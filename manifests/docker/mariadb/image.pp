# == Class: graphite::docker::mariadb::image
#
# Configure a host to build the MariaDB docker image for Graphite.

class graphite::docker::mariadb::image {

  vcsrepo { '/opt/docker-graphite':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/ajsmith/docker-graphite.git',
    revision => 'master',
  }

  ~>
  docker::image { 'graphite':
    ensure     => present,
    docker_dir => '/opt/docker-graphite/',
  }

}
