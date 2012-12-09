def here(*paths)
  File.expand_path(File.join(File.dirname(__FILE__), *paths))
end

def dotfiles
  Dir[here('*')].map { |path|
    File.basename(path)
  }.reject { |path|
    path == "Rakefile" or path =~ /^README/ or path == "bin"
  }
end

def binfiles
  Dir[here('bin', '*')].map { |path| File.basename(path) }
end

def run(cmd)
  puts cmd
  system cmd
end

task :default => [:dotfiles, :binfiles]

desc "Symlinks all my dotfiles"
task :dotfiles do
  dotfiles.each do |dotfile|
    link = File.expand_path("~/.#{dotfile}")
    unless File.exists?(link)
      run %Q{ln -s "#{here(dotfile)}" "#{link}"}
    end
  end
end

task :binfiles do
  binfiles.each do |binfile|
    link = File.expand_path("~/bin/#{binfile}")
    unless File.exists?(link)
      run %Q{ln -s "#{here('bin', binfile)}" "#{link}"}
    end
  end
end

desc "Removes all my dotfile symlinks"
task :clean do
  dotfiles.each do |dotfile|
    link = File.expand_path("~/.#{dotfile}")
    if File.symlink?(link)
      run %Q{rm "#{link}"}
    end
  end
end

