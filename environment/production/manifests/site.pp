import "users.pp"

node 'default' {
        class {'base_module':}

	class {'nginx':
 		listening_port => 8000,
	}
	User['www-data']->Class['nginx']
}
