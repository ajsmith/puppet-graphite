# == Class: graphite
#
# Configures Graphite for monitoring.
#
# Deprecation Notice: MySQL has been deprecated and will be replaced with
# MariaDB soon.
#
# === Parameters
#
# [db_user]
#   The database user.
#
# [db_password]
#   The database password.
#
# [mysql_root_password]
#   The MySQL root password.
#
# [django_secret_key]
#   A secret used by Django for cryptographic signing.
#
# [http_port]
#   Port to run the HTTP server on.
#
# [storage_dir]
#   The directory where RRD, Whisper, and list files are stored.
#
# [rrd_dir]
#   The directory where RRD files are stored.
#
# [whitelists_dir]
#   The directory where whitelist files are stored.
#
# [whisper_dir]
#   The directory where Whisper files are stored.
#
class graphite (
  $db_password         = '',
  $db_user             = 'graphite',
  $django_secret_key   = 'UNSAFE_SECRET',
  $http_port           = 80,
  $mysql_root_password = '',
  $rrd_dir             = '/var/lib/carbon/rrd/',
  $storage_dir         = '/var/lib/carbon/',
  $whisper_dir         = '/var/lib/carbon/whisper/',
  $whitelists_dir      = '/var/lib/carbon/lists/',
) {

  include ::graphite::config
  include ::graphite::mysql

  package {
    [ 'graphite-web',
      'graphite-web-selinux',
      'python-carbon',
      'python-whisper',
      ]:
    ensure => installed,
  }

  Class['::graphite::config']
  ->
  Class['::graphite::mysql']
  ->
  exec {'graphite_syncdb':
    command     => '/usr/lib/python2.6/site-packages/graphite/manage.py syncdb --noinput',
    refreshonly => true,
  }

  Class['::graphite::config'] ~> Exec['graphite_syncdb']
  Class['::graphite::mysql'] ~> Exec['graphite_syncdb']

  service {'carbon-cache':
    ensure  => running,
    enable  => true,
    require => Class['::graphite::config'],
  }

  Class['::graphite::config'] ~> Service['carbon-cache']
  Package['python-carbon'] ~> Service['carbon-cache']

}
