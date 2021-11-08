# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include acsc_e8_application_control::rule_status
class acsc_e8_application_control::rule_status (
  Enum['Audit','Enabled'] $executable_rules,
  Enum['Audit','Enabled'] $msi_rules,
  Enum['Audit','Enabled'] $dll_rules,
  Enum['Audit','Enabled'] $script_rules,
  Enum['Audit','Enabled'] $packaged_app_rules,
) {

  # Set executable rules
  if $executable_rules == 'Enabled' {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Exe\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Exe',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '1',
    }
  } else {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Exe\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Exe',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '0',
    }
  }

  # Set msi rules
  if $msi_rules == 'Enabled' {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Msi\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Msi',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '1',
    }
  } else {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Msi\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Msi',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '0',
    }
  }

  # Set dll rules
  if $dll_rules == 'Enabled' {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Dll\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Dll',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '1',
    }
  } else {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Dll\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Dll',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '0',
    }
  }

  # Set script rules
  if $script_rules == 'Enabled' {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Script\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Script',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '1',
    }
  } else {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Script\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Script',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '0',
    }
  }

  # Set package app rules
  if $packaged_app_rules == 'Enabled' {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Appx\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Appx',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '1',
    }
  } else {
    registry::value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Appx\EnforcementMode':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SrpV2\Appx',
      value => 'EnforcementMode',
      type  => 'dword',
      data  => '0',
    }
  }

}
