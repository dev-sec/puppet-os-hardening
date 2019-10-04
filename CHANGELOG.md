# Changelog

## [v2.2.7](https://github.com/dev-sec/puppet-os-hardening/tree/v2.2.7) (2019-10-04)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.2.6...v2.2.7)

**Implemented enhancements:**

- If disabled service should also be stopped [\#226](https://github.com/dev-sec/puppet-os-hardening/pull/226) ([mcgege](https://github.com/mcgege))
- Manage files /etc/anacrontab and crontab equally [\#225](https://github.com/dev-sec/puppet-os-hardening/pull/225) ([mcgege](https://github.com/mcgege))

**Fixed bugs:**

- Travis-CI fix \(kitchen / faraday broken?\) [\#228](https://github.com/dev-sec/puppet-os-hardening/pull/228) ([mcgege](https://github.com/mcgege))

**Closed issues:**

- disabled\_services should be stopped too [\#224](https://github.com/dev-sec/puppet-os-hardening/issues/224)
- os\_hardening::minimize\_access should treat anacrontab the same as crontab [\#223](https://github.com/dev-sec/puppet-os-hardening/issues/223)

**Merged pull requests:**

- CentOS 8 support [\#229](https://github.com/dev-sec/puppet-os-hardening/pull/229) ([mcgege](https://github.com/mcgege))
- Updates from pdk template 1.13.0 [\#227](https://github.com/dev-sec/puppet-os-hardening/pull/227) ([mcgege](https://github.com/mcgege))
- Updates from pdk template 1.12.0 [\#221](https://github.com/dev-sec/puppet-os-hardening/pull/221) ([mcgege](https://github.com/mcgege))

## [2.2.6](https://github.com/dev-sec/puppet-os-hardening/tree/2.2.6) (2019-07-24)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.2.5...2.2.6)

**Implemented enhancements:**

- Proxy support / SUSE fixes [\#217](https://github.com/dev-sec/puppet-os-hardening/pull/217) ([mcgege](https://github.com/mcgege))
- Updates from pdk template 1.11.1 [\#215](https://github.com/dev-sec/puppet-os-hardening/pull/215) ([mcgege](https://github.com/mcgege))
- Metadata / Travis fixes [\#211](https://github.com/dev-sec/puppet-os-hardening/pull/211) ([mcgege](https://github.com/mcgege))
- CIS: Fix permissions on home cron and log dirs [\#203](https://github.com/dev-sec/puppet-os-hardening/pull/203) ([PenguinFreeDom](https://github.com/PenguinFreeDom))

**Fixed bugs:**

- Approve stdlib v6 + resolve librarian-puppet problem [\#213](https://github.com/dev-sec/puppet-os-hardening/issues/213)

**Closed issues:**

- Error: no implicit conversion of Integer into String [\#199](https://github.com/dev-sec/puppet-os-hardening/issues/199)

**Merged pull requests:**

- allow puppet-stdlib v6 [\#219](https://github.com/dev-sec/puppet-os-hardening/pull/219) ([mcgege](https://github.com/mcgege))
- OpenSUSE 42.3 docker image correction [\#214](https://github.com/dev-sec/puppet-os-hardening/pull/214) ([mcgege](https://github.com/mcgege))

## [2.2.5](https://github.com/dev-sec/puppet-os-hardening/tree/2.2.5) (2019-06-01)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.2.4...2.2.5)

**Fixed bugs:**

- Augeas sysctl needs explicit string value [\#207](https://github.com/dev-sec/puppet-os-hardening/pull/207) ([mcgege](https://github.com/mcgege))

**Merged pull requests:**

- Kitchen fix [\#206](https://github.com/dev-sec/puppet-os-hardening/pull/206) ([mcgege](https://github.com/mcgege))
- Some applications require different setting for icmp\_ratelimit [\#204](https://github.com/dev-sec/puppet-os-hardening/pull/204) ([tuxmea](https://github.com/tuxmea))

## [2.2.4](https://github.com/dev-sec/puppet-os-hardening/tree/2.2.4) (2019-05-01)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.2.3...2.2.4)

**Implemented enhancements:**

- Adjust .travis.yml to PDK template [\#197](https://github.com/dev-sec/puppet-os-hardening/pull/197) ([mcgege](https://github.com/mcgege))

**Fixed bugs:**

- Add dirs to exclude to .pdkignore [\#196](https://github.com/dev-sec/puppet-os-hardening/pull/196) ([mcgege](https://github.com/mcgege))

## [2.2.3](https://github.com/dev-sec/puppet-os-hardening/tree/2.2.3) (2019-05-01)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.2.2...2.2.3)

**Implemented enhancements:**

- Integration tests with DigitalOcean \(see \#180\) [\#194](https://github.com/dev-sec/puppet-os-hardening/pull/194) ([mcgege](https://github.com/mcgege))
- Update to PDK 1.9.1 [\#191](https://github.com/dev-sec/puppet-os-hardening/pull/191) ([mcgege](https://github.com/mcgege))
- Update to PDK 1.9.0 [\#190](https://github.com/dev-sec/puppet-os-hardening/pull/190) ([mcgege](https://github.com/mcgege))

**Merged pull requests:**

- Update to PDK 1.10.0 [\#193](https://github.com/dev-sec/puppet-os-hardening/pull/193) ([mcgege](https://github.com/mcgege))

## [2.2.2](https://github.com/dev-sec/puppet-os-hardening/tree/2.2.2) (2019-02-28)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.2.1...2.2.2)

**Implemented enhancements:**

- Readme updates [\#188](https://github.com/dev-sec/puppet-os-hardening/pull/188) ([mcgege](https://github.com/mcgege))
- Replace sysctl module [\#183](https://github.com/dev-sec/puppet-os-hardening/pull/183) ([mcgege](https://github.com/mcgege))
- Add version tag on puppetforge [\#182](https://github.com/dev-sec/puppet-os-hardening/pull/182) ([mcgege](https://github.com/mcgege))

**Fixed bugs:**

- Wrong permission on module files [\#175](https://github.com/dev-sec/puppet-os-hardening/issues/175)
- Add missing dependency [\#184](https://github.com/dev-sec/puppet-os-hardening/pull/184) ([theosotr](https://github.com/theosotr))

**Merged pull requests:**

- Replace Gitter with mailing lists [\#185](https://github.com/dev-sec/puppet-os-hardening/pull/185) ([mcgege](https://github.com/mcgege))

## [2.2.1](https://github.com/dev-sec/puppet-os-hardening/tree/2.2.1) (2019-01-28)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.2.0...2.2.1)

**Merged pull requests:**

- Bugfix script to change file + dir permissions for Puppet Forge build [\#176](https://github.com/dev-sec/puppet-os-hardening/pull/176) ([mcgege](https://github.com/mcgege))

## [2.2.0](https://github.com/dev-sec/puppet-os-hardening/tree/2.2.0) (2019-01-27)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.1.3...2.2.0)

**Implemented enhancements:**

- Test / Update for Puppet 6 [\#156](https://github.com/dev-sec/puppet-os-hardening/issues/156)
- Convert module into "standardized PDK module" [\#107](https://github.com/dev-sec/puppet-os-hardening/issues/107)
- Update to verify the module against https://github.com/dev-sec/linux-baseline [\#79](https://github.com/dev-sec/puppet-os-hardening/issues/79)
- New option rpfilter\_loose to enable loose mode \(rp\_filter = 2\) [\#163](https://github.com/dev-sec/puppet-os-hardening/pull/163) ([mcgege](https://github.com/mcgege))
- Update test mechanisms [\#169](https://github.com/dev-sec/puppet-os-hardening/pull/169) ([mcgege](https://github.com/mcgege))
- Support os umask [\#152](https://github.com/dev-sec/puppet-os-hardening/pull/152) ([hdep](https://github.com/hdep))

**Fixed bugs:**

- Rhel 7 won't boot on physical server [\#165](https://github.com/dev-sec/puppet-os-hardening/issues/165)

**Closed issues:**

- Wrong permission on git project files ?  [\#164](https://github.com/dev-sec/puppet-os-hardening/issues/164)
- module on the forge is not in sync with version of github [\#160](https://github.com/dev-sec/puppet-os-hardening/issues/160)
- Fix broken tests in Travis CI [\#123](https://github.com/dev-sec/puppet-os-hardening/issues/123)

**Merged pull requests:**

- Also works with current puppetlabs/stdlib \(5.1.0 tested\) [\#168](https://github.com/dev-sec/puppet-os-hardening/pull/168) ([mcgege](https://github.com/mcgege))
- Do not disable vfat. Fixes \#165. [\#166](https://github.com/dev-sec/puppet-os-hardening/pull/166) ([timstoop](https://github.com/timstoop))
- Add support for Ubuntu 18.04 and SLES 15 in metadata.json [\#162](https://github.com/dev-sec/puppet-os-hardening/pull/162) ([mcgege](https://github.com/mcgege))

## [2.1.3](https://github.com/dev-sec/puppet-os-hardening/tree/2.1.3) (2018-11-12)

[Full Changelog](https://github.com/dev-sec/puppet-os-hardening/compare/2.1.2...2.1.3)

**Implemented enhancements:**

- Easy add and remove packages, disable services [\#138](https://github.com/dev-sec/puppet-os-hardening/pull/138) ([timstoop](https://github.com/timstoop))

**Closed issues:**

- user resource conflict with puppetlabs/apache: Duplicate declaration: User\[www-data\] is already declared [\#157](https://github.com/dev-sec/puppet-os-hardening/issues/157)
- Missing comments in managed file : file managed by puppet [\#146](https://github.com/dev-sec/puppet-os-hardening/issues/146)
- Missing requirements in readme file [\#145](https://github.com/dev-sec/puppet-os-hardening/issues/145)

**Merged pull requests:**

- Update issue templates [\#158](https://github.com/dev-sec/puppet-os-hardening/pull/158) ([rndmh3ro](https://github.com/rndmh3ro))
- rework README [\#155](https://github.com/dev-sec/puppet-os-hardening/pull/155) ([mcgege](https://github.com/mcgege))
- Create license file [\#154](https://github.com/dev-sec/puppet-os-hardening/pull/154) ([mcgege](https://github.com/mcgege))
- Create license file [\#153](https://github.com/dev-sec/puppet-os-hardening/pull/153) ([mcgege](https://github.com/mcgege))
- Add  'MANAGED BY PUPPET' header [\#150](https://github.com/dev-sec/puppet-os-hardening/pull/150) ([hdep](https://github.com/hdep))
- Fix missing Requirements in Readme [\#149](https://github.com/dev-sec/puppet-os-hardening/pull/149) ([hdep](https://github.com/hdep))
- Add OpenSUSE 15 to the supported distributions [\#148](https://github.com/dev-sec/puppet-os-hardening/pull/148) ([mcgege](https://github.com/mcgege))

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


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
