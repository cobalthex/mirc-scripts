alias tunnel {
  window -podk0 @tunnel 1 1 400 400
  window -hpdk0 @tunnel.buf 1 1 400 400
  drawfill -r @tunnel.buf $rgb(255,255,255) $rgb(255,255,255) 1 1
  set %t.score 0
  .timerscore 0 1 t.score
  t.drawmap
}
on 1:KEYDOWN:@tunnel:*: {
  ;< = 37 > = 39
  if ($keyval = 37) { t.moveleft }
  if ($keyval = 39) { t.moveright }
}
alias -l t.moveleft { set %t.bx $calc(%t.bx - 5) }
alias -l t.moveright { set %t.bx $calc(%t.bx + 5) }
alias t.drawmap {
  clear @tunnel
  set %t.bx 150
  set %t.by 350
  drawrect -fr @tunnel.buf $rgb(135,125,105) 1 %t.bx %t.by 10 10
  set %t.x 130
  set %t.y 270
  var %t.r, %t.ra, %i = 400, %x
  while (%x < %i) {
    %t.r = $rand(1,50)
    %t.ra = $rand(1,5)
    set %t.x $calc($iif(%t.r > 25,$+(-,%t.ra),%t.ra) + %t.x)
    set %t.y $calc($iif(%t.r > 25,$+(-,%t.ra),%t.ra) + %t.y)
    drawline -r @tunnel.buf $rgb(0,0,0) 1 1 $calc(400 - %i) %t.x $calc(400 - %i)
    drawline -r @tunnel.buf $rgb(0,0,0) 1 399 $calc(400 - %i) %t.y $calc(400 - %i)
    drawcopy @tunnel.buf 1 1 399 399 @tunnel 1 1 399 399
    inc %x
  }
  var %gggg = 0 | while %gggg < 32 { t.movemap | inc %gggg }
}
alias t.movemap {
  drawscroll @tunnel.buf 0 1 1 1 400 400
  drawrect -fr @tunnel.buf $rgb(255,255,255) 1 1 1 400 1
  drawrect -fr @tunnel.buf $rgb(135,125,105) 1 %t.bx %t.by 10 10
  %t.r = $rand(1,50)
  %t.p = $rand(1,5)
  if ($calc(%t.x - 50) < 25) { 
    set %t.x $calc($iif(%t.r > 25,%t.p,%t.p) + %t.x)
    set %t.y $calc($iif(%t.r > 25,%t.p,%t.p) + %t.y)
  }
  elseif ($calc(400 - %t.y) < 25) { 
    set %t.y $calc(%t.y - $iif(%t.r > 25,%t.p,%t.p))
    set %t.x $calc(%t.x - $iif(%t.r > 25,%t.p,%t.p))
  }
  else { 
    set %t.x $calc($iif(%t.r > 25,$+(-,%t.p),%t.p) + %t.x) 
    set %t.y $calc($iif(%t.r > 25,$+(-,%t.p),%t.p) + %t.y) 
  }
  drawline -r @tunnel.buf $rgb(0,0,0) 1 1 1 %t.x 1
  drawline -r @tunnel.buf $rgb(0,0,0) 1 %t.y 1 399 1
  drawcopy @tunnel.buf 1 1 399 399 @tunnel 1 1 399 399
  if ($t.walls(%t.bx,%t.by)) { .timertframe -m 1 1 t.movemap }
  else { echo -a Game Over $calc(%t.score - 5) }
}
alias -l t.score { 
  inc %t.score
  drawtext -r @tunnel.buf $rgb(255,255,255) Tahoma 14 1 1 Score: %t.score
  if ($calc(%t.score % 5) == 0 && %t.score < 45) { inc %t.x 5 | dec %t.y 5 }
}
alias t.walls {
  var %i 1
  var %x $1, %y $2
  while (%i <= 11) {
    if ($getdot(@tunnel.buf,$calc(%x -1),$calc(%y + %i)) == 0) { return $false }
    inc %i
  }
  %i = 1
  while (%i <= 11) {
    if ($getdot(@tunnel.buf,$calc(%x + 11),$calc(%y + %i)) == 0) { return $false }
    inc %i
  }
  return $true
}
on 1:CLOSE:@tunnel: {
  window -c @tunnel.buf
  unset %t.*
  .timertframe off
  .timerscore off
}
