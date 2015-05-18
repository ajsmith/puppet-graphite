# == Class: graphite::config
#
# Configuration files for Graphite components.
#
class graphite::config {

  file {'/etc/carbon/carbon.conf':
    ensure  => present,
    content => template('graphite/etc/carbon/carbon.conf.erb'),
    require => Package['python-carbon'],
  }

  file {'/etc/carbon/storage-schemas.conf':
    ensure  => present,
    content => template('graphite/etc/carbon/storage-schemas.conf.erb'),
    require => Package['python-carbon'],
  }

  file {'/etc/sysconfig/carbon':
    ensure  => present,
    content => template('graphite/etc/sysconfig/carbon.erb'),
  }

  file {'/etc/graphite-web/dashboard.conf':
    ensure  => present,
    content => template('graphite/etc/graphite-web/dashboard.conf.erb'),
    require => Package['graphite-web'],
  }

  file {'/etc/graphite-web/local_settings.py':
    ensure  => present,
    content => template('graphite/etc/graphite-web/local_settings.py.erb'),
    require => Package['graphite-web'],
  }

  file {'/etc/httpd/conf.d/graphite-web.conf':
    ensure  => present,
    content => template('graphite/etc/httpd/conf.d/graphite-web.conf.erb'),
  }

}
