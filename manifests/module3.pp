# module3.pp - 2014-05-17 05:51
#
# Copyright (c) 2014 Paul Houghton <paul4hough@gmail.com>
#
define python::module3 (
  $ensure   = 'installed',
  $provider = undef,
  ) {

  $pypkg = $provider ? {
    undef   => "python3-${title}",
    default => $title,
  }

  ensure_resource('package',$pypkg,{
    ensure   => 'installed',
    provider => $provider,
  })
}
