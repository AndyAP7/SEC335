param ($networkprefix, $dnsserver)
$start = 1
$end = 254

for ($i = $start; $i -le $end; $i++) {
    $ip ="$networkprefix.$i"
    try {
    $result = Resolve-DnsName -Name $ip -Server $dnsserver -ErrorAction stop
    if ($result) {
        "$ip - " + $result.NameHost
        }
    } 
    catch {
    }

 }
