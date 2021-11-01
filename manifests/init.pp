# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_applocker_fervid
class puppet_applocker_fervid (
  Hash $additional_applocker_rules = {},
  Enum['Audit','Enabled'] $executable_rules = 'Enabled',
  Enum['Audit','Enabled'] $msi_rules = 'Enabled',
  Enum['Audit','Enabled'] $dll_rules = 'Enabled',
  Enum['Audit','Enabled'] $script_rules = 'Enabled',
  Enum['Audit','Enabled'] $packaged_app_rules = 'Enabled',
  Boolean $start_service = true,
) {
  # lookup default rules
  $default_applocker_rules = lookup(puppet_applocker_fervid::default_applocker_rules)
  # merge hashes
  $applocker_rules = merge($default_applocker_rules, $additional_applocker_rules)

  # Apply rules
  class { 'puppet_applocker_fervid::rules':
    applocker_rules => $applocker_rules,
  }

  # Set rule status
  class { 'puppet_applocker_fervid::rule_status':
    executable_rules   => $executable_rules,
    msi_rules          => $msi_rules,
    dll_rules          => $dll_rules,
    script_rules       => $script_rules,
    packaged_app_rules => $packaged_app_rules,
  }

  if $start_service {
    include puppet_applocker_fervid::service
  }

}
