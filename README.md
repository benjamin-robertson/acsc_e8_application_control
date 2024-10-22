# acsc_e8_application_control

A Puppet module which automates the setup of the ACSC essential 8 application control on Windows, without requiring the use of group policy. This module allows for application control to be configured at scale as ACSC intended across all Puppet managed environment using a repeatable method.

For more information about applocker: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/applocker/applocker-overview

For more information about Essential 8: https://www.cyber.gov.au/acsc/view-all-content/essential-eight

For more information about Application control: https://www.cyber.gov.au/acsc/view-all-content/publications/implementing-application-control

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with acsc_e8_application_control](#setup)
    * [What acsc_e8_application_control affects](#what-acsc_e8_application_control-affects)
    * [Setup requirements](#setup-requirements)
    * [Warning](#Warning)
    * [Beginning with acsc_e8_application_control](#beginning-with-acsc_e8_application_control)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Use this module to easily implement basic application control on your Windows hosts. This module will implement application control as described in [ACSC link][2] [Backup link][1]

## Setup

### What acsc_e8_application_control affects

See [here][2] page 2 for information on which applocker rules will be configured. 

In addition, c:\choco will also be whitelisted for executables to allow chocolatey to run from its default directly. Chocolate is commonly used in conjunction with Puppet on Window for package management. [Chocolately][3]

## Warning
**Only apply this module to test nodes initially. Applocker can prevent application from running and could cause outages in production systems.**

Audit only mode can now be used to verify applocker rules before they are enforced.

### Setup Requirements

The following modules are dependencies are required acsc_e8_application_control

- [benjaminrobertson-applocker][4]

### Beginning with acsc_e8_application_control

`include acsc_e8_application_control`

## Usage

Standard defaults

    class { 'acsc_e8_application_control'
      executable_rules   => 'AuditOnly',
      msi_rules          => 'AuditOnly',
      dll_rules          => 'AuditOnly',
      script_rules       => 'AuditOnly',
      packaged_app_rules => 'AuditOnly',
      start_service      => true,
    }

Additional applocker rules can be specified as shown. Hiera is preferred method to configure and manage large hash sets

    class { 'acsc_e8_application_control':
      additional_exec_applocker_rules => {
        'Exec c:\\temp' => {
          'ensure'            => 'present',
          'action'            => 'Allow',
        'conditions' => {
          'path'              => '%OSDRIVE%\\temp\\*',
        },
          'description'       => 'Allow all users to run executable from c:\\temp',
          'rule_type'         => 'path',
          'type'              => 'Exe',
          'user_or_group_sid' => 'S-1-1-0',
        },
      },
      executable_rules   => 'Enabled',
      msi_rules          => 'Enabled',
      dll_rules          => 'Enabled',
      script_rules       => 'Enabled',
      packaged_app_rules => 'Enabled',
      start_service      => true,
      }
    }

To remove the rule simply remove the rule from hiera or class declaration. 

    class { 'acsc_e8_application_control':
      executable_rules   => 'Enabled',
      msi_rules          => 'Enabled',
      dll_rules          => 'Enabled',
      script_rules       => 'Enabled',
      packaged_app_rules => 'Enabled',
      start_service      => true,
      }
    }

For more information on how to construct applocker rules, please see https://forge.puppet.com/modules/benjaminrobertson/applocker documentation. 

## Limitations

This module has been tested on
- Windows Server 2016
- Windows Server 2019
- Windows Server 2022

Windows 10 and 11 hasn't been tested, however it expected to work.

It can take a few minutes for applocker to apply policies once running Puppet. Especially when setting up applocker for the first time. I have seen it take over 20 minutes in some cases.

## Development

Open to Pull requests :)

[1]: https://github.com/benjamin-robertson/acsc_e8_application_control/blob/main/files/PROTECT%20-%20Implementing%20Application%20Control%20(October%202021).pdf
[2]: https://www.cyber.gov.au/sites/default/files/2023-11/PROTECT%20-%20Implementing%20Application%20Control%20%28November%202023%29.pdf
[3]: https://chocolatey.org/
[4]: https://forge.puppet.com/modules/benjaminrobertson/applocker