require 'pathname'
require 'yaml'

CONFIG = YAML.load(File.read('config.yml'))

class LinkPath
  def initialize(windows: nil, linux: nil, mac: nil)
    @windows = windows ? Pathname.new(windows) : nil
    @linux = linux ? Pathname.new(linux) : nil
    @mac = mac ? Pathname.new(mac) : nil
  end

  def self.os
    @@os ||=
      case RbConfig::CONFIG['host_os']
      when /mingw/
        :windows
      when /darwin/
        :mac
      when /linux/
        :linux
      end
  end

  def link(source)
    dest = case LinkPath.os
           when :windows then @windows
           when :linux   then @linux
           when :mac     then @mac
           end
    if !dest
      $stderr.puts 'Not compatible with the host OS.'
    elsif File.exist?(dest)
      $stderr.puts "File already exists: #{dest}"
    else
      real_source = Pathname.new(source).realpath
      FileUtils.mkdir_p(dest.dirname)
      create_link(real_source, dest)
    end
  end

  private

  def create_link(source, dest)
    case LinkPath.os
    when :windows
      if File.directory?(source)
        `cmd.exe /C mklink /D "#{dest}" "#{source}"`
      else
        `cmd.exe /C mklink "#{dest}" "#{source}"`
      end
      exit_code = $?.to_i
      $stderr.puts "Exit with code #{exit_code}" if exit_code != 0
    when :linux, :mac
      FileUtils.ln_s(source, dest)
    end
  end
end

desc 'Link the World of Warcraft account settings'
task :wow do
  account = CONFIG['wow_account']
  custom_path = CONFIG['wow_custom_path']
  target = "WTF/Account/#{account}"
  windows = if custom_path['windows']
              custom_path['windows'].join(target)
            else
              if ENV['ProgramFiles(x86)']
                Pathname.new(ENV['ProgramFiles(x86)'])
                  .join('World of Warcraft').join(target)
              elsif ENV['ProgramFiles']
                Pathname.new(ENV['ProgramFiles'])
                  .join('World of Warcraft').join(target)
              end
            end
  mac = if custom_path['mac']
          custom_path['mac'].join(target)
        else
          "/Applications/World of Warcraft/#{target}"
        end
  link_path = LinkPath.new(windows: windows, mac: mac)
  link_path.link("WoW/#{account}")
end
