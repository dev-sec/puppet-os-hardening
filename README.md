# Puppet OS hardening

[![Puppet Forge](https://img.shields.io/puppetforge/dt/hardening/os_hardening.svg)][1]
[![Build Status](https://travis-ci.org/dev-sec/puppet-os-hardening.svg?branch=master)][2]
[![Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)][3]

## Description

This Puppet module provides secure configuration of your base OS with hardening.

## Requirements

* Puppet OpenSource or Enterprise
* [Module stdlib](https://forge.puppet.com/puppetlabs/stdlib)
* [Module sysctl](https://forge.puppet.com/herculesteam/augeasproviders_sysctl)


### IMPORTANT for Puppet Enterprise

**If you are using this module in a PE environment, you have to set** `pe_environment = true`
Otherwise puppet will drop an error (duplicate resource)!

## Parameters

* `system_environment = 'default'`
  define the context in which the system runs. Some options don't work for `docker`/`lxc`
* `pe_environment = false`
  set this to true if you are using Puppet Enterprise **IMPORTANT - see above**
* `extra_user_paths = []`
  add additional paths to the user's `PATH` variable (default is empty).
* `umask = undef`
  umask used for the creation of new home directories by useradd / newusers (e.g. '027')
* `maildir = undef`
  path for maildir (e.g. '/var/mail')
* `usergroups = true`
  true if you want separate groups for each user, false otherwise
* `sys_uid_min = undef` and `sys_gid_min = undef`
  override the default setting for `login.defs`
* `password_max_age = 60`
  maximum password age
* `password_min_age = 7`
  minimum password age (before allowing any other password change)
* `password_warn_age = 7`
  Days warning before password change is due
* `login_retries = 5`
  the maximum number of login retries if password is bad (normally overridden by PAM / auth_retries)
* `login_timeout = 60`
  authentication timeout in seconds, so login will exit if this time passes
* `chfn_restrict = ''`
  which fields may be changed by regular users using chfn
* `allow_login_without_home = false`
  true if to allow users without home to login
* `allow_change_user = false`
  if a user may use `su` to change his login
* `ignore_users = []`
  array of system user accounts that should _not be_ hardened (password disabled and shell set to `/usr/sbin/nologin`)
* `folders_to_restrict = ['/usr/local/games','/usr/local/sbin','/usr/local/bin','/usr/bin','/usr/sbin','/sbin','/bin']`
  folders to make sure of that group and world do not have write access to it or any of the contents
* `recurselimit = 5`
  directory depth for recursive permission check
* `passwdqc_enabled = true`
  true if you want to use strong password checking in PAM using passwdqc
* `auth_retries = 5`
  the maximum number of authentication attempts, before the account is locked for some time
* `auth_lockout_time = 600`
  time in seconds that needs to pass, if the account was locked due to too many failed authentication attempts
* `passwdqc_options = 'min=disabled,disabled,16,12,8'`
  set to any option line (as a string) that you want to pass to passwdqc
* `manage_pam_unix = false`
  true if you want pam_unix managed by this module
* `enable_pw_history = true`
  true if you want pam_unix to remember password history to prevent reuse of passwords (requires `manage_pam_unix = true`)
* `pw_remember_last = 5`
  the number of last passwords (e.g. 5 will prevent user to reuse any of her last 5 passwords)
* `only_root_may_su = false`
  true when only root and member of the group wheel may use su, required to be true for CIS Benchmark compliance
* `root_ttys = ['console','tty1','tty2','tty3','tty4','tty5','tty6']`
  registered TTYs for root
* `whitelist = []`
  all files which should keep their SUID/SGID bits if set (will be combined with pre-defined whiteliste of files)
* `blacklist = []`
  all files which should have their SUID/SGID bits removed if set (will be combined with pre-defined blacklist of files)
* `remove_from_unknown = false`
  `true` if you want to remove SUID/SGID bits from any file, that is not explicitly configured in a `blacklist`. This will make every Puppet run search through the mounted filesystems looking for SUID/SGID bits that are not configured in the default and user blacklist. If it finds an SUID/SGID bit, it will be removed, unless this file is in your `whitelist`.
* `dry_run_on_unknown = false`
  like `remove_from_unknown` above, only that SUID/SGID bits aren't removed. It will still search the filesystems to look for SUID/SGID bits but it will only print them in your log. This option is only ever recommended, when you first configure `remove_from_unknown` for SUID/SGID bits, so that you can see the files that are being changed and make adjustments to your `whitelist` and `blacklist`.
* `enable_module_loading = true`
  true if you want to allowed to change kernel modules once the system is running (eg `modprobe`, `rmmod`)
* `load_modules = []`
  load this modules via initramfs if enable_module_loading is false
* `disable_filesystems = ['cramfs','freevxfs','jffs2','hfs','hfsplus','squashfs','udf']`
  array of filesystems (kernel modules) that should be disabled
* `cpu_vendor = 'intel'`
  only required if `enable_module_loading = false`: set the CPU vendor for modules to load
* `desktop_enabled = false`
  true if this is a desktop system, ie Xorg, KDE/GNOME/Unity/etc
* `enable_ipv4_forwarding = false`
  true if this system requires packet forwarding in IPv4 (eg Router), false otherwise
* `manage_ipv6 = true`
  true to harden ipv6 setup, false to ignore ipv6 completely
* `enable_ipv6 = false`
  false to disable ipv6 on this system, true to enable
* `enable_ipv6_forwarding = false`
  true if this system requires packet forwarding in IPv6 (eg Router), false otherwise
* `arp_restricted = true`
  true if you want the behavior of announcing and replying to ARP to be restricted, false otherwise
* `enable_sysrq = false`
  true to enable the magic sysrq key, false otherwise
* `enable_core_dump = false`
  false to prevent the creation of core dumps, true otherwise
* `enable_stack_protection = true`
  for Address Space Layout Randomization. ASLR can help defeat certain types of buffer overflow attacks. ASLR can locate the base, libraries, heap, and stack at random positions in a process's address space, which makes it difficult for an attacking program to predict the memory address of the next instruction.
* `enable_rpfilter = true`
  true to enable reverse path filtering (discard bogus packets), false otherwise
* `rpfilter_loose = false`
  (only if `enable_rpfilter` is true) *loose mode* (rp_filter = 2) if true, *strict mode* otherwise
* `enable_log_martians = true`
  true to enable logging on suspicious / unroutable network packets, false otherwise **WARNING - this might generate huge log files!**
* `unwanted_packages = []`
  packages that should be removed from the system
* `wanted_packages = []`
  packages that should be added to the system
* `disabled_services = []`
  services that should not be enabled
* `enable_grub_hardening = false`
  set to true to enable some grub hardening rules
* `grub_user = 'root'`
  the grub username that needs to be provided when changing config on the grub prompt
* `grub_password_hash = ''`
  a password hash created with `grub-mkpasswd-pbkdf2` that is associated with the grub\_user
* `boot_without_password = true`
  setup Grub so it only requires a password when changing an entry, not when booting an existing entry
* `system_umask = undef`
  if this variable is set setup the umask for all user in the system (e.g. '027')

## Usage

After adding this module, you can use the class:

    class { 'os_hardening': }

### Note about wanted/unwanted packages and disabled services

As the CIS Distribution Independent Linux Benchmark is a good starting point
regarding hardening of systems, it was deemed appropriate to implement an easy
way to deal with one-offs for which one doesn't want to write an entire module.

For instance, to increase CIS DIL compliance on a Debian system, one should set
the following:

```
wanted_packages   => ['ntp'],
unwanted_packages => ['telnet'],
disabled_services => ['rsync'],
```

The default settings of NTP are actually pretty good for most situations, so it
is not immediately necessary to implement a module. However, if you do use a
module to control these services, that is of course preferred.

## Testing

### Local Testing

You should have Ruby interpreter installed on your system. It might be a good idea to use [rvm](https://rvm.io) for that purpose. Besides that you have to install the `Puppet Development Kit` [PDK](https://puppet.com/download-puppet-development-kit) and [Docker Community Edition](https://www.docker.com/products/docker-engine), as the integration tests run in Docker containers.

For all our integration tests we use `test-kitchen`. If you are not familiar with `test-kitchen` please have a look at [their guide](http://kitchen.ci/docs/getting-started).

#### PDK Tests

```bash
# Syntax & Lint tests
pdk validate

# Unit Tests
pdk test unit
```

#### Integration Tests

```bash
# Install dependencies
gem install bundler
bundle install

# list all test instances
bundle exec kitchen list

# fast test on one machine
bundle exec kitchen test ubuntu-16-04-puppet5

# test on all machines
bundle exec kitchen test
```

### CI testing of PRs & forks

Your patches will automatically get tested via [Travis CI](http://travis-ci.org/). The test summary is visible on Github in your PR, details can be found on the corresponding [Travis puppet-os-hardening page](https://travis-ci.org/dev-sec/puppet-os-hardening).

## Contributors + Kudos

* Dominik Richter [arlimus](https://github.com/arlimus)
* Edmund Haselwanter [ehaselwanter](https://github.com/ehaselwanter)
* Christoph Hartmann [chris-rock](https://github.com/chris-rock)
* Thomas Dütsch [a-tom](https://github.com/a-tom)
* Patrick Meier [atomic111](https://github.com/atomic111)
* Artem Sidorenko [artem-sidorenko](https://github.com/artem-sidorenko)
* Kurt Huwig [kurthuwig](https://github.com/kurthuwig)
* Matthew Haughton [3flex](https://github.com/3flex)
* Reik Keutterling [spielkind](https://github.com/spielkind)
* Daniel Dreier [danieldreier](https://github.com/danieldreier)
* Timo Goebel [timogoebel](https://github.com/timogoebel)
* Tristan Helmich [fadenb](https://github.com/fadenb)
* Michael Geiger [mcgege](https://github.com/mcgege)

For the original port of `chef-os-hardening` to puppet:

* Artem Sidorenko [artem-sidorenko](https://github.com/artem-sidorenko)
* Frank Kloeker [eumel8](https://github.com/eumel8)

Thank you all!!

## License and Author

* Author:: Dominik Richter <dominik.richter@gmail.com>
* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[1]: https://forge.puppet.com/hardening/os_hardening
[2]: https://travis-ci.org/dev-sec/puppet-os-hardening
[3]: https://gitter.im/dev-sec/general
