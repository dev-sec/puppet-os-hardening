# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::securetty
#
# Configures securetty.
#
class os_hardening::securetty (
  $root_ttys = ['console','tty1','tty2','tty3','tty4','tty5','tty6']
){
  $ttys = join( $root_ttys, "\n")
  file { '/etc/securetty':
    ensure  => present,
    content => template( 'os_hardening/securetty.erb' ),
    owner   => root,
    group   => root,
    mode    => '0400',
  }
}
