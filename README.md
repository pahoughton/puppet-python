## puppet-python

Latest: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-homedirs.png)](https://travis-ci.org/pahoughton/puppet-homedirs)
Master: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-homedirs.png?branch=master)](https://travis-ci.org/pahoughton/puppet-homedirs)
Test OSX: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-homedirs.png?branch=test-osx)](https://travis-ci.org/pahoughton/puppet-homedirs)
Test Debian: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-homedirs.png?branch=test-debian)](https://travis-ci.org/pahoughton/puppet-homedirs)
Devel: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-homedirs.png?branch=test-devel)](https://travis-ci.org/pahoughton/puppet-homedirs)

A Puppet module providing Python and Python3 packages.
Also provides pipmp and pip3 package providers.

## Usage

    include python

    package { 'nose' :
      ensure   => install,
      provider => pip3,
    }
    # pip installs for /usr/bin/python - pipmp: /opt/local/bin/python
    package { 'nose-cover3' :
      ensure   => install,
      provider => pipmp,
    }
## Testing

Tested on Debian (Ubuntu), Darwin (OSX) and RedHat (Fedora)

    python
      on osfamily Darwin
        installs python33 package on Darwin
        installs /usr/bin/python
        installs /usr/bin/python3
        installs /usr/bin/pip
        installs /usr/bin/pip3
      on osfamily RedHat
        installs python33 package on RedHat
        installs /usr/bin/python
        installs /usr/bin/python3
        installs /usr/bin/pip
        installs /usr/bin/pip3
      on osfamily Debian
        installs python3 package on Debian
        installs /usr/bin/python
        installs /usr/bin/python3
        installs /usr/bin/pip
        installs /usr/bin/pip3
    python::nose
      Darwin
        install python nose with pipmp
        install python3 nose-cover3 with pip3
      RedHat
        install python nose with pip
        install python3 nose-cover3 with pip3
    
## Installs 
    
    /usr/bin/python
    /usr/bin/pip
    /usr/bin/python3
    /usr/bin/pip3
    
## Credits and License

Original Author: https://github.com/footballradar/puppet-python
Updated By: Paul Houghton <paul4hough@gmail.com>

License: Apache 2.0 (see LICENSE)
