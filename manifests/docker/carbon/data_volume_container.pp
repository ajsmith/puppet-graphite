define graphite::docker::carbon::data_volume_container (
  $image = 'graphite-carbon-data',
) {
  docker_systemd::data_volume_container { "$title":
    image => $image,
  }
}
