if (!(test-path HKLM:\Software\SoftwareDeployment\Office365UninstallPreConfigured)) {
$OfficeUninstallStrings = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where {$_.DisplayName -like "*Microsoft Office 365*"} | Select UninstallString).UninstallString
    ForEach ($UninstallString in $OfficeUninstallStrings) {
        $UninstallEXE = ($UninstallString -split '"')[1]
        $UninstallArg = ($UninstallString -split '"')[2] + " DisplayLevel=False"
        Start-Process -FilePath $UninstallEXE -ArgumentList $UninstallArg -Wait}
New-Item -Path HKLM:\Software\SoftwareDeployment -Name Office365UninstallPreConfigured -Force
}  
exit
