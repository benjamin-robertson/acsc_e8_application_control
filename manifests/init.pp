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
# @param [Enum['Enabled','AuditOnly']] executable_rules Mode for executable rules, Default: AuditOnly.
# @param [Enum['Enabled','AuditOnly']] msi_rules Mode for msi rules, Default: AuditOnly.
# @param [Enum['Enabled','AuditOnly']] dll_rules Mode for dll rules, Default: AuditOnly.
# @param [Enum['Enabled','AuditOnly']] script_rules Mode for script rules, Default: AuditOnly.
# @param [Enum['Enabled','AuditOnly']] packaged_app_rules Mode for packaged app rules, Default: AuditOnly.
# @param [Boolean] start_service Start the appID service, defaults true.
class acsc_e8_application_control (
  Hash $additional_exec_applocker_rules = {},
  Hash $additional_msi_applocker_rules = {},
  Hash $additional_appx_applocker_rules = {},
  Hash $additional_script_applocker_rules = {},
  Hash $additional_dll_applocker_rules = {},
  Enum['Enabled','AuditOnly'] $executable_rules = 'AuditOnly',
  Enum['Enabled','AuditOnly'] $msi_rules = 'AuditOnly',
  Enum['Enabled','AuditOnly'] $dll_rules = 'AuditOnly',
  Enum['Enabled','AuditOnly'] $script_rules = 'AuditOnly',
  Enum['Enabled','AuditOnly'] $packaged_app_rules = 'AuditOnly',
  Boolean $start_service = true,
) {
  # lookup default rules
  $default_exec_applocker_rules = lookup(acsc_e8_application_control::exec_applocker_rules)
  $default_msi_applocker_rules = lookup(acsc_e8_application_control::msi_applocker_rules)
  $default_appx_applocker_rules = lookup(acsc_e8_application_control::appx_applocker_rules)
  $default_script_applocker_rules = lookup(acsc_e8_application_control::script_applocker_rules)
  $default_dll_applocker_rules = lookup(acsc_e8_application_control::dll_applocker_rules)
  # merge hashes
  $exec_applocker_rules = $default_exec_applocker_rules + $additional_exec_applocker_rules
  $msi_applocker_rules = $default_msi_applocker_rules + $additional_msi_applocker_rules
  $appx_applocker_rules = $default_appx_applocker_rules + $additional_appx_applocker_rules
  $script_applocker_rules = $default_script_applocker_rules + $additional_script_applocker_rules
  $dll_applocker_rules = $default_dll_applocker_rules + $additional_dll_applocker_rules

  # Apply rules
  class { 'applocker':
    exec_applocker_rules   => $exec_applocker_rules,
    msi_applocker_rules    => $msi_applocker_rules,
    appx_applocker_rules   => $appx_applocker_rules,
    script_applocker_rules => $script_applocker_rules,
    dll_applocker_rules    => $dll_applocker_rules,
    executable_rules       => $executable_rules,
    msi_rules              => $msi_rules,
    dll_rules              => $dll_rules,
    script_rules           => $script_rules,
    packaged_app_rules     => $packaged_app_rules,
    start_service          => $start_service,
  }
}
