# == Class: graphite::docker::mariadb::container
#
# Configure a systemd service to run a MariaDB container.

define graphite::docker::mariadb::container (
  $image            = 'graphite-mariadb',
  $pull_image       = false,
  $depends          = ['graphite-mariadb-data'],
  $link             = undef,
  $publish          = undef,
  $volumes_from     = ['graphite-mariadb-data'],
  $systemd_env_file = undef,
) {

  docker_systemd::container { $title:
    image            => $image,
    pull_image       => $pull_image,
    depends          => $depends,
    link             => $link,
    publish          => $publish,
    volumes_from     => $volumes_from,
    systemd_env_file => $systemd_env_file,
  }

}
