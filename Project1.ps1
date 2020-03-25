$sdir = $args[0]
$ddir = $args[1]

$list = new-object system.collections.arraylist

function copyboom ($foldername)
{
    
    $ext = $foldername.Split(".")[1]
    if($list.Contains($foldername.Split(".")[1])){
        Write-Host "There is Folder named that"
        #Write-Host "$sdir$foldername"
        Copy-Item -Path "$sdir$foldername" -Destination "$ddir$ext\$foldername"
    }

    else{
        Write-Host  "There is no such variable\nHence Adding It"
        New-Item -Path "$ddir$ext" -ItemType Directory
        $list.Add($foldername.Split(".")[1])
        Copy-Item -Path "$sdir$foldername" -Destination "$ddir$ext\$foldername"
    }

    #dir $sdir | foreach{if($list.Contains($_.Name.Split(".")[1])){Write-Host "Its there thanks"}else{$list.Add($_.Name.Split(".")[1])}}
    #Write-Host "This is my list"
    #$list
    #New-Item -Path 'C:\Yourlife\My Stuff\Powershell\Scripts\Boom' -ItemType Directory

    #Copy-Item -Path ($sdir.ToString()+$_.ToString()) -Destination $ddir\$_\$_.Name.Split(".")[1]
    #Copy-Item -Path \\fs\Shared\it\users.xlsx -Destination \\fs2\Backups\it\users.xlsx

}

dir $sdir | foreach{if($_.Name){copyboom($_.ToString())}}