require 'spec_helper.rb'

os_facts = {
  :operatingsystem => 'RedHat',
  :osfamily => 'RedHat',
  :kernel => 'Linux',
}

describe 'graphite::docker::carbon::container' do
  context 'with defaults for all parameters' do
    let(:facts) { os_facts }
    let(:title) { 'graphite-carbon' }

    # It should at least do this.
    it { should compile }
  end
end

describe 'graphite::docker::carbon::data_volume_container' do
  context 'with defaults for all parameters' do
    let(:facts) { os_facts }
    let(:title) { 'graphite-carbon-data' }

    # It should at least do this.
    it { should compile }
  end
end

describe 'graphite::docker::mariadb::container' do
  context 'with defaults for all parameters' do
    let(:facts) { os_facts }
    let(:title) { 'graphite-mariadb' }

    # It should at least do this.
    it { should compile }
  end
end

describe 'graphite::docker::mariadb::data_volume_container' do
  context 'with defaults for all parameters' do
    let(:facts) { os_facts }
    let(:title) { 'graphite-mariadb-data' }

    # It should at least do this.
    it { should compile }
  end
end

describe 'graphite::docker::web::container' do
  context 'with defaults for all parameters' do
    let(:facts) { os_facts }
    let(:title) { 'graphite-web' }

    # It should at least do this.
    it { should compile }
  end
end
