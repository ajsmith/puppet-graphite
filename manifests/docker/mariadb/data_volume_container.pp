define graphite::docker::mariadb::data_volume_container (
  $image = 'graphite-mariadb-data',
) {
  docker_systemd::data_volume_container { "$title":
    image => $image,
  }
}
