class LinkPath
  def initialize(windows: nil, linux: nil, mac: nil)
    @windows = windows
    @linux = linux
    @mac = mac
  end

  def self.os
    @@os ||=
      case RbConfig::CONFIG['host_os']
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
      FileUtils.ln_s(source, dest)
    end
  end
end

desc 'Link the World of Warcraft account settings'
task :wow do
  link_path = LinkPath.new(
    mac: '/Applications/World of Warcraft/WTF/Account/16482221#1')
  link_path.link(Pathname.new('WoW/16482221#1').realpath)
end
