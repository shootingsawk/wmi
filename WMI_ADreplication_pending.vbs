' Pending replication

strComputer = "."
   
Set objWMI = GetObject("winmgmts:\\" & strComputer & "\root\MicrosoftActiveDirectory")
Set objRepOps = objWMI.ExecQuery("Select * from MSAD_ReplPendingOp")
   
if objRepOps.Count = 0 then
    Wscript.Echo "There are no pending replication operations"
else
    for each objRepOp in objRepOps
        Wscript.Echo objRepOp.DsaDN
        Wscript.Echo objRepOp.NamingContextDN
        Wscript.Echo objRepOp.PositionInQ
        Wscript.Echo objRepOp.TimeEnqueued
    next
end if