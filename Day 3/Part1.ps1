$source = get-content "$psscriptroot\input.txt"
$array = @()
foreach($i in 1..($source[0].length)){
    $array += @{[string]$i = @{Yes = 0; No = 0}}
}

$source | %{
    $x = 0
    do{
        $y = $x + 1
        switch ($_.substring($x,1)){
            '0' {$array."$y".no ++}
            '1' {$array."$y".yes ++}
        }
        $x++
    }
    until ($x -eq $_.length)
}

$gamma = foreach($i in 1..($source[0].length)) {
    if ($array.$i.yes -gt $array.$i.no) {
        "1"
    }
    else {"0"}
}

$epsilon = foreach($i in 1..($source[0].length)) {
    if ($array.$i.yes -gt $array.$i.no) {
        "0"
    }
    else {"1"}
}

$gamma2 = [convert]::toInt32($gamma -join '',2)
$epsilon2 = [convert]::toInt32($epsilon -join '',2)

$gamma2 * $epsilon2
