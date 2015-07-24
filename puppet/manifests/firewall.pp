Firewall {
  require => undef
}

firewall { '100 allow http':
    port   => [80],
    proto  => tcp,
    action => accept
}

firewall { '101 allow https':
    port   => [443],
    proto  => tcp,
    action => accept
}

firewall { '102 allow ssh access':
    port   => [22],
    proto  => tcp,
    action => accept
}
