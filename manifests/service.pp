# @summary A short summary of the purpose of this class
#
# Starts applocker service
#
# @example
#   private class
class acsc_e8_application_control::service {
  service { 'application identity service':
    ensure => running,
    name   => 'AppIDSvc',
    enable => true,
  }
}
