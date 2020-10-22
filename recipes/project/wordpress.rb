# apt updation 
case node['platform']
when 'debian', 'ubuntu'
 execute "apt-get update" do
  command "apt-get update"
  end
 end

# packages installation
packages=['apache2','mysql-server','mysql-client','php','libapache2-mod-php','php-mcrypt','php-mysql','unzip']

packages.each do |package|
	apt_package package do
		action :install
	 end
 end

# Starting Service
service "apache2" do   
	action :start 
   end
## Setting up the root password
execute "root password" do
	command "mysqladmin -u root password rootpassword"
 end

# Downloading myqsl command

remote_file "mysqlcommands" do
 source "https://gitlab.com/roybhaskar9/devops/raw/master/coding/chef/chefwordpress/files/default/mysqlcommands"
 path "/tmp/mysqlcommands"
end

 
### 
execute "mysql -uroot -prootpassword < /tmp/mysqlcommands" do
	command "mysql -uroot -prootpassword < /tmp/mysqlcommands"
 end

## downloading wordpress

remote_file " wordpress_latest" do 
 	source "https://wordpress.org/latest.zip"
 	path "/tmp/latest.zip"
 end


# unzipping the wordpress
execute " unzip the wordpress" do 
	command "unzip /tmp/latest.zip -d /var/www/html"
 end


## 
remote_file "wp-config-sample" do
	source "https://gitlab.com/roybhaskar9/devops/raw/master/coding/chef/chefwordpress/files/default/wp-config-sample.php"
	path "/var/www/html/wordpress/wp-config.php"
 end

##

directory "/var/www/html/wordpress" do
	mode "0755"
	owner "www-data"
	group "www-data"
 end
	

###


execute "apache2 restart" do 
         command "systemctl restart apache2"  
  end
