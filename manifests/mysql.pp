# == Class: graphite::mysql
#
# MySQL configuration for Graphite.
#
class graphite::mysql (
  $db_user       = $graphite::db_user,
  $db_password   = $graphite::db_password,
  $root_password = $graphite::mysql_root_password,
  ) {

  include ::mysql::client

  class {'::mysql::server':
    root_password => $root_password,
  }

  package {'MySQL-python':
    ensure => installed,
  }

  Class['::mysql::server::service']
  ->
  mysql_user {'graphite@localhost':
    ensure        => present,
    password_hash => mysql_password($db_password)
  }
  ->
  mysql_database {'graphite':
    ensure => present
  }
  ->
  mysql_grant {'graphite@localhost/graphite.*':
    ensure     => present,
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => 'graphite.*',
    user       => "${db_user}@localhost",
  }

}
