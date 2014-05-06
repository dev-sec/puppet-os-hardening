# == Class: os_hardening::limits
#
# Configures the limits.conf. Sets:
# 
# * disable core dumps
#
# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
#
class os_hardening::limits (
  $allow_core_dumps = false
){
  if $allow_core_dumps == false {
    file {
      '/etc/security/limits.d/10.hardcore.conf':
        ensure => present,
        source => 'puppet:///modules/os_hardening/limits.conf',
        owner => root,
        group => root,
        mode => 400
    }
  }
}
