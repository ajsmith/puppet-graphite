# puppet-graphite

#### Table of Contents

 1. [Overview](#overview)
 2. [Usage](#usage)
 3. [Compatibility](#compatibility)

## Overview

This module configures the Graphite monitoring server on a host in the simplest
way possible. It installs Graphite from packages, rather than building from
source. It also installs and configures dependencies, such as MySQL.

This module is currently only intended for Red Hat hosts (Fedora, CentOS,
RHEL), at least for now.

## Usage

Here's a basic configuration:

    class {'::graphite':
      http_port           => 8080,
      django_secret_key   => "c3NoaGggaXQncyBhIHNlY3JldAo=",
      db_password         => "graphitedbsecret",
      mysql_root_password => "mysqlsecret",
    }

## Compatibility

This module is currently only intended for Red Hat hosts (Fedora, CentOS,
RHEL), at least for now.

CentOS and RHEL systems need to add and enable the EPEL repository <https://fedoraproject.org/wiki/EPEL>.

## Release Notes

### v0.3.4 unreleased

- Configure Carbon for uncapped `MAX_CREATES_PER_MINUTE`.
- Configure Carbon to enable the UDP listener by default.

### v0.3.3 2016/01/11

- Style fixes.

### v0.3.2 2016/01/11

- Initial release.
