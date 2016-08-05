# == Class: graphite::docker::carbon::data_volume_container
#
# Configure a systemd service to run a Graphite Carbon data volume container.

define graphite::docker::carbon::data_volume_container (
  $image            = 'ajsmith/graphite-carbon',
  $pull_image       = false,
  $systemd_env_file = undef,
) {
  docker_systemd::data_volume_container { $title:
    image            => $image,
    pull_image       => $pull_image,
    systemd_env_file => $systemd_env_file,
  }
}
