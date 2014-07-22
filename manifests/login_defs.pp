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
class os_hardening::login_defs (
  $extra_user_paths = [],
  $umask = '027',
  $password_max_age = 60,
  $password_min_age = 7,
  $login_retries = 5,
  $login_timeout = 60,
  $chfn_restrict = '',
  $allow_login_without_home = false,
){
  # prepare all variables
  $additional_user_paths = join( $extra_user_paths, ':' )

  # set the file
  file {
    '/etc/login.defs':
      ensure  => present,
      content => template( 'os_hardening/login.defs.erb' ),
      owner   => root,
      group   => root,
      mode    => '0400',
  }
}
