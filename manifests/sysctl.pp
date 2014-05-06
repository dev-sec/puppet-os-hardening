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
  $cpu_vendor = "intel",
  $desktop_enabled = false
){
  # set variables
  if $architecture == "amd64" or $architecture == "x86_64" {
    $x86_64 = true
  } else {
    $x86_64 = false
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
        }

        exec { 'update initramfs':
          command => 'update-initramfs -u'
        }
      }
    }
  }
}
