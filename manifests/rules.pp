# @summary A short summary of the purpose of this class
#
# Sets applocker rules
#
# @example
#   private class
class acsc_e8_application_control::rules (
  Hash $exec_applocker_rules,
  Hash $msi_applocker_rules,
  Hash $appx_applocker_rules,
  Hash $script_applocker_rules,
  Hash $dll_applocker_rules,
  Enum['Audit','Enabled'] $executable_rules = 'Enabled',
  Enum['Audit','Enabled'] $msi_rules = 'Enabled',
  Enum['Audit','Enabled'] $dll_rules = 'Enabled',
  Enum['Audit','Enabled'] $script_rules = 'Enabled',
  Enum['Audit','Enabled'] $packaged_app_rules = 'Enabled',
) {


  # Apply exec applocker rules
  if $executable_rules == 'Enabled' {
    $exec_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  } elsif $executable_rules == 'Audit' {
    $exec_applocker_rules.each | String $name, Hash $rule | {
      notify { "Applocker exec rule ${name} hash is ${rule}":}
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        mode              => 'AuditOnly',
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  }

  # Apply msi applocker rules
  if $msi_rules == 'Enabled' {
    $msi_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  } elsif $msi_rules == 'Audit' {
    $msi_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        mode              => 'AuditOnly',
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  }

  # Apply package app rules
  if $packaged_app_rules == 'Enabled' {
    $appx_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  } elsif $packaged_app_rules == 'Audit' {
    $appx_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        mode              => 'AuditOnly',
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  }

  # Apply scirpt rules
  if $script_rules == 'Enabled' {
    $script_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  } elsif $script_rules == 'Audit' {
    $script_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        mode              => 'AuditOnly',
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  }

  # Apply dll rules
  if $dll_rules == 'Enabled' {
    $dll_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  } elsif $dll_rules == 'Audit' {
    $dll_applocker_rules.each | String $name, Hash $rule | {
      applocker_rule { $name:
        ensure            => $rule['ensure'],
        action            => $rule['action'],
        conditions        => $rule['conditions'],
        exceptions        => $rule['exceptions'],
        description       => $rule['description'],
        mode              => 'AuditOnly',
        rule_type         => $rule['rule_type'],
        type              => $rule['type'],
        user_or_group_sid => $rule['user_or_group_sid'],
      }
    }
  }

}
