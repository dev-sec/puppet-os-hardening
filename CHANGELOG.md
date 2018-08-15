# Change Log

## [2.1.2](https://github.com/dev-sec/puppet-os-hardening/tree/2.1.2) (2018-08-15)
[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.1.1...2.1.2)

**Implemented enhancements:**

- Deploy GRUB hardening [\#137](https://github.com/dev-sec/puppet-os-hardening/pull/137) ([timstoop](https://github.com/timstoop))
- Only allow root and members of group wheel to use su [\#134](https://github.com/dev-sec/puppet-os-hardening/pull/134) ([timstoop](https://github.com/timstoop))
- Fix permissions on /etc/gshadow, based on CIS DIL Benchmark 6.1.5. [\#133](https://github.com/dev-sec/puppet-os-hardening/pull/133) ([timstoop](https://github.com/timstoop))

**Merged pull requests:**

- Add stricter file permissions + PE fix [\#136](https://github.com/dev-sec/puppet-os-hardening/pull/136) ([mcgege](https://github.com/mcgege))

## [2.1.1](https://github.com/dev-sec/puppet-os-hardening/tree/2.1.1) (2018-05-17)
[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.1.0...2.1.1)

**Implemented enhancements:**

- Convert module into "standardized PDK module" [\#107](https://github.com/dev-sec/puppet-os-hardening/issues/107)
- Adding new param to specify maildir path. Updated nologin path for Re… [\#127](https://github.com/dev-sec/puppet-os-hardening/pull/127) ([hundredacres](https://github.com/hundredacres))
- converted module to pdk \#107 [\#120](https://github.com/dev-sec/puppet-os-hardening/pull/120) ([enemarke](https://github.com/enemarke))

**Closed issues:**

- net.ipv4.tcp\_rfc1337 not a valid sysctl key [\#124](https://github.com/dev-sec/puppet-os-hardening/issues/124)

**Merged pull requests:**

- Add password\_warn\_age parameter for login.defs [\#128](https://github.com/dev-sec/puppet-os-hardening/pull/128) ([claw-real](https://github.com/claw-real))
- CI: switch testing to DigitalOcean [\#126](https://github.com/dev-sec/puppet-os-hardening/pull/126) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Refactoring and new spec test [\#121](https://github.com/dev-sec/puppet-os-hardening/pull/121) ([enemarke](https://github.com/enemarke))

## [2.1.0](https://github.com/dev-sec/puppet-os-hardening/tree/2.1.0) (2018-01-17)
[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.0.0...2.1.0)

**Implemented enhancements:**

- Update to verify the module against https://github.com/dev-sec/linux-baseline [\#79](https://github.com/dev-sec/puppet-os-hardening/issues/79)
- Use type checking by defining data types [\#114](https://github.com/dev-sec/puppet-os-hardening/pull/114) ([mcgege](https://github.com/mcgege))
- Make paramater USERGROUPS\_ENAB in login.defs configurable [\#113](https://github.com/dev-sec/puppet-os-hardening/pull/113) ([mcgege](https://github.com/mcgege))

**Fixed bugs:**

- Limit recursive file/directory check [\#116](https://github.com/dev-sec/puppet-os-hardening/pull/116) ([mcgege](https://github.com/mcgege))

**Closed issues:**

- Minimize access needs a better way of removing +w on system folders  [\#60](https://github.com/dev-sec/puppet-os-hardening/issues/60)
- login.defs for different OS [\#57](https://github.com/dev-sec/puppet-os-hardening/issues/57)
- Adduser consistency [\#49](https://github.com/dev-sec/puppet-os-hardening/issues/49)
- Update some RH settings in this module [\#102](https://github.com/dev-sec/puppet-os-hardening/issues/102)

**Merged pull requests:**

- Get CI tests running on azure [\#115](https://github.com/dev-sec/puppet-os-hardening/pull/115) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Correct header comments in sysctl.pp [\#69](https://github.com/dev-sec/puppet-os-hardening/pull/69) ([Zordrak](https://github.com/Zordrak))
- Skip entropy tests and disable auditd tests [\#117](https://github.com/dev-sec/puppet-os-hardening/pull/117) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Making test-kitchen work again [\#112](https://github.com/dev-sec/puppet-os-hardening/pull/112) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Implement new RH defaults \(see issue \#102\) [\#103](https://github.com/dev-sec/puppet-os-hardening/pull/103) ([mcgege](https://github.com/mcgege))

## [2.0.0](https://github.com/dev-sec/puppet-os-hardening/tree/2.0.0) (2017-12-19)
[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/1.1.2...2.0.0)

**Closed issues:**

- SLES and OEL errors when ipv6 is disabled [\#82](https://github.com/dev-sec/puppet-os-hardening/issues/82)
- Failed to generate additional resources [\#75](https://github.com/dev-sec/puppet-os-hardening/issues/75)
- Multiple conflicts with Puppet Enterprise [\#74](https://github.com/dev-sec/puppet-os-hardening/issues/74)
- Conflict with Puppet Enterprise 2016.1.1 [\#71](https://github.com/dev-sec/puppet-os-hardening/issues/71)
- allow\_core\_dump set to true still ends up setting /etc/security/limits.d/10.hardcore.conf and /etc/profile.d/pinerolo\_profile.sh files [\#68](https://github.com/dev-sec/puppet-os-hardening/issues/68)
- IPv6 setting problem [\#67](https://github.com/dev-sec/puppet-os-hardening/issues/67)
- Log martian packets [\#66](https://github.com/dev-sec/puppet-os-hardening/issues/66)
- Merge \#64 [\#65](https://github.com/dev-sec/puppet-os-hardening/issues/65)
- net.ipv6.conf.default.accept\_ra [\#56](https://github.com/dev-sec/puppet-os-hardening/issues/56)
- Publish new release on Puppet Forge [\#104](https://github.com/dev-sec/puppet-os-hardening/issues/104)

**Merged pull requests:**

- Update links + contributors in README [\#108](https://github.com/dev-sec/puppet-os-hardening/pull/108) ([mcgege](https://github.com/mcgege))
- Avoid picking up users retrieved from SSSD or other domain services. [\#101](https://github.com/dev-sec/puppet-os-hardening/pull/101) ([tprobinson](https://github.com/tprobinson))
- Implement linux-baseline os-10 [\#100](https://github.com/dev-sec/puppet-os-hardening/pull/100) ([mcgege](https://github.com/mcgege))
- Style Guide corrections [\#98](https://github.com/dev-sec/puppet-os-hardening/pull/98) ([mcgege](https://github.com/mcgege))
- Update module metadata [\#97](https://github.com/dev-sec/puppet-os-hardening/pull/97) ([mcgege](https://github.com/mcgege))
- Baseline sysctl-17: Enable logging of martian packets [\#96](https://github.com/dev-sec/puppet-os-hardening/pull/96) ([mcgege](https://github.com/mcgege))
- One single coredump parameter [\#95](https://github.com/dev-sec/puppet-os-hardening/pull/95) ([mcgege](https://github.com/mcgege))
- Fix for Linux Baseline os-02 [\#94](https://github.com/dev-sec/puppet-os-hardening/pull/94) ([mcgege](https://github.com/mcgege))
- Baseline os-05b: set SYS\_\[GU\]ID\_\[MIN|MAX\] in /etc/login.defs [\#92](https://github.com/dev-sec/puppet-os-hardening/pull/92) ([mcgege](https://github.com/mcgege))
- Remove config/scripts to prevent core dumps if function is disabled… [\#91](https://github.com/dev-sec/puppet-os-hardening/pull/91) ([mcgege](https://github.com/mcgege))
- DevSec Linux Baseline os-05 [\#90](https://github.com/dev-sec/puppet-os-hardening/pull/90) ([mcgege](https://github.com/mcgege))
- Corrected handling of /bin/su \(via allow\_change\_user\) [\#89](https://github.com/dev-sec/puppet-os-hardening/pull/89) ([mcgege](https://github.com/mcgege))
- Documentation update [\#88](https://github.com/dev-sec/puppet-os-hardening/pull/88) ([mcgege](https://github.com/mcgege))
- added switch manage\_ipv6, so people could disable managing of ipv6 co… [\#87](https://github.com/dev-sec/puppet-os-hardening/pull/87) ([STetzel](https://github.com/STetzel))
- CentOS7 issue - revert "Remove link following in minimize\_access file resource" [\#86](https://github.com/dev-sec/puppet-os-hardening/pull/86) ([mcgege](https://github.com/mcgege))
- Making rubocop happy [\#85](https://github.com/dev-sec/puppet-os-hardening/pull/85) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Make the sysctl setting 'rp\_filter' configurable [\#84](https://github.com/dev-sec/puppet-os-hardening/pull/84) ([mcgege](https://github.com/mcgege))
- Quick fix for issue \#71: remove '/usr/local/bin' from managed folders [\#83](https://github.com/dev-sec/puppet-os-hardening/pull/83) ([mcgege](https://github.com/mcgege))
- Puppet-lint done for sysctl.pp [\#81](https://github.com/dev-sec/puppet-os-hardening/pull/81) ([bitvijays](https://github.com/bitvijays))
- Fix the CI [\#80](https://github.com/dev-sec/puppet-os-hardening/pull/80) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Adopt Puppet style guide - remove dynamic variable lookup [\#70](https://github.com/dev-sec/puppet-os-hardening/pull/70) ([tuxmea](https://github.com/tuxmea))
- Remove link following in minimize\_access file resource [\#64](https://github.com/dev-sec/puppet-os-hardening/pull/64) ([rooprob](https://github.com/rooprob))
- update common kitchen.yml platforms [\#63](https://github.com/dev-sec/puppet-os-hardening/pull/63) ([chris-rock](https://github.com/chris-rock))
- add support for limiting password re-use. [\#61](https://github.com/dev-sec/puppet-os-hardening/pull/61) ([igoraj](https://github.com/igoraj))
- add local testing section to readme [\#59](https://github.com/dev-sec/puppet-os-hardening/pull/59) ([chris-rock](https://github.com/chris-rock))
- add net.ipv6.conf.default.accept\_ra. closes \#56 [\#58](https://github.com/dev-sec/puppet-os-hardening/pull/58) ([igoraj](https://github.com/igoraj))
- Disable System Accounts [\#54](https://github.com/dev-sec/puppet-os-hardening/pull/54) ([igoraj](https://github.com/igoraj))
- common files: add centos 7 [\#53](https://github.com/dev-sec/puppet-os-hardening/pull/53) ([arlimus](https://github.com/arlimus))
- Prepare module for v2.0.0 [\#109](https://github.com/dev-sec/puppet-os-hardening/pull/109) ([mcgege](https://github.com/mcgege))

## [1.1.2](https://github.com/dev-sec/puppet-os-hardening/tree/1.1.2) (2015-05-09)
[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/1.1.1...1.1.2)

**Merged pull requests:**

- Update common readme badges + contributors + rubocop [\#52](https://github.com/dev-sec/puppet-os-hardening/pull/52) ([arlimus](https://github.com/arlimus))
- update common travis.yml, kitchen.yml platforms [\#51](https://github.com/dev-sec/puppet-os-hardening/pull/51) ([arlimus](https://github.com/arlimus))
- bugfix: use scoped resource for puppet 4 [\#50](https://github.com/dev-sec/puppet-os-hardening/pull/50) ([arlimus](https://github.com/arlimus))

# OLD Changelog

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


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*