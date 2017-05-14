# === Copyright
#
# Copyright 2017, Vijay Kumar - bitvijays
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::rc
#
# Configures /etc/init.d/rc
#
class os_hardening::rc (
  $umask = '027',
){
  # set the file
  file {
    '/etc/init.d/rc':
      ensure  => present,
      content => template( 'os_hardening/rc.erb' ),
      owner   => root,
      group   => root,
      mode    => '0755',
  }
}
