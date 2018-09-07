# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::umask
#
# Configures system umask.
#
class os_hardening::umask (
  $system_umask = undef,
) {

  if $system_umask != undef {

    file { '/etc/profile.d/umask.sh':
      ensure  => file,
      content => template('os_hardening/umask.sh.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }
  else {
    file { '/etc/profile.d/umask.sh':
      ensure  => absent,
    }
  }
}