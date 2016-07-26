import "users.pp"

node 'default' {
        class {'base_module':}

	class {'nginx':
 		listening_port => 8000,
		proxy_url => 'https://github.com/puppetlabs/exercise-webpage',
	}
	User['www-data']->Class['nginx']
}
