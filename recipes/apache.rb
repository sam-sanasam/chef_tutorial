package "apache2" do
  action :install
end
service "apache2" do
  action :start
end
file "/tmp/file1" do
  content "Hello world"
end
    
