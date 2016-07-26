group {'www-data':
    ensure => present,
}

user {'www-data':
    name => 'www-data',
    ensure => present,
    groups => ['www-data'],
    password => '!!',
    shell => '/sbin/nologin',
    home => '/var/www',
}
