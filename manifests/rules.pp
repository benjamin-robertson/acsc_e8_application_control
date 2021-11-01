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
      ensure            => $rule['ensure'],
      action            => $rule['action'],
      conditions        => $rule['conditions'],
      exceptions        => $rule['exceptions'],
      description       => $rule['description'],
      mode              => $rule['mode'],
      rule_type         => $rule['rule_type'],
      type              => $rule['type'],
      user_or_group_sid => $rule['user_or_group_sid'],
    }
  }
}
