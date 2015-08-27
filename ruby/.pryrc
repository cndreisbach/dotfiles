Pry.config.editor = "vim"
Pry.prompt = [
  proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }
]

if defined?(Rails) && Rails.env
  railsrc = File.dirname(__FILE__) + '/.railsrc'
  load railsrc if File.exists?(railsrc)
end
