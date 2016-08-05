# puppet-graphite

#### Table of Contents

 1. [Overview](#overview)
 2. [Setup - The basics of getting started with docker_systemd](#setup)
      * [What graphite affects](#what-graphite-affects)
      * [Setup requirements](#setup-requirements)
      * [Beginning with graphite](#beginning-with-graphite)
 3. [Usage](#usage)
 4. [Compatibility](#compatibility)

## Overview

This module configures the Graphite monitoring server using Docker and systemd.

## Setup

### What graphite affects

To configure Graphite components to run as normal systemd services, this module
will generate systemd unit files in `/etc/systemd/system/`. Depending on how a
host is configured, the following unit files may be generated:

  * */etc/systemd/system/docker-graphite-web.service*
  * */etc/systemd/system/docker-graphite-carbon.service*
  * */etc/systemd/system/docker-graphite-carbon-data.service*
  * */etc/systemd/system/docker-graphite-mariadb.service*
  * */etc/systemd/system/docker-graphite-mariadb-data.service*

Any Docker containers will be stored using the Docker storage driver, no
differently than how any other container may be stored on the host.

If any Docker images are pulled as a result of running a Docker container,
those images will be stored using the Docker storage driver, no differently
than how any other container may be stored on the host.

This module **does not** install and Docker for you. Plenty of ways to install
Docker already exist, so this module does not add yet another way to do it.

### Setup Requirements

Ensure that Docker is installed and running. On Red Hat systems, this can
easily be accomplished using plain ol' Puppet resources, as so:

```.puppet
package { 'docker':
    ensure => latest
}
->
service { 'docker':
    ensure => true,
    enable => true
}
```

### Beginning with graphite

As stated above, Graphite is installed as a set of Docker containers. Each
container is configured as a systemd service to automatically handle starting
and ordering of services at boot.

## Usage

Here's an example which deploys a full set of Graphite containers including
persistent storage using data volume containers:

```.puppet
graphite::docker::carbon::data_volume_container { 'graphite-carbon-data':
  image => 'ajsmith/graphite-carbon',
}
->
graphite::docker::carbon::container { 'graphite-carbon':
  image        => 'ajsmith/graphite-carbon',
  depends      => ['graphite-carbon-data'],
  volumes_from => ['graphite-carbon-data'],
  publish      => ['2003:2003/tcp', '2004:2004/tcp', '7002:7002/tcp'],
}

graphite::docker::mariadb::data_volume_container { 'graphite-mariadb-data':
  image => 'ajsmith/graphite-mariadb',
}
->
graphite::docker::mariadb::container { 'graphite-mariadb':
  image        => 'ajsmith/graphite-mariadb',
  depends      => ['graphite-mariadb-data'],
  volumes_from => ['graphite-mariadb-data'],
}

graphite::docker::web::container { 'graphite-web':
  image        => 'ajsmith/graphite-web',
  depends      => ['graphite-mariadb'],
  link         => ['graphite-mariadb:db'],
  publish      => ['8080:80/tcp'],
  volumes_from => ['graphite-carbon-data'],
}

Graphite::Docker::Mariadb::Container['graphite-mariadb']
->
Graphite::Docker::Web::Container['graphite-web']

Graphite::Docker::Carbon::Container['graphite-carbon']
->
Graphite::Docker::Web::Container['graphite-web']
```

## Compatibility

This module is currently intended for Red Hat Linux systems capable of running
Docker and systemd.

- RHEL 7+
- CentOS 7+
- Fedora 20+

## Release Notes

### v0.5.1 2016/08/05

- Ugrade to ajsmith/docker_systemd v0.3.x.
- Add the following options for Docker containers:
    - `pull_image`
    - `volume`
    - `env`
    - `env_file`
    - `systemd_env_file`
- Set default Graphite Carbon image to `ajsmith/graphite-carbon`.
- Set default Graphite Web image to `ajsmith/graphite-web`.
- Set default Graphite MariaDB image to `ajsmith/graphite-mariadb`.
- Add class to which provides Graphite Web syncdb script.
- Update rspec tests.
- Remove resources for building Graphite Docker images.
- Remove legacy Graphite installation method.

### v0.4.0 2016/02/09

- Configure Carbon for uncapped `MAX_CREATES_PER_MINUTE`.
- Configure Carbon to enable the UDP listener by default.
- Update Graphite default settings from latest EPEL release.
- Allow custom configuration to be added to Graphite Docker images.
- Allow Docker build dir to be configured.
- Allow Graphite Dockerfile revision to be configured.

### v0.3.3 2016/01/11

- Style fixes.

### v0.3.2 2016/01/11

- Initial release.
