# Get a list of all Cluster Nodes
Begin {
    $ClusterNodes = Get-ClusterNode
    $Disks = @()
    $VM = ""
}

Process {
    foreach ($Node in $ClusterNodes) {
        $VM = Get-VM -ComputerName $Node
        foreach ($V in $VM) {
        $Disks += Get-VMHardDiskDrive $V
        }
    }
}

End {
$Disks | ConvertTo-Csv | Out-File C:\temp\guestvhdlist.csv
}


