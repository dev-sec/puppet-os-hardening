# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#
# Remove SUID and SGID bits from a given file

define os_hardening::blacklist_files {
  exec{ "remove suid/sgid bit from ${name}":
    command => "/bin/chmod ug-s ${name}",
    # the following checks if we are operating on a file
    # and if this file has either SUID or SGID bits set
    # it reads:
    # (isFile(x) && isSuid(x)) || (isFile(x) && isSgid(x))
    onlyif  => "/usr/bin/test -f ${name} -a -u ${name} -o -f ${name} -a -g ${name}",
  }
}
