node 'default' {
  include nginx::config
  include nginx::service
  Class['nginx'] -> Class['nginx::config'] ~> Class['nginx::service']
}
