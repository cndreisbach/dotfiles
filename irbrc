begin
  require "rubygems"
  require 'pry'
  Pry.start
  exit
rescue LoadError
  puts "Pry not available."
end
