# acsc_e8_application_control

A Puppet module which automates the setup of ACSC essential 8 application control on Windows without requiring the use of group policy. 
For more information about applocker: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/applocker/applocker-overview
For more information about Essential 8: https://www.cyber.gov.au/acsc/view-all-content/essential-eight
For more information about Application control: https://www.cyber.gov.au/acsc/view-all-content/publications/implementing-application-control

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with acsc_e8_application_control](#setup)
    * [What acsc_e8_application_control affects](#what-acsc_e8_application_control-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with acsc_e8_application_control](#beginning-with-acsc_e8_application_control)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Use this module to easily implement basic application control on your Windows hosts. This module will implement application control as described in [ACSC link][2] [Backup link][1]

## Setup

### What acsc_e8_application_control affects

See [here][2] page 2 for information on which applocker rules will be configured. 

In addition, the c:\choco will also be whitelisted for executables to allow chocolatey to run from its default directly. Chocolate is commonly used in conjunction with Puppet on Window for package management. [Chocolately][3]

**Warning** Please only apply this module to test nodes initially. Applocker can prevent application from running and could cause outages in production systems. 

### Setup Requirements **OPTIONAL**

The following modules are dependencies are required acsc_e8_application_control

- [fervid-applocker][4]
- [puppetlabs-registry][5]

### Beginning with acsc_e8_application_control

`include acsc_e8_application_control`

## Usage




## Limitations

Currently, we are unable to set the Applocker rules to run in audit only. This is due to a limitation in the underlying custom type. 

## Development

Open to Pull requests :)

[1]: https://github.com/benjamin-robertson/acsc_e8_application_control/blob/main/files/PROTECT%20-%20Implementing%20Application%20Control%20(October%202021).pdf
[2]: https://www.cyber.gov.au/sites/default/files/2021-10/PROTECT%20-%20Implementing%20Application%20Control%20%28October%202021%29.pdf
[3]: https://chocolatey.org/
[4]: https://forge.puppet.com/modules/fervid/applocker
[5]: https://forge.puppet.com/modules/puppetlabs/registry