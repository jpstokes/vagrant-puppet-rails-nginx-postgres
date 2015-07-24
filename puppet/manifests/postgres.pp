class { 'postgresql::server': }

postgresql::server::role { 'postgres':
  password_hash => postgresql_password('vagrant', 'mypasswd'),
}

postgresql::server::database_grant { 'postgres':
  privilege => 'ALL',
  db        => 'development',
  role      => 'postgres',
}
