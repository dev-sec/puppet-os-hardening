# === Copyright
#
# Copyright 2017, Vijay Kumar - bitvijays
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::modprobe
#
# Configures the dev-sec.conf. Sets:
# CIS: Disable unused filesystems - Ensure mounting of cramfs, freevxfs, jffs2, hfs, hfsplus, squashfs, udf, FAT#
#
class os_hardening::modprobe{
    file { '/etc/modeprobe.d/dev-sec.conf':
        ensure => present,
        source => 'puppet:///modules/os_hardening/dev-sec.conf',
        owner  => 'root',
        group  => 'root',
        mode   => '0640',
    }
  }
