# == Class: os_hardening::profile
#
# Configures profile.conf.
#
# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
#
class os_hardening::profile (
  $allow_core_dumps = false
){
  if $allow_core_dumps == false {
    file {
      '/etc/profile.d/pinerolo_profile.sh':
        ensure => present,
        source => 'puppet:///modules/os_hardening/profile.conf',
        owner => root,
        group => root,
        mode => 400
    }
  }
}
