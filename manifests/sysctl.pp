# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: os_hardening::pam
#
# Configures PAM
#
class os_hardening::sysctl (
  $enable_module_loading   = true,
  $load_modules            = [],
  $cpu_vendor              = 'intel',
  $desktop_enabled         = false,
  $enable_ipv4_forwarding  = false,
  $enable_ipv6             = false,
  $enable_ipv6_forwarding  = false,
  $arp_restricted          = true,
  $enable_sysrq            = false,
  $enable_core_dump        = false,
  $enable_stack_protection = true,
){

  # set variables
  if $::architecture == 'amd64' or $::architecture == 'x86_64' {
    $x86_64 = true
  } else {
    $x86_64 = false
  }

  # configure sysctl parameters

  # Networking
  # ----------

  # Only enable IP traffic forwarding, if required.
  if $enable_ipv4_forwarding {
    sysctl { 'net.ipv4.ip_forward': value => '1' }
  } else {
    sysctl { 'net.ipv4.ip_forward': value => '0' }
  }

  # IPv6 enabled
  if $enable_ipv6 {
    sysctl { 'net.ipv6.conf.all.disable_ipv6': value => '0' }
    if $enable_ipv6_forwarding {
      sysctl { 'net.ipv6.conf.all.forwarding': value => '1' }
    } else {
      sysctl { 'net.ipv6.conf.all.forwarding': value => '0' }
    }
  } else {
    # IPv6 disabled
    sysctl { 'net.ipv6.conf.all.disable_ipv6': value => '1' }
    sysctl { 'net.ipv6.conf.all.forwarding': value => '0' }
    sysctl { 'net.ipv6.conf.default.router_solicitations': value => '0' }
    sysctl { 'net.ipv6.conf.default.accept_ra_rtr_pref': value => '0' }
    sysctl { 'net.ipv6.conf.default.accept_ra_pinfo': value => '0' }
    sysctl { 'net.ipv6.conf.default.accept_ra_defrtr': value => '0' }
    sysctl { 'net.ipv6.conf.default.autoconf': value => '0' }
    sysctl { 'net.ipv6.conf.default.dad_transmits': value => '0' }
    sysctl { 'net.ipv6.conf.default.max_addresses': value => '1' }
  }

  #ignore RAs on Ipv6
  sysctl { 'net.ipv6.conf.all.accept_ra': value => '0' }

  # Enable RFC-recommended source validation feature. It should not be used for routers on complex networks, but is helpful for end hosts and routers serving small networks.
  sysctl { 'net.ipv4.conf.all.rp_filter': value => '1' }
  sysctl { 'net.ipv4.conf.default.rp_filter': value => '1' }

  # Reduce the surface on SMURF attacks. Make sure to ignore ECHO broadcasts, which are only required in broad network analysis.
  sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts': value => '1' }

  # There is no reason to accept bogus error responses from ICMP, so ignore them instead.
  sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses': value => '1' }

  # Limit the amount of traffic the system uses for ICMP.
  sysctl { 'net.ipv4.icmp_ratelimit': value => '100' }

  # Adjust the ICMP ratelimit to include: ping, dst unreachable, source quench, time exceed, param problem, timestamp reply, information reply
  sysctl { 'net.ipv4.icmp_ratemask': value => '88089' }

  # Protect against wrapping sequence numbers at gigabit speeds:
  sysctl { 'net.ipv4.tcp_timestamps': value => '0' }

  # arp_announce - INTEGER
  # Define different restriction levels for announcing the local source IP address from IP packets in ARP requests sent on interface:
  #
  # * **0** - (default) Use any local address, configured on any interface
  # * **1** - Try to avoid local addresses that are not in the target's subnet for this interface. This mode is useful when target hosts reachable via this interface require the source IP address in ARP requests to be part of their logical network configured on the receiving interface. When we generate the request we will check all our subnets that include the target IP and will preserve the source address if it is from such subnet. If there is no such subnet we select source address according to the rules for level 2.
  # * **2** - Always use the best local address for this target. In this mode we ignore the source address in the IP packet and try to select local address that we prefer for talks with the target host. Such local address is selected by looking for primary IP addresses on all our subnets on the outgoing interface that include the target IP address. If no suitable local address is found we select the first local address we have on the outgoing interface or on all other interfaces, with the hope we will receive reply for our request and even sometimes no matter the source IP address we announce.
  if $arp_restricted {
    sysctl { 'net.ipv4.conf.all.arp_ignore': value => '1' }
  } else {
    sysctl { 'net.ipv4.conf.all.arp_ignore': value => '0' }
  }


  # Define different modes for sending replies in response to received ARP requests that resolve local target IP addresses:
  #
  # * **0** - (default): reply for any local target IP address, configured on any interface
  # * **1** - reply only if the target IP address is local address configured on the incoming interface
  # * **2** - reply only if the target IP address is local address configured on the incoming interface and both with the sender's IP address are part from same subnet on this interface
  # * **3** - do not reply for local addresses configured with scope host, only resolutions for global and link addresses are replied
  # * **4-7** - reserved
  # * **8** - do not reply for all local addresses
  if $arp_restricted {
    sysctl { 'net.ipv4.conf.all.arp_announce': value => '2' }
  } else {
    sysctl { 'net.ipv4.conf.all.arp_announce': value => '0' }
  }

  # RFC 1337 fix F1
  sysctl { 'net.ipv4.tcp_rfc1337': value => '1' }

  # Syncookies is used to prevent SYN-flooding attacks.
  sysctl { 'net.ipv4.tcp_syncookies': value => '1' }

  sysctl { 'net.ipv4.conf.all.shared_media': value => '1' }
  sysctl { 'net.ipv4.conf.default.shared_media': value => '1' }

  # Accepting source route can lead to malicious networking behavior, so disable it if not needed.
  sysctl { 'net.ipv4.conf.all.accept_source_route': value => '0' }
  sysctl { 'net.ipv6.conf.all.accept_source_route': value => '0' }
  sysctl { 'net.ipv4.conf.default.accept_source_route': value => '0' }
  sysctl { 'net.ipv6.conf.default.accept_source_route': value => '0' }

  # Accepting redirects can lead to malicious networking behavior, so disable it if not needed.
  sysctl { 'net.ipv4.conf.all.accept_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.default.accept_redirects': value => '0' }
  sysctl { 'net.ipv6.conf.all.accept_redirects': value => '0' }
  sysctl { 'net.ipv6.conf.default.accept_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.all.secure_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.default.secure_redirects': value => '0' }

  # For non-routers: don't send redirects, these settings are 0
  sysctl { 'net.ipv4.conf.all.send_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.default.send_redirects': value => '0' }

  # log martian packets (risky, may cause DoS)
  #net.ipv4.conf.all.log_martians = 1


  # System
  # ------

  # This settings controls how the kernel behaves towards module changes at runtime. Setting to 1 will disable module loading at runtime.
  if $enable_module_loading == false {
    sysctl { 'kernel.modules_disabled': value => '1' }
  }
  #kernel.modules_disabled = <%= @enable_module_loading ? 0 : 1 %>

  # Magic Sysrq should be disabled, but can also be set to a safe value if so desired for physical machines. It can allow a safe reboot if the system hangs and is a 'cleaner' alternative to hitting the reset button.
  # The following values are permitted:
  #
  # * **0** - disable sysrq
  # * **1** - enable sysrq completely
  # * **>1** - bitmask of enabled sysrq functions:
  # * **2** - control of console logging level
  # * **4** - control of keyboard (SAK, unraw)
  # * **8** - debugging dumps of processes etc.
  # * **16** - sync command
  # * **32** - remount read-only
  # * **64** - signalling of processes (term, kill, oom-kill)
  # * **128** - reboot/poweroff
  # * **256** - nicing of all RT tasks
  if $enable_sysrq {
    $limited_sysrq = 4 + 16 + 32 + 64 + 128
    sysctl { 'kernel.sysrq': value => $limited_sysrq }
  } else {
    sysctl { 'kernel.sysrq': value => '0' }
  }

  # Enable stack protection by randomizing kernel va space
  if $enable_stack_protection {
    sysctl { 'kernel.randomize_va_space': value => '2' }
  } else {
    sysctl { 'kernel.randomize_va_space': value => '0' }
  }
  
  # Prevent core dumps with SUID. These are usually only needed by developers and may contain sensitive information.
  if $enable_core_dump {
    sysctl { 'fs.suid_dumpable': value => '1' }
  } else {
    sysctl { 'fs.suid_dumpable': value => '0' }
  }

  # configure for module hardening
  # if modules cannot be loaded at runtime, they must all
  # be pre-configured in initramfs
  if $enable_module_loading == false {
    case $::operatingsystem {
      debian, ubuntu: {
        file {
          '/etc/initramfs-tools/modules':
            ensure  => present,
            content => template( 'os_hardening/modules.erb' ),
            owner   => root,
            group   => root,
            mode    => '0400',
            notify  => Exec['update-initramfs'],
        }

        exec { 'update-initramfs':
          command     => '/usr/sbin/update-initramfs -u',
          refreshonly => true,
        }
      }
      default: {
        # TODO
      }
    }
  }
}
