nginx::service {'nginx':
	enable => true,
	ensure => running,
	hasstatus => true,
}

