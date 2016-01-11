# == Class: graphite::docker::mariadb::container
#
# Configure a systemd service to run a MariaDB container.

define graphite::docker::mariadb::container (
  $image            = 'graphite-mariadb',
  $depends          = ['graphite-mariadb-data'],
  $link             = undef,
  $publish          = undef,
  $volumes_from     = ['graphite-mariadb-data'],
) {

  docker_systemd::container { $title:
    image        => $image,
    depends      => $depends,
    link         => $link,
    publish      => $publish,
    volumes_from => $volumes_from,
  }

}
