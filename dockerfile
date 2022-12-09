##Downloading server core image
FROM mcr.microsoft.com/windows/servercore:10.0.17763.1039-amd64SHELL 

##installing windows features

["powershell" ]RUN powershell Get-WindowsFeature web-server



RUN powershell Install-windowsfeature web-server
RUN Install-WindowsFeature NET-Framework-45-ASPNET ;    Install-WindowsFeature Web-Asp-Net45 ;
RUN powershell Add-WindowsFeature Web-Common-Http
RUN powershell Add-WindowsFeature Web-Default-Doc
RUN powershell Add-WindowsFeature Web-Dir-Browsing
RUN powershell Add-WindowsFeature Web-Http-Errors
RUN powershell Add-WindowsFeature Web-Static-Content
RUN powershell Add-WindowsFeature Web-Http-Redirect
RUN powershell Add-WindowsFeature Web-Health
RUN powershell Add-WindowsFeature Web-Http-Logging
RUN powershell Add-WindowsFeature Web-Performance
RUN powershell Add-WindowsFeature Web-Stat-Compression
RUN powershell Add-WindowsFeature Web-Security
RUN powershell Add-WindowsFeature Web-Filtering
RUN powershell Add-WindowsFeature Web-Basic-Auth
RUN powershell Add-WindowsFeature Web-CertProvider
RUN powershell Add-WindowsFeature Web-Windows-Auth
RUN powershell Add-WindowsFeature Web-App-Dev
RUN powershell Add-WindowsFeature Web-Net-Ext45
RUN powershell Add-WindowsFeature Web-Asp-Net45
RUN powershell Add-WindowsFeature Web-ISAPI-Ext
RUN powershell Add-WindowsFeature Web-ISAPI-Filter
RUN powershell Add-WindowsFeature Web-WebSockets
RUN powershell Add-WindowsFeature Web-Mgmt-Tools
RUN powershell Add-WindowsFeature Web-Mgmt-Console
RUN powershell Add-WindowsFeature Web-Mgmt-Compat
RUN powershell Add-WindowsFeature Web-Metabase
RUN powershell Add-WindowsFeature Web-Scripting-Tools
RUN powershell Add-WindowsFeature Web-Mgmt-Service
RUN powershell Add-WindowsFeature Web-Http-Redirect
RUN powershell Add-WindowsFeature Web-Basic-Auth
RUN powershell Add-WindowsFeature Web-CertProvider
RUN powershell Add-WindowsFeature Web-Basic-Auth
RUN powershell add-windowsfeature Web-Windows-Auth
RUN powershell Add-WindowsFeature Web-ASP
RUN powershell Add-WindowsFeature  Web-WebSockets
RUN powershell Add-WindowsFeature Web-Scripting-Tools
RUN powershell Add-WindowsFeature Web-Mgmt-Tools
RUN powershell Add-WindowsFeature Web-Mgmt-Console
RUN powershell Add-WindowsFeature  Web-Mgmt-Compat
RUN powershell Add-WindowsFeature Web-Metabase
RUN powershell Add-WindowsFeature Web-Scripting-ToolsRUN Remove-WebSite -Name 'Default Web Site'WORKDIR //inetpub/wwwroot/Messenger
COPY Messenger/. /inetpub/wwwroot/MessengerRUN powershell Import-Module webadministrationRUN powershell New-WebAppPool MessengerRUN powershell $WebSite New-Website -Name 'Messenger' -Port 443  -PhysicalPath 'C:\inetpub\wwwroot\Messenger'   -ApplicationPool 'Messenger' -Ssl -SslFlags 0 ;\
    $pwd = ConvertTo-SecureString -String 'password' -Force -AsPlainText;\
    $cert = Import-PfxCertificate -Exportable -FilePath 'C:\inetpub\wwwroot\Messenger\wild.riyadbank.com-2022-06-26-135101.p12' -CertStoreLocation cert:\localMachine\My -Password $pwd


WORKDIR c://
COPY nlu/. c://.SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]#RUN ./setup.exe \quite '/qn /norestart /L*V "AlkhawarizmiSetup.log"' -PassThru
#| Wait-Process;
RUN Start-Process 'AlkhawarizmiSetup.msi' '/qn /norestart /L*V "AlkhawarizmiSetup.log"' -PassThru | Wait-Process;#######################run container with static ip addr
