REM Eliminazione test precedenti 
DEL Test-*.txt

REM Controllo Share 
net share > Test-01-NetShare.txt 
dcdiag /test:netlogons /f:Test-02-NetLogons.txt /i

REM Controllo DNS 
dcdiag /test:DNS /DnsDynamicUpdate /f:Test-03-DnsDynamicUpdate.txt /i
dcdiag /test:DNS /DnsRecordRegistration /f:Test-04-DnsRecordRegistration.txt /i
dcdiag /test:RegisterInDNS /DnsDomain:%USERDNSDOMAIN% /f:Test-05-RegisterInDNS.txt /i

REM Controllo Membership 
dcdiag /test:MachineAccount /f:Test-06-MachineAccount.txt /i

REM Controllo Replica 
dcdiag /test:Replications /f:Test-07-Replications.txt /i 
dcdiag /test:VerifyReplicas /f:Test-08-VerifyReplicas.txt /i
repadmin /showreps > Test-09-RepAdmin-showreps.txt 

REM Controllo Operations Masters 
dcdiag /test:knowsofroleholders /f:Test-10-knowsofroleholders.txt /i
dcdiag /test:fsmocheck /f:Test-11-fsmocheck.txt /i
netdom /query fsmo >Test-12-QueryFsmo.txt
