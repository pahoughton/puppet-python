# == Class: python
#
# Installs Python and associated development packages
#
# === Examples
#
# include python
#
class python {

  $pkgprovider = $::osfamily ? {
    'Darwin' => 'macports',
    default  => undef,
  }

  $ofpkgs = $::osfamily ? {
    'Darwin' => [ 'python27',
                  'py27-pip',
                  'python33',
                  'py33-pip',
                  ],
    'Debian' => [ 'python-pip',
                  'python-setuptools',
                  'python3',
                  'python3-pip',
                  'python3-setuptools',
                  ],
    default  => undef,
  }
  $ospkgs = $::operatingsystem ? {
    'CentOS' => [ 'python27',
                  'python27-tools',
                  'python27-setuptools',
                  'python3',
                  'python3-tools',
                  'python3-setuptools',
                  ],
    default  => [ 'python-pip',
                  'python-setuptools',
                  'python3',
                  'python3-pip',
                  'python3-setuptools',
                  ],
  }

  if $::operatingsystem == 'CentOS' {

    Yumrepo <| |> -> Package <| |>

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-puias' :
      source => 'puppet:///modules/python/RPM-GPG-KEY-puias',
    }
    ->
    yumrepo { 'puias' :
      name        => 'puias',
      mirrorlist  => 'http://puias.math.ias.edu/data/puias/computational/$releasever/$basearch/mirrorlist',
      enabled     => 1,
      gpgcheck    => 1,
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puias',
    }

    # todo - centos
    # exec { 'install centos pip-2.7' :
    #   command => '/usr/bin/env curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py  | python2.7',
    #   creates => '/usr/bin/pip-2.7',
    #   require => Package['python27-setuptools'],
    # }
    # ->
    # file { '/usr/bin/pip27' :
    #   ensure => 'link',
    #   target => '/usr/bin/pip-2.7'
    # }
    # exec { 'install centos pip-3.3' :
    #   command => '/usr/bin/env curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python3',
    #   creates => '/usr/bin/pip3.3',
    #   require => Package['python3-setuptools'],
    # }
    # ->
    # file { '/usr/bin/pip3' :
    #   ensure => 'link',
    #   target => '/usr/bin/pip3.3'
    # }
  }

  if $ofpkgs {
    ensure_resource('package',$ofpkgs,{
      ensure    => installed,
      provider  => $pkgprovider,
    })
  }
  ensure_resource('package',$ospkgs,{
    ensure    => installed,
    provider  => $pkgprovider,
  })
}
