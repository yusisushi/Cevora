function format-size ([long] $length) {
    switch ($length) {
        { $_ -gt 1tb }
        { return "{0:n2} TB" -f ($_ / 1tb) }
        { $_ -gt 1gb }
        { return "{0:n2} GB" -f ($_ / 1gb) }
        { $_ -gt 1mb }
        { return "{0:n2} MB " -f ($_ / 1mb) }
        { $_ -gt 1kb }
        { return "{0:n2} KB " -f ($_ / 1Kb) }
        default
        { return "{0} B " -f $_}
    }
}

format-size -length 10
format-size -length 100
format-size -length 100000
format-size -length 100000000000000