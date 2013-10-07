require 'spec_helper'

# I wish there was a better way, but system test will verify.
$fam_pkg = {
  :Darwin => 'python33',
  :RedHat => 'python33',
  :Debian => 'python3',
}

describe 'python', :type => :class do
  $fam_pkg.each {|osfam,pkg|
    context "on osfamily #{osfam}" do
      let(:facts) {{
        :osfamily                 => "#{osfam}",
      }}
      it "installs #{pkg} package on #{osfam}" do 
        should contain_package(pkg).with_ensure('installed')
      end
      [ '/usr/bin/python',
        '/usr/bin/python3',
        '/usr/bin/pip',
        '/usr/bin/pip3',
      ].each {|fn|
        it "installs #{fn}" do
          should contain_file(fn)
        end        
      }
    end
  }
end