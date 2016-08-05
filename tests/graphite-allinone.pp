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
