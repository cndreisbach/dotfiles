require 'find'

module Watch
  def watch(command, *paths)
    raise "You must provide some paths to watch." if paths.empty?
    
    files = {}
    paths.select { |path| File.exist?(path) }.each do |path|      
      Find.find(File.expand_path(path)) do |file|
        if FileTest.directory?(file)          
          Find.prune if File.basename(file) =~ /^\.\w+/            
        else
          files[file] = File.mtime(file)
        end
      end
    end
                
    puts "Watching #{paths.join(', ')}\n\nFiles: #{files.keys.length}"

    # trap('INT') do
    #   puts "\nQuitting..."
    #   exit
    # end
    
    loop do
      sleep 1

      changed_file, last_changed = files.find { |file, last_changed|
        File.mtime(file) > last_changed
      }

      if changed_file
        files[changed_file] = File.mtime(changed_file)
        puts "=> #{changed_file} changed, running #{command}"
        puts `#{command.gsub(/FILE/, changed_file)}`
        puts "=> done"
      end
    end
  end
end