include_controls 'linux-baseline' do
  # /etc/hosts.equiv is not absent everywhere
  skip_control 'os-01'
  # skip entropy test, as our short living test VMs usually do not have enough
  skip_control 'os-08'
  # skip filesystem test (vfat enabled for uefi)
  skip_control 'os-10'
  # skip mountpoint test
  skip_control 'os-14'
  # No syslog installed in test env
  skip_control 'package-07'
  # skip auditd tests, we do not have any implementation for audit management yet
  skip_control 'package-08'

  # docker environment - skip all sysctl tests
  skip_control 'sysctl-01'
  skip_control 'sysctl-02'
  skip_control 'sysctl-03'
  skip_control 'sysctl-04'
  skip_control 'sysctl-05'
  skip_control 'sysctl-06'
  skip_control 'sysctl-07'
  skip_control 'sysctl-08'
  skip_control 'sysctl-09'
  skip_control 'sysctl-10'
  skip_control 'sysctl-11'
  skip_control 'sysctl-12'
  skip_control 'sysctl-13'
  skip_control 'sysctl-14'
  skip_control 'sysctl-15'
  skip_control 'sysctl-16'
  skip_control 'sysctl-17'
  skip_control 'sysctl-18'
  skip_control 'sysctl-19'
  skip_control 'sysctl-20'
  skip_control 'sysctl-21'
  skip_control 'sysctl-22'
  skip_control 'sysctl-23'
  skip_control 'sysctl-24'
  skip_control 'sysctl-25'
  skip_control 'sysctl-26'
  skip_control 'sysctl-27'
  skip_control 'sysctl-28'
  skip_control 'sysctl-29'
  skip_control 'sysctl-30'
  skip_control 'sysctl-31a'
  skip_control 'sysctl-31b'
  skip_control 'sysctl-32'
  skip_control 'sysctl-33'
end
