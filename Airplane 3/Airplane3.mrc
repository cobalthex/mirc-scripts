alias Airplane3 { 
  window -pkodCfB +nt @Airplane3 -1 -1 640 480
  window -pfBh @Ab -1 -1 640 480
  window -pfBh @Ab1 -1 -1 640 480
  window -pfBh @Ab2 -1 -1 640 576
  window -h @Ab3 -1 -1 100 100 tahoma 2
  window -h @Ab4 -1 -1 100 100 tahoma 2
  window -h @Ab5 -1 -1 100 100 tahoma 14
  window -h @Ab6 -1 -1 100 100 tahoma 20
  drawdot -r @Ab1 16711935 800 0 0
  drawdot -r @Ab 3 800 0 0
  drawpic -ls @Ab2 0 0 640 576 $+(",$scriptdir,Water.png,")
  drawpic @Ab1 0 0 $+(",$scriptdir,Numbers.png,")
  drawpic @Ab1 0 10 $+(",$scriptdir,Bullet.png,")
  drawpic @Ab1 0 50 $+(",$scriptdir,Airplane.png,")
  drawpic @Ab1 0 100 $+(",$scriptdir,Enem1.png,")
  drawpic @Ab1 0 140 $+(",$scriptdir,Enem2.png,")
  drawpic @Ab1 100 10 $+(",$scriptdir,Explosion.png,")
  drawpic @Ab1 125 50 $+(",$scriptdir,Explosion2.png,")
  drawpic @Ab1 0 180 $+(",$scriptdir,Bullet Powerup.png,")
  drawpic @Ab1 24 180 $+(",$scriptdir,Health.png,")
  hfree -w A3 | hmake A3 100
  hadd A3 Stage Home
  hadd A3 MS 96
  Airplane3.Loop
}
alias CTex {
  var %t 1 | while (%t <= $len($3)) {
    drawcopy -nt @Ab1 16711935 $calc($mid($3,%t,1) * 8) 0 8 9 @Airplane3 $calc($1 + ((%t - 1) * 8)) $2
    inc %t 
} }

alias -l Airplane3.Loop {
  if (!$window(@Airplane3)) halt
  var %t $ticks
  drawcopy -n @Ab2 0 $hget(A3,MS) 640 480 @Airplane3 0 0 | hadd A3 MS $iif($calc($hget(A3,MS) - 4) >= 0, $v1, 96)
  if ($hget(A3,Stage) == Home) { 
    drawpic -in @Airplane3 105 50 $+(",$scriptdir,Logo Mask.png,")
    drawpic -tn @Airplane3 16777215 105 50 $+(",$scriptdir,Logo.png,")
    if ($inrect($mouse.x,$mouse.y,260,200,123,82)) {
      drawrect -nr @Airplane3 2626590 3 260 206 123 82
      drawrect -nr @Airplane3 16777215 3 260 198 123 82
    }
    if ($inrect($mouse.x,$mouse.y,268,406,108,72)) {
      drawrect -nr @Airplane3 2626590 3 268 406 108 72
      drawrect -nr @Airplane3 16777215 3 268 398 108 72
    }
    drawtext -nir @Airplane3 2626590 arial 60 $calc(320 - ($width(Play,arial,60) / 2)) 208 Play
    drawtext -nr @Airplane3 16777215 arial 60 $calc(320 - ($width(Play,arial,60) / 2)) 200 Play
    drawtext -nir @Airplane3 2626590 arial 60 $calc(320 - ($width(Exit,arial,60) / 2)) 408 Exit
    drawtext -nr @Airplane3 16777215 arial 60 $calc(320 - ($width(Exit,arial,60) / 2)) 400 Exit
  }
  elseif ($hget(A3,Stage) isnum) {
    drawdot -rn @Ab 3 800 0 0
    if ($istok($hget(A3,Keys),32,151)) && ($hget(A3,Bullets) > 0 || $hget(A3,Bullets) == *) && ($ticks & 2) {
      $iif($hget(A3,Bullets) != *, hdec A3 Bullets, ) | hinc A3 Score 2
      aline 1 @Ab3 $r($gettok($hget(A3,me),1,32),$calc($gettok($hget(A3,me),1,32) + 1)) $calc($gettok($hget(A3,me),2,32) - 24) 
    }
    if ($istok($hget(A3,Keys),37,151)) && ($gettok($hget(A3,me),1,32) > 39) hadd A3 Me $calc($gettok($hget(A3,me),1,32) - 4) $gettok($hget(A3,me),2,32)
    if ($istok($hget(A3,Keys),38,151)) && ($gettok($hget(A3,me),2,32) > 32) hadd A3 Me $gettok($hget(A3,me),1,32) $calc($gettok($hget(A3,me),2,32) - 4)
    if ($istok($hget(A3,Keys),39,151)) && ($gettok($hget(A3,me),1,32) < 601) hadd A3 Me $calc($gettok($hget(A3,me),1,32) + 4) $gettok($hget(A3,me),2,32)
    if ($istok($hget(A3,Keys),40,151)) && ($gettok($hget(A3,me),2,32) < 453) hadd A3 Me $gettok($hget(A3,me),1,32) $calc($gettok($hget(A3,me),2,32) + 4) 
    if ($hget(A3,BP)) { 
      tokenize 32 $v1
      drawcopy -nt @Ab1 16711935 0 180 12 36 @Airplane3 $calc($1 - 6) $calc($2 - 16) 
      $iif($calc($2 + 4) <= 496, hadd A3 BP $1 $v1, hdel A3 BP)
      if ($abs($calc($1 - $gettok($hget(A3,me),1,32))) <= 36) && ($abs($calc($2 - $gettok($hget(A3,me),2,32))) <= 22) hdel A3 BP | hinc A3 Bullets 100 
    }
    if ($hget(A3,HP)) { 
      tokenize 32 $v1
      drawcopy -nt @Ab1 16711935 24 180 18 18 @Airplane3 $calc($1 - 9) $calc($2 - 9) 
      $iif($calc($2 + 4) <= 496, hadd A3 HP $1 $v1, hdel A3 HP)
      if ($abs($calc($1 - $gettok($hget(A3,me),1,32))) <= 36) && ($abs($calc($2 - $gettok($hget(A3,me),2,32))) <= 22) hdel A3 HP | hadd A3 Health 100 
    }
    var %c 1 | while (%c <= $line(@Ab5,0)) { 
      tokenize 32 $line(@Ab5,%c)
      drawcopy -nt @Ab1 16711935 $calc(32 * $and($ticks,1)) 100 32 31 @Airplane3 $calc($1 - 16) $calc($2 - 15)
      drawcopy -nt @Ab1 16711935 0 100 32 31 @Ab $calc($1 - 16) $calc($2 - 15)
      $iif($calc($2 + 4) >= 516, rline 1 @Ab5 %c $r(26,614) - $+ $r(200,300), rline 1 @Ab5 %c $1 $v1)
      if ($abs($calc($1 - $gettok($hget(A3,me),1,32))) <= 40) && ($abs($calc($2 - $gettok($hget(A3,me),2,32))) <= 22) {
        dline @Ab5 %c | hinc A3 Score 100 | if ($Hget(A3,Health) isnum) hdec A3 Health 10 
        var %x 0 | while (%x <= 3) { aline 1 @Ab6 $r($calc($1 - 12),$calc($1 + 12)) $r($calc($2 - 12),$calc($2 + 12)) 0 | inc %x }
      }
      inc %c
    }
    var %e 1 | while (%e <= $line(@Ab3,0)) {
      tokenize 32 $line(@Ab3,%e)
      drawcopy -nt @Ab1 16711935 0 10 6 6 @Airplane3 $calc($1 - 3) $calc($2 - 3)
      drawcopy -nt @Ab1 16711935 0 10 6 6 @Ab $calc($1 - 3) $calc($2 - 3)
      $iif($calc($2 - 9) <= -3, dline @Ab3 %e, rline 1 @Ab3 %e $1 $v1)
      if ($getdot(@Ab,$1,$calc($2 - 4)) != 3) {
        var %g 1 | while (%g <= $line(@Ab5,0)) {
          tokenize 32 $1-2 $line(@Ab5,%g)
          if ($abs($calc($3 - $1)) <= 24) && ($abs($calc($4 - $2)) <= 24) { hinc A3 Score 100 | dline @Ab3 %e | dline @Ab5 %g | Aline 1 @Ab6 $3 $4 0 }
          inc %g
        }
      }
      inc %e
    }
    drawcopy -nt @Ab1 16711935 $calc($and($ticks,1) * 59) 50 59 43 @Airplane3 $calc($gettok($hget(A3,me),1,32) - 29) $calc($gettok($hget(A3,me),2,32) - 22)
    drawtext -nr @Airplane3 16777215 verdana 10 150 10 Score: 
    CTex 150 26 $base($hget(A3,Score),10,10,16)
    drawtext -nr @Airplane3 $iif($hget(A3,Health) <= 20 && $ticks & 2 && $hget(A3,Health) isnum, 255, 16777215) verdana 10 10 10 Health:
    $iif($hget(A3,Health) != *, CTex 10 26 $hget(A3,Health), drawtext -nr @Airplane3 16777215 fixedsys 9 10 23 inf.)
    var %c $iif($hget(A3,Bullets) <= 0 && $istok($hget(A3,Keys),32,151) && ($ticks & 2), $iif($hget(A3,Bullets) == *, 16777215, 255), 16777215)
    drawtext -nr @Airplane3 %c verdana 10 80 10 Bullets:
    $iif($hget(A3,Bullets) != *, CTex 80 26 $base($hget(A3,Bullets),10,10,5), drawtext -nr @Airplane3 16777215 fixedsys 9 80 23 inf.)
    if ($line(@Ab5,0) <= 0) {
      hinc A3 Stage
      var %e 1 | while (%e <= $calc($hget(A3,Stage) * 10)) { 
        aline 1 @Ab5 $r(26,614) - $+ $r(200,300)
        inc %e 
      }
    }
    if ($r(0,500) == 13) && (!$hget(A3,BP)) hadd A3 BP $r(15,628) - $+ $r(200,400)
    if ($r(0,500) == 87) && (!$hget(A3,HP)) && ($hget(A3,Health) <= 50) hadd A3 HP $r(15,622) $calc(0 - $r(200,400)) 
    if ($hget(A3,Health) <= 0) && ($hget(A3,Health) isnum) { hadd A3 Stage Lose | hadd A3 Etime $ctime }
  }
  if ($hget(A3,Stage) == Lose) {
    drawpic -in @Airplane3 105 50 $+(",$scriptdir,Logo Mask.png,")
    drawpic -tn @Airplane3 16777215 105 50 $+(",$scriptdir,Logo.png,")
    drawtext -nr @Airplane3 2626590 arial 60 $calc(320 - ($width(You Lose,arial,60) / 2)) 208 You Lose
    drawtext -nr @Airplane3 16777215 arial 60 $calc(320 - ($width(You Lose,arial,60) / 2)) 200 You Lose
    drawcopy -nt @Ab1 16711935 $calc(32 * $and($ticks,1)) 100 32 31 @Airplane3 304 300
    drawtext -nr @Airplane3 2626590 arial 20 $calc(320 - ($width(Total time played: $calc($hget(A3,Etime) - $hget(A3,Stime)) Seconds,arial,20) / 2)) 358 $&
      Total time played: $calc($hget(A3,Etime) - $hget(A3,Stime)) Seconds
    drawtext -nr @Airplane3 16777215 arial 20 $calc(320 - ($width(Total time played: $calc($hget(A3,Etime) - $hget(A3,Stime)) Seconds,arial,20) / 2)) 350 $&
      Total time played: $calc($hget(A3,Etime) - $hget(A3,Stime)) Seconds
    drawtext -nr @Airplane3 2626590 arial 20 $calc(320 - ($width(Score: $hget(A3,Score),arial,20) / 2)) 388 Score: $hget(A3,Score)
    drawtext -nr @Airplane3 16777215 arial 20 $calc(320 - ($width(Score: $hget(A3,Score),arial,20) / 2)) 380 Score: $hget(A3,Score)
  }
  var %h 1 | while (%h <= $line(@Ab6,0)) {
    tokenize 32 $line(@Ab6,%h) 
    drawcopy -nt @Ab1 16711935 $calc(100 + ($3 * 32)) 10 32 32 @Airplane3 $calc($1 - 16) $calc($2 - 16)
    $iif($calc($3 + 1) <= 6, rline 1 @Ab6 %h $1-2 $v1, dline @Ab6 %h)
    inc %h 
  }
  if ($hget(A3,Explosion)) { 
    tokenize 32 $v1
    drawcopy -nt @Ab1 16711935 $calc(125 + ($3 * 65)) 50 60 65 @Airplane3 $calc($1 - 32) $calc($2 - 32)
    $iif($calc($3 + 1) <= 7, hadd A3 Explosion $1-2 $v1, hdel A3 Explosion)
  }
  drawdot @Airplane3
  titlebar @Airplane3 - FPS: $iif($ceil($calc(1000 / ($ticks - %t))) == 0, 100%, $v1)
  .timer -oh 1 0 Airplane3.Loop
}
on *:KEYDOWN:@Airplane3:*:hadd A3 Keys $addtok($hget(A3,Keys),$keyval,151)
on *:KEYUP:@Airplane3:*:hadd A3 Keys $remtok($hget(A3,Keys),$keyval,151)
on *:CLOSE:@Airplane3: {
  window -c @Ab | window -c @Ab1
  window -c @Ab2 | window -c @Ab3
  window -c @Ab4 | window -c @Ab5
  window -c @Ab6
  hfree -w A3
}
menu @Airplane3 {
  uclick: {
    if ($hget(A3,Stage) == Home) {
      if ($inrect($mouse.x,$mouse.y,260,200,123,82)) {
        hadd A3 Score 0
        hadd A3 Health 100
        hadd A3 Bullets 100
        hadd A3 Me 310 420 
        hadd A3 Stime $ctime
        clear @Ab3 | clear @Ab4 | clear @Ab5 | clear @Ab6
        var %e 1 | while (%e <= 10) { 
          Aline @Ab5 $r(26,614) - $+ $r(200,300)
          inc %e 
        }
        hadd A3 Stage 1
      }
      elseif ($inrect($mouse.x,$mouse.y,268,406,108,72)) {
        window -c @Airplane3 | window -c @Ab1
        window -c @Ab2 | window -c @Ab3
        window -c @Ab4 | window -c @Ab5
        window -c @Ab6 | window -c @Ab
        hfree -w A3
      }
    }
  }
}
on *:LOAD: echo 2 -m Airplane 033 sucsessfully loaded! Type 05/Airplane3 to run.
on *:UNLOAD:echo 2 -m Don't Leave, $me $+ !
