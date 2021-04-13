; --- Airplane 3.5.5! --- PicWin Studios © 2Ø12 - CobaltHex
alias A35 {
  if ($1 == d) %adbg = 1
  %whc = 16777215
  %sh = 32964
  %lp = 0
  %tsc = 0
  window -pkodCfB +dn @A 0 0 640 480 $+(",$scriptdir,Icon.ico,") 0
  drawdot -r @A %whc 5000 50 50
  var %# = drawtext -r @A 14606046 arial
  %# 200 10 10 Load
  hfree -w a35
  %# 80 444 117 ing
  var %c = window -pfBh @Ab, %i = 0
  %c $+ 1 0 0 330 360
  while (%i < 5) {
    window -h @Ab $+ $calc(%i + 2) 0 0 10 10
    inc %i
  }
  hmake a35 10
  drawpic -c @Ab1
  %al = aline
  var %- hadd a35
  drawdot -r @Ab1 16711935 800 0 0
  dp
  hadd a35 c 001M06ER<&QA;F4S+C4[4&EC5VEN(%-T=61I;W,JPJD@,C`P.2TR,#$ $+ $& 
    P.T-O9&4JH0V]B86QT2&5X.T=R87!H:6-S*D-O8F%L=$AE>"I!<FD@1F5L9&UA;@``
  dp
  var %* = drawpic @Ab1
  %* 164 0 $+(",$scriptdir,Numbers.png,")
  dp
  %- m1 320
  %- m2 400
  dp
  %* 0 0 $+(",$scriptdir,Bullet.png,")
  dp
  %* 0 18 $+(",$scriptdir,Bullet2.png,")
  dp
  %* 0 170 $+(",$scriptdir,Airplane.png,") 
  %- i1 $rand(10,566) - $+ $r(100,3000)
  %* 260 0 $+(",$scriptdir,Enem.png,")
  dp
  ;%* 100 17 $+(",$scriptdir,Explosion.png,")
  dp
  ;%* 0 50 $+(",$scriptdir,Explosion2.png,")
  dp
  %- t 0
  %- k $null 
  %* 0 32 $+(",$scriptdir,powerup.png,")
  dp
  %* 0 52 $+(",$scriptdir,Health.png,")
  dp
  %* 0 80 $+(",$scriptdir,Island1.png,")
  dp
  %* 52 0 $+(",$scriptdir,pbar.png,")
  dp
  %ê = $ticks
  %* 64 80 $+(",$scriptdir,Island2.png,")
  dp
  %* 128 80 $+(",$scriptdir,Island3.png,")
  dp
  %- a 100
  dp
  titlebar @A I R P L A N E  3 . 5
  %- i2 $rand(10,566) - $+ $r(100,3000)
  if ($1 == fs) {
    %- FS 1
    dll $+(",$scriptdir,Fullscreen.dll,") Fullscreen $window(@A).hwnd > $window(@A).w > $window(@A).h > 16 > 60
    dll $+(",$scriptdir,Fullscreen.dll,") HideMouse
  }
  dp
  %- i3 $rand(10,566) - $+ $r(100,3000)
  unset %lp
  A35L 0 0 0 0
}
alias -l A35L {
  if (!$window(@A)) halt
  var %tk = $ticks, %pg = $2, %sc = $3, %hp = $4, %- hadd a35, %sp = 6, %bs = 12, %ww = $window(@A).w, %wh = $window(@A).h
  if ($active == @A) && ($hget(a35,FS) == 1) && (!$dll($+(",$scriptdir,Fullscreen.dll,"),inFullscreen,)) {
    dll $+(",$scriptdir,Fullscreen.dll,") Fullscreen $window(@A).hwnd > %ww > %wh > 16 > 60
  }
  drawpic -cnsl @a 0 $calc(-64 + ($1 % 32) * 2) %ww $calc(%wh + 64) $iif(%boss, $calc(%tk / 20 % 2 * 32), $iif($calc(%tk % 800) > 400,32,0)) 0 32 32 $+(",$scriptdir,water.png")
  if %tpg > -1 {
    %pg = %tpg
    %tpg = -1
  }
  var %~ = drawcopy -nt @Ab1 16711935, %` = drawtext -nrp @A, %i = 0, %p1 = $calc($gettok($hget(a35,i1),2,32) + 2)
  var %p0 = $gettok($hget(a35,i1),1,32)
  if %p1 > -65 {
    if %p1 > %wh {
      %p0 = $rand(10,$calc(%ww - 74))
      %p1 = - $+ $r(100,3000)
    }
    else %~ 0 80 64 64 @a %p0 %p1
  }
  %- i1 %p0 %p1
  %p1 = $calc($gettok($hget(a35,i2),2,32) + 2)
  %p0 = $gettok($hget(a35,i2),1,32)
  if %p1 > -65 {
    if %p1 > %wh {
      %p0 = $rand(10,$calc(%ww - 74))
      %p1 = - $+ $r(100,3000)
    }
    else %~ 64 80 64 64 @a %p0 %p1
  }
  %- i2 %p0 %p1
  %p1 = $calc($gettok($hget(a35,i3),2,32) + 2)
  %p0 = $gettok($hget(a35,i3),1,32)
  if %p1 > -65 {
    if %p1 > %wh {
      %p0 = $rand(10,$calc(%ww - 74))
      %p1 = - $+ $r(100,3000)
    }
    else %~ 128 80 64 64 @a %p0 %p1
  }
  %- i3 %p0 %p1
  if %pg == 0 { ;menu
    if ($hget(a35,t) < 150) hinc a35 t
    if ($v1 < 149 && $mouse.key & 1) %- t 148
    drawpic -ctn @A 11295237 102 $iif($hget(a35,t) < 100, $calc(-150 + $v1 * 2), 50) $+(",$scriptdir,logo.png")
    if $v1 > 149 {
      var %÷ = drawtext -nrp @A %sh arial
      %÷ 80 243 194 $iif($inrect($mouse.x,$mouse.y,0,190,640,100),,) $+ Play
      %÷ 80 216 294 $iif($inrect($mouse.x,$mouse.y,0,290,640,100),,) $+ About
      %÷ 60 270 393 $iif($inrect($mouse.x,$mouse.y,0,390,640,68),,) $+ Exit
    }
    if $hget(a35,t) >= 100 {
      var %ÿ = $iif($hget(a35,t) >= 150,%whc,$rgb($calc(23 + ($v1 - 100) * 4.64),$calc(51 + ($v1 - 100) * 4.08), $&
        $calc(224 + ($v1 - 150) * 0.62))), %? = drawtext -nrp @A %ÿ arial
      if (%adbg) %? 12 460 160 Debug Mode
      %? 80 243 190 $iif($inrect($mouse.x,$mouse.y,0,190,640,100),,) $+ Play
      %? 80 216 290 $iif($inrect($mouse.x, $mouse.y,0,290,640,100),,) $+ About
      %? 60 270 390 $iif($inrect($mouse.x, $mouse.y,0,390,640,68),,) $+ Exit
    }
    if $hget(a35,t) > 149 && $mouse.key & 1 {
      if ($inrect($mouse.x,$mouse.y,0,390,640,68)) a35k
      if ($inrect($mouse.x,$mouse.y,0,290,640,100)) %pg = 4
      if ($inrect($mouse.x,$mouse.y,0,190,640,100)) {
        %pg = 1
        %Hp = 100
        %sc = 0
        %- a 100
        %i = 0
        while %i < 10 {
          %al @ab5 $r(0,4) $r(48,592) - $+ $r(100,1500)
          inc %i
        }
      }
      if ($hget(a35,fs) == 1) drawdot -nri @a %sh 3 $mouse.x $mouse.y
    }

    var %i = 1
    while %i <= $line(@ab2,0) { ;water explosions
      var %0 = $line(@ab2,%i), %1 = $gettok(%0,1,32), %2 = $gettok(%0,2,32), %3 = $gettok(%0,3,32)
      if (%1 > -1) drawpic -cnt @A 16711935 $calc(%2 - 40) $calc(%3 - 54) $calc((%1 % 7) * 81) $calc($int($calc(%1 / 7)) * 108) 81 108 $+(",$scriptdir,Explosion.png")
      if (%1 > 26) rline @ab2 %i 0 %2 %3
      else rline @ab2 %i $calc(%1 + 1) %2 %3
      inc %i
    }
    %i = 1
    while %i <= $line(@ab6,0) { ;air explosions
      var %0 = $line(@ab6,%i), %1 = $gettok(%0,1,32), %2 = $gettok(%0,2,32)
      var %3 = $gettok(%0,3,32)
      if (%1 > -1) drawpic -cnt @A 16711935 $calc(%2 - 40) $calc(%3 - 42) $calc((%1 % 7) * 81) $calc($int($calc(%1 / 7)) * 84) 81 84 $+(",$scriptdir,Explosion2.png")
      if (%1 > 26) rline @ab6 %i 0 %2 %3
      else rline @ab6 %i $calc(%1 + 1) %2 %3
      inc %i
    }
  }
  elseif %pg == 4 { ;credits
    var %/ = $hget(a35,c),%+ = $gettok($decode($right(%/,-3)),$mid(%/,3,1),59),%yc = 1
    while %+ != 4 && %yc <= $numtok(%+,42) {

      drawtext -nr @a %sh arial $iif(%yc > 1,60,80) 30 $calc(4 + %yc * $iif(%yc > 2,85,95)) $gettok(%+,%yc,42)
      drawtext -nr @a %whc arial $iif(%yc > 1,60,80) 30 $calc(%yc * $iif(%yc > 2,85,95)) $gettok(%+,%yc,42)
      inc %yc
    }
    hadd a35 c $iif($calc($left(%/,2) + 1) < 99,$base($v1,10,10,2),00) $+ $iif($v1 < 99,$mid(%/,3,1),$calc(($mid(%/,3,1) + 1) % 5)) $+ $right(%/,-3)
    dh 0
  }
  elseif %pg == 3 { ;game over
    var %? = drawtext -nrp @A 
    drawpic -ctn @A 11295237 $calc((%ww - 436) / 2) 150 $+(",$scriptdir,GameOver.png")
    %? %sh arial 61 240 280 Score
    %? %whc arial 61 240 277 Score
    var %www = $calc(320 - $width(%sc,arial,41) / 2)
    %? %sh arial 41 %www 352 %sc
    %? %whc arial 41 %www 350 %sc
    dh 0
  }
  elseif %pg == 2 { ;paused
    var %? = drawtext -nrp @A
    %? %sh arial 82 180 108 Paused
    %? %whc arial 82 180 104 Paused
    %? %sh arial 61 240 280 Score
    %? %whc arial 61 240 277 Score
    var %www = $calc(320 - $width(%sc,arial,41) / 2)
    %? %sh arial 41 %www 352 %sc
    %? %whc arial 41 %www 350 %sc
    dh 1
  }
  elseif %pg == 1 { ;game
    if (%hp == 0) {
      %al @ab6 -48 $calc($hget(a35,m1) - 16) $calc($hget(a35,m2) - 16)
      clear @ab4
      clear @ab5
      %al @ab2 0 $hget(a35,m1) $hget(a35,m2)
      var %i = 1
      %hp = -1
      while %i < 24 {
        %al @ab2 - $+ $calc(%i * 2) $calc($hget(a35,m1) - 32 + $r(0,64)) $calc($hget(a35,m2) - 32 + $r(0,64))
        inc %i
      }
    }
    if (%hp < 1 && $line(@ab2,0) == 0) {
      %pg = 3
    }
    var %i = 1, %j = 1
    if (%tsc < %sc) inc %tsc 5
    if (%tsc > %sc) %tsc = %sc
    if ($istok($hget(a35,k),80,160)) %pg = 2
    if (%hp <= 0) hdel a35 k

    while %j <= $line(@ab3,0) { ;player shots
      %p0 = $gettok($line(@ab3,%j),1,32)
      %p1 = $calc($gettok($line(@ab3,%j),2,32) - %bs)
      %~ $iif($calc(%tk % 100) > 50,16,0) 0 16 16 @a %p0 %p1
      %i = 1
      while %i <= $line(@ab5,0) {
        var %1 = $gettok($line(@ab5,%i),1,32), %2 = $gettok($line(@ab5,%i),2,32), %3 = $gettok($line(@ab5,%i),3,32)
        if %3 > -32 && %p1 >= %3 && $inrect(%p0,%p1,%2,%3,32,32) {
          %al @ab2 0 %p0 %p1
          %3 = 500
          %p1 = -32
          inc %sc 100
        }
        if (%3 > %wh) rline @ab5 %i $r(0,4) $r(48,592) - $+ $r(64,500)
        inc %i
      }
      if (%p1 < -16) dline @ab3 %j
      else rline @ab3 %j %p0 %p1
      inc %j
    }
    %i = 1
    while %i <= $line(@ab5,0) { ;enemy planes
      var %1 = $gettok($line(@ab5,%i),1,32), %2 = $gettok($line(@ab5,%i),2,32), %3 = $gettok($line(@ab5,%i),3,32)
      if %3 > -32 {
        %~ $iif($and($1,2),260,292) $calc(%1 * 32) 32 32 @a %2 %3
      }
      inc %3 %sp
      if ($abs($calc(%2 - $hget(a35,m1))) < 64 && $r(0,50) == $r(0,10)) %al @ab4 $calc(%2 +14) $calc(%3 +18) 
      if $inrect($calc(%2 +16),$calc(%3 +16),$calc($hget(a35,m1) -32),$calc($hget(a35,m2) -32),64,64) {
        %al @ab6 0 %2 %3
        dec %hp 10
        %3 = 500
        inc %sc 50
      }
      if (%3 > %wh) rline @ab5 %i $r(0,4) $r(48,592) - $+ $r(64,500)
      else rline @ab5 %i %1 %2 %3
      inc %i
    }
    %i = 1
    while %i <= $line(@ab4,0) { ;enemy shots
      %p0 = $gettok($line(@ab4,%i),1,32)
      %p1 = $calc($gettok($line(@ab4,%i),2,32) + %bs)
      %~ $iif($calc(%tk % 100) > 50,6,0) 18 6 6 @a %p0 %p1
      if (%p1 > %wh) dline @ab4 %i
      else rline @ab4 %i %p0 %p1
      if $inrect(%p0,%p1,$calc($hget(a35,m1) -33),$calc($hget(a35,m2) -33),64,64) {
        dline @ab4 %i
        dec %hp 5
        %al @ab2 0 %p0 $calc(%p1 + 12)
      }
      inc %i
    }
    ;draw player
    if (%hp != 0) %~ $iif($and($1,2),161,0) $iif(%hp > 25,170,257) 160 86 @A $calc($hget(a35,m1) - 80) $calc($hget(a35,m2) - 24)

    %i = 1
    while %i <= $line(@ab2,0) { ;water explosions
      var %0 = $line(@ab2,%i), %1 = $gettok(%0,1,32), %2 = $gettok(%0,2,32), %3 = $gettok(%0,3,32)
      if (%1 > -1) drawpic -cnt @A 16711935 $calc(%2 - 40) $calc(%3 - 46) $calc((%1 % 7) * 81) $calc($int($calc(%1 / 7)) * 99) 81 99 $+(",$scriptdir,Explosion.png")
      if (%1 > 26) dline @ab2 %i
      else rline @ab2 %i $calc(%1 + 1) %2 %3
      inc %i
    }
    %i = 1
    while %i <= $line(@ab6,0) { ;air explosions
      var %0 = $line(@ab6,%i), %1 = $gettok(%0,1,32), %2 = $gettok(%0,2,32)
      var %3 = $gettok(%0,3,32)
      if (%1 > -1) drawpic -cnt @A 16711935 $calc(%2 - 40) $calc(%3 - 42) $calc((%1 % 7) * 81) $calc($int($calc(%1 / 7)) * 84) 81 84 $+(",$scriptdir,Explosion2.png")
      if (%1 > 26) dline @ab6 %i
      else rline @ab6 %i $calc(%1 + 1) %2 %3
      inc %i
    }
    if %hp < 30 && !$hget(a35,hp) && $rand(0,40) == $rand(0,10) {
      %- hp $r(40,600) - $+ $r(100,1000)
    }
    if $hget(a35,hp) { ;health powerup
      %p0 = $gettok($hget(a35,hp),1,32)
      %p1 = $gettok($hget(a35,hp),2,32)
      if $inrect(%p0,%p1,$calc($hget(a35,m1)-32),$calc($hget(a35,m2)-32),64,64) {
        hdel a35 hp
        %hp = 100
      }
      else {
        inc %p1 3
        hadd a35 hp %p0 %p1
      }
      %~ $calc($int($calc((%tk % 500) / 100)) * 18) 52 18 18 @a $calc(%p0 - 9) $calc(%p1 - 9)
      if (%p1 > 600) hdel a35 hp
    }
    if $hget(a35,a) < 50 && !$hget(a35,ab) && $rand(0,120) == $rand(0,10) {
      %- ab $r(40,600) - $+ $r(100,1000)
    }
    if $hget(a35,ab) { ;ammo box
      %p0 = $gettok($hget(a35,ab),1,32)
      %p1 = $gettok($hget(a35,ab),2,32)
      if $inrect(%p0,%p1,$calc($hget(a35,m1)-32),$calc($hget(a35,m2)-32),64,64) {
        hdel a35 ab
        hadd a35 a 100
      }
      else {
        inc %p1 3
        hadd a35 ab %p0 %p1
      }
      %~ $calc($int($calc((%tk % 400) / 100)) * 26) 32 26 18 @a $calc(%p0 -13) $calc(%p1 -9)
      if (%p1 > 600) hdel a35 ab
    }
    ;hud
    var %] = tahoma 10
    %` %whc %] 330 10 Score: $iif(%adbg, %sc,)
    dn 330 26 $base(%tsc,10,10,12)
    %` $iif(%hp < 31, $iif($and($1,16),255,%whc),%whc) %] 10 10 Health: $iif(%adbg, %hp,)
    %~ 52 0 106 16 @a 10 24
    %~ 159 3 1 10 @a 13 27 %hp 10
    %~ 159 1 1 10 @a $calc(13 + %hp - 1) 28 1 8
    %~ 159 1 1 10 @a 13 28 1 8
    %` %whc %] 120 10 Ammo: $iif(%adbg, $hget(a35,a),)
    var %^ drawdot -nri @a
    drawrect -nrfi @A $iif($hget(a35,a) > 0,%sh,51200) 1 122 26 202 12
    if ($hget(a35,a) > 0) drawpic -ctsl @A 16711935 123 27 $calc($v1 * 2) 10 $+(",$scriptdir,shot.png,")
    if ($istok($hget(a35,k),37,160) && $hget(a35,m1) > 30) %- m1 $iif($calc($hget(a35,m1) - %sp) < 30, 30, $v1)
    if ($istok($hget(a35,k),39,160) && $hget(a35,m1) < 610) %- m1 $iif($calc($hget(a35,m1) + %sp) > 610, 610, $v1)
    if ($istok($hget(a35,k),38,160) && $hget(a35,m2) > 22) %- m2 $iif($calc($hget(a35,m2) - %sp) < 22, 22, $v1)
    if ($istok($hget(a35,k),40,160) && $hget(a35,m2) < 458) %- m2 $iif($calc($hget(a35,m2) + %sp) > 458, 458, $v1)
    if $istok($hget(a35,k),32,160) && $hget(a35,a) > 0 && $calc($1 % 4) == 0 {
      %al @ab3 $calc($hget(a35,m1) - 8) $hget(a35,m2)
      hdec a35 a
    }
    if ($hget(a35,a) < 100 && $v1 > 0 && $calc($1 % 24) == 0) hinc a35 a
    if ($hget(a35,a) == 0) %- a -500
    elseif ($v1 < 0) hinc a35 a
    if ($hget(a35,a) == 0) %- a 100

    if (%adbg) {
      %` %whc %] 10 50 fps: $int($calc(1000 / ($ticks - %tk)))
      %` %whc %] 10 60 enemies: $line(@ab5,0)
      %` %whc %] 10 70 explosions: $line(@ab2,0)
      %` %whc %] 10 80 big explosions: $line(@ab6,0)
      %` %whc %] 10 90 player shots: $line(@ab3,0)
      %` %whc %] 10 100 enemy shots: $line(@ab4,0)
    }
  }
  drawrect -rn @A 8396864 1 0 0 %ww %wh
  drawdot @A
  .timer -oh 1 0 A35L $calc(($1 + 1) % 4294967295) %pg %sc %hp
}
alias -l dn { ;draw bitmap numbers
  var %t = 1
  while (%t <= $len($3)) {
    drawcopy -nt @Ab1 16711935 $calc($iif($mid($3,%t,1) !isnum, 10, $v1) * 8 + 164) $calc($int($calc($ticks % 400 / 100)) * 11) 8 11 @A $calc($1 + ((%t - 1) * 9)) $2
    inc %t
  }
}
alias -l dp { ;draw progress bar
  drawrect -rfn @A %whc 1 400 300 150 100
  drawtext -rn @A 13158600 arial 80 401 301 $ceil($calc(%lp * 6))
  drawdot @A
  inc %lp
}
alias -l dh { ;draw back button
  var %+ = drawrect -rn @A, %> = drawtext -nr @A
  %+ %sh 1 4 5 37 22
  %+ %whc 1 4 4 37 22
  %> %sh tahoma 16 6 6 Back
  %> %whc tahoma 16 6 5 Back
  if $inrect($mouse.x,$mouse.y,4,4,38,23) && $mouse.key & 1 {
    %tpg = $$1
  }
}
on *:LOAD: {
  echo -m Airplane 033.055 sucsessfully loaded! Type 05/A35 to run (3/A35 fs to run in fullscreen).
  editbox -a /a35
}
alias a35k { ;close a35
  if ($window(@A)) window -c @A
  var %i = 1, %q = window -c @Ab
  while %i < 7 {
    %q $+ %i
    inc %i
  }
  %q
  hfree -w a35
  unset %j %n %lp %whc %sh %tsc %al %tpg %ê %adbg
  dll $+(",$scriptdir,Fullscreen.dll,") Reset
  dll $+(",$scriptdir,Fullscreen.dll,") ShowMouse
}
on *:KEYDOWN:@A:*: {
  if ($keyval == 27) a35k
  else hadd a35 k $addtok($hget(a35,k),$keyval,160)
}
on *:KEYUP:@A:*:hadd a35 k $remtok($hget(a35,k),$keyval,160)
on *:CLOSE:@A:a35k
menu * {
  Airplane 3.5
  .Windowed:A35
  .Full Screen:A35 1
}
