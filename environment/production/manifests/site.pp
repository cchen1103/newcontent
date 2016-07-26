import "users.pp"

node 'default' {
	class {'nginx':
 		listening_port => 8000,
		proxy_url => 'https://github.com/puppetlabs/exercise-webpage',
	}
	User['nginx']->Class['nginx']
}
