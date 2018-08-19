# === Copyright
#
# Copyright 2018, Kumina B.V., Tim Stoop
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::services
#
# Configures specific services that do not require a full class of their own
#
class os_hardening::services (
  Array   $unwanted_packages = [],
  Array   $wanted_packages   = [],
  Array   $disabled_services = [],
) {
  # Remove packages that should not be installed
  $unwanted_packages.each |String $package| {
    package { $package:
      ensure => purged,
    }
  }

  # Add packages that should be installed
  $wanted_packages.each |String $package| {
    package { $package:
      ensure => installed,
    }
  }

  # Disable services that are not wanted
  $disabled_services.each |String $service| {
    service { $service:
      enable => false,
    }
  }

}

