package "apache2" do
 action :install
 not_if { node['platform'] == 'centos' }
end