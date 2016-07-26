package {'nginx':
	present => true,
	ensure => 'latest',
	provider => 'yum',
	stage => 'prepare',
}

