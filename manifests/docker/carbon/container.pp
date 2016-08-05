# == Class: graphite::docker::carbon::container
#
# Configure a systemd service to run a Graphite Carbon container.

define graphite::docker::carbon::container (
  $image            = 'ajsmith/graphite-carbon',
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
