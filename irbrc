require 'pp'
require 'rubygems'
require 'yaml'

# wirble is amazing
# it gives you cross-session history, coloring, and auto-completion
require 'wirble'
Wirble.init
Wirble.colorize

IRB.conf[:AUTO_INDENT] = true

class Object
  # get all the methods for an object that aren't basic methods from Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
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

def mate(obj)
  IO.popen( 'mate -', 'w') do |io|
    io.puts obj.to_yaml
  end
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

# From http://toolmantim.com/articles/system_wide_script_console_logging
# script/console will now output its log into the console
script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
irb_standalone_running = !script_console_running && !rails_running

if script_console_running
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end
