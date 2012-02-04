Pry.config.editor = "vim"
Pry.prompt = [
  proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }
]

load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env
