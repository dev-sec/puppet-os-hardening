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
  String  $user                  = 'root',
  String  $password_hash         = false,
  Boolean $boot_without_password = true,
) {

  file { '/etc/grub.d/01_hardening':
    content => template('os_hardening/grub_hardening.erb'),
    notify  => Exec['Grub configuration recreate for os_hardening::grub'],
  }

  if $boot_without_password {
    # This sets up Grub on Debian Stretch so you can still boot the system without a password
    exec { 'Keep system bootable without credentials':
      command => "/bin/sed -i -e 's/^CLASS=\"\\(.*\\)\"/CLASS=\"\\1 --unrestricted\"/' /etc/grub.d/10_linux;",
      unless  => '/bin/grep -e "^CLASS=" /etc/grub.d/10_linux | /bin/grep -q -- "--unrestricted"',
      notify  => Exec['Grub configuration recreate for os_hardening::grub'],
    }
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

