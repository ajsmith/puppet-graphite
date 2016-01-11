# == Class: graphite::docker::carbon::data_volume_container
#
# Configure a systemd service to run a Graphite Carbon data volume container.

define graphite::docker::carbon::data_volume_container (
  $image = 'graphite-carbon-data',
) {
  docker_systemd::data_volume_container { $title:
    image => $image,
  }
}
