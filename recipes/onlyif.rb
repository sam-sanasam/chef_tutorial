execute "test" do
  command "apt-get update && rm -f /tmp/updateneeded"
  only_if {File.exists?("/tmp/updateneeded")}
end