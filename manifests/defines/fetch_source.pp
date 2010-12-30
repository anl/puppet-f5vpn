# function to download individual F5 VPN source files from master site

define f5vpn::fetch_source() {
  $url_base = "http://fuhm.net/software/f5vpn-login/"
  exec { "wget $title":
    cwd => "/root/f5vpn-build",
    command => "/usr/bin/wget ${url_base}/${title}",
    creates => "/root/f5vpn-build/${title}",
    require => File["/root/f5vpn-build"],
  }
}
