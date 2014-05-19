# == Class: os_hardening::sysctl
# 
# Configures sysctl
#
# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
#
class os_hardening::sysctl (
  $enable_module_loading = true,
  $load_modules = [],
  $cpu_vendor = "intel",
  $desktop_enabled = false,
  $enable_ipv4_forwarding = false,
  $enable_ipv6 = false,
  $enable_ipv6_forwarding = false,
  $arp_restricted = true,
  $enable_sysrq = false,
  $enable_core_dump = false,
){
  # set variables
  if $architecture == "amd64" or $architecture == "x86_64" {
    $x86_64 = true
  } else {
    $x86_64 = false
  }

  # configure sysctl parameters
  file { '/etc/sysctl.conf':
    content => template('os_hardening/sysctl.conf.erb'),
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 644,
    notify  => Exec['reload_sysctl'],
  }

  exec { '/sbin/sysctl -p':
    alias       => 'reload_sysctl',
    refreshonly => true,
  }

  # configure for module hardening
  # if modules cannot be loaded at runtime, they must all
  # be pre-configured in initramfs
  if $enable_module_loading == false {
    case $operatingsystem {
      debian, ubuntu: {
        file {
          '/etc/initramfs-tools/modules':
            content => template( 'os_hardening/modules.erb' ),
            owner => root,
            group => root,
            mode => 400,
            ensure => present,
            notify => Exec['update-initramfs'],
        }

        exec { 'update-initramfs':
          command     => '/usr/sbin/update-initramfs -u',
          refreshonly => true,
        }
      }
    }
  }
}
