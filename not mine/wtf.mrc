alias wtf window -pkodCfB +nt @plasma 0 0 300 300 | var %p = 0, %x, %y | while %p < 90000 { %x = $calc(%p % 300) | %y = $floor($calc(%p / 300)) | drawdot -rf @plasma $calc(128 + 128 * $sin(%x) + 128 + 128 * $sin(%y)) 1 %x %y | inc %p } | loup
alias loup if (!$window(@plasma)) halt | drawrect -rfi @plasma 3583854 1 0 0 300 300 | .timer -oh 1 0 loup
