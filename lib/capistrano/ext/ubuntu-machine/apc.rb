namespace :apc do
  desc "Install APC opcode cache using ubuntu package"
  task :install, :roles => :app do    
    sudo "apt-get install php-apc -y"
    sudo "/etc/init.d/apache2 reload"
  end

end