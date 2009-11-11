require 'fileutils'

module Nginx  
  # @desc Add a new site to nginx/sites-available
  def add_site(directory, hostname=nil)    
    if !File.exist?(directory) || !File.directory?(directory)
      puts "#{directory} does not exist or is not a directory!"
      exit(0)
    end
    
    directory = File.expand_path(directory)
    hostname ||= "#{File.basename(directory)}.local"
    passenger = true
    rails_env = 'development'
    
    conf_file = nginx_conf('sites-available', hostname)
    if File.exist?(conf_file)
      puts "#{conf_file} already exists!"
    else
      File.open(conf_file, "w") do |file|
        file.write ERB.new(SITE_TEMPLATE).result(binding)
      end
      
      puts "Wrote #{conf_file}"
    end
  end
  
  # @desc Enable HOSTNAME
  def en_site(hostname)
    site_file = nginx_conf('sites-available', hostname)
    
    if File.exists?(site_file)
      run "ln -s #{site_file} #{nginx_conf('sites-enabled', hostname)}"
    else
      puts "#{site_file} does not exist!"
    end
    
    add_host(hostname)
  end
  
  # @desc Disable HOSTNAME
  def dis_site(hostname)
    run "rm #{nginx_conf('sites-enabled', hostname)}"
    rm_host(hostname)
  end
  
  # @desc Edit configuration for HOSTNAME
  def edit_site(hostname)
    site_file = nginx_conf('sites-available', hostname)
    
    if File.exists?(site_file)
      run "#{ENV['EDITOR'] || 'mate'} #{site_file}"
    else
      puts "#{site_file} does not exist!"
    end
  end
  
  # @desc Show all available sites
  def sites
    enabled_sites = Dir[nginx_conf('sites-enabled/*')].map { |site| File.basename(site) }
    Dir[nginx_conf('sites-available/*')].map { |site| File.basename(site) }.each do |site|
      puts "#{enabled_sites.include?(site) ? '*' : ' '} #{File.basename(site)}"
    end
  end
  
  # @desc Start server
  def start
    sudo "#{nginx_dir}/sbin/nginx"
  end
  
  # @desc Stop server
  def stop
    sudo "#{nginx_dir}/sbin/nginx -s stop"
  end
  
  # @desc Restart server
  def restart
    stop
    sleep 1
    start
  end
    
  private
  
  def add_host(host, ip='127.0.0.1')
    rm_host(host, ip)
    sudo %Q{echo '#{ip} #{host}' >> /etc/hosts}
  end
  
  def rm_host(host, ip='127.0.0.1')
    sudo "perl -pi.bak -e 's/^#{ip.gsub('.', '\.')}\\s+#{host.gsub('.', '\.')}\//;s/^\\n$//' /etc/hosts"
  end
  
  def nginx_dir
    if @nginx_dir.nil?
      @nginx_dir = ENV['NGINX_HOME']
      if @nginx_dir
        FileUtils.mkdir_p(nginx_conf('sites-available'))
        FileUtils.mkdir_p(nginx_conf('sites-enabled'))
      else
        puts "You must define an NGINX_HOME environment variable. Example: NGINX_HOME=/usr/local/nginx"
        exit(0)
      end
    end
    
    @nginx_dir
  end
    
  def nginx_conf(*paths)
    File.join(nginx_dir, 'conf', *paths)
  end
  
  def run(cmd, print=true)
    puts cmd if print
    system cmd
  end
  
  def sudo(cmd, print=true)
    run %Q{sudo sh -c "#{cmd}"}, print
  end
  
SITE_TEMPLATE = %q[
server {
    listen       80;
    server_name  <%= hostname %>;
    root <%= directory %>/public;

    passenger_enabled <%= passenger ? 'on' : 'off' %>;
    <% if passenger %>
    rails_env <%= rails_env %>;
    <% end %>
}
]
end