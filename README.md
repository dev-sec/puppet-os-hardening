# os_hardening (Puppet module)

## Description

This module provides secure configuration of your base OS with hardening.

## Requirements

* Puppet

## Parameters

* `system_environment = default`
  define the context in which the system runs. Some options don't work for `docker`/`lxc`
* `desktop_enabled = false`
  true if this is a desktop system, ie Xorg, KDE/GNOME/Unity/etc
* `enable_ipv4_forwarding   = false`
  true if this system requires packet forwarding in IPv4 (eg Router), false otherwise
* `enable_ipv6_forwarding   = false`
  true if this system requires packet forwarding in IPv6 (eg Router), false otherwise
* `enable_ipv6 = false`
* `arp_restricted = true`
  true if you want the behavior of announcing and replying to ARP to be restricted, false otherwise
* `extra_user_paths = []`
  add additional paths to the user's `PATH` variable (default is empty).
* `umask = "027"`
* `password_max_age = 60`
  maximum password age
* `password_min_age = 7`
  minimum password age (before allowing any other password change)
* `auth_retries = 5`
  the maximum number of authentication attempts, before the account is locked for some time
* `auth_lockout_time = 600`
  time in seconds that needs to pass, if the account was locked due to too many failed authentication attempts
* `login_timeout = 60`
  authentication timeout in seconds, so login will exit if this time passes
* `allow_login_without_home = false`
  true if to allow users without home to login
* `passwdqc_enabled = true`
  true if you want to use strong password checking in PAM using passwdqc
* `passwdqc_options = "min=disabled,disabled,16,12,8"`
  set to any option line (as a string) that you want to pass to passwdqc
* `allow_change_user = false`
  if a user may use `su` to change his login
* `enable_module_loading = true`
  true if you want to allowed to change kernel modules once the system is running (eg `modprobe`, `rmmod`)
* `enable_sysrq = false`
* `enable_core_dump = false`
* `cpu_vendor = 'intel'`
  only required if `enable_module_loading = false`: set the CPU vendor for modules to load
* `root_ttys = ["console","tty1","tty2","tty3","tty4","tty5","tty6"]`
  registered TTYs for root
* `whitelist = []`
  all files which should keep their SUID/SGID bits if set (will be combined with pre-defined whiteliste of files)
* `blacklist = []`
  all files which should have their SUID/SGID bits removed if set (will be combined with pre-defined blacklist of files)
* `remove_from_unknown = false`
  if true will search through the mounted filesystems and make sure no files contain SUID/SGID bits
  (except for the user-defined and system-defined whitelist)
* `dry_run_on_unkown = false`
  when using `remove_from_unkown` and setting this to true, will not actually remove SUID/SGID bits
  from the found files but instead print the affected files

## Usage

After adding this module, you can use the class:

    class { 'os_hardening': }

## Contributors + Kudos

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
