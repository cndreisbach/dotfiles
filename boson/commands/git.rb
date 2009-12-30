require 'erb'
require 'fileutils'

module Git

  # @desc Install hook for automatically removing trailing whitespace    
  # @options :force => :boolean, :path => :string, :encoding => :string, :whitelist => :string, :blacklist => :string
  def whitespace_hook(options={})
    # --force
    if File.exist?(".git/hooks/pre-commit") && options['force']
      FileUtils.rm ".git/hooks/pre-commit"
    end

    if File.exist?(".git/hooks/pre-commit")
      raise "You must remove .git/hooks/pre-commit first!"
    else
      puts "Installing .git/hooks/pre-commit ..."
      gemdir = `gem open code-cleaner -c 'ls -d'`.chomp
      source = File.join(gemdir, "support", "pre-commit.erb")
      File.open(".git/hooks/pre-commit", "w") do |file|
        file.puts(ERB.new(File.read(source)).result(binding))
      end
      File.chmod(0755, ".git/hooks/pre-commit")
      puts "Installed!"
    end
  rescue Errno::ENOENT => ex
    puts "Something went wrong!"
    raise ex
  end
end