# defined type os_hardening::pathperms {
define os_hardening::pathperms {
  file { "os_hardening_${name}" :
    ensure  => 'directory',
    path    => $name,
    links   => 'follow',
    mode    => 'go-w',
    recurse => true,
  }
}
