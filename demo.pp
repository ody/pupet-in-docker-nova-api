docker::run { 'nova-mysql':
  image           => 'mysql:latest',
  env             => [ 'MYSQL_ROOT_PASSWORD=my-secret-pw', 'MYSQL_DATABASE=nova', 'MYSQL_USER=nova', 'MYSQL_PASSWORD=nova' ],
  restart_service => true,
}

docker::run { 'nova-api-mysql':
  image           => 'mysql:latest',
  env             => [ 'MYSQL_ROOT_PASSWORD=my-secret-pw', 'MYSQL_DATABASE=nova_api', 'MYSQL_USER=nova_api', 'MYSQL_PASSWORD=nova' ],
  restart_service => true,
}

docker::run { 'nova-api':
  image           => 'puppet/puppet-nova-api:latest',
  ports           => [ '8774:8774', '8775:8775' ],
  links           => [ 'nova-mysql:nova-mysql', 'nova-api-mysql:nova-api-mysql' ],
  restart_service => true,
  depends         => [ 'nova-mysql', 'nova-api-mysql' ],
}
