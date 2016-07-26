group {'nginx':
    ensure => 'present',
    gid => '1010',
}

user {'nginx':
    name => 'nginx',
    ensure => 'present',
    uid => '1010',
    groups => ['nginx'],
    password => '!!',
    shell => '/sbin/nologin',
    home => '/opt/nginx',
}
