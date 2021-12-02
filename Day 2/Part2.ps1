$source = get-content "$psscriptroot\input.txt"

$array = @(0,0,0)

$source | foreach-object {
    $command = $_.split(" ")
    switch -regex ($command[0]) {
        "forward" {
            $array[0] += $command[1]
            $array[1] += ([int]$command[1] * [int]$array[2])
        }
        "up" {$array[2] -= $command[1]}
        "down"{$array[2] += $command[1]}
    }

}
$array[0] * $array[1]