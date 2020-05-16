$2 !~ /^#/
$2 ~ /^#/ {
    fg  =       "38;2;" hex2rgb($2)
    bg  = $3 ? ";48;2;" hex2rgb($3) : ""

    printf "%s %s%s\n", $1, fg, bg
}

# maps #RRGGBB to rr;gg;bb
# where RR is the hex representation of dec rr, etc.
function hex2rgb(color,         hex, x, xlen, r, g, b) {
    hex = substr(color, 2)

    if (match(hex, /[a-fA-F0-9]+/) == 0) {
        printf "Offending line #%s: %s\n", NR, $0         > "/dev/stderr"
        printf "Invalid hex digits in color, %s\n", color > "/dev/stderr"
        exit 2
    }

    xlen = split(hex, x, "")

    if (xlen == 3) {
        r = x[1]x[1]
        g = x[2]x[2]
        b = x[3]x[3]
    } else if (xlen == 6) {
        r = x[1]x[2]
        g = x[3]x[4]
        b = x[5]x[6]
    } else {
        printf "Offending line #%s: %s\n", NR, $0            > "/dev/stderr"
        printf "Length of hex color must be 3 or 6 digits\n" > "/dev/stderr"
        exit 2
    }

    return hex2dec(r) ";" hex2dec(g) ";" hex2dec(b)
}

# takes hex string and returns dec int
function hex2dec(hex,           dec) {
    dec = 0
    hex = tolower(hex)
    for (i = 1; i <= length(hex); i++) {
        c = substr(hex, i, 1)
        k = index("123456789abcdef", c)
        dec = dec * 16 + k
    }
    return dec
}
