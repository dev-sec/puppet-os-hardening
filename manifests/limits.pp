# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::limits
#
# Configures the limits.conf. Sets:
#
# * disable core dumps
#
# @param enable_core_dump
#
class os_hardening::limits (
  Boolean $enable_core_dump = false,
) {
  if $enable_core_dump == false {
    file { '/etc/security/limits.d/10.hardcore.conf':
      ensure => file,
      source => 'puppet:///modules/os_hardening/limits.conf',
      owner  => 'root',
      group  => 'root',
      mode   => '0400',
    }
  } else {
    file { '/etc/security/limits.d/10.hardcore.conf':
      ensure => absent,
    }
  }
}
