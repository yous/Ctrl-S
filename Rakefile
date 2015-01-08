require 'pathname'
require 'yaml'

CONFIG = YAML.load(File.read('config.yml'))

class LinkPath
  def initialize(path, required_path: nil)
    @path = path ? Pathname.new(path) : nil
    @required_path = required_path ? Pathname.new(required_path) : nil
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
    if !@path
      $stderr.puts 'Not compatible with the host OS.'
    elsif File.exist?(@path)
      $stderr.puts "File already exists: #{@path}"
    elsif !File.exist?(@required_path)
      $stderr.puts "File doesn't exist: #{@required_path}"
    else
      real_source = Pathname.new(source).realpath
      FileUtils.mkdir_p(@path.dirname)
      create_link(real_source, @path)
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

namespace :wow do
  desc 'Link the World of Warcraft account settings'
  task :account do
    os = LinkPath.os
    account = CONFIG['wow_account']
    custom_path = CONFIG['wow_custom_path'] &&
      CONFIG['wow_custom_path'][os.to_s]
    custom_path = Pathname.new(custom_path) if custom_path
    target = "WTF/Account/#{account}"
    link_path =
      case os
      when :windows
        if custom_path
          LinkPath.new(custom_path.join(target), required_path: custom_path)
        else
          program_files = if ENV['ProgramFiles(x86)']
                            ENV['ProgramFiles(x86)']
                          elsif ENV['ProgramFiles']
                            ENV['ProgramFiles']
                          end
          required_path = Pathname.new(program_files).join('World of Warcraft')
          LinkPath.new(required_path.join(target), required_path: required_path)
        end
      when :mac
        if custom_path
          LinkPath.new(custom_path.join(target), required_path: custom_path)
        else
          required_path = Pathname.new('/Applications/World of Warcraft')
          LinkPath.new(required_path.join(target), required_path: required_path)
        end
      end
    link_path.link("WoW/#{account}")
  end

  desc 'Link the World of Warcraft addons'
  task :addons do
    os = LinkPath.os
    custom_path = CONFIG['wow_custom_path'] &&
      CONFIG['wow_custom_path'][os.to_s]
    custom_path = Pathname.new(custom_path) if custom_path
    target = 'Interface/AddOns'
    link_path =
      case os
      when :windows
        if custom_path
          LinkPath.new(custom_path.join(target), required_path: custom_path)
        else
          program_files = if ENV['ProgramFiles(x86)']
                            ENV['ProgramFiles(x86)']
                          elsif ENV['ProgramFiles']
                            ENV['ProgramFiles']
                          end
          required_path = Pathname.new(program_files).join('World of Warcraft')
          LinkPath.new(required_path.join(target), required_path: required_path)
        end
      when :mac
        if custom_path
          LinkPath.new(custom_path.join(target), required_path: custom_path)
        else
          required_path = Pathname.new('/Applications/World of Warcraft')
          LinkPath.new(required_path.join(target), required_path: required_path)
        end
      end
    link_path.link('WoW/AddOns')
  end
end
