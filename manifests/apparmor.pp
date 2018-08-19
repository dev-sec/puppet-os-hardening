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
  Boolean $enable      = false,
  Boolean $enforce_all = false,
) {

  case $::operatingsystem {
    debian, ubuntu: {
      packages = ['apparmor','apparmor-utils','apparmor-profiles','apparmor-profiles-extra']
    }
  }

  if $enable {
    $package_action = 'installed'
  } else {
    $package_action = 'removed'
  }

  # Install the actual package
  package { $packages:
    ensure => $package_action,
  }

  if $enable {
    exec {
      'Enable apparmor at boot, apparmor=1':
        command => "/bin/sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=\"\\(.*\\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\\1 apparmor=1\"/g' /etc/default/grub;",
        unless  => "/bin/grep GRUB_CMDLINE_LINUX /etc/default/grub | /bin/grep -q 'apparmor=1'",
        notify  => Exec['After apparmor change, update grub'];
      'Enable apparmor at boot, security=apparmor':
        command => "/bin/sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=\"\\(.*\\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\\1 security=apparmor\"/g' /etc/default/grub;",
        unless  => "/bin/grep GRUB_CMDLINE_LINUX /etc/default/grub | /bin/grep -q 'security=apparmor'",
        notify  => Exec['After apparmor change, update grub'];
    }
  } else {
    exec {
      'Disable apparmor at boot, apparmor=1':
        command => "/bin/sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=\"\\(.*\\)apparmor=1\\(.*\\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\\1\\2\"/g' /etc/default/grub;",
        onlyif  => "/bin/grep GRUB_CMDLINE_LINUX /etc/default/grub | /bin/grep -q 'apparmor=1'",
        notify  => Exec['After apparmor change, update grub'];
      'Disable apparmor at boot, security=apparmor':
        command => "/bin/sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=\"\\(.*\\)security=apparmor\\(.*\\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\\1\\2\"/g' /etc/default/grub;",
        onlyif  => "/bin/grep GRUB_CMDLINE_LINUX /etc/default/grub | /bin/grep -q 'security=apparmor'",
        notify  => Exec['After apparmor change, update grub'];
    }
  }

  if $enforce_all {
    exec { 'Enforce all AppArmor profiles on the system':
      command => '/usr/sbin/aa-enforce /etc/apparmor.d/*',
      onlyif  => ['/bin/sh -c "[ $(apparmor_status --enforced) -lt $(apparmor_status --profiled) ]"', '/usr/sbin/apparmor_status >/dev/null 2>&1; retval=$?; [ $retval -eq 0 ] || [ $retval -eq 2 ]'],
    }
  }

  exec { 'After apparmor change, update grub':
    command     => '/usr/sbin/update-grub',
    refreshonly => true;
  }

}

