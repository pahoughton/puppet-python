# == Class: python
#
# Installs Python and associated development packages
#
# === Examples
#
# include python
#
class python {

  case $::osfamily {
    'Darwin': {
      $provider = 'macports'
      $py_packages = ['python27',
                      'py27-pip',
                      'python33',
                      'py33-pip',
                      ]
    }
    'Debian': {
      $provider = undef
      case $::lsbdistdescription {
        /Ubuntu 12.04.* LTS/ : {
          # bug on travis ubuntu worker version 7 - missing python3-pip
          # see https://github.com/travis-ci/travis-ci/issues/1528
          $py_packages = ['python',
                          'python-pip',
                          'python3',
                          ]
        }
        default : {
          $py_packages = ['python',
                          'python-pip',
                          'python3',
                          'python3-pip',
                          ]
        }
      }
    }
    'RedHat':{
      $provider = undef
      $py_packages = ['python27',
                      'py27-pip',
                      'python33',
                      'py33-pip',
                      ]
    }
    default: {
      fail("\"${module_name}\" does not supoort osfamily: \"${::osfamily}\"")
    }
  }
  package { $py_packages :
    ensure    => installed,
    provider  => $provider
  }

  case $::lsbdistdescription {
    /Ubuntu 12.04.* LTS/ : {
      # install python pip3 for travis-ci
      exec { 'install setuptools' :
        command => shellquote(
          '/usr/bin/env',
          'curl',
          'http://python-distribute.org/distribute_setup.py',
          '|',
          'python3'),
      }->
      exec { 'install pip-3.3' :
        command => shellquote(
          '/usr/bin/env',
          'curl',
          'https://raw.github.com/pypa/pip/master/contrib/get-pip.py',
          '|',
          'python3'),
        creates => '/usr/bin/pip-3.3'
      }->
      file { '/usr/bin/pip3' :
        ensure => 'link',
        target => '/usr/bin/pip-3.3'
      }
      file { [
        '/usr/bin/python',
        '/usr/bin/pip',
        '/usr/bin/python3' ] :
          ensure => 'present',
      }
    }
    default : {
      case $::osfamily {
        'Darwin': {
          file { '/usr/bin/python' :
            ensure => 'link',
            target => '/opt/local/bin/python2.7'
          }
          file { '/usr/bin/pip' :
            ensure => 'link',
            target => '/opt/local/bin/pip-2.7'
          }
          file { '/usr/bin/python3' :
            ensure => 'link',
            target => '/opt/local/bin/python3.3'
          }
          file { '/usr/bin/pip3' :
            ensure => 'link',
            target => '/opt/local/bin/pip-3.3'
          }
        }
        default : {
          file { ['/usr/bin/python',
                  '/usr/bin/pip',
                  '/usr/bin/python3',
                  '/usr/bin/pip3' ] :
            ensure => 'present',
          }
        }
      }
    }
  }
}
