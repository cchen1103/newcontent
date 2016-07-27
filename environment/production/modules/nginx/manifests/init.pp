define remote_file(
    $remote_location = undef,
    $local_repo = undef,
    $mode = '644'){
        exec{"download_${title}":
            command => "git clone $remote_location $local_repo",
	    path => ['/usr/bin','/usr/sbin','/bin'],
            creates => "$local_repo/$title",
#            unless => "ls $local_repo/$title && false",
        }
}

File {
	mode => '644',
	ensure => present,
	}

class nginx($listening_port = 80,){

	include nginx::package

        # nginx webserver configuration
        file {'/etc/nginx/nginx.conf':
                ensure => present,
                owner => 'root',
                group => 'root',
                mode => '644',
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
	
	class {'nginx::webserver':
		local_repo => '/etc/nginx/sites-available',
	}

	service{'nginx':
		enable => true,
		ensure => running,
		hasstatus => true,
	}

	Package['nginx'] -> File['/etc/nginx/nginx.conf'] -> Class['Nginx::Webserver'] ~> Service['nginx']
}
