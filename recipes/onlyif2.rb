apt_package "php-pear" do
 action :install
 only_if "which php"
end