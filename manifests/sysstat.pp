# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::sysstat
#
# Configures /etc/default/sysstat
#
class os_hardening::sysstat (
  $sysstat_enabled = 'true',
){
  # set the file
  file {
    '/etc/default/sysstat':
      ensure  => present,
      content => template( 'os_hardening/sysstat.erb' ),
      owner   => root,
      group   => root,
      mode    => '0644',
  }
}
