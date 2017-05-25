FROM microsoft/windowsservercore
RUN powershell -command Add-WindowsFeature Web-Server
RUN powershell -command Install-WindowsFeature Web-Common-Http -IncludeAllSubFeature
RUN powershell -command Install-WindowsFeature Web-Health -IncludeAllSubFeature
RUN powershell -command Install-WindowsFeature Web-Performance -IncludeAllSubFeature
RUN powershell -command Install-WindowsFeature Web-Security -IncludeAllSubFeature
RUN powershell -command Install-WindowsFeature Web-App-Dev
RUN powershell -command Install-WindowsFeature Web-AppInit
RUN powershell -command Install-WindowsFeature Web-Asp
RUN powershell -command Install-WindowsFeature Web-Net-Ext45
RUN powershell -command Install-WindowsFeature Web-Asp-Net45
RUN powershell -command Install-WindowsFeature Web-CGI
RUN powershell -command Install-WindowsFeature Web-ISAPI-Filter
RUN powershell -command Install-WindowsFeature Web-Includes
RUN powershell -command Install-WindowsFeature Web-WebSockets
RUN mkdir site
WORKDIR /web
COPY . c:/site/
RUN powershell -command New-Website -Name test23may -Port 80 -PhysicalPath C:\site
CMD start c:\site\stopstart.ps1
