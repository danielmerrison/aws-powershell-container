FROM mcr.microsoft.com/powershell

ARG AWS_TOOLS_VERSION=4.1.55.0
# to get verbose output use: ARG DEBUG=-Verbose
ARG DEBUG=

# RUN echo "AWS_TOOLS_VERSION: ${AWS_TOOLS_VERSION}"
# RUN echo "DEBUG: ${DEBUG}"
RUN pwsh -c "Install-Module -Name AWS.Tools.Installer -Force"
RUN pwsh -c "Find-Module -Name AWS.Tools.* -Repository PSGallery | Where-Object Name -NotMatch "AWS.Tools.Installer" | Select-Object -ExpandProperty Name | Install-AWSToolsModule -RequiredVersion ${AWS_TOOLS_VERSION} $DEBUG -Force"

COPY profile.ps1  /opt/microsoft/powershell/7/profile.ps1