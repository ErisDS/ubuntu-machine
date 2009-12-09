namespace :apc do
  desc "Install APC opt code cache"
  task :install, :roles => :app do    
    sudo "pecl install apc -y"
    sudo "/etc/init.d/apache2 reload"
  end

end