# === Copyright
#
# Copyright 2018, Kumina B.V., Tim Stoop
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::grub
#
# Hardens the grub config
#
class os_hardening::grub (
  String  $user          = 'root',
  String  $password_hash = false,
) {

  file { '/etc/grub.d/01_hardening':
    content => template('os_hardening/grub_hardening.erb'),
    notify  => Exec['Grub configuration recreate for os_hardening::grub'],
  }

  exec { 'Grub configuration recreate for os_hardening::grub':
    command     => '/usr/sbin/update-grub',
    refreshonly => true,
  }

  file { '/boot/grub/grub.cfg':
    owner => 'root',
    group => 'root',
    mode  => '0600',
  }

}

