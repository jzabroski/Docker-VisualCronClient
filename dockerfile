FROM windows-latest

MAINTAINER johnzabroski@gmail.com

# Setup package management

RUN powershell -Command \
	Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

RUN powershell -Command \
	Install-PackageProvider -Name chocolatey -Force

RUN powershell -Command \
   choco install 7zip.portable -y 



RUN VisualCron.exe
# RUN pwsh.exe \
#  -Command "Invoke-WebRequest \
#  -Uri 'https://www.visualcron.com/resource.ashx?a=4036&b=1' \
#  -OutFile .\VisualCron.exe"
  
ENTRYPOINT["/run.ps1"]

LABEL Description="VisualCron Client" Vendor="VisualCron"
