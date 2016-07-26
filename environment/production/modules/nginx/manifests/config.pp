class nginx::config (
	$listening_port = undef,
	$proxy_url = undef,
 ) {
	file {'/etc/nginx/nginx.conf':
		owner => 'root',
		group => 'root',
		mode => '644',
		ensure => present,
		content => template('puppet:///modules/nginx/nginx.erb')
	}
}

