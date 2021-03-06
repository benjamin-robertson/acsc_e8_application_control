# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`acsc_e8_application_control`](#acsc_e8_application_control): Enforce acsc E8 application control
* [`acsc_e8_application_control::rule_status`](#acsc_e8_application_controlrule_status): A short summary of the purpose of this class
* [`acsc_e8_application_control::rules`](#acsc_e8_application_controlrules): A short summary of the purpose of this class
* [`acsc_e8_application_control::service`](#acsc_e8_application_controlservice): A short summary of the purpose of this class

## Classes

### <a name="acsc_e8_application_control"></a>`acsc_e8_application_control`

Enforce acsc E8 application control

#### Examples

##### 

```puppet
include acsc_e8_application_control
```

#### Parameters

The following parameters are available in the `acsc_e8_application_control` class:

* [`additional_exec_applocker_rules`](#additional_exec_applocker_rules)
* [`additional_msi_applocker_rules`](#additional_msi_applocker_rules)
* [`additional_appx_applocker_rules`](#additional_appx_applocker_rules)
* [`additional_script_applocker_rules`](#additional_script_applocker_rules)
* [`additional_dll_applocker_rules`](#additional_dll_applocker_rules)
* [`executable_rules`](#executable_rules)
* [`msi_rules`](#msi_rules)
* [`dll_rules`](#dll_rules)
* [`script_rules`](#script_rules)
* [`packaged_app_rules`](#packaged_app_rules)
* [`start_service`](#start_service)

##### <a name="additional_exec_applocker_rules"></a>`additional_exec_applocker_rules`

Data type: `Hash`

Additional exec applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
Defaults - {}

Default value: `{}`

##### <a name="additional_msi_applocker_rules"></a>`additional_msi_applocker_rules`

Data type: `Hash`

Additional msi applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
Defaults - {}

Default value: `{}`

##### <a name="additional_appx_applocker_rules"></a>`additional_appx_applocker_rules`

Data type: `Hash`

Additional appx applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
Defaults - {}

Default value: `{}`

##### <a name="additional_script_applocker_rules"></a>`additional_script_applocker_rules`

Data type: `Hash`

Additional script applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
Defaults - {}

Default value: `{}`

##### <a name="additional_dll_applocker_rules"></a>`additional_dll_applocker_rules`

Data type: `Hash`

Additional dll applocker rules. merged with existing ACSC rules see https://forge.puppet.com/modules/fervid/applocker
Defaults - {}

Default value: `{}`

##### <a name="executable_rules"></a>`executable_rules`

Data type: `Enum['Enabled']`

Executable rule status, Enabled (or Audit, currently not supported)
Defaults - Enabled

Default value: `'Enabled'`

##### <a name="msi_rules"></a>`msi_rules`

Data type: `Enum['Enabled']`

Msi rule status, Enabled (or Audit, currently not supported)
Defaults - Enabled

Default value: `'Enabled'`

##### <a name="dll_rules"></a>`dll_rules`

Data type: `Enum['Enabled']`

Dll rule status, Enabled (or Audit, currently not supported)
Defaults - Enabled

Default value: `'Enabled'`

##### <a name="script_rules"></a>`script_rules`

Data type: `Enum['Enabled']`

Script rule status, Enabled (or Audit, currently not supported)
Defaults - Enabled

Default value: `'Enabled'`

##### <a name="packaged_app_rules"></a>`packaged_app_rules`

Data type: `Enum['Enabled']`

Packaged_app_rules rule status, Enabled (or Audit, currently not supported)
Defaults - Enabled

Default value: `'Enabled'`

##### <a name="start_service"></a>`start_service`

Data type: `Boolean`

Start the appID service, defaults true.

Default value: ``true``

### <a name="acsc_e8_application_controlrule_status"></a>`acsc_e8_application_control::rule_status`

Enforces rule status of each applocker rule type

#### Examples

##### 

```puppet
private class
```

#### Parameters

The following parameters are available in the `acsc_e8_application_control::rule_status` class:

* [`executable_rules`](#executable_rules)
* [`msi_rules`](#msi_rules)
* [`dll_rules`](#dll_rules)
* [`script_rules`](#script_rules)
* [`packaged_app_rules`](#packaged_app_rules)

##### <a name="executable_rules"></a>`executable_rules`

Data type: `Enum['Audit','Enabled']`



##### <a name="msi_rules"></a>`msi_rules`

Data type: `Enum['Audit','Enabled']`



##### <a name="dll_rules"></a>`dll_rules`

Data type: `Enum['Audit','Enabled']`



##### <a name="script_rules"></a>`script_rules`

Data type: `Enum['Audit','Enabled']`



##### <a name="packaged_app_rules"></a>`packaged_app_rules`

Data type: `Enum['Audit','Enabled']`



### <a name="acsc_e8_application_controlrules"></a>`acsc_e8_application_control::rules`

Sets applocker rules

#### Examples

##### 

```puppet
private class
```

#### Parameters

The following parameters are available in the `acsc_e8_application_control::rules` class:

* [`exec_applocker_rules`](#exec_applocker_rules)
* [`msi_applocker_rules`](#msi_applocker_rules)
* [`appx_applocker_rules`](#appx_applocker_rules)
* [`script_applocker_rules`](#script_applocker_rules)
* [`dll_applocker_rules`](#dll_applocker_rules)
* [`executable_rules`](#executable_rules)
* [`msi_rules`](#msi_rules)
* [`dll_rules`](#dll_rules)
* [`script_rules`](#script_rules)
* [`packaged_app_rules`](#packaged_app_rules)

##### <a name="exec_applocker_rules"></a>`exec_applocker_rules`

Data type: `Hash`



##### <a name="msi_applocker_rules"></a>`msi_applocker_rules`

Data type: `Hash`



##### <a name="appx_applocker_rules"></a>`appx_applocker_rules`

Data type: `Hash`



##### <a name="script_applocker_rules"></a>`script_applocker_rules`

Data type: `Hash`



##### <a name="dll_applocker_rules"></a>`dll_applocker_rules`

Data type: `Hash`



##### <a name="executable_rules"></a>`executable_rules`

Data type: `Enum['Audit','Enabled']`



Default value: `'Enabled'`

##### <a name="msi_rules"></a>`msi_rules`

Data type: `Enum['Audit','Enabled']`



Default value: `'Enabled'`

##### <a name="dll_rules"></a>`dll_rules`

Data type: `Enum['Audit','Enabled']`



Default value: `'Enabled'`

##### <a name="script_rules"></a>`script_rules`

Data type: `Enum['Audit','Enabled']`



Default value: `'Enabled'`

##### <a name="packaged_app_rules"></a>`packaged_app_rules`

Data type: `Enum['Audit','Enabled']`



Default value: `'Enabled'`

### <a name="acsc_e8_application_controlservice"></a>`acsc_e8_application_control::service`

Starts applocker service

#### Examples

##### 

```puppet
private class
```

