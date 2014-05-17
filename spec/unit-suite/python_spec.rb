# python_spec.rb - 2013-10-07 08:01
#
# Copyright (c) 2014 Paul Houghton <paul4hough@gmail.com>
#
require 'spec_helper'

tobject = 'python'
ttype   = :class

supported = {
  'undef' => { 'undef' => ['undef',],},
  'Darwin' => {'undef' => ['undef',],},
  'Debian' => {'undef' => ['undef',],},
  'RedHat' => {
    'undef'  => ['undef',],
    'CentOS' => ['undef',],
  },
}

classes = {
  'undef'  => {'undef' => {'undef' => ['python'],},},
  'Darwin' => {'undef' => {'undef' => [],},},
  'Debian' => {'undef' => {'undef' => [],},},
  'RedHat' => {
    'undef' => {'undef' => [],},
    'CentOS' => {'undef' => [],},
  },
}

packages = {
  'undef' => {
    'undef' => {
      'undef' => ['python-pip',
                  'python-setuptools',
                  'python3',
                  'python3-pip',
                  'python3-setuptools',
                 ],
    },
  },
  'Darwin' => {
    'undef' => {
      'undef' => ['python27',
                  'py27-pip',
                  'python33',
                  'py33-pip',
                 ],
    },
  },
  'Debian' => {
    'undef' => {
      'undef' => ['python-pip',
                  'python-setuptools',
                  'python3',
                  'python3-pip',
                  'python3-setuptools',
                 ],
    },
  },
  'RedHat' => {
    'undef' => {
      'undef' => ['python-pip',
                  'python-setuptools',
                  'python3',
                  'python3-pip',
                  'python3-setuptools',
                 ],
    },
    'CentOS' => {
      'undef' => ['python27',
                  'python27-tools',
                  'python27-setuptools',
                  'python3',
                  'python3-tools',
                  'python3-setuptools',
                 ],
    },
  },
}

supported.keys.each { |fam|
  osfam = supported[fam]
  osfam.keys.each { |os|
    osfam[os].each { |rel|
      describe tobject, :type => ttype do
        tfacts = {
          :osfamily               => fam,
          :operatingsystem        => os,
          :operatingsystemrelease => rel,
          :os_maj_version         => rel,
        }
        let(:facts) do tfacts end
        context "supports facts #{tfacts}" do
          #print "p:#{fam}:#{os}:#{rel}:#{classes[fam][os][rel]}\n"
          classes[fam][os][rel].each { |cls|
            it { should contain_class(cls) }
          }
          packages[fam][os][rel].each { |pkg|
            it { should contain_package(pkg) }
          }
        end
      end
    }
  }
}
