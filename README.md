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

Use this module to easily implement basic application control on your Windows hosts. This module will implement application control as described in 

## Setup

### What acsc_e8_application_control affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For
example, folks can probably figure out that your mysql_instance module affects
their MySQL instances.

If there's more that they should know about, though, this is the place to
mention:

* Files, packages, services, or operations that the module will alter, impact,
  or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
another module, etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you might want to include an additional "Upgrading" section here.

### Beginning with acsc_e8_application_control

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most basic
use of the module.

## Usage

Include usage examples for common use cases in the **Usage** section. Show your
users how to use your module to solve problems, and be sure to include code
examples. Include three to five examples of the most important or common tasks a
user can accomplish with your module. Show users how to accomplish more complex
tasks that involve different types, classes, and functions working in tandem.


## Limitations

In the Limitations section, list any incompatibilities, known issues, or other
warnings.

## Development

Open to Pull requests :)


## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel are
necessary or important to include here. Please use the `##` header.

[1]: https://puppet.com/docs/pdk/latest/pdk_generating_modules.html
[2]: https://puppet.com/docs/puppet/latest/puppet_strings.html
[3]: https://puppet.com/docs/puppet/latest/puppet_strings_style.html
