define graphite::docker::carbon::container (
  $image        = 'graphite-carbon',
  $depends      = undef,
  $link         = undef,
  $publish      = undef,
  $volumes_from = undef,
) {

  docker_systemd::service { "$title":
    image        => $image,
    depends      => $depends,
    link         => $link,
    publish      => $publish,
    volumes_from => $volumes_from,
  }

}
