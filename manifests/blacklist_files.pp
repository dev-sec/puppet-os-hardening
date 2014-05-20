# Remove SUID and SGID bits from a given file
define blacklist_files {
  exec{ "remove suid/sgid bit from ${name}":
    command => "/bin/chmod ug-s ${name}",
    onlyif  => "/usr/bin/test -f ${name}",
  }
}