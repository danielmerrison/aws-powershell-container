ARG AWS_TOOLS_VERSION=4.1.55.0

FROM mcr.microsoft.com/powershell

RUN pwsh -c "Install-Module -Name AWS.Tools.Installer -Force"
RUN pwsh -c "Find-Module -Name AWS.Tools.* -Repository PSGallery | Where-Object Name -NotMatch "AWS.Tools.Installer" | Select-Object -ExpandProperty Name | Install-AWSToolsModule -RequiredVersion 4.1.55.0 -Verbose -Force"

COPY profile.ps1  /opt/microsoft/powershell/7/profile.ps1