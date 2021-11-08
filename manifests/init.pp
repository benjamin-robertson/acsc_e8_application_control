# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include acsc_e8_application_control
class acsc_e8_application_control (
  Hash $additional_exec_applocker_rules = {},
  Hash $additional_msi_applocker_rules = {},
  Hash $additional_appx_applocker_rules = {},
  Hash $additional_script_applocker_rules = {},
  Hash $additional_dll_applocker_rules = {},
  Enum['Audit','Enabled'] $executable_rules = 'Enabled',
  Enum['Audit','Enabled'] $msi_rules = 'Enabled',
  Enum['Audit','Enabled'] $dll_rules = 'Enabled',
  Enum['Audit','Enabled'] $script_rules = 'Enabled',
  Enum['Audit','Enabled'] $packaged_app_rules = 'Enabled',
  Boolean $start_service = true,
) {
  # lookup default rules
  $default_exec_applocker_rules = lookup(acsc_e8_application_control::exec_applocker_rules)
  $default_msi_applocker_rules = lookup(acsc_e8_application_control::msi_applocker_rules)
  $default_appx_applocker_rules = lookup(acsc_e8_application_control::appx_applocker_rules)
  $default_script_applocker_rules = lookup(acsc_e8_application_control::script_applocker_rules)
  $default_dll_applocker_rules = lookup(acsc_e8_application_control::dll_applocker_rules)
  # merge hashes
  $exec_applocker_rules = merge($default_exec_applocker_rules, $additional_exec_applocker_rules)
  $msi_applocker_rules = merge($default_msi_applocker_rules, $additional_msi_applocker_rules)
  $appx_applocker_rules = merge($default_appx_applocker_rules, $additional_appx_applocker_rules)
  $script_applocker_rules = merge($default_script_applocker_rules, $additional_script_applocker_rules)
  $dll_applocker_rules = merge($default_dll_applocker_rules, $additional_dll_applocker_rules)

  # Apply rules
  class { 'acsc_e8_application_control::rules':
    exec_applocker_rules   => $exec_applocker_rules,
    msi_applocker_rules    => $msi_applocker_rules,
    appx_applocker_rules   => $appx_applocker_rules,
    script_applocker_rules => $script_applocker_rules,
    dll_applocker_rules    => $dll_applocker_rules,
  }

  # Set rule status
  #class { 'acsc_e8_application_control::rule_status':
  #  executable_rules   => $executable_rules,
  #  msi_rules          => $msi_rules,
  #  dll_rules          => $dll_rules,
  #  script_rules       => $script_rules,
  #  packaged_app_rules => $packaged_app_rules,
  #}

  if $start_service {
    include acsc_e8_application_control::service
  }

}
