execute "test" do
  command "apt-get update && touch /tmp/updatedone"
  not_if {File.exists?("/tmp/updatedone")}
end
