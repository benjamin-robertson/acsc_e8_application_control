# Changelog

All notable changes to this project will be documented in this file.

## Release 1.0.0

**Features**

- **Major change:** Module has been migrated to use benjaminrobertson-applocker. Dependencies need to be updated in Puppetfile. See [applocker][2] module for its dependencies on the xml-simple gem and how to install it.
- Module now supports 'AuditOnly' mode for applocker rules.

**Known Issues**

- Windows 2016/2019/2022 will throw error on 1st Puppet run when activating the AppIDSvc, this is due to it being a [protected service][1] subsequent runs will run clean.

## Release 0.1.0

**Features**

- Initial release

**Bugfixes**

**Known Issues**

- Audit only option not working, can only run the module in enforce mode.
- Windows 2016/2019/2022 will throw error on 1st Puppet run when activating the AppIDSvc, this is due to it being a [protected service][1] subsequent runs will run clean.


[1]: https://docs.microsoft.com/en-us/windows/win32/services/protecting-anti-malware-services-
[2]: https://forge.puppet.com/modules/benjaminrobertson/applocker
