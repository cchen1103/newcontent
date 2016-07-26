class nginx::package {
        package {'nginx':
                ensure => 'latest',
        }
}
