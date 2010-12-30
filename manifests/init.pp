# Puppet module to install the F5 FirePass SSL VPN command-line client
# from http://fuhm.net/software/f5vpn-login/

import "defines/*.pp"
import "classes/*.pp"

class f5vpn {

  include f5vpn::build

}
