# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::pam
#
# Configures PAM
#
class os_hardening::login_defs {

  # set the file
  file {
    '/etc/login.defs':
      ensure  => file,
      content => template( 'os_hardening/login.defs.erb' ),
      owner   => 'root',
      group   => 'root',
      mode    => '0444',
  }
}
