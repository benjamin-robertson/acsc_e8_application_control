# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_applocker_fervid::rules
class puppet_applocker_fervid::rules (
  Hash $applocker_rules
) {

  # Apply applocker rules
  $applocker_rules.each | String $name, Hash $rule | {
    applocker_rule { $name:
      * => $rule
    }
  }
}
