## puppet-python

Latest: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-python.png)](https://travis-ci.org/pahoughton/puppet-python)
Master: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-python.png?branch=master)](https://travis-ci.org/pahoughton/puppet-python)
Test OSX: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-python.png?branch=test-osx)](https://travis-ci.org/pahoughton/puppet-python)
Test Debian: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-python.png?branch=test-debian)](https://travis-ci.org/pahoughton/puppet-python)
Devel: [![Test Build Status](https://travis-ci.org/pahoughton/puppet-python.png?branch=test-devel)](https://travis-ci.org/pahoughton/puppet-python)

Provides Python 2.7 and 3.n development packages including pip and
pip3 providers

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
    /usr/bin/python2
    /usr/bin/pip2
    /usr/bin/python3
    /usr/bin/pip3

## Credits and License

Original Author: https://github.com/footballradar/puppet-python
Updated By: Paul Houghton <paul4hough@gmail.com>

License: Apache 2.0 (see LICENSE)
