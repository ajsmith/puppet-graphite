# == Class: graphite::docker::images
#
# Configure a host to build the Graphite docker images.

class graphite::docker::images (
  $build_dir    = '/opt/docker-graphite',
  $vcs_revision = '1.1',
){

  vcsrepo { $build_dir:
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/ajsmith/docker-graphite.git',
    revision => $vcs_revision,
  }

  Vcsrepo[$build_dir]
  ~>
  docker::image { 'graphite-mariadb':
    ensure     => present,
    docker_dir => '/opt/docker-graphite/mariadb',
  }

  Vcsrepo[$build_dir]
  ~>
  docker::image { 'graphite-carbon':
    ensure     => present,
    docker_dir => '/opt/docker-graphite/graphite-carbon',
  }

  Vcsrepo[$build_dir]
  ~>
  docker::image { 'graphite-web':
    ensure     => present,
    docker_dir => '/opt/docker-graphite/graphite-web',
  }

  Vcsrepo[$build_dir]
  ~>
  file {"${build_dir}/carbon/rhel/etc/carbon/carbon.conf":
    ensure  => present,
    content => template('graphite/etc/carbon/carbon.conf.erb'),
  }
  ~>
  Docker::Image['graphite-carbon']

  Vcsrepo[$build_dir]
  ~>
  file {"${build_dir}/carbon/rhel/etc/carbon/storage-schemas.conf":
    ensure  => present,
    content => template('graphite/etc/carbon/storage-schemas.conf.erb'),
  }
  ~>
  Docker::Image['graphite-carbon']

}
