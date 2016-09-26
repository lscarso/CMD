#######
## REM This script needs to run as a daily scheduled task by someone who has 
## REM local administrator rights for all machines in reported RG.  This script
## REM will generate a health report for all members of the replication group, 
## REM with backlog based on a specified reference member.  When reports are 
## REM complete they will be saved to a specified share.  When ALL reports are
## REM done, mail will be sent to the specified e-mail alias with links to the
## REM share.
#######
@echo off
set CURRDATE=%TEMP%CURRDATE.TMP
set CURRTIME=%TEMP%CURRTIME.TMP
DATE /T > %CURRDATE%
TIME /T > %CURRTIME%
######
## REM This adds the date and time to the health report name and to the title
## REM of the e-mail.
######
set PARSEARG=”eol=; tokens=1,2,3,4* delims=/, “
for /F %PARSEARG% %%i in (%CURRDATE%) Do SET DDMMYYYY=%%j-%%k-%%l
set PARSEARG=”eol=; tokens=1,2,3* delims=:, “
for /F %PARSEARG% %%i in (%CURRTIME%) Do Set HHMM=%%i%%j%%k
#######
## REM Here you define the different resources by specifying the name of each 
## REM replication group, server name and share name.  You can do this for as
## REM many replication groups as you want, but keep in mind that the script 
## REM will wait until all reports complete before mail is sent out.
#######
set RG1_Report=\Server_nameShare_NameRG1_Name-%DDMMYYYY%-%HHMM%.html
set RG2_Report=\Server_nameShare_NameRG2_Name-%DDMMYYYY%-%HHMM%.html
@echo on
#######
## REM This generates the reports with Dfsradmin.exe (you can use help to see
## REM what else it can do.)  You need to set the name of the replication 
## REM group, the name of the reference server for calculating backlog, the 
## REM domain the RG is in, and a name for the report.  The time and date
## REM variables we defined earlier in the script
#######
dfsradmin health new /rgname:RG1 /refmemname:Domain_nameServer_Name /domain:domain_name.com /ReportName:%RG1Report%
dfsradmin health new /rgname:RG2 /refmemname:Domain_nameServer_Name /domain:domain_name.com /ReportName:%RG2Report%
echo RG1  %RG1Report% >  %TEMP%healthMessageBody.txt
echo RG2  %RG2Report% >> %TEMP%healthMessageBody.txt
#######
### REM You will need to obtain an email command line application for this 
### REM next part.  You will use the program to send an email with links to
### REM the health reports to an alias of your choice.  You may want address
### REM this mail to a distribution group.  
### REM 
### REM The command below is an example of how to send the mail using a 
### REM ficticious command line mail application.  You will need to reformat
### REM the command to be compatible with your command line mail application.
### REM 
### REM You many need to give the sending alias the “Send As” right
#######
cl_mail.exe smtp server:my_smtphost to:some_Alias@domain.com from:your_alias@domain.com subject:”DFS Replication Health Reports %DDMMYYYY%” message:@%TEMP%healthMessageBody.txt auth:sspi