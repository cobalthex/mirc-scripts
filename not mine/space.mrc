0
65290
5656060
16560610
alias space window -aCpdkB +t @- 0 0 500 500 | c | d | %w = 0 | %m = %ticks | a
on *:close:@-:.timera off | unset %w %m %d %v %� %� %� %g %% %7 %l | var %o hfree | %o x | %o y | %o z | %o x2 | %o z2
alias -l a {
  inc %d | inc %w | var %c $cos(%�),%s $sin(%�),%z $calc(200-140*%s),%i %g | drawrect -nrf @- 0 0 0 0 500 500 | titlebar @- %v - | inc %� .1 | if (%d = 200) %% = 1 | if (%% = 0 && %g < 99) { inc %g } | if (%% = 1) dec %g | if (%d = 299) b
  while %i { hadd -m x2 %i $calc($hget(x,%i)*%c +$hget(z,%i)*%s) | hadd -m z2 %i $calc(-$hget(x,%i)*%s +$hget(z,%i)*%c) | var %f = .01 * $hget(z2,%i),%b %f + %z | drawdot -rn @- $calc(%7 +155-100*%f) $calc(4-2*%f) $calc(256*($hget(x2,%i)/%b)+250) $calc(256*($hget(y,%i)/%b)+450) | dec %i }
  if $calc($ticks -%m) > 999 { %v = %w | %w = 0 | %m = $ticks } | drawdot @- | .timera 1 0 a
}
alias -l b d | if $r(0,1) { c | return } | var %a $r(1,10),%b $r(10,80),%i 100,%p hadd -m, %l | while %i { inc %l %a | var %j %b * %i | %p x %i $calc((40+20*$cos(%j).deg)*$cos(%l).deg) | %p y %i $calc(-50+(40+20*$cos(%j).deg)*$sin(%l).deg) | %p z %i 20 * $sin(%j).deg | dec %i }
alias -l c var %i 100,%l -90,%p hadd -m | while %i { inc %l 2 | var %j 20 * %i | %p x %i $calc(40+50*$cos(%j).deg *$cos(%l).deg) | %p y %i $calc(-50+50*$cos(%j).deg *$sin(%l).deg) | %p z %i 50 * $sin(%j).deg | dec %i }
alias -l d %7 = $read($script,$r(0,3)) | %g = 1 | %% = 0 | %d = 0


alias cube {
  if (!$window(@3Dcube)) { window -pdfC +t @3Dcube -1 -1 500 500 }
  if (!%cube.color) set %cube.color $2
  if (!%cube.length) set %cube.length $1
  if ($var(%cube.3D.*,0) = 0) {
    set %cube.3D.y 0
    set %cube.3D.x 0
    set %cube.3D.z 0
    set %cube.3D.bx $calc($window(@3Dcube).bw /2)
    set %cube.3D.by $calc($window(@3Dcube).bh /2)
  }
  %cube.d = drawline -n @3Dcube $iif(%cube.color != $null,$v1,4) 1
  var %cube.x = 0
  while (%cube.x < 8) {
    var %cube. [ $+ [ %cube.x ] ] $calcxyz(%cube.x,$iif(%cube.length,$v1,50))
    inc %cube.x
  }
  clear -n @3dcube
  %cube.d %cube.1 %cube.5 %cube.7 %cube.3 %cube.1
  %cube.d %cube.5 %cube.4 %cube.6 %cube.7 %cube.5
  %cube.d %cube.4 %cube.0 %cube.2 %cube.6 %cube.4
  %cube.d %cube.0 %cube.1 %cube.3 %cube.2 %cube.0
  drawdot @3Dcube
  inc %cube.3D.y $r(1,3)
  inc %cube.3D.x $r(1,3)
  dec %cube.3D.z $r(1,3)
  .timer3Dcube -h 1 0 cube
}
alias -l posneg return $iif($mid($base($1,8,2,3),$2,1),-) $+ $3
alias -l calcxyz {
  var %cube.x1, %cube.x3, %cube.y2, %cube.z1, %cube.z3,%cube.z2 = $posneg($1,1,$2),%cube.y1 = $posneg($1,2,$2),%cube.y3 = $posneg($1,3,$2)
  %cube.z1 = $calc((%cube.y3 * $cos(%cube.3D.y).deg) - (%cube.z2 * $sin(%cube.3D.y).deg))
  %cube.x1 = $calc((%cube.y3 * $sin(%cube.3D.y).deg) + (%cube.z2 * $cos(%cube.3D.y).deg))
  %cube.z2 = $calc((%cube.y1 * $sin(%cube.3D.x).deg) + (%cube.z1 * $cos(%cube.3D.x).deg))
  %cube.y2 = $calc((%cube.y1 * $cos(%cube.3D.x).deg) - (%cube.z1 * $sin(%cube.3D.x).deg))
  %cube.x3 = $calc((%cube.y2 * $sin(%cube.3D.z).deg) + (%cube.x1 * $cos(%cube.3D.z).deg) + %cube.3D.bx)
  %cube.y3 = $calc((%cube.y2 * $cos(%cube.3D.z).deg) - (%cube.x1 * $sin(%cube.3D.z).deg) + %cube.3D.by)
  return %cube.x3 %cube.y3
}
menu @3Dcube {
  sclick: if ($timer(3Dcube)) .timer3Dcube off | else cube
}
on *:CLOSE:@3Dcube:{
  .timer3Dcube off 
  unset %cube.* 
}
