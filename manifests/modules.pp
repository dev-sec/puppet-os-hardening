# === Copyright
#
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::modules
#
# Manage Kernel Modules
#
class os_hardening::modules (
  Array $disable_filesystems =
    ['cramfs','freevxfs','jffs2','hfs','hfsplus','squashfs','udf'],
  Array $disable_network_protocol = ['dccp','sctp','rds','tipc'],
) {

  # Disable unused filesystems (os-10)
  file { '/etc/modprobe.d/dev-sec.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => template('os_hardening/disable_fs.erb'),
  }

  file { '/etc/modprobe.d/dev-sec-net-protocols.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => template('os_hardening/disable_net_protocols.erb'),
  }
}

