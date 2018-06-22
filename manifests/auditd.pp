# === Copyright
#
# Copyright 2018, Kumina B.V., Tim Stoop
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::auditd
#
# Configures Auditd according to the CIS DIL Benchmark
#
class os_hardening::auditd (
  Integer                                                    $max_log_file        = 8,
  Enum['rotate', 'ignore', 'syslog', 'suspend', 'keep_logs'] $max_log_file_action = 'rotate',
  Integer                                                    $num_logs            = 5,
  Boolean                                                    $selinux_in_use      = false,
  Boolean                                                    $apparmor_in_use     = false,
  Array                                                      $privileged_binaries = [],
) {

  case $::operatingsystem {
    debian, ubuntu: {
      $audit_rules = '/etc/audit/rules.d/cis.rules'
      $audit_rules_last = '/etc/audit/rules.d/zzz_last.rules'
      $network_file = '/etc/network'
      $non_system_users_from = 1000
    }
    default: {
      $audit_rules = '/etc/audit/audit.rules'
      $audit_rules_last = $audit_rules
      $network_file = '/etc/sysconfig/network'
      $non_system_users_from = 500
    }
  }

  package { 'auditd':
    ensure => installed,
  }

  service { 'auditd':
    ensure => running,
    enable => true,
  }

  file { $audit_rules:
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  if $audit_rules_last != $audit_rules {
    file { $audit_rules_last:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0640',
    }
  }

  file_line { 'CIS DIL Benchmark 4.1.1.1 - Ensure audit log storage size is configured':
    path   => '/etc/audit/auditd.conf',
    match  => '^max_log_file =.*',
    line   => "max_log_file = ${max_log_file}",
    notify => Service['auditd'],
  }

  file_line {
    'CIS DIL Benchmark 4.1.1.2 - Ensure system is disabled when audit logs are full, space_left_action':
      path   => '/etc/audit/auditd.conf',
      match  => '^space_left_action =.*',
      notify => Service['auditd'],
      line   => 'space_left_action = email';
    'CIS DIL Benchmark 4.1.1.2 - Ensure system is disabled when audit logs are full, action_mail_acct':
      path   => '/etc/audit/auditd.conf',
      match  => '^action_mail_acct =.*',
      notify => Service['auditd'],
      line   => 'action_mail_acct = root';
    'CIS DIL Benchmark 4.1.1.2 - Ensure system is disabled when audit logs are full, admin_space_left_action':
      path   => '/etc/audit/auditd.conf',
      match  => '^admin_space_left_action =.*',
      notify => Service['auditd'],
      line   => 'admin_space_left_action = halt';
  }

  file_line { 'CIS DIL Benchmark 4.1.1.3 - Ensure audit logs are not automatically deleted':
    path   => '/etc/audit/auditd.conf',
    match  => '^max_log_file_action =.*',
    line   => "max_log_file_action = ${max_log_file_action}",
    notify => Service['auditd'],
  }

  if $max_log_file_action == 'rotate' {
    file_line { 'CIS DIL Benchmark 4.1.1.3 not implemented, number of logs to keep':
      path   => '/etc/audit/auditd.conf',
      match  => '^num_logs =.*',
      line   => "num_logs = ${num_logs}",
      notify => Service['auditd'],
    }
  }

  # CIS DIL Benchmark 4.1.3 - Ensure auditing for processes that start prior to auditd is enabled
  exec { 'CIS DIL Benchmark 4.1.3 - Ensure auditing for processes that start prior to auditd is enabled':
    command => "/bin/sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=\"\\(.*\\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\\1 audit=1\"/g' /etc/default/grub;",
    unless  => "/bin/grep GRUB_CMDLINE_LINUX /etc/default/grub | /bin/grep -q 'audit=1'",
    notify  => Exec['CIS DIL Benchmark 4.1.3 - Ensure auditing for processes that start prior to auditd is enabled - update grub'],
  }

  exec { 'CIS DIL Benchmark 4.1.3 - Ensure auditing for processes that start prior to auditd is enabled - update grub':
    command     => '/usr/sbin/update-grub',
    refreshonly => true,
  }

  file_line {
    'CIS DIL Benchmark 4.1.4 - Ensure events that modify date and time information are collected - line 1, 32 bit':
      path   => $audit_rules,
      line   => '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.4 - Ensure events that modify date and time information are collected - line 2, 32 bit':
      path   => $audit_rules,
      line   => '-a always,exit -F arch=b32 -S clock_settime -k time-change',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.4 - Ensure events that modify date and time information are collected - line 3':
      path   => $audit_rules,
      line   => '-w /etc/localtime -p wa -k time-change',
      notify => Service['auditd'];
  }

  if $::architecture == 'amd64' {
    file_line {
      'CIS DIL Benchmark 4.1.4 - Ensure events that modify date and time information are collected - line 1, 64 bit':
        path   => $audit_rules,
        line   => '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change',
        notify => Service['auditd'];
      'CIS DIL Benchmark 4.1.4 - Ensure events that modify date and time information are collected - line 2, 64 bit':
        path   => $audit_rules,
        line   => '-a always,exit -F arch=b64 -S clock_settime -k time-change',
        notify => Service['auditd'];
    }
  }

  file_line {
    'CIS DIL Benchmark 4.1.5 - Ensure events that modify user/group information are collected - line 1':
      path   => $audit_rules,
      line   => '-w /etc/group -p wa -k identity',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.5 - Ensure events that modify user/group information are collected - line 2':
      path   => $audit_rules,
      line   => '-w /etc/passwd -p wa -k identity',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.5 - Ensure events that modify user/group information are collected - line 3':
      path   => $audit_rules,
      line   => '-w /etc/gshadow -p wa -k identity',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.5 - Ensure events that modify user/group information are collected - line 4':
      path   => $audit_rules,
      line   => '-w /etc/shadow -p wa -k identity',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.5 - Ensure events that modify user/group information are collected - line 5':
      path   => $audit_rules,
      line   => '-w /etc/security/opasswd -p wa -k identity',
      notify => Service['auditd'];
  }

  file_line {
    'CIS DIL Benchmark 4.1.6 - Ensure events that modify the system\'s network environment are collected - line 1, 32bit':
      path   => $audit_rules,
      line   => '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.6 - Ensure events that modify the system\'s network environment are collected - line 2':
      path   => $audit_rules,
      line   => '-w /etc/issue -p wa -k system-locale',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.6 - Ensure events that modify the system\'s network environment are collected - line 3':
      path   => $audit_rules,
      line   => '-w /etc/issue.net -p wa -k system-locale',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.6 - Ensure events that modify the system\'s network environment are collected - line 4':
      path   => $audit_rules,
      line   => '-w /etc/hosts -p wa -k system-locale',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.6 - Ensure events that modify the system\'s network environment are collected - line 5':
      path   => $audit_rules,
      line   => "-w ${network_file} -p wa -k system-locale",
      notify => Service['auditd'];
  }

  if $::architecture == 'amd64' {
    file_line {
      'CIS DIL Benchmark 4.1.6 - Ensure events that modify the system\'s network environment are collected - line 1, 64bit':
        path   => $audit_rules,
        line   => '-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale',
        notify => Service['auditd'];
    }
  }

  if $selinux_in_use {
    file_line {
      'CIS DIL Benchmark 4.1.7 - Ensure events that modify the system\'s Mandatory Access Controls are collected - line 1, selinux':
        path   => $audit_rules,
        line   => '-w /etc/selinux/ -p wa -k MAC-policy',
        notify => Service['auditd'];
      'CIS DIL Benchmark 4.1.7 - Ensure events that modify the system\'s Mandatory Access Controls are collected - line 2, selinux':
        path   => $audit_rules,
        line   => '-w /usr/share/selinux/ -p wa -k MAC-policy',
        notify => Service['auditd'];
    }
  }

  if $apparmor_in_use {
    file_line {
      'CIS DIL Benchmark 4.1.7 - Ensure events that modify the system\'s Mandatory Access Controls are collected - line 1, apparmor':
        path   => $audit_rules,
        line   => '-w /etc/apparmor/ -p wa -k MAC-policy',
        notify => Service['auditd'];
      'CIS DIL Benchmark 4.1.7 - Ensure events that modify the system\'s Mandatory Access Controls are collected - line 2, apparmor':
        path   => $audit_rules,
        line   => '-w /etc/apparmor.d/ -p wa -k MAC-policy',
        notify => Service['auditd'];
    }
  }

  file_line {
    'CIS DIL Benchmark 4.1.8 - Ensure login and logout events are collected - line 1':
      path   => $audit_rules,
      line   => '-w /var/log/faillog -p wa -k logins',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.8 - Ensure login and logout events are collected - line 2':
      path   => $audit_rules,
      line   => '-w /var/log/lastlog -p wa -k logins',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.8 - Ensure login and logout events are collected - line 3':
      path   => $audit_rules,
      line   => '-w /var/log/tallylog -p wa -k logins',
      notify => Service['auditd'];
  }

  file_line {
    'CIS DIL Benchmark 4.1.9 - Ensure session initiation information is collected - line 1':
      path   => $audit_rules,
      line   => '-w /var/run/utmp -p wa -k session',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.9 - Ensure session initiation information is collected - line 2':
      path   => $audit_rules,
      line   => '-w /var/log/wtmp -p wa -k logins',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.9 - Ensure session initiation information is collected - line 3':
      path   => $audit_rules,
      line   => '-w /var/log/btmp -p wa -k logins',
      notify => Service['auditd'];
  }

  file_line {
    'CIS DIL Benchmark 4.1.10 - Ensure discretionary access control permission modification events are collected - line 1, 32bit':
      path   => $audit_rules,
      line   => "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=${non_system_users_from} -F auid!=4294967295 -k perm_mod",
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.10 - Ensure discretionary access control permission modification events are collected - line 2, 32bit':
      path   => $audit_rules,
      line   => "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=${non_system_users_from} -F auid!=4294967295 -k perm_mod",
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.10 - Ensure discretionary access control permission modification events are collected - line 3, 32bit':
      path   => $audit_rules,
      line   => "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=${non_system_users_from} -F auid!=4294967295 -k perm_mod",
      notify => Service['auditd'];
  }

  if $::architecture == 'amd64' {
    file_line {
      'CIS DIL Benchmark 4.1.10 - Ensure discretionary access control permission modification events are collected - line 1, 64bit':
        path   => $audit_rules,
        line   => "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=${non_system_users_from} -F auid!=4294967295 -k perm_mod",
        notify => Service['auditd'];
      'CIS DIL Benchmark 4.1.10 - Ensure discretionary access control permission modification events are collected - line 2, 64bit':
        path   => $audit_rules,
        line   => "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=${non_system_users_from} -F auid!=4294967295 -k perm_mod",
        notify => Service['auditd'];
      'CIS DIL Benchmark 4.1.10 - Ensure discretionary access control permission modification events are collected - line 3, 64bit':
        path   => $audit_rules,
        line   => "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=${non_system_users_from} -F auid!=4294967295 -k perm_mod",
        notify => Service['auditd'];
    }
  }

  file_line {
    'CIS DIL Benchmark 4.1.11 - Ensure unsuccessful unauthorized file access attempts are collected - line 1, 32bit':
      path   => $audit_rules,
      line   => "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=${non_system_users_from} -F auid!=4294967295 -k access",
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.11 - Ensure unsuccessful unauthorized file access attempts are collected - line 2, 32bit':
      path   => $audit_rules,
      line   => "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=${non_system_users_from} -F auid!=4294967295 -k access",
      notify => Service['auditd'];
  }

  if $::architecture == 'amd64' {
    file_line {
      'CIS DIL Benchmark 4.1.11 - Ensure unsuccessful unauthorized file access attempts are collected - line 1, 64bit':
        path   => $audit_rules,
        line   => "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=${non_system_users_from} -F auid!=4294967295 -k access",
        notify => Service['auditd'];
      'CIS DIL Benchmark 4.1.11 - Ensure unsuccessful unauthorized file access attempts are collected - line 2, 64bit':
        path   => $audit_rules,
        line   => "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=${non_system_users_from} -F auid!=4294967295 -k access",
        notify => Service['auditd'];
    }
  }

  $privileged_binaries.each |String $binary| {
    # TODO We should sanitise $binary.
    file_line { "CIS DIL Benchmark 4.1.12 - Ensure use of privileged commands is collected - $binary":
      path   => $audit_rules,
      line   => "-a always,exit -F path=${binary} -F perm=x -F auid>=${non_system_users_from} -F auid!=4294967295 -k privileged",
      notify => Service['auditd'];
    }
  }

  file_line { 'CIS DIL Benchmark 4.1.13 - Ensure successful file system mounts are collected - 32bit':
    path   => $audit_rules,
    line   => "-a always,exit -F arch=b32 -S mount -F auid>=${non_system_users_from} -F auid!=4294967295 -k mounts",
    notify => Service['auditd'];
  }

  if $::architecture == 'amd64' {
    file_line { 'CIS DIL Benchmark 4.1.13 - Ensure successful file system mounts are collected - 64bit':
      path   => $audit_rules,
      line   => "-a always,exit -F arch=b64 -S mount -F auid>=${non_system_users_from} -F auid!=4294967295 -k mounts",
      notify => Service['auditd'];
    }
  }

  file_line { 'CIS DIL Benchmark 4.1.14 - Ensure file deletion events by users are collected - 32bit':
    path   => $audit_rules,
    line   => "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=${non_system_users_from} -F auid!=4294967295 -k delete",
    notify => Service['auditd'];
  }

  if $::architecture == 'amd64' {
    file_line { 'CIS DIL Benchmark 4.1.14 - Ensure file deletion events by users are collected - 64bit':
      path   => $audit_rules,
      line   => "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=${non_system_users_from} -F auid!=4294967295 -k delete",
      notify => Service['auditd'];
    }
  }

  file_line {
    'CIS DIL Benchmark 4.1.15 - Ensure changes to system administration scope (sudoers) is collected - line 1':
      path   => $audit_rules,
      line   => '-w /etc/sudoers -p wa -k scope',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.15 - Ensure changes to system administration scope (sudoers) is collected - line 2':
      path   => $audit_rules,
      line   => '-w /etc/sudoers.d/ -p wa -k scope',
      notify => Service['auditd'];
  }

  file_line { 'CIS DIL Benchmark 4.1.16 - Ensure system administrator actions (sudolog) are collected':
    path   => $audit_rules,
    line   => '-w /var/log/sudo.log -p wa -k actions',
    notify => Service['auditd'];
  }

  file_line {
    'CIS DIL Benchmark 4.1.17 - Ensure kernel module loading and unloading is collected - line 1':
      path   => $audit_rules,
      line   => '-w /sbin/insmod -p x -k modules',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.17 - Ensure kernel module loading and unloading is collected - line 2':
      path   => $audit_rules,
      line   => '-w /sbin/rmmod -p x -k modules',
      notify => Service['auditd'];
    'CIS DIL Benchmark 4.1.17 - Ensure kernel module loading and unloading is collected - line 3':
      path   => $audit_rules,
      line   => '-w /sbin/modprobe -p x -k modules',
      notify => Service['auditd'];
  }

  if $::architecture == 'amd64' {
    file_line { 'CIS DIL Benchmark 4.1.17 - Ensure kernel module loading and unloading is collected - line 4 64bit':
      path   => $audit_rules,
      line   => '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules',
      notify => Service['auditd'];
    }
  }

  if $::architecture == 'i386' {
    file_line { 'CIS DIL Benchmark 4.1.17 - Ensure kernel module loading and unloading is collected - line 4 32bit':
      path   => $audit_rules,
      line   => '-a always,exit -F arch=b32 -S init_module -S delete_module -k modules',
      notify => Service['auditd'];
    }
  }

  exec { 'CIS DIL Benchmark 4.1.18 - Ensure the audit configuration is immutable':
    command => "/bin/echo '-e 2' >> ${audit_rules_last}",
    unless  => "/bin/grep '^\s*[^#]' ${audit_rules_last} | /usr/bin/tail -1 | /bin/grep -q -e '^-e 2$'",
    notify => Service['auditd'];
  }

}

