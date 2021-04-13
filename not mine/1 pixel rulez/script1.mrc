;by CobaltHex - 512b
alias -l xorz var %i = 0, %c = 0 | while %i < 65536 { var %x = $calc(%i % 256), %y = $calc(%i / 256), %c = $xor(%x,%y) | drawdot -r @pp %c 1 %x %y | inc %i }
alias glaß window -pkodCfB +nt @pp 0 0 256 256 | drawtext @pp 1 verdana 20 175 230 Loading | xorz | kül 0
alias -l kül if (!$window(@pp)) halt | drawcopy -nm @pp 0 0 256 256 @pp -10 -10 266 266 | drawcopy -m @pp 0 0 256 256 @pp 10 10 246 246 | drawdot @pp | if ($1 < 24) .timere -oh 1 70 kül $calc($1 + .5)

;by CobaltHex - Flac
alias Flac window -pkodCfB +nt @pp 0 0 512 512 | drawpic @pp 0 0 img.png | kul 0
alias -l kul if (!$window(@pp)) halt | drawcopy -nm @pp 0 0 512 512 @pp -10 -10 522 522 | drawcopy -m @pp 0 0 512 512 @pp 10 10 502 502 | drawdot @pp | if ($1 < 1) .timere -oh 1 30 kul $calc($1 + .02) | else scrol_off 0
alias -l xorx var %i = 0, %c = 0 | while %i < 4096 { var %x = $calc(%i % 64), %y = $calc(%i / 64), %c = $xor(%x,%y) | drawdot -r @pz %c 1 %x %y | inc %i }
alias -l scrol_off if (!$window(@pp)) halt | drawcopy @pp 0 0 512 512 @pp $1 $1 $calc(512 - $1) $calc(512 - $1) | if ($1 > -80) .timerb -oh 1 30 scrol_off $calc($1 - 1) | else { window -phB @pz 0 0 64 64 | xorx }
