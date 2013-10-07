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
      $py_packages = ['python',
                      'python-pip',
                      'python3',
                      'python3-pip',
                      ]
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
      file { [
        '/usr/bin/python',
        '/usr/bin/pip',
        '/usr/bin/python3',
        '/usr/bin/pip3' ] :
        ensure => 'present',
      }
    }
  }
}
