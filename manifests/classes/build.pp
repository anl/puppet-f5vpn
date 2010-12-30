# Class to build f5vpn; consider instead distributing a local package
# for your OS.

class f5vpn::build {

  # Directory within which to build f5vpn
  file { "/root/f5vpn-build":
    ensure => directory,
    owner => "root",
    group => "root",
    mode => 0700,
  }

  $src_files = [ "Makefile", "f5vpn-login-runner.c", "f5vpn-login.py", ]

  f5vpn::fetch_source { $src_files: }

  exec { "build f5vpn":
    command => "/usr/bin/make PREFIX=/usr/local",
    cwd => "/root/f5vpn-build",
    creates => "/root/f5vpn-build/f5vpn-login-runner",
    notify => Exec["install f5vpn"],
  }

  exec { "install f5vpn":
    command => "/usr/bin/make install PREFIX=/usr/local",
    cwd => "/root/f5vpn-build",
    refreshonly => true,
  }
  
}
