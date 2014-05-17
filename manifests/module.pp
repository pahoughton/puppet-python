# module.pp - 2014-05-17 05:44
#
# Copyright (c) 2014 Paul Houghton <paul4hough@gmail.com>
#
define python::module (
  $ensure   = 'installed',
  $provider = undef,
  ) {

  $pypkg = $provider ? {
    undef   => "python-${title}",
    default => $title,
  }

  ensure_resource('package',$pypkg,{
    ensure   => 'installed',
    provider => $provider,
  })
}
