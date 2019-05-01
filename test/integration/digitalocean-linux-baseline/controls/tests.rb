include_controls 'linux-baseline' do
  # /etc/hosts.equiv is not absent everywhere
  skip_control 'os-01'
  # skip entropy test, as our short living test VMs usually do not have enough
  skip_control 'os-08'
  # skip filesystem test (vfat enabled for uefi)
  skip_control 'os-10'
  # No syslog installed in test env
  skip_control 'package-07'
  # skip auditd tests, we do not have any implementation for audit management yet
  skip_control 'package-08'
end
