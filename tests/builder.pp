class { 'graphite::docker::images':
  build_dir    => '/tmp/graphite-test',
  vcs_revision => '1.1',
}
