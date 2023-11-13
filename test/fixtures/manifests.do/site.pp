# FIX: create module conf dir

file { '/etc/modprobe.d/':
  ensure => directory,
}

# Apply hardening module
-> class { 'os_hardening':
  manage_cron_permissions => true,
}
