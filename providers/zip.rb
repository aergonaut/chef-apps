def load_current_resource
  @zip_pkg = Chef::Resources::AppsZip.new(new_resource.name)
  Chef::Log.debug("Checking for application #{new_resource.app}")
  installed = ::File.directory?(File.join(new_resource.destination, "#{new_resource.app}.app"))
  @zip_pkg.installed(installed)
end

action :install do
  unless @zip_pkg.installed
    zip_file = resource.zip_file || new_resource.source.split('/').last
    downloaded_file = File.join(Chef::Config[:file_cache_path], zip_file)

    remote_file downloaded_file do
      source new_resource.source
      checksum new_resource.checksum if new_resource.checksum
    end

    execute "Extract #{new_resource.app}" do
      cwd new_resource.destination
      command "unzip '#{downloaded_file}'"

      creates File.join(new_resource.destination, "#{new_resource.app}.app")
    end
  end
end
