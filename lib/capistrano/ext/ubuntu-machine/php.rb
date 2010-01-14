namespace :php do
  desc "Install PHP 5"
  task :install, :roles => :app do    

    sudo "apt-get install libapache2-mod-php5 php5 php5-common php-pear php5-curl php5-dev php5-gd php5-imagick php5-mcrypt php5-memcache php5-mhash php5-mysql php5-pspell php5-snmp php5-sqlite php-soap php5-xmlrpc php5-xsl php-apc -y"
    sudo "/etc/init.d/apache2 reload"

  end

	desc "Install PHP 5 development tools"
  task :install_dev_tools, :roles => :app do 
  
    sudo "apt-get install php5-xdebug php-doc php-codesniffer -y"
    sudo "/etc/init.d/apache2 reload"

  end

	desc "Add PEAR channels"
  task :install_pear_channels, :roles => :app do 
		sudo "pear -q channel-discover components.ez.no"
		sudo "pear -q channel-discover pear.pdepend.org"		
    sudo "pear -q channel-discover pear.phing.info"
		sudo "pear -q channel-discover pear.phpunit.de"
  end

	desc "Install PHP 5 PEAR tools"
  task :install_pear_tools, :roles => :app do 
  
		# pear config-set preferred_state beta
		# pear install --alldeps phpunit/phpUnderControl
		
		sudo "pear upgrade pdepend/PHP_Depend-beta"
		
		sudo "pear upgrade phing/phing"
		
		sudo "pear upgrade PhpDocumentor"
		
		sudo "pear upgrade phpunit/PHPUnit"
		
		sudo "pear upgrade phpunit/phpcpd"
		
    sudo "/etc/init.d/apache2 reload"

		php.pear_list
  end

	desc "List PEAR installed packages"
  task :pear_list, :roles => :app do 
		sudo "pear list"
  end

end
