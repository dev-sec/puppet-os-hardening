# Puppet OS hardening

[![Puppet Forge](https://img.shields.io/puppetforge/dt/hardening/os_hardening.svg)][1]
[![Build Status](https://travis-ci.org/dev-sec/puppet-os-hardening.svg?branch=master)][2]
[![Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)][3]

## Description

This Puppet module provides secure configuration of your base OS with hardening.

## Requirements

* Puppet OpenSource or Enterprise
* [Module stdlib](https://forge.puppet.com/puppetlabs/stdlib)

### IMPORTANT for Puppet Enterprise

**If you are using this module in a PE environment, you have to set** `pe_environment = true`  
Otherwise puppet will drop an error (duplicate resource)!

## Parameters

* `system_environment = default`
  define the context in which the system runs. Some options don't work for `docker`/`lxc`
* `pe_environment = false`
  set this to true if you are using Puppet Enterprise **IMPORTANT - see above**
* `desktop_enabled = false`
  true if this is a desktop system, ie Xorg, KDE/GNOME/Unity/etc
* `enable_ipv4_forwarding = false`
  true if this system requires packet forwarding in IPv4 (eg Router), false otherwise
* `enable_ipv6_forwarding = false`
  true if this system requires packet forwarding in IPv6 (eg Router), false otherwise
* `enable_ipv6 = false`
  false to disable ipv6 on this system, true to enable
* `manage_ipv6 = true`
  true to harden ipv6 setup, false to ignore ipv6 completely
* `enable_log_martians = true`
  true to enable logging on suspicious / unroutable network packets, false otherwise **WARNING - this might generate huge log files!**
* `arp_restricted = true`
  true if you want the behavior of announcing and replying to ARP to be restricted, false otherwise
* `enable_rpfilter = true`
  true to enable reverse path filtering (discard bogus packets), false otherwise
* `extra_user_paths = []`
  add additional paths to the user's `PATH` variable (default is empty).
* `umask = "027"`
  umask used for the creation of new home directories by useradd / newusers
* `maildir = "/var/mail"`
  path for maildir
* `usergroups = true`
  true if you want separate groups for each user, false otherwise
* `password_max_age = 60`
  maximum password age
* `password_min_age = 7`
  minimum password age (before allowing any other password change)
* `password_warn_age = 7`
  Days warning before password change is due
* `auth_retries = 5`
  the maximum number of authentication attempts, before the account is locked for some time
* `auth_lockout_time = 600`
  time in seconds that needs to pass, if the account was locked due to too many failed authentication attempts
* `login_retries = 5`
  the maximum number of login retries if password is bad (normally overridden by PAM / auth_retries)
* `login_timeout = 60`
  authentication timeout in seconds, so login will exit if this time passes
* `allow_login_without_home = false`
  true if to allow users without home to login
* `passwdqc_enabled = true`
  true if you want to use strong password checking in PAM using passwdqc
* `passwdqc_options = "min=disabled,disabled,16,12,8"`
  set to any option line (as a string) that you want to pass to passwdqc
* `manage_pam_unix = false`
  true if you want pam_unix managed by this module
* `enable_pw_history = true`
  true if you want pam_unix to remember password history to prevent reuse of passwords (requires `manage_pam_unix = true`)
* `pw_remember_last = 5`
  the number of last passwords (e.g. 5 will prevent user to reuse any of her last 5 passwords)
* `allow_change_user = false`
  if a user may use `su` to change his login
* `only_root_may_su = false`
  true when only root and member of the group wheel may use su, required to be true for CIS Benchmark compliance
* `ignore_users = []`
  array of system user accounts that should _not be_ hardened (password disabled and shell set to `/usr/sbin/nologin`)
* `folders_to_restrict = ['/usr/local/games','/usr/local/sbin','/usr/local/bin','/usr/bin','/usr/sbin','/sbin','/bin']`
  folders to make sure of that group and world do not have write access to it or any of the contents
* `recurselimit = 5`
  directory depth for recursive permission check
* `dir_mode = '0750'`
  mode to use for directories created while creating a user (homedirs, basically)
* `chfn_restrict = ""`
  which fields may be changed by regular users using chfn
* `enable_module_loading = true`
  true if you want to allowed to change kernel modules once the system is running (eg `modprobe`, `rmmod`)
* `load_modules = []`
  load this modules via initramfs if enable_module_loading is false
* `disable_filesystems = ['cramfs','freevxfs','jffs2','hfs','hfsplus','squashfs','udf','vfat']`
  array of filesystems (kernel modules) that should be disabled
* `enable_sysrq = false`
  true to enable the magic sysrq key, false otherwise
* `enable_core_dump = false`
  false to prevent the creation of core dumps, true otherwise
* `enable_stack_protection = true`
  for Address Space Layout Randomization. ASLR can help defeat certain types of buffer overflow attacks. ASLR can locate the base, libraries, heap, and stack at random positions in a process's address space, which makes it difficult for an attacking program to predict the memory address of the next instruction.
* `cpu_vendor = 'intel'`
  only required if `enable_module_loading = false`: set the CPU vendor for modules to load
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

## Usage

After adding this module, you can use the class:

    class { 'os_hardening': }

## Testing

### Local Testing

You should have Ruby interpreter installed on your system. It might be a good idea to use [rvm](https://rvm.io) for that purpose. Besides that you have to install VirtualBox and Vagrant. See [Vagrant Downloads](http://downloads.vagrantup.com/) for a vagrant package and [VirtualBox Downloads](https://www.virtualbox.org/wiki/Downloads) for a VirtualBox package suitable for your system. For all our tests we use `test-kitchen`. If you are not familiar with `test-kitchen` please have a look at [their guide](http://kitchen.ci/docs/getting-started).

Next install test-kitchen:

```bash
# Install dependencies
gem install bundler
bundle install

# list all test instances
bundle exec kitchen list

# fast test on one machine
bundle exec kitchen test default-ubuntu-16-04

# test on all machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-ubuntu-16-04
bundle exec kitchen converge default-ubuntu-16-04
bundle exec kitchen verify default-ubuntu-16-04
```

For more information see [test-kitchen](http://kitchen.ci/docs/getting-started)

### CI testing of forks

You can enable testing of your fork in [Travis CI](http://travis-ci.org/). By default you will get linting and spec tests.

Integration tests of this repository are conducted using [Microsoft Azure](https://azure.microsoft.com/).

If you want to have integration tests for your fork, you will have to add following [environment variables](https://docs.travis-ci.com/user/environment-variables/#Defining-Variables-in-Repository-Settings) in the settings of your fork:

* `AZURE_SUBSCRIPTION_ID` - subscription id
* `AZURE_CLIENT_ID`- id of registered application
* `AZURE_CLIENT_SECRET`- secret of registered application
* `AZURE_TENANT_ID`- id of Azure Active Directory
* `CI_SSH_KEY` - private part of some ssh key, in base64 encoded form (e.g. `cat id_rsa | base64 -w0 ; echo`)

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
