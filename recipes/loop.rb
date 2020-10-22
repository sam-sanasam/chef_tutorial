for file in [ "file1", "file2" ] do
  file "/tmp/#{file}" do
    action :create
  end
end
