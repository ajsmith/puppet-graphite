# == Class: graphite::docker::web::container
#
# Configure a systemd service to run a Graphite Web container.

define graphite::docker::web::container (
  $image            = 'ajsmith/graphite-web',
  $pull_image       = false,
  $depends          = undef,
  $link             = undef,
  $publish          = undef,
  $volume           = undef,
  $volumes_from     = undef,
  $env              = undef,
  $env_file         = undef,
  $systemd_env_file = undef,
) {

  class { 'graphite::docker::web::syncdb':
    graphite_web_container => $title,
  }

  ->
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
