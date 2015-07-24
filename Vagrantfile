Vagrant.configure(2) do |config|
	config.vm.define :appserver do |appserver|
		appserver.vm.box = "ubuntu_precise64"
		appserver.vm.box_url = "http://files.vagrantup.com/precise64.box"
    appserver.vm.network "forwarded_port", guest: 3000, host: 3000

		appserver.vm.provision :shell, :path => "shell/prereqs.sh", :args => "puppet/librarian/appserver"

		appserver.vm.provision :puppet do |appserver_puppet|
			appserver_puppet.manifests_path = "puppet/manifests"
			appserver_puppet.manifest_file  = "appserver.pp"
		end

		appserver.vm.provision :shell, :path => "shell/kickstart-app.sh",:args => "app"
	end

	config.vm.define :mongodb do |mongodb|
		mongodb.vm.box = "ubuntu_precise64"
		mongodb.vm.box_url = "http://files.vagrantup.com/precise64.box"
    mongodb.vm.network "forwarded_port", guest: 5432, host: 9999

		mongodb.vm.provision :shell, :path => "shell/prereqs.sh", :args => "puppet/librarian/mongodb"

		mongodb.vm.provision :puppet do |mongodb_puppet|
			mongodb_puppet.manifests_path = "puppet/manifests"
			mongodb_puppet.manifest_file  = "mongo.pp"
		end
	end

end
