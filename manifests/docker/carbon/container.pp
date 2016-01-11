# == Class: graphite::docker::carbon::container
#
# Configure a systemd service to run a Graphite Carbon container.

define graphite::docker::carbon::container (
  $image        = 'graphite-carbon',
  $depends      = undef,
  $link         = undef,
  $publish      = undef,
  $volumes_from = undef,
) {

  docker_systemd::container { $title:
    image        => $image,
    depends      => $depends,
    link         => $link,
    publish      => $publish,
    volumes_from => $volumes_from,
  }

}
