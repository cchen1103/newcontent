define get_remote_file(
	$file_location=undef,
	$mode='644'){
		exec{"download_${title}":
		command => "git pull $title",
		creates => $title,
	}

	file{$title:
		mode => $mode,
		require => Exec["download_$title"],
	}
}

remote_file{'/home/vagrant/bin/lein':
  remote_location => 'https://raw.github.com/technomancy/leiningen/stable/bin/lein',
  mode            => '0755',
}
