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

CentOS and RHEL systems need to add and enable the EPEL repository[^1].

[^1]: https://fedoraproject.org/wiki/EPEL

## Release Notes

2015/05/18 - v0.2.0 release.
