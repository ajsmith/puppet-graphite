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

  end
end
