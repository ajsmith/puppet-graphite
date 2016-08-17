# == Class: graphite::docker::web::container
#
# Configure a systemd service to run a Graphite Web container.

define graphite::docker::web::container (
  $image            = 'ajsmith/graphite-web',
  $depends          = undef,
  $pull_image       = false,
  $env              = undef,
  $env_file         = undef,
  $link             = undef,
  $log_driver       = undef,
  $log_opt          = undef,
  $publish          = undef,
  $volume           = undef,
  $volumes_from     = undef,
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

  ->
  class { 'graphite::docker::web::syncdb':
    graphite_web_container => $title,
  }

}
