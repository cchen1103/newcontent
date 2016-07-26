File {
	mode => '644',
	ensure => present,
	}

class nginx( $nginx_user = 'www-data',
        $listening_port = 80,
	$proxy_url = undef){

	include nginx::package

	file {'/etc/nginx/nginx.conf':
       		owner => 'root',
        	group => 'root',
       		source => 'puppet:///modules/nginx/nginx.conf',
	}

        file {'/etc/nginx/conf.d':
		ensure => directory,
		owner => 'root',
		group => 'root',
	}

	file {'/etc/nginx/conf.d/my_server.conf':
		owner => 'root',
		group => 'root',
		content => template('nginx/my_server.conf.erb'),
	}

	service{'nginx':
		enable => true,
		ensure => running,
		hasstatus => true,
	}

	Package['nginx'] -> File['/etc/nginx/nginx.conf'] ~> Service['nginx']
}
