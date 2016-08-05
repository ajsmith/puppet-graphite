# == Class: graphite::docker::mariadb::container
#
# Configure a systemd service to run a MariaDB container.

define graphite::docker::mariadb::container (
  $image            = 'graphite-mariadb',
  $pull_image       = false,
  $depends          = ['graphite-mariadb-data'],
  $link             = undef,
  $publish          = undef,
  $volume           = undef,
  $volumes_from     = ['graphite-mariadb-data'],
  $env              = undef,
  $env_file         = undef,
  $systemd_env_file = undef,
) {

  docker_systemd::container { $title:
    image            => $image,
    pull_image       => $pull_image,
    depends          => $depends,
    link             => $link,
    publish          => $publish,
    volume           => $volume,
    volumes_from     => $volumes_from,
    env              => $env,
    env_file         => $env_file,
    systemd_env_file => $systemd_env_file,
  }

}
