require 'pp'
require 'rubygems'
require 'yaml'
# require 'ap'
# 
# alias :vdump :ap

# wirble is amazing
# it gives you cross-session history, coloring, and auto-completion
require 'wirble'
Wirble.init
Wirble.colorize

# Hirb
require 'hirb'
 
Hirb.enable :pager=>false
 
# make hashes show up as yaml (from the Hirb documentation)
class Hirb::Helpers::Yaml
  def self.render(output, options={})
    output.to_yaml
  end
end
# Hirb::View.format_class Hash, :class=>"Hirb::Helpers::Yaml"

# IRB setup

IRB.conf[:AUTO_INDENT] = true

class Object
  # return methods and instance methods of a class
  def my_methods
    methods(false).map { |m| "#{name}::#{m}" }.sort + instance_methods(false).sort
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
