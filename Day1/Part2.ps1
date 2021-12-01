$source = get-content "$psscriptroot\input.txt"

$list = [system.collections.generic.list[pscustomobject]]::new()
$Increase = 0
$last = $null
$source | %{    
    $list.add($_)
    if($list.count -eq 4) {
        $list.remove($list[0]) | out-null
        $sum = $list | measure-object -sum | select-object -expand sum
        if ($sum -gt $last) {
            $increase ++
        }
        $last = $sum        
    }       
}

$increase