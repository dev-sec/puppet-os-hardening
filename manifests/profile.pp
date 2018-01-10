# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::profile
#
# Configures profile.conf.
#
class os_hardening::profile (
  Boolean $enable_core_dump = false,
) {

  if $enable_core_dump == false {
    file { '/etc/profile.d/pinerolo_profile.sh':
      ensure => file,
      source => 'puppet:///modules/os_hardening/profile.conf',
      owner  => 'root',
      group  => 'root',
      mode   => '0400',
    }
  } else {
    file { '/etc/profile.d/pinerolo_profile.sh':
      ensure => absent,
    }
  }

}

