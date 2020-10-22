# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "chefuser"
client_key               "#{current_dir}/chefuser.pem"
chef_server_url          "https://chefserver.example.com/organizations/doc"
cookbook_path            ["#{current_dir}/../cookbooks"]
