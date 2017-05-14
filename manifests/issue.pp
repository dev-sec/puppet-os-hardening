# === Copyright
#
# Copyright 2017, Vijay Kumar - bitvijays
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::issue
#
# Configures the content of /etc/issue and /etc/issue.net
#
class os_hardening::issue (
  $legal_warning = false,
  $company_name = "Example"
){
  if $legal_warning == true {
    $str = "${lsbdistdescription}

This computer system (including all hardware , software and peripheral equipment) is the property of the ${company_name} organization.
${company_name} reserves the right to monitor the use of the computer system to ensure its compliance with ${company_name} security protocols. 
Any additional monitoring, such as monitoring of performance or working hours, shall only take place if permitted in accordance with local laws, 
regulations and/or policies. Any unauthorized access, use or modification of the computer system may be sanctioned in accordance with local laws, regulations and/or policies. 

"
	
    file { ['/etc/issue','/etc/issue.net']:
        ensure => present,
        content => $str,
        owner  => root,
        group  => root,
        mode   => '0644',
    }
  }
}
