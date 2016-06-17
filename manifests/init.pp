class { '::openstack_extras::repo::debian::ubuntu':
  release         => 'newton',
  repo            => 'updates',
  package_require => true,
}

class { '::nova':
  database_connection     => 'mysql+pymysql://nova:nova@nova-mysql/nova?charset=utf8',
  api_database_connection => 'mysql+pymysql://nova_api:nova@nova-api-mysql/nova_api?charset=utf8',
  rabbit_userid           => 'nova',
  rabbit_password         => 'an_even_bigger_secret',
  debug                   => true,
  notification_driver     => 'messagingv2',
  notify_on_state_change  => 'vm_and_task_state',
}
class { '::nova::api':
  admin_password                       => 'a_big_secret',
  osapi_v3                             => true,
  neutron_metadata_proxy_shared_secret => 'a_big_secret',
  metadata_workers                     => 2,
  default_floating_pool                => 'public',
  sync_db                              => false,
  sync_db_api                          => false,
  service_name                         => 'httpd',
}
include '::apache'
class { '::nova::wsgi::apache':
  workers => '2',
  ssl     => false,
}
