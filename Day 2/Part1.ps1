$source = get-content "$psscriptroot\input.txt"

$array = @(0,0)

$source | foreach-object {
    $command = $_.split(" ")
    switch -regex ($command[0]) {
        "forward" {$array[0] += $command[1]}
        "up" {$array[1] -= $command[1]}
        "down"{$array[1] += $command[1]}
    }

}
$array[0] * $array[1]