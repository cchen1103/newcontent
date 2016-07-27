class nginx::webserver (
	$local_repo = undef,
	){ 
	file {'/var/www/html':
		ensure => directory,
		owner => 'www-data',
		group => 'www-data',
		mode => '644',
		recurse => true,
	}

        remote_file{'index.html':
        	remote_location => 'https://github.com/puppetlabs/exercise-webpage',
		local_repo => $local_repo,
	}

	file {'/var/www/html/index.html':
		ensure => link,
		target => "$local_repo/index.html",
	}
}

