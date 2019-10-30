FROM windows-latest

RUN pwsh.exe \
  -Command "Invoke-WebRequest \
  -Uri 'https://www.visualcron.com/resource.ashx?a=4036&b=1' \
  -OutFile .\VisualCron.exe"
  
ENTRYPOINT["/run.ps1"]

LABEL Description="VisualCron Client" Vendor="VisualCron"
