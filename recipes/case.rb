case node['platform']
when 'debian', 'ubuntu'
  execute "apt-get update" do
   command "apt-get update"
  end
when 'redhat', 'centos', 'fedora'
  execute "yum update" do
   command "yum update"
  end
end