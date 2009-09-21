#!/usr/bin/env ruby

require 'rubygems'
require 'osx_env'

cflags = []
cflags << '-O3' << '-march=core2' << '-m64' << '-mmmx' << '-msse4.1' <<
          '-w' << '-mmacosx-version-min=10.6'

OSXEnv.set do |env|
  env[:APXS2] = '/usr/sbin/apxs'
  env[:APACHE] = '/usr/sbin/httpd'
  env[:NGINX_HOME] = '/usr/local/Cellar/nginx/0.7.61'
  env[:LIB_HOME] = File.expand_path('~/lib')
  env[:JAVA_HOME] = '/Library/Java/Home'
  env[:SCALA_HOME] = '/usr/local/Cellar/scala/2.7.5'
  env[:ANT_HOME] = '/usr/local/Cellar/apache-ant/1.7.1-bin'
  env[:MY_PATH] = ['~/bin',
                   '~/knapsack/bin'].map { |path| File.expand_path(path) }
  env[:SYS_PATH] = ['/usr/local/bin',
                    '/usr/bin', '/bin',
                    '/usr/sbin', '/sbin',
                    '/usr/X11/bin']
  env[:PATH] = env[:MY_PATH] + env[:SYS_PATH]
  env[:EDITOR] = 'waitmate'
  env[:PAGER] = 'most'
  env[:MY_NAME] = 'Clinton R. Nixon'
  env[:MY_EMAIL] = 'crnixon@gmail.com'
  env[:MY_GITHUB_LOGIN] = 'crnixon'
  env[:MY_ORG] = 'Viget Labs'
  env[:CLICOLOR] = 1
  env[:CFLAGS] = cflags * ' '
  env[:CXXFLAGS] = cflags * ' '
end
