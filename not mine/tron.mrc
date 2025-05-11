menu status {
  Tron
  .Computers
  ..1: { tron 1 }
  ..2: { tron 2 }
  ..3: { tron 3 }
  ..4: { tron 4 }
  ..5: { tron 5 }
  ..6: { tron 6 }
  ..7: { tron 7 }
  ..8: { tron 8 }
}
alias tron {
  ;showmirc -m
  var %a = drawdot -r @.i, %x = 0, %j = $1, %y = 0, %m = 2, %w = window, %d = drawrect, %t = 0 0 70 70, %^ = 0 0 400 400
  %.q = 0 0 350 350 | %w -hBfp +d @.i 0 0 36 4 | %a 9737983 1 0 0 1 0 2 0 | %a 3750969 1 3 0 | %a 16742779 1 4 0 5 0 6 0 | %a 3750969 1 7 0 | %a 8716287 1 8 0 9 0 10 0 | %a 3750969 1 11 0 | %a 7602035 1 12 0 13 0 14 0 | %a 3750969 1 15 0 | %a 16747263 1 16 0 17 0 18 0 | %a 3750969 1 19 0 | %a 13026246 1 20 0 21 0 22 0 | %a 3750969 1 23 0 | %a 5417727 1 24 0 25 0 26 0 | %a 3750969 1 27 0 | %a 9210623 1 28 0 29 0 30 0 | %a 3750969 1 31 0 | %a 9226239 1 32 0 33 0 34 0 | %a 3750969 1 35 0 | %a 9737983 1 0 1 | %a 255 1 1 1 2 1 | %a 3750969 1 3 1 | %a 16742779 1 4 1 | %a 16711680 1 5 1 6 1 | %a 3750969 1 7 1 | %a 8716287 1 8 1 | %a 65535 1 9 1 10 1 | %a 3750969 1 11 1 | %a 7602035 1 12 1 | %a 33280 1 13 1 14 1 | %a 3750969 1 15 1 | %a 16747263 1 16 1 | %a 8650884 1 17 1 18 1 | %a 3750969 1 19 1 | %a 13026246 1 20 1 | %a 8684164 1 21 1 22 1 | %a 3750969 1 23 1 | %a 5417727 1 24 1 | %a 16772 1 25 1 26 1 
  %a 3750969 1 27 1 | %a 9210623 1 28 1 | %a 132 1 29 1 30 1 | %a 3750969 1 31 1 | %a 9226239 1 32 1 | %a 33535 1 33 1 34 1 | %a 3750969 1 35 1 | %a 9737983 1 0 2 | %a 255 1 1 2 2 2 | %a 3750969 1 3 2 | %a 16742779 1 4 2 | %a 16711680 1 5 2 6 2 | %a 3750969 1 7 2 | %a 8716287 1 8 2 | %a 65535 1 9 2 10 2 | %a 3750969 1 11 2 | %a 7602035 1 12 2 | %a 33280 1 13 2 14 2 | %a 3750969 1 15 2 | %a 16747263 1 16 2 | %a 8650884 1 17 2 18 2 | %a 3750969 1 19 2 | %a 13026246 1 20 2 | %a 8684164 1 21 2 22 2 | %a 3750969 1 23 2 | %a 5417727 1 24 2 | %a 16772 1 25 2 26 2 | %a 3750969 1 27 2 | %a 9210623 1 28 2 | %a 132 1 29 2 30 2 | %a 3750969 1 31 2 | %a 9226239 1 32 2 | %a 33535 1 33 2 34 2 | %a 3750969 1 35 2 | %a 3750969 1 0 3 1 3 2 3 3 3 4 3 5 3 6 3 7 3 8 3 9 3 10 3 11 3 12 3 13 3 14 3 15 3 16 3 17 3 18 3 19 3 20 3 21 3 22 3 23 3 24 3 25 3 26 3 27 3 28 3 29 3 30 3 31 3 32 3 33 3 34 3 35 3
  drawsave -b16 @.i v.bmp | %w -aCBodp +d @ %.q | %w -hBp +d @. %t | %w -hBp +d @.3 %.q | %w -hl @.d 0 0 10 10 | clear @.d | var %x = 0, %b = 1, %v = 0, %y = 0, %c = 0, %z = 1, %r, %c = 0 | %w -hBp +d @.m 0 0 342 200 | %w -hl @.g %^ | %w -hBp +d @.c %^ | clear @.g | %d -fnr @.m 0 1 %^ | drawtext -r @.m 255 "Arial Black" 110 0 -30 TRON | %d -fr @.m 255 1 286 47 2 2 | %d -fr @.m 255 1 315 54 2 2 | while (%y <= 90) { while (%x <= 340) { if (%c != $getdot(@.m,%x,%y)) { if (%z == 2) { %z = 0 | inc %v | %w -ofmBphkd +dL @. $+ %v $calc($gettok(%r,1,32) + $window(@).x + 3) $calc($gettok(%r,2,32) + $window(@).y + $window(@).h) $calc(%x - $gettok(%r,1,32)) 1 | aline @.g @. $+ %v %r %r %x %y | tokenize 32 $line(@.g,$line(@.g,0)) | rline @.g $line(@.g,0) @.m $2 $3 $window($1).w 1 $1 0 0 | goto a } | %c = $getdot(@.m,%x,%y) | %r = %x %y | inc %z } | :a | inc %x } | %x = 0 | inc %y 
  }
  %d -fnr @.m 0 1 0 0 400 400 | %x = 0 | %y = 0 | %z = 0 | while (%y <= 90) { while (%x <= 345) { drawpic -c @.m %x %y %z 0 4 5 v.bmp | inc %x 7.5 } 
  %z = 4 | %x = 0 | inc %y 5 } | %z = $line(@.g,0)
  while %z > 0 { tokenize 32 $line(@.g,%z) | drawcopy $line(@.g,%z) | dec %z } | while %j { %x = $r(5,60) | %y = $r(5,60) | aline @.d %x %y $r(1,4) %b | inc %b | dec %j } | %d -rf @.3 0 1 %.q | %.x = $r(5,70) | %.y = $r(5,70) | %.d = 1 | %d -rf @. 0 1 %t | %d -r @. 255 1 1 1 69 69 | %w -a @ | r 
}
alias -l r {
  if (!$window(@)) { close | .halt }
  var %a = $line(@.d,0), %x, %y, %u, %d, %l, %r, %s, %p = drawcopy, %e = 0 0 20 20
  while %a { if (!$line(@.d,%a)) { goto e } | tokenize 32 $line(@.d,%a) | %u = 0 | %d = 0 | %l = 0 | %r = 0 | %s = 0 | %x = $1 | %y = $2 | while (!$getdot(@.,%x,%y)) && $3 != 1) { dec %y | inc %u } | %x = $1 | %y = $2
    while (!$getdot(@.,%x,%y)) && $3 != 3) { dec %x | inc %l } | %x = $1 | %y = $2
    while (!$getdot(@.,%x,%y)) && $3 != 2) { inc %y | inc %d } | %x = $1 | %y = $2
    while (!$getdot(@.,%x,%y)) && $3 != 4) { inc %x | inc %r } | %s = $gettok($sorttok(%u %d %l %r,32,rn),1,32)
    if %s == %r { %x = $calc($1 + 1) | %y = $2 | %s = 4 | goto n }  
    if %s == %u { %x = $1 | %y = $calc($2 - 1) | %s = 1 | goto n } 
    if %s == %d { %x = $1 | %y = $calc($2 + 1) | %s = 2 | goto n }
    if %s == %l { %x = $calc($1 - 1) | %y = $2 | %s = 3 | goto n }
    :n
    if (!$getdot(@.,%x,%y)) {
    rline @.d %a %x %y %s $4  }
    else { dline @.d %a | goto e }
    drawpic -c @.3 $calc(%x * 5) $calc(%y * 5) $calc(($4 - 1) * 4) 0 4 5 v.bmp
    drawdot -nr @. 255 1 $1 $2
    :e
    dec %a
  }
  %p -mn @.3 %.q @ %e | %p -mn @ %e @ %.q | %p -t @.3 0 %.q @ 0 0
  .timer -hm 1 0 r
}
alias -l c { .timer off | close -@.* | unset %* | .remove v.bmp }
on *:KEYDOWN:@:*: { if ($keyval == 27) c }
on *:CLOSE:@: { c }
