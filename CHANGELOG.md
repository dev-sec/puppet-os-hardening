# Changelog

## 1.1.2

* bugfix: ruby1.8+puppet+rspec interplay
* bugfix: use scoped resource for puppet 4

## 1.1.1

* feature: add stack protection configuration via sysctl (enabled)
* bugfix: replace non-ascii char in login.defs
* bugfix: follow links for RHEL7 /bin and /sbin
* bugfix: fixed tty newlines
* bugfix: minor log typos

## 1.1.0

**API-change**: renamed module to `hardening-os_hardening`

* improvement: linting

## 1.0.2

* improvement: only run 'update-pam' when needed

## 1.0.1

* bugfix: add missing colon for user-defined paths in PATH env
* adjust login.defs template to not log user logins (as per Debian defaults)

## 1.0.0

* add verified support for puppet 3.6, remove support for puppet 3.0 and 3.4
* improvement: streamlined rubocop and puppet-lint
* improvement: remove stdlib fixed version dependency
* improvement: loosened thias/sysctl dependency
* bugfix: get puppet version in gemfile from ENV: `PUPPET_VERSION`

## 0.1.3

**API-change**: `dry_run_on_unkown` is now `dry_run_on_unknown`

* feature: allow configuration of custom modules (if module loading is disabled)
* improvement: only remove SUID/SGID if necessary
* improvement: clarify SUID/SGID options
* improvement: use thias/sysctl to configure sysctls (also fixes previous bugs with the template)
* improvement: add spec tests for sysctl options
* improvement: puppet-lint everything
* improvement: add travis testing for lint+specs
* improvement: use file resource instead of exec for access minimization
* bugfix: fix typo dry_run_on_unkown -> dry_run_on_unknown
* bugfix: don't run update initramfs on each run, only when requiered
* bugfix: deactivation of kernel module loading wasn't implemented
* bugfix: ip_forwarding wasn't activated correctly

## 0.1.2

* feature: add additional ipv6 hardening to sysctl
* feature: add test kitchen
* improvement: remove unnecessary attributes from os_hardening::pam
* bugfix: remove cracklib if passwdqc is used

## 0.1.1

* feature: add configurable system environment
* feature: remove suid/sgid bits from blacklist
* feature: remove suid/sgid bits from unknown files

## 0.1.0

* port from chef-os-hardening and monolithic puppet implementation
