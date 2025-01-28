param ($networkP, $Dserver)

for ($i=0; $i -lt 255; $i++) {
   
    $name = Resolve-DnsName -DnsOnly $networkP'.'$i -Server $Dserver -ErrorAction Ignore | Select-Object -ExpandProperty "NameHost"
    if ($null -ne $name) {
        write-host $networkP'.'$i $name
    } 
  }
    
 


