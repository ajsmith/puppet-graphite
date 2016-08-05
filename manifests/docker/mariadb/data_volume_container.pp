# == Class: graphite::docker::mariadb::data_volume_container
#
# Configure a systemd service to run a MariaDB data volume container.

define graphite::docker::mariadb::data_volume_container (
  $image      = 'graphite-mariadb-data',
  $pull_image = false,
) {
  docker_systemd::data_volume_container { $title:
    image      => $image,
    pull_image => $pull_image,
  }
}
