require 'spec_helper.rb'

describe 'graphite::docker::web::syncdb' do
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
  end
end
