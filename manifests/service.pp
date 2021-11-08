# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include acsc_e8_application_control::service
class acsc_e8_application_control::service {
  service { 'application identity service':
    ensure => running,
    name   => 'AppIDSvc',
    enable => true,
  }
}
