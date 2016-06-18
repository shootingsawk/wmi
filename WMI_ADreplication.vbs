' Find all of the replication neighbors for a given domain controller

strComputer = "."
   
Set objWMI = GetObject("winmgmts:\\" & strComputer & "\root\MicrosoftActiveDirectory")
Set objReplNeighbors = objWMI.ExecQuery("Select * from MSAD_ReplNeighbor")
   
for each objReplNeighbor in objReplNeighbors
   
   Wscript.Echo objReplNeighbor.SourceDsaCN & "/" & objReplNeighbor.NamingContextDN & ":"
   
   for each objProp in objReplNeighbor.Properties_
      if IsNull(objProp.Value) then
         Wscript.Echo " " & objProp.Name & " : NULL"
      else
         wscript.echo " " & objProp.Name & " : " & objProp.Value
      end if 
   next
   
   Wscript.echo ""
   
next