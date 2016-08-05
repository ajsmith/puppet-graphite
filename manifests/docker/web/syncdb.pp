# == Class: graphite::docker::web::syncdb
#
# Configure a systemd service to exec the Graphite Web syncdb script.

class graphite::docker::web::syncdb (
  $graphite_web_container = 'graphite-web',
) {

  docker_systemd::exec { 'graphite_web_syncdb':
    command   => '/usr/lib/python2.7/site-packages/graphite/manage.py syncdb --noinput',
    container => $graphite_web_container,
  }

}
