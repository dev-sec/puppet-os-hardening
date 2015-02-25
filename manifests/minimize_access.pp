# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::minimize_access
#
# Configures profile.conf.
#
class os_hardening::minimize_access (
  $allow_change_user = false,
){
  # from which folders to remove public access
  $folders = [
    '/usr/local/sbin',
    '/usr/local/bin',
    '/usr/sbin',
    '/usr/bin',
    '/sbin',
    '/bin',
  ]

  # remove write permissions from path folders ($PATH) for all regular users
  # this prevents changing any system-wide command from normal users
  file { $folders:
    ensure  => 'directory',
    links   => 'follow',
    mode    => 'go-w',
    recurse => true,
  }
  # shadow must only be accessible to user root
  file { '/etc/shadow':
    owner => root,
    group => root,
    mode  => '0600',
  }

  # su must only be accessible to user and group root
  if $allow_change_user == true {
    file { '/bin/su':
      owner => root,
      group => root,
      mode  => '0750',
    }
  }

}
