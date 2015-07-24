Vagrant.configure(2) do |config|
	config.vm.define :appserver do |appserver|
		appserver.vm.box = "ubuntu_precise64"
		appserver.vm.box_url = "http://files.vagrantup.com/precise64.box"
    appserver.vm.network "forwarded_port", guest: 80, host: 3000

		appserver.vm.provision :shell, :path => "shell/prereqs.sh", :args => "puppet/librarian/appserver"

		appserver.vm.provision :puppet do |appserver_puppet|
			appserver_puppet.manifests_path = "puppet/manifests"
			appserver_puppet.manifest_file  = "appserver.pp"
		end

		appserver.vm.provision :shell, :path => "shell/kickstart-app.sh",:args => "app"
	end

	config.vm.define :postgres do |postgres|
		postgres.vm.box = "ubuntu_precise64"
		postgres.vm.box_url = "http://files.vagrantup.com/precise64.box"
    postgres.vm.network "forwarded_port", guest: 5432, host: 9999

		postgres.vm.provision :shell, :path => "shell/prereqs.sh", :args => "puppet/librarian/postgres"

		postgres.vm.provision :puppet do |postgres_puppet|
			postgres_puppet.manifests_path = "puppet/manifests"
			postgres_puppet.manifest_file  = "postgres.pp"
		end
	end

end
