require 'pathname'

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
  link_path = LinkPath.new(
    windows: if RbConfig::CONFIG['host_cpu'] =~ /x86_64/
               'C:/Program Files (x86)/World of Warcraft/WTF/Account/16482221#1'
             else
               'C:/Program Files/World of Warcraft/WTF/Account/16482221#1'
             end,
    mac: '/Applications/World of Warcraft/WTF/Account/16482221#1')
  link_path.link('WoW/16482221#1')
end
