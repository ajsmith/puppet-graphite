# == Class: graphite::docker::images
#
# Configure a host to build the Graphite docker images.

class graphite::docker::images {

  vcsrepo { '/opt/docker-graphite':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/ajsmith/docker-graphite.git',
    revision => 'master',
  }

  Vcsrepo['/opt/docker-graphite']
  ~>
  docker::image { 'graphite-mariadb':
    ensure     => present,
    docker_dir => '/opt/docker-graphite/mariadb',
  }

  Vcsrepo['/opt/docker-graphite']
  ~>
  docker::image { 'graphite-carbon':
    ensure     => present,
    docker_dir => '/opt/docker-graphite/graphite-carbon',
  }

  Vcsrepo['/opt/docker-graphite']
  ~>
  docker::image { 'graphite-web':
    ensure     => present,
    docker_dir => '/opt/docker-graphite/graphite-web',
  }

}
