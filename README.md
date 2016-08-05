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

```puppet
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

If you don't really care about configuring things yourself, you could just try
copying this into a Puppet file and running it:

```puppet
class {'::graphite':
  http_port           => 8080,
  django_secret_key   => "c3NoaGggaXQncyBhIHNlY3JldAo=",
  db_password         => "graphitedbsecret",
  mysql_root_password => "mysqlsecret",
}
```

## Usage

Here's a basic configuration:

```puppet
class {'::graphite':
  http_port           => 8080,
  django_secret_key   => "c3NoaGggaXQncyBhIHNlY3JldAo=",
  db_password         => "graphitedbsecret",
  mysql_root_password => "mysqlsecret",
}
```

Note: This package is currently in a somewhat transitional state. Please look
to the source for more in depth information about configuration options.

## Compatibility

This module is currently only intended for Red Hat, Fedora, or CentOS systems
capable of running Docker.

## Release Notes

### v0.5.0 (unreleased)

- Ugrade to ajsmith/docker_systemd v0.3.x.
- Add `pull_image` and `systemd_env_file` options for Docker containers.
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
