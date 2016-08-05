# == Class: graphite::docker::web::container
#
# Configure a systemd service to run a Graphite Web container.

define graphite::docker::web::container (
  $image            = 'graphite-web',
  $pull_image       = false,
  $depends          = undef,
  $link             = undef,
  $publish          = undef,
  $volumes_from     = undef,
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
