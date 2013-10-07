# python::nose - install python nose
#
# This is really just an example that uses the new package providers

class python::nose {

  case $::osfamily {
    'Darwin' : {
      $pip = 'pipmp'
    }
    default : {
      $pip = 'pip'
    }
  }
  package { 'nose' :
    ensure   => 'installed',
    provider => $pip,
    require  => Class['python'],
  }
  # :( puppet bug cant install nose w/ 2 diff providers.
  package { 'nose-cover3' :
    ensure   => 'installed',
    provider => 'pip3',
    require  => Class['python'],
  }
}