REM c:\>wmic /node:"localhost" process call create calc.exe
REM c:\>wmic /node:"blih" /AUTHORITY:"kerberos:blah\blih" process call create calc.exe
SET /P PCNAME=Hostname to query:
SET /P PCDOMAIN=Domain of host:
SET /P WMICCMD=WMIC command to run:
wmic /node:"%PCNAME%" /AUTHORITY:"kerberos:%PCDOMAIN%\%PCNAME%" %WMICCMD%