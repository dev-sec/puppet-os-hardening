# == Class: os_hardening::minimize_access
#
# Configures profile.conf.
#
# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
#
class os_hardening::minimize_access (
  $allow_change_user = false,
){

  # remove write permissions from path folders ($PATH) for all regular users
  # this prevents changing any system-wide command from normal users
  exec { "remove write permission from #{folder}":
    command => "/bin/chmod go-w -R /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin",
  }

  # shadow must only be accessible to user root
  file { "/etc/shadow":
    owner => root,
    group => root,
    mode => 600,
  }

  # su must only be accessible to user and group root
  if $allow_change_user == true {
    file { "/bin/su":
      owner => root,
      group => root,
      mode => 750,
    }
  }

}
