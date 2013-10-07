require 'spec_helper'

describe 'python::nose', :type => :class do
  context 'Darwin' do
    let(:facts) {{
      :osfamily                 => 'Darwin',
    }}
    it 'install python nose with pipmp' do
      should contain_package('nose').with(
        'ensure'   => 'installed',
        'provider' => 'pipmp'
      )
    end
    it 'install python3 nose-cover3 with pip3' do
      should contain_package('nose-cover3').with(
        'ensure'   => 'installed',
        'provider' => 'pip3'
      )
    end
  end
  
  context 'RedHat' do
    let(:facts) {{
      :osfamily                 => 'RedHat',
    }}
    it 'install python nose with pip' do
      should contain_package('nose').with(
        'ensure'   => 'installed',
        'provider' => 'pip'
      )
    end
    it 'install python3 nose-cover3 with pip3' do
      should contain_package('nose-cover3').with(
        'ensure'   => 'installed',
        'provider' => 'pip3'
      )
    end
  end
  
end