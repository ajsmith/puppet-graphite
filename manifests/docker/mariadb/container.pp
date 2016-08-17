# == Class: graphite::docker::mariadb::container
#
# Configure a systemd service to run a MariaDB container.

define graphite::docker::mariadb::container (
  $image            = 'ajsmith/graphite-mariadb',
  $depends          = ['graphite-mariadb-data'],
  $pull_image       = false,
  $env              = undef,
  $env_file         = undef,
  $link             = undef,
  $log_driver       = undef,
  $log_opt          = undef,
  $publish          = undef,
  $volume           = undef,
  $volumes_from     = ['graphite-mariadb-data'],
  $systemd_env_file = undef,
) {

  docker_systemd::container { $title:
    image            => $image,
    depends          => $depends,
    pull_image       => $pull_image,
    env              => $env,
    env_file         => $env_file,
    link             => $link,
    log_driver       => $log_driver,
    log_opt          => $log_opt,
    publish          => $publish,
    volume           => $volume,
    volumes_from     => $volumes_from,
    systemd_env_file => $systemd_env_file,
  }

}
