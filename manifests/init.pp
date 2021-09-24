# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_applocker_fervid
class puppet_applocker_fervid (
  Hash $additional_applocker_rules = {},
) {
  # lookup default rules
  $default_applocker_rules = lookup(puppet_applocker_fervid::default_applocker_rules)
  # merge hashes
  $applocker_rules = merge($default_applocker_rules, $additional_applocker_rules)

  # Apply rules
  class { 'puppet_applocker_fervid::rules':
    applocker_rules => $applocker_rules,
  }

}
