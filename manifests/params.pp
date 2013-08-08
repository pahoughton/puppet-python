class python::params {

  case $::operatingsystem {
    'CentOS', 'Fedora', 'Scientific', 'RedHat', 'Amazon': {
      $package = 'python'
      $development_package = ['python-devel']
    }
    'Debian', 'Ubuntu': {
      $package = 'python'
      $development_package = ['python-dev', 'python-pip']
    }
    default: {
      fail("\"${module_name}\" provides no package default value
            for \"${::operatingsystem}\"")
    }
  }
}
