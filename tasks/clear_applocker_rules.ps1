echo '<AppLockerPolicy Version="1">' > applock.xml
echo '<RuleCollection Type="Appx" EnforcementMode="NotConfigured" />' >> applock.xml
echo '<RuleCollection Type="Exe" EnforcementMode="NotConfigured" />' >> applock.xml
echo '<RuleCollection Type="Msi" EnforcementMode="NotConfigured" />' >> applock.xml
echo '<RuleCollection Type="Script" EnforcementMode="NotConfigured" />' >> applock.xml
echo '<RuleCollection Type="Dll" EnforcementMode="NotConfigured" />' >> applock.xml
echo '</AppLockerPolicy>' >> applock.xml
Set-AppLockerPolicy -XMLPolicy applock.xml
rm applock.xml