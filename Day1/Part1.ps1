$source = get-content "$psscriptroot\input.txt"

$Increase = 0
$last = $null
$source | %{
    if ($_ -gt $last) {
        $increase ++
    }
    $last = $_
}

$increase