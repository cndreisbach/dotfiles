require 'rubygems'
require 'yaml'
require 'pp'

if defined? IRB
  require 'irb/ext/save-history'
  require 'irb/completion'

  # wirble is amazing
  # it gives you cross-session history, coloring, and auto-completion
  begin
    require 'wirble'
    Wirble.init
    Wirble.colorize
  rescue LoadError
    nil
  end

  # IRB setup
  IRB.conf[:USE_READLINE] = true
  IRB.conf[:AUTO_INDENT] = true
  # Save History between irb sessions
  IRB.conf[:SAVE_HISTORY] = 100
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
end

class Object
  # return methods and instance methods of a class
  def my_methods
    methods(false).map { |m| "#{name}::#{m}" }.sort + instance_methods(false).sort
  end
end

def ls
   %x{ls}.split("\n")
end

def cd(dir)
  Dir.chdir(dir.to_s)
  Dir.pwd
end

def pwd
  Dir.pwd
end

# also from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def rl(file_name = nil)
  if file_name.nil?
    if !@recent.nil?
      rl(@recent) 
    else
      puts "No recent file to reload"
    end
  else
    file_name += '.rb' unless file_name =~ /\.rb/
    @recent = file_name 
    load "#{file_name}"
  end
end

alias p pp
alias q exit
alias quit exit

railsrc_path = File.expand_path('~/.railsrc')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path }" # because of $!.message
  end
end
