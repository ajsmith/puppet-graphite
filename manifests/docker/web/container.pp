# == Class: graphite::docker::web::container
#
# Configure a systemd service to run a Graphite Web container.

define graphite::docker::web::container (
  $image            = 'graphite-web',
  $depends          = undef,
  $link             = undef,
  $publish          = undef,
  $volumes_from     = undef,
) {

  docker_systemd::container { $title:
    image        => $image,
    depends      => $depends,
    link         => $link,
    publish      => $publish,
    volumes_from => $volumes_from,
  }

}
