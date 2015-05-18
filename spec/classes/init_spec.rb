require 'spec_helper.rb'

describe 'graphite' do
  context 'with defaults for all parameters' do

    let(:facts) {
      {
        :operatingsystem => 'RedHat',
        :osfamily => 'RedHat',
        :kernel => 'Linux',
      }
    }

    # It should at least do this.
    it { should compile }
    it { should contain_class('graphite') }

    # Graphite tests
    it { should contain_package('graphite-web').with_ensure('installed') }
    it { should contain_package('graphite-web-selinux').with_ensure('installed') }
    it { should contain_package('python-carbon').with_ensure('installed') }
    it { should contain_package('python-whisper').with_ensure('installed') }
    it { should contain_package('mysql-server').with_ensure('present') }
    it { should contain_package('MySQL-python').with_ensure('installed') }
    it { should contain_service('mysqld').with_ensure('running') }
    it { should contain_service('carbon-cache').with_ensure('running') }
    it { should contain_file('/etc/carbon/carbon.conf') }
    it { should contain_file('/etc/carbon/storage-schemas.conf') }
    it { should contain_file('/etc/sysconfig/carbon') }
    it { should contain_file('/etc/graphite-web/dashboard.conf') }
    it { should contain_file('/etc/graphite-web/local_settings.py') }
    it { should contain_file('/etc/httpd/conf.d/graphite-web.conf') }

  end
end
