# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_applocker_fervid::service
class puppet_applocker_fervid::service {
  service { 'application identity service':
    ensure => running,
    name   => 'AppIDSvc',
    enable => true,
  }
}
