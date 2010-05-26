require 'erb'
require 'open-uri'

# Read in render files
app, data = ::IO.read(template).split(/^__END__$/, 2)
TEMPLATES = {}
current_template = nil
data.each_line do |line|
  if line =~ /^@@\s*(.*)/
    current_template = ''
    TEMPLATES[$1] = current_template
  elsif current_template
    current_template << line
  end
end

def render(name)
  ERB.new(TEMPLATES[name]).result(binding).strip + "\n"
end
  
# Delete unnecessary files
run "rm README"
run "rm doc/README_FOR_APP"
run "rm public/index.html"
run "rm public/robots.txt"
run "rm -f public/javascripts/*"

# Write out needed files
run "cp config/database.yml config/database.example.yml"
file '.gitignore', render('gitignore')
file 'tmp/.gitignore', render('blank_gitignore')
file 'log/.gitignore', render('blank_gitignore')
file 'test/blueprints.rb', render('blueprints.rb')
file 'test/test_helper.rb', render('test_helper.rb')
file 'public/javascripts/vendor/jquery-1.4.2.js', open("http://code.jquery.com/jquery-1.4.2.js").read

# Setup Bundler
file 'Gemfile', render('Gemfile')
file '.bundle/.gitignore', render('blank_gitignore')
file 'config/preinitializer.rb', render('preinitializer.rb')
gsub_file 'config/boot.rb', "Rails.boot!", render('boot.rb')

# Setup Jammit
file 'config/assets.yml', render('assets.yml')
route "Jammit::Routes.draw(map)"

# Install plugins
plugin 'rails_xss', :git => "git://github.com/rails/rails_xss.git"

# Download your bundle
run 'bundle install'

__END__

@@ gitignore
.DS_Store
config/database.yml

@@ blank_gitignore
*
!.gitignore

@@ Gemfile
source 'http://rubygems.org'

gem 'rails', '<%= Rails::VERSION::STRING %>'
gem 'mysql'
gem 'erubis'

gem 'jammit'

group :test do
  gem 'phocus'
  gem 'contest'
  gem 'machinist'
  gem 'faker'
  gem 'rr'  
end

@@ preinitializer.rb
begin
  # Require the preresolved locked set of gems.
  require File.expand_path('../../.bundle/environment', __FILE__)
rescue LoadError
  # Fallback on doing the resolve at runtime.
  require "rubygems"
  require "bundler"
  if Bundler::VERSION <= "0.9"
    raise RuntimeError, "Bundler incompatible.\n" +
      "Your bundler version is incompatible with Rails 2.3 and an unlocked bundle.\n" +
      "Run `gem install bundler` to upgrade or `bundle lock` to lock."
  else
    Bundler.setup
  end
end

@@ boot.rb
class Rails::Boot
 def run
   load_initializer
   extend_environment
   Rails::Initializer.run(:set_load_path)
 end

 def extend_environment
   Rails::Initializer.class_eval do
     old_load = instance_method(:load_environment)
     define_method(:load_environment) do
       Bundler.require :default, Rails.env
       old_load.bind(self).call
     end
   end
 end
end

Rails.boot!

@@ assets.yml
package_assets: on
embed_assets: off
compress_assets: off
javascript_compressor: yui

javascripts:
  common:
    - public/javascripts/vendor/jquery-1.4.2.js

stylesheets:
  common:
    - public/stylesheets/reset.css
    - public/stylesheets/screen.css
    
@@ blueprints.rb
require 'machinist/active_record'
require 'sham'

@@ test_helper.rb
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

require File.expand_path(File.dirname(__FILE__) + "/blueprints")

class ActiveSupport::TestCase
  include RR::Adapters::TestUnit  
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
