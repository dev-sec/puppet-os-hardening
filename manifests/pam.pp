# == Class: os_hardening::pam
# 
# Configures PAM
#
# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
#
class os_hardening::pam (
  $passwdqc_enabled = true,
  $auth_retries = 5,
  $auth_lockout_time = 600,
  $passwdqc_options = 'min=disabled,disabled,16,12,8',
){
  # prepare package names
  case $operatingsystem {
    redhat, fedora: {
      $pam_ccreds = "pam_ccreds"
      $pam_passwdqc = "pam_passwdqc"
      $pam_cracklib = "pam_cracklib"
    }
    debian, ubuntu: { 
      $pam_ccreds = "libpam-ccreds"
      $pam_passwdqc = "libpam-passwdqc"
      $pam_cracklib = "libpam-cracklib"
    }
    default: {
      $pam_ccreds = "pam_ccreds"
      $pam_passwdqc = "pam_passwdqc"
      $pam_cracklib = "pam_cracklib"
    }
  }

  # remove ccreds if not necessary
  package{ 'pam-ccreds':
    ensure => absent,
    name => $pam_ccreds
  }

  case $operatingsystem {
    debian, ubuntu: {
      # configure paths
      $passwdqc_path = "/usr/share/pam-configs/passwdqc"
      $tally2_path   = "/usr/share/pam-configs/tally2"

      # if passwdqc is enabled
      if $passwdqc_enabled == true {
        # remove pam_cracklib, because it does not play nice wiht passwdqc
        package { 'pam-cracklib':
          name => $pam_cracklib,
          ensure => present,
        }

        # get the package for strong password checking
        package { 'pam-passwdqc':
          name => $pam_passwdqc,
          ensure => present,
        }

        # configure passwdqc via central module:
        file { $passwdqc_path:
          content => template( 'os_hardening/pam_passwdqc.erb' ),
          owner => root,
          group => root,
          mode => 640,
          ensure => present,
        }

      } else {
        # deactivate passwdqc

        # delete passwdqc file on ubuntu and debian
        file { $passwdqc_path:
          ensure => absent,
        }

        # make sure the package is not on the system,
        # if this feature is not wanted
        package { 'pam-passwdqc':
          name => $pam_passwdqc,
          ensure => absent,
        }
      }

      #configure tally2
      if $auth_retries > 0 {
        # tally2 is needed for pam 
        package{ 'libpam-modules':
          ensure => present,
        }

        file { $tally2_path:
          content => template( 'os_hardening/pam_tally2.erb' ),
          owner => root,
          group => root,
          mode => 640,
          ensure => present,
        }
      } else {
        file { $tally2_path:
          ensure => absent,
        }
      }

      exec { 'update-pam':
        command => '/usr/sbin/pam-auth-update --package'
      }
    }

    # others ...
  }

}
