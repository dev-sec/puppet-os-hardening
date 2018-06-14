# === Copyright
#
# Copyright 2018, Kumina B.V., Tim Stoop
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::apparmor
#
# Configures AppArmor
#
class os_hardening::apparmor (
) {

  # Install the actual package
  package { ['apparmor','apparmor-utils','apparmor-profiles','apparmor-profiles-extra']:
    ensure => installed,
  }

  exec {
    'Enable apparmor at boot, apparmor=1':
      command => "/bin/sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=\"\\(.*\\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\\1 apparmor=1\"/g' /etc/default/grub;",
      unless  => "/bin/grep GRUB_CMDLINE_LINUX /etc/default/grub | /bin/grep -q 'apparmor=1'",
      notify  => Exec['After enable apparmor, update grub'];
    'Enable apparmor at boot, security=apparmor':
      command => "/bin/sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=\"\\(.*\\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\\1 security=apparmor\"/g' /etc/default/grub;",
      unless  => "/bin/grep GRUB_CMDLINE_LINUX /etc/default/grub | /bin/grep -q 'security=apparmor'",
      notify  => Exec['After enable apparmor, update grub'];
    'After enable apparmor, update grub':
      command     => '/usr/sbin/update-grub',
      refreshonly => true;
  }

}

