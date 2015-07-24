class { 'nginx':
  package_source  => 'passenger',
  http_cfg_append => {
    'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
  }
}

class { 'rbenv': }

class { 'firewall': }

package { ['libxml2', 'libxml2-dev', 'libxslt1-dev']:
  ensure => installed
}

package { 'nodejs':
  ensure => installed
}

exec { 'run bundler':
  command => "bundle install",
  require => Class['qt']
}

file { "/app":
	ensure => "link",
	target => '/vagrant/app',
  require => File['/vagrant/app']
}

file { "/vagrant/app":
	ensure => "directory",
	mode => '0755',
}

nginx::resource::vhost { 'localhost':
  ensure                => present,
  listen_port           => 80,
  www_root              => '/vagrant/app',
  vhost_cfg_append => {
    'passenger_enabled' => 'on',
    'passenger_ruby'    => '/usr/bin/ruby',
  }
}

rbenv::plugin { 'sstephenson/ruby-build': }
rbenv::build { '2.2.2': global => true }
