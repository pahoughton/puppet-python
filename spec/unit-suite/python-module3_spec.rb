# python3-module_spec.rb - 2014-05-17 06:31
#
# Copyright (c) 2014 Paul Houghton <paul4hough@gmail.com>
#
require 'spec_helper'

tobject = 'python::module3'
ttype   = :define

ttitle  = 'gd'

supported = {
  'undef' => { 'undef' => ['undef',],},
}

packages = {'undef' => {'undef' => {'undef' => ['python3-gd',]}}}

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
        let(:title) do ttitle end
        context "supports title: #{ttitle} facts: #{tfacts}" do
          #print "p:#{fam}:#{os}:#{rel}:#{classes[fam][os][rel]}\n"
          packages[fam][os][rel].each { |pkg|
            it { should contain_package(pkg) }
          }
        end
      end
    }
  }
}
