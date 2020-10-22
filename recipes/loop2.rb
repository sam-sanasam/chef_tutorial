packages = ['vim', 'git', 'curl']

packages.each do |package|
 apt_package package do
   action :install
 end
end