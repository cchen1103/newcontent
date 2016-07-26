class nginx( $listening_port =undef,
	$proxy_url = undef){

	include nginx::package

	file {'/etc/nginx/nginx.conf':
       		owner => 'root',
        	group => 'root',
        	mode => '644',
	        ensure => present,
       		content => template('nginx/nginx.conf.erb')
	}

	service{'nginx':
		enable => true,
		ensure => running,
		hasstatus => true,
	}

	Package['nginx'] -> File['/etc/nginx/nginx.conf'] ~> Service['nginx']
}
