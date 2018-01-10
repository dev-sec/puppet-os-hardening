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
  Array   $extra_user_paths         = [],
  String  $umask                    = '027',
  Boolean $usergroups               = true,
  Integer $sys_uid_min              = 100,
  Integer $sys_gid_min              = 100,
  Integer $password_max_age         = 60,
  Integer $password_min_age         = 7,
  Integer $login_retries            = 5,
  Integer $login_timeout            = 60,
  String  $chfn_restrict            = '',
  Boolean $allow_login_without_home = false,
) {

  # prepare all variables
  $additional_user_paths = join($extra_user_paths, ':')

  # convert bool to yes/no
  $usergroups_yn = bool2str($usergroups, 'yes', 'no')

  # set the file
  file { '/etc/login.defs':
      ensure  => file,
      content => template('os_hardening/login.defs.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0444',
  }

}

