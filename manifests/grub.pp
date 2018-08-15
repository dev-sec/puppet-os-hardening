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
  Boolean $enable                = false,
  String  $user                  = 'root',
  String  $password_hash         = '',
  Boolean $boot_without_password = true,
) {

  case $::operatingsystem {
    debian, ubuntu: {
      $grub_cfg = '/boot/grub/grub.cfg'
      $grub_cmd = '/usr/sbin/grub-mkconfig'
    }
    default: {
      $grub_cfg = '/boot/grub2/grub.cfg'
      $grub_cmd = '/usr/sbin/grub2-mkconfig'
    }
  }

  if $enable {
    file { '/etc/grub.d/01_hardening':
      content => template('os_hardening/grub_hardening.erb'),
      notify  => Exec['Grub configuration recreate for os_hardening::grub'],
      mode    => '0755',
    }

    file { $grub_cfg:
      owner => 'root',
      group => 'root',
      mode  => '0600',
    }

    if $boot_without_password {
      # This sets up Grub on Debian Stretch so you can still boot the system without a password
      exec { 'Keep system bootable without credentials':
        command => "/bin/sed -i -e 's/^CLASS=\"\\(.*\\)\"/CLASS=\"\\1 --unrestricted\"/' /etc/grub.d/10_linux;",
        unless  => '/bin/grep -e "^CLASS=" /etc/grub.d/10_linux | /bin/grep -q -- "--unrestricted"',
        notify  => Exec['Grub configuration recreate for os_hardening::grub'],
      }
    } else {
      exec { 'Remove addition for keeping system bootable without credentials':
        command => "/bin/sed -i -e 's/^CLASS=\"\\(.*\\) --unrestricted\\(.*\\)\"/CLASS=\"\\1\\2\"/' /etc/grub.d/10_linux;",
        onlyif  => '/bin/grep -e "^CLASS=" /etc/grub.d/10_linux | /bin/grep -q -- "--unrestricted"',
        notify  => Exec['Grub configuration recreate for os_hardening::grub'],
      }
    }
  } else {
    file { '/etc/grub.d/01_hardening':
      ensure => absent,
      notify => Exec['Grub configuration recreate for os_hardening::grub'],
    }
  }

  exec { 'Grub configuration recreate for os_hardening::grub':
    command     => "${grub_cmd} -o ${grub_cfg}",
    refreshonly => true,
  }

}

