# === Copyright
#
# Copyright 2017, bitvijays
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::lynis_packages
#
# Configures Multiple packages as suggested by Lynis: apt-listbugs, apt-listchanges, checkrestart, needrestart, debsecan, debsums, fail2ban,  libapache2-mod-evasive, libapache2-mod-qos, libapache2-mod-security2, arpwatch,
# arpon, rkhunter, chkrootkit, libpam-tmpdir
#
#
#
#
class os_hardening::lynis_packages{
  package { 'apt-listbugs'		: ensure => 'installed' }
  package { 'apt-listchanges'		: ensure => 'installed' }
  package { 'debian-goodies'		: ensure => 'installed' }
  package { 'needrestart'		: ensure => 'installed' }
  package { 'debsecan'			: ensure => 'installed' }
  package { 'debsums'			: ensure => 'installed' }
  package { 'fail2ban'			: ensure => 'installed' }
  package { 'libapache2-mod-evasive'	: ensure => 'installed' }
  package { 'libapache2-mod-qos'	: ensure => 'installed' }
  package { 'libapache2-mod-security2'	: ensure => 'installed' }
  package { 'arpwatch'			: ensure => 'installed' }
  package { 'arpon'			: ensure => 'installed' }
  package { 'rkhunter'			: ensure => 'installed' }
  package { 'chkrootkit'		: ensure => 'installed' }
  package { 'libpam-tmpdir'		: ensure => 'installed' }
  package { 'acct'			: ensure => 'installed' }
  package { 'sysstat'			: ensure => 'installed' }
}

