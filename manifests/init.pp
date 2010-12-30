# Puppet module to install the F5 FirePass SSL VPN command-line client
# from http://fuhm.net/software/f5vpn-login/

import "defines/*.pp"
import "classes/*.pp"

class f5vpn {

  # Directory within which to build f5vpn; consider instead
  # distributing a package for your OS:
  file { "/root/f5vpn-build":
    ensure => directory,
    owner => "root",
    group => "root",
    mode => 0700,
  }

  $src_files = [ "Makefile", "f5vpn-login-runner.c", "f5vpn-login.py", ]

  f5vpn::fetch_source { $src_files: }

}
