# @summary 
#
# Enforce acsc E8 application control
#
# @example
#   include acsc_e8_application_control
#
# @param [Hash] additional_exec_applocker_rules
#     Additional exec applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
#     Defaults - {}
#
# @param [Hash] additional_msi_applocker_rules
#     Additional msi applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
#     Defaults - {}
#
# @param [Hash] additional_appx_applocker_rules
#     Additional appx applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
#     Defaults - {}
#
# @param [Hash] additional_script_applocker_rules
#     Additional script applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
#     Defaults - {}
#
# @param [Hash] additional_dll_applocker_rules
#     Additional dll applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
#     Defaults - {}
#
# @param [Enum['Enabled']] executable_rules
#     Executable rule status, Enabled (or Audit, currently not supported)
#     Defaults - Enabled
#
# @param [Enum['Enabled']] msi_rules
#     Msi rule status, Enabled (or Audit, currently not supported)
#     Defaults - Enabled
#
# @param [Enum['Enabled']] dll_rules
#     Dll rule status, Enabled (or Audit, currently not supported)
#     Defaults - Enabled
#
# @param [Enum['Enabled']] script_rules
#     Script rule status, Enabled (or Audit, currently not supported)
#     Defaults - Enabled
#
# @param [Enum['Enabled']] packaged_app_rules
#     Packaged_app_rules rule status, Enabled (or Audit, currently not supported)
#     Defaults - Enabled
#
# @param [Boolean] start_service
#     Start the appID service, defaults true.
#
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
  class { 'acsc_e8_application_control::rule_status':
    executable_rules   => $executable_rules,
    msi_rules          => $msi_rules,
    dll_rules          => $dll_rules,
    script_rules       => $script_rules,
    packaged_app_rules => $packaged_app_rules,
  }

  if $start_service {
    include acsc_e8_application_control::service
  }

}
