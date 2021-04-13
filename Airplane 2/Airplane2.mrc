; Airplane 2 By Foshizzle
; Type /Airplane2 to Run

alias Airplane2 {
  window -pkodCfB +nt @Airplane2 -1 -1 400 400
  drawtext -r @Airplane2 0 verdana 12 10 10 Loading, Please Wait...
  window -pkdfBh @Air2_Buf -1 -1 400 400
  window -pkdfBh @Air2_Buf2 -1 -1 400 500
  window -pkdfBh +b @Air2_Buf3 -1 -1 192 64
  hfree -w Airplane2 
  hmake Airplane2 1000
  hadd Airplane2 me.x 200 
  hadd Airplane2 me.y 350 
  hadd Airplane2 me.hp 100
  hadd Airplane2 ScrollH 100
  hadd Airplane2 Detail High
  hadd Airplane2 mscstat On
  hadd Airplane2 Level 0
  var %i 1
  while (%i <= 10) { 
    hadd Airplane2 enem. $+ %i $r(20,374) - $+ $r(100,400) 
    inc %i
  }
  hadd Airplane2 enem_max 10
  hadd Airplane2 time $ctime
  var %y 0 
  while (%y <= 15) {
    var %x 0
    while (%x <= 12) { 
      drawpic -c @Air2_Buf2 $calc(%x * 32) $calc(%y * 32) $+(",$scriptdir,water.gif,")
      inc %x
    }
    inc %y 
  } 
  drawfill -rn @Air2_Buf3 $rgb(255,0,255) 1 0 0
  drawpic -ntc @Air2_Buf3 $rgb(0,67,171) 0 0 $+(",$scriptdir,Airplane.gif,")
  drawpic -ntc @Air2_Buf3 $rgb(0,65,173) 32 0 $+(",$scriptdir,Bullet.gif,")
  drawpic -ntc @Air2_Buf3 $rgb(0,67,171) 64 0 $+(",$scriptdir,eBullet.gif,")
  drawpic -ntc @Air2_Buf3 $rgb(0,65,173) 96 0 $+(",$scriptdir,Airplane2.gif,")
  drawpic -ntc @Air2_Buf3 $rgb(4,66,172) 0 32 $+(",$scriptdir,explosion.gif,")
  drawpic -ntc @Air2_Buf3 $rgb(4,66,172) 128 0 $+(",$scriptdir,hpowerup.gif,")
  if ($hget(Airplane2,Detail) == High) && ($hget(Airplane2,mscstat) == on) { :song1 | var %song $+(",$scriptdir,song,$r(0,$findfile($scriptdir,song*.mp3,0)),.mp3,") | if ($exists(%song)) .splay -p %song | else goto song1 }
  Airplane2.loop
}
alias -l Airplane2.loop {
  if ($window(@Airplane2)) && ($window(@Air2_Buf)) {
    if ($hget(Airplane2,Pause) != True) {
      if ($hget(Airplane2,Level) == 0) {
        hadd Airplane2 Ticks $Ticks
        clear -n @Airplane2 
        drawfill -nr @Airplane2 16737792 1 0 0
        clear -n @Air2_Buf
        drawfill -nr @Air2_Buf 13107912 1 0 0
        if ($hget(Airplane2,Detail) == High) {
          drawcopy -n @Air2_Buf2 0 $hget(Airplane2,ScrollH) 400 400 @Airplane2 0 0
          hdec Airplane2 ScrollH 4
          if ($hget(Airplane2,ScrollH) <= 4)  {
            hadd Airplane2 ScrollH 100
          }
        }
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 60 $calc(200 - ($width(Airplane 2,verdana,60) / 2)) 22 Airplane 2
        drawtext -nr @Airplane2 16777215 verdana 60 $calc(200 - ($width(Airplane 2,verdana,60) / 2)) 20 Airplane 2
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 12 $calc(200 - ($width(Created By Foshizzle,verdana,12) / 2)) 102 Created by Foshizzle
        drawtext -nr @Airplane2 16777215 verdana 12 $calc(200 - ($width(Created By Foshizzle,verdana,12) / 2)) 100 Created by Foshizzle
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 40 $calc(200 - ($width(Play,verdana,40) / 2)) 162 Play
        drawtext -nr @Airplane2 16777215 verdana 40 $calc(200 - ($width(Play,verdana,40) / 2)) 160 Play
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 40 $calc(200 - ($width(Exit,verdana,40) / 2)) 342 Exit
        drawtext -nr @Airplane2 16777215 verdana 40 $calc(200 - ($width(Exit,verdana,40) / 2)) 340 Exit
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 40 $calc(200 - ($width(Credits,verdana,40) / 2)) 222 Credits
        drawtext -nr @Airplane2 16777215 verdana 40 $calc(200 - ($width(Credits,verdana,40) / 2)) 220 Credits
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 40 $calc(200 - ($width(Options,verdana,40) / 2)) 282 Options
        drawtext -nr @Airplane2 16777215 verdana 40 $calc(200 - ($width(Options,verdana,40) / 2)) 280 Options
        if ($inrect($mouse.x,$mouse.y,100,162,200,52)) {
          if ($hget(Airplane2,Detail) == High) drawrect -rn @Airplane2 6704128 2 100 164 200 52
          drawrect -rn @Airplane2 16777215 2 100 162 200 52
        }
        elseif ($inrect($mouse.x,$mouse.y,100,220,200,52)) {
          if ($hget(Airplane2,Detail) == High) drawrect -rn @Airplane2 6704128 2 100 222 200 52
          drawrect -rn @Airplane2 16777215 2 100 220 200 52
        }
        elseif ($inrect($mouse.x,$mouse.y,100,282,200,52)) {
          if ($hget(Airplane2,Detail) == High) drawrect -rn @Airplane2 6704128 2 100 284 200 52
          drawrect -rn @Airplane2 16777215 2 100 282 200 52
        }
        elseif ($inrect($mouse.x,$mouse.y,100,340,200,52)) {
          if ($hget(Airplane2,Detail) == High) drawrect -rn @Airplane2 6704128 2 100 342 200 52
          drawrect -rn @Airplane2 16777215 2 100 340 200 52
        }
        drawdot @Airplane2
        titlebar @Airplane2 - FPS: $ceil($calc(1000 / ($ticks - $hget(Airplane2,Ticks))))
        .timer -m 1 0 Airplane2.Loop
      }
      elseif ($hget(Airplane2,Level) == Credits) {
        hadd Airplane2 Ticks $Ticks
        clear -n @Airplane2 
        drawfill -nr @Airplane2 16737792 1 0 0
        clear -n @Air2_Buf
        drawfill -nr @Air2_Buf 13107912 1 0 0
        if ($hget(Airplane2,Detail) == High) {
          drawcopy -n @Air2_Buf2 0 $hget(Airplane2,ScrollH) 400 400 @Airplane2 0 0
          hdec Airplane2 ScrollH 4
          if ($hget(Airplane2,ScrollH) <= 4)  {
            hadd Airplane2 ScrollH 100
          }
        }
        var %msg $gettok($hget(Airplane2,crdt.msg),$hget(Airplane2,crdt.msgnum),58)
        if ($hget(Airplane2,Detail) == High) {
          drawcopy -nt @Air2_Buf3 16711935 0 0 32 32 @Airplane2 184 $calc($hget(Airplane2,crdt.height) - 48)
          drawline -nr @Airplane2 16777215 1 200 $calc($hget(Airplane2,crdt.height) - 13) 200 $calc($hget(Airplane2,crdt.height) + 8)
        }
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 30 $calc(200 - ($width(%msg,verdana,30) / 2)) $calc($hget(Airplane2,crdt.height) + 2) %msg
        drawtext -nr @Airplane2 16777215 verdana 30 $calc(200 - ($width(%msg,verdana,30) / 2)) $hget(Airplane2,crdt.height) %msg
        hdec Airplane2 crdt.height 4
        if ($calc($hget(Airplane2,crdt.height) - 4) <= -75) {
          hinc Airplane2 crdt.msgnum
          hadd Airplane2 crdt.height 445
        }
        if ($hget(Airplane2,crdt.msgnum) > $numtok($hget(Airplane2,crdt.msg),58)) { 
          hadd Airplane2 crdt.msgnum 1
        }
        drawdot @Airplane2
        titlebar @Airplane2 - FPS: $ceil($calc(1000 / ($ticks - $hget(Airplane2,Ticks))))
        .timer -m 1 0 Airplane2.Loop
      }
      elseif ($hget(Airplane2,Level) == Options) {
        hadd Airplane2 Ticks $Ticks
        clear -n @Airplane2 
        drawfill -nr @Airplane2 16737792 1 0 0
        if ($hget(Airplane2,Detail) == High) {
          drawcopy -n @Air2_Buf2 0 $hget(Airplane2,ScrollH) 400 400 @Airplane2 0 0
          hdec Airplane2 ScrollH 4
          if ($hget(Airplane2,ScrollH) <= 4)  {
            hadd Airplane2 ScrollH 100
          }
        }
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 60 $calc(200 - ($width(Options,verdana,60) / 2)) 22 Options
        drawtext -nr @Airplane2 16777215 verdana 60 $calc(200 - ($width(Options,verdana,60) / 2)) 20 Options
        var %34 Detail: $hget(Airplane2,Detail)
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 20 $calc(200 - ($width(%34,verdana,20) / 2)) 152 %34
        drawtext -nr @Airplane2 16777215 verdana 20 $calc(200 - ($width(%34,verdana,20) / 2)) 150 %34
        if ($hget(Airplane2,Detail) == High) {
          var %35 Music: $hget(Airplane2,Mscstat)
          drawtext -nr @Airplane2 6704128 verdana 20 $calc(200 - ($width(%35,verdana,20) / 2)) 202 %35
          drawtext -nr @Airplane2 16777215 verdana 20 $calc(200 - ($width(%35,verdana,20) / 2)) 200 %35
        }
        if ($inrect($mouse.x,$mouse.y,100,149,200,30)) { 
          if ($hget(Airplane2,Detail) == High) drawrect -nr @Airplane2 6704128 2 100 151 200 30
          drawrect -nr @Airplane2 16777215 2 100 149 200 30
        }
        if ($inrect($mouse.x,$mouse.y,100,199,200,30)) && ($hget(Airplane2,Detail) == High) { 
          drawrect -nr @Airplane2 6704128 2 100 201 200 30
          drawrect -nr @Airplane2 16777215 2 100 199 200 30
        }
        if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 20 $calc(200 - ($width(Back,verdana,20) / 2)) 352 Back
        drawtext -nr @Airplane2 16777215 verdana 20 $calc(200 - ($width(Back,verdana,20) / 2)) 350 Back
        if ($inrect($mouse.x,$mouse.y,100,349,200,30)) {
          if ($hget(Airplane2,Detail) == High) drawrect -nr @Airplane2 6704128 2 100 351 200 30
          drawrect -nr @Airplane2 16777215 2 100 349 200 30
        }
        drawdot @Airplane2
        titlebar @Airplane2 - FPS: $ceil($calc(1000 / ($ticks - $hget(Airplane2,Ticks))))
        .timer -m 1 0 Airplane2.Loop
      }
      elseif ($hget(Airplane2,Level) > 10) {
        if (!$hget(Airplane2,Finishtime)) hadd Airplane2 Finishtime $calc($ctime - $hget(Airplane2,Time))
        clear -n @Airplane2
        drawfill -nr @Airplane2 16737792 1 0 0
        if ($hget(Airplane2,Detail) == High) drawcopy -n @Air2_Buf2 0 $hget(Airplane2,ScrollH) 400 400 @Airplane2 0 0
        var %tex Game completed in $hget(Airplane2,Finishtime) Seconds.
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 20 $calc(200 - ($width(%tex,verdana,20) / 2)) 290 %tex
        drawtext -rn @Airplane2 16777215 verdana 20 $calc(200 - ($width(%tex,verdana,20) / 2)) 288 %tex
        var %out Health: $hget(Airplane2,me.hp) $+ /100 - Shots Fired: $hget(Airplane2,me.bullets)
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 20 $calc(200 - ($width(%out,verdana,20) / 2)) 250 %out
        drawtext -rn @Airplane2 16777215 verdana 20 $calc(200 - ($width(%out,verdana,20) / 2)) 248 %out
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 20 $calc(200 - ($width(Created by Foshizzle,verdana,20) / 2)) 350 Created by Foshizzle
        drawtext -rn @Airplane2 16777215 verdana 20 $calc(200 - ($width(Created by Foshizzle,verdana,20) / 2)) 348 Created by Foshizzle
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 40 $calc(200 - ($width(Airplane2,verdana,40) / 2)) 10 Airplane 2
        drawtext -rn @Airplane2 16777215 verdana 40 $calc(200 - ($width(Airplane2,verdana,40) / 2)) 8 Airplane 2
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 50 $calc(200 - ($width(You Win!,verdana,50) / 2))  152 You Win!
        drawtext -rn @Airplane2 16777215 verdana 50 $calc(200 - ($width(You Win!,verdana,50) / 2)) 150 You Win!
        if ($hget(Airplane2,Detail) == High) drawcopy -nt @Air2_Buf3 16711935 0 0 32 32 @Airplane2 184 91
        drawdot @Airplane2
        titlebar @Airplane2 - You Win!
        .timer -m 1 0 Airplane2.loop
      }
      elseif ($hget(Airplane2,me.hp) <= 0) {
        if (!$hget(Airplane2,Finishtime)) hadd Airplane2 Finishtime $calc($ctime - $hget(Airplane2,Time))
        clear -n @Airplane2
        drawfill -nr @Airplane2 16737792 1 0 0
        if ($hget(Airplane2,Detail) == High) drawcopy -n @Air2_Buf2 0 $hget(Airplane2,ScrollH) 400 400 @Airplane2 0 0
        var %tex Shots Fired: $hget(Airplane2,me.bullets)
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 20 $calc(200 - ($width(%tex,verdana,20) / 2)) 286 %tex
        drawtext -rn @Airplane2 16777215 verdana 20 $calc(200 - ($width(%tex,verdana,20) / 2)) 284 %tex
        var %out Enemies Left in Level: $calc($hget(Airplane2,enem_max) - $hfind(Airplane2,enem.*,0,w)) - Level: $hget(Airplane2,Level)
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 20 $calc(200 - ($width(%out,verdana,20) / 2)) 250 %out
        drawtext -rn @Airplane2 16777215 verdana 20 $calc(200 - ($width(%out,verdana,20) / 2)) 248 %out
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 20 $calc(200 - ($width(Created by Foshizzle,verdana,20) / 2)) 370 Created by Foshizzle
        drawtext -rn @Airplane2 16777215 verdana 20 $calc(200 - ($width(Created by Foshizzle,verdana,20) / 2)) 368 Created by Foshizzle
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 40 $calc(200 - ($width(Airplane2,verdana,40) / 2)) 10 Airplane 2
        drawtext -rn @Airplane2 16777215 verdana 40 $calc(200 - ($width(Airplane2,verdana,40) / 2)) 8 Airplane 2
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 50 $calc(200 - ($width(You Lose!,verdana,50) / 2)) 152 You Lose!
        drawtext -rn @Airplane2 16777215 verdana 50 $calc(200 - ($width(You Lose!,verdana,50) / 2)) 150 You Lose!
        var %ti Time Passed: $hget(Airplane2,Finishtime) Seconds.
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 20 $calc(200 - ($width(%ti,verdana,20) / 2)) 322 %ti
        drawtext -rn @Airplane2 16777215 verdana 20 $calc(200 - ($width(%ti,verdana,20) / 2)) 320 %ti
        if ($hget(Airplane2,Detail) == High) drawcopy -nt @Air2_Buf3 16711935 96 0 32 32 @Airplane2 184 91
        drawdot @Airplane2
        titlebar @Airplane2 - You Lose!
        .timer -m 1 0 Airplane2.loop
      }
      else {
        hadd Airplane2 Ticks $Ticks
        clear -n @Airplane2 
        drawfill -nr @Airplane2 16737792 1 0 0
        clear -n @Air2_Buf
        drawfill -nr @Air2_Buf 13107912 1 0 0
        if ($istok($hget(Airplane2,Keys),37,32)) && ($hget(Airplane2,me.x) > 20) {
          hdec Airplane2 me.x $iif($hget(Airplane,Level) > 5, 10, 5) 
        }
        if ($istok($hget(Airplane2,Keys),38,32)) && ($hget(Airplane2,me.y) > 20) { 
          hdec Airplane2 me.y $iif($hget(Airplane,Level) > 5, 10, 5)
        }
        if ($istok($hget(Airplane2,Keys),39,32)) && ($hget(Airplane2,me.x) < 380) { 
          hinc Airplane2 me.x $iif($hget(Airplane,Level) > 5, 10, 5)
        }
        if ($istok($hget(Airplane2,Keys),40,32)) && ($hget(Airplane2,me.y) < 380) { 
          hinc Airplane2 me.y $iif($hget(Airplane,Level) > 5, 10, 5)
        }
        if ($istok($hget(Airplane2,Keys),32,32)) && ($iif($hget(Airplane2,Level) > 3, 3, 5) // $ticks) {
          hinc Airplane2 me.bullets
          hadd Airplane2 me.blt_ $+ $hget(Airplane2,me.bullets) $calc($hget(Airplane2,me.x) +  1) $calc($hget(Airplane2,me.y) - 6)
        }
        if ($hget(Airplane2,Detail) == High) {
          drawcopy -n @Air2_Buf2 0 $hget(Airplane2,ScrollH) 400 400 @Airplane2 0 0
          hdec Airplane2 ScrollH 4
          if ($hget(Airplane2,ScrollH) <= 4)  {
            hadd Airplane2 ScrollH 100
          }
        }
        var %tex Health: $hget(Airplane2,me.hp) $+ /100 - Enemies Remaining: $hfind(Airplane2,enem.*,0,w) $+ / $+ $hget(Airplane2,enem_max)
        if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 10 $calc(200 - ($width(%tex,verdana,10) / 2)) 387 %tex
        drawtext -rn @Airplane2 16777215 verdana 10 $calc(200 - ($width(%tex,verdana,10) / 2)) 385 %tex
        var %i 1
        while (%i <= $hget(Airplane2,enem_max)) {
          if ($hget(Airplane2,enem. $+ %i)) {
            tokenize 32 $hget(Airplane2,enem. $+ %i)
            if ($abs($calc($1 - $hget(Airplane2,me.x))) <= 16) && ($abs($calc($2 - $hget(Airplane2,me.y))) <= 16) {
              hdel Airplane2 enem. $+ %i
              if ($hget(Airplane2,Detail) == High) {
                hinc Airplane2 explosions
                hadd Airplane2 expl. $+ $hget(Airplane2,explosions) 0 $calc($1 - 16) $calc($2 - 16) 
              }
              hdec Airplane2 me.hp 20
            }
            else {
              drawcopy -nt @Air2_Buf3 $rgb(255,0,255) 96 0 32 32 @Airplane2 $calc($1 - 16) $calc($2 - 16)
              drawcopy -nt @Air2_Buf3 $rgb(255,0,255) 96 0 32 32 @Air2_Buf $calc($1 - 16) $calc($2 - 16) 
              hadd Airplane2 enem. $+ %i $1 $calc($2 + 6)
              if ($calc($2 + 6) > 400) { 
                hadd Airplane2 enem. $+ %i $r(40,374) - $+ $r(100,400) 
              }    
              if ($r(0,3) == 0) && ($abs($calc($1 - $hget(Airplane2,me.x))) <= 16) && (5 // $ticks) {
                hinc Airplane2 en.bullets
                hadd Airplane2 en.blt_ $+ $hget(Airplane2,en.bullets) $1 $calc($2 + 32)
              }
            }
          }  
          inc %i
        }
        var %blt 1
        while (%blt <= $hget(Airplane2,me.bullets)) {
          if ($hget(Airplane2,me.blt_ $+ %blt)) {
            tokenize 32 $hget(Airplane2,me.blt_ $+ %blt)
            if ($getdot(@Air2_Buf,$1,$2) != 13107912) {
              hdel Airplane2 me.blt_ $+ %blt
              var %t 1 
              while (%t <= $hget(Airplane2,enem_max)) {
                tokenize 32 $1 $2 $hget(Airplane2,enem. $+ %t)
                if ($abs($calc($1 - $3)) <= 16) && ($abs($calc($2 - $4)) <= 16) {
                  hdel Airplane2 enem. $+ %t
                  if ($hget(Airplane2,Detail) == High) {
                    hinc Airplane2 explosions
                    hadd Airplane2 expl. $+ $hget(Airplane2,explosions) 0 $calc($1 - 16) $calc($2 - 16) 
                  }
                }
                inc %t
              }
            }
            else {
              if ($hget(Airplane2,Detail) == High) {
                drawcopy -nt @Air2_Buf3 $rgb(255,0,255) 32 0 32 32 @Airplane2 $calc($1 - 16) $calc($2 - 16)
                drawcopy -nt @Air2_Buf3 $rgb(255,0,255) 32 0 32 32 @Air2_Buf $calc($1 - 16) $calc($2 - 16)
              }
              else {
                drawdot -nr @Airplane2 52479 5 $1 $2
                drawdot -nr @Air2_Buf 52479 5 $1 $2
              }
              hadd Airplane2 me.blt_ $+ %blt $1 $calc($2 - 6)
              if ($calc($2 - 6) < 0) { 
                hdel Airplane2 me.blt_ $+ %blt 
              }
            }
          }
          inc %blt
        }
        var %ebt 1 
        while (%ebt <= $hget(Airplane2,en.bullets)) {
          if ($hget(Airplane2,en.blt_ $+ %ebt)) {
            tokenize 32 $hget(Airplane2,en.blt_ $+ %ebt)
            if ($abs($calc($1 - $hget(Airplane2,me.x))) <= 16) && ($abs($calc($2 - $hget(Airplane2,me.y))) <= 16) {
              if ($hget(Airplane2,Detail) == High) {
                hinc Airplane2 explosions
                hadd Airplane2 expl. $+ $hget(Airplane2,explosions) 0 $calc($1 - 16) $calc($2 - 16) 
              }
              hdec Airplane2 me.hp 10
              hdel Airplane2 en.blt_ $+ %ebt
            }
            else {
              if ($hget(Airplane2,Detail) == High) {
                drawcopy -nt @Air2_Buf3 $rgb(255,0,255) 64 0 32 32 @Airplane2 $calc($1 - 16) $calc($2 - 16)
                drawcopy -nt @Air2_Buf3 $rgb(255,0,255) 64 0 32 32 @Air2_Buf $calc($1 - 16) $calc($2 - 16)
              } 
              else {
                drawdot -nr @Airplane2 52479 3 $1 $2
                drawdot -nr @Air2_Buf 52479 3 $1 $2
              }
              hadd Airplane2 en.blt_ $+ %ebt $1 $calc($2 + 8)
              if ($calc($2 + 8) > 400) { 
                hdel Airplane2 en.blt_ $+ %ebt 
              }
            }
          }
          inc %ebt
        }
        if ($hget(Airplane2,HpowerUp)) {
          tokenize 32 $v1
          drawcopy -nt @Air2_Buf3 16711935 128 0 32 32 @Airplane2 $calc($1 - 16) $calc($2 - 16) 
          drawcopy -nt @Air2_Buf3 16711935 128 0 32 32 @Air2_Buf $calc($1 - 16) $calc($2 - 16) 
          hadd Airplane2 HpowerUp $1 $calc($2 + 3)
          if ($calc($2 + 3) > 400) {
            hdel Airplane2 HpowerUp
          }
        }
        if (!$hget(Airplane2,HpowerUp)) && ($hget(Airplane2,me.hp) <= 50) { 
          hadd Airplane2 HpowerUp $r(16,384) - $+ $r(300,800)
        }
        drawcopy -nt @Air2_Buf3 16711935 0 0 32 32 @Airplane2 $calc($hget(Airplane2,me.x) - 16) $calc($hget(Airplane2,me.y) - 16)
        drawcopy -nt @Air2_Buf3 16711935 0 0 32 32 @Air2_Buf $calc($hget(Airplane2,me.x) - 16) $calc($hget(Airplane2,me.y) - 16)
        if ($getdot(@Air2_Buf,$calc($hget(Airplane2,me.x) - 16),$calc($hget(Airplane2,me.y) - 16)) != 13107912) {
          tokenize 32 $hget(Airplane2,HpowerUp) 
          if ($abs($calc($1 - $hget(Airplane2,me.x))) <= 16) && ($abs($calc($2 - $hget(Airplane2,me.y))) <= 16) { 
            hdel Airplane2 HpowerUp
            hadd Airplane2 me.hp 100
          }
        }
        if ($hget(Airplane2,Detail) == High) { 
          var %exp 1
          while (%exp <= $hget(Airplane2,explosions)) {
            if ($Hget(Airplane2,expl. $+ %exp)) {
              tokenize 32 $v1
              if ($1 < 6) { 
                drawcopy -nt @Air2_Buf3 16711935 $calc(32 * $1) 32 32 32 @Airplane2 $2 $3
                hadd Airplane2 expl. $+ %exp $calc($1 + 1) $2 $3
              }
              else {
                hdel Airplane2 expl. $+ %exp
              }
            }
            inc %exp
          }
        }
        titlebar @Airplane2 - FPS: $ceil($calc(1000 / ($ticks - $hget(Airplane2,Ticks)))) - Time: $calc($ctime - $Hget(Airplane2,time)) Seconds
        drawdot @Air2_Buf
        drawdot @Airplane2 
        if ($hfind(Airplane2,enem.*,0,w) <= 0) {
          hinc Airplane2 Level
          hadd Airplane2 enem_max $calc(10 * $hget(Airplane2,Level))
          var %l 1
          while (%l <= $hget(Airplane2,enem_max)) { 
            hadd Airplane2 enem. $+ %l $r(20,374) - $+ $r(200,$calc($hget(Airplane2,Level) * 2) $+ 00) 
            inc %l
          }
          hdel -w Airplane2 me.blt_*
          hdel -w Airplane2 en.blt_*
        }
        .timer -mh 1 0 Airplane2.loop
      }
    }
    elseif ($hget(Airplane2,Pause) == True) {
      clear -n @Airplane2
      drawfill -nr @Airplane2 16737792 1 0 0
      if ($hget(Airplane2,Detail) == High) drawcopy -n @Air2_Buf2 0 $hget(Airplane2,ScrollH) 400 400 @Airplane2 0 0
      if ($hget(Airplane2,Detail) == High) drawtext -rn @Airplane2 6704128 verdana 40 $calc(200 - ($width(PAUSE,verdana,40) / 2)) $calc(202 - ($height(PAUSE,verdana,40) / 2)) PAUSE
      drawtext -rn @Airplane2 16777215 verdana 40 $calc(200 - ($width(PAUSE,verdana,40) / 2)) $calc(200 - ($height(PAUSE,verdana,40) / 2)) PAUSE
      if ($hget(Airplane2,Detail) == High) drawtext -nr @Airplane2 6704128 verdana 20 $calc(200 - ($width(Main Menu,verdana,20) / 2)) 352 Main Menu
      drawtext -nr @Airplane2 16777215 verdana 20 $calc(200 - ($width(Main Menu,verdana,20) / 2)) 350 Main Menu
      if ($inrect($mouse.x,$mouse.y,100,349,200,30)) {
        if ($hget(Airplane2,Detail) == High) drawrect -nr @Airplane2 6704128 2 100 351 200 30
        drawrect -nr @Airplane2 16777215 2 100 349 200 30
      }
      drawdot @Airplane2
      titlebar @Airplane2 - PAUSED
      .timer -mh 1 0 Airplane2.loop
    }
  }
}
on *:KEYDOWN:@Airplane2:32,37,38,39,40,8,32: {
  if ($keyval == 8) {
    hadd Airplane2 Pause $iif($hget(Airplane2,Pause) == True, False, True)
    if ($hget(Airplane2,pause) == false) {
      if ($hget(Airplane2,Detail) == High) && ($hget(Airplane2,mscstat) == on) .splay -p resume
    }
    elseif ($hget(Airplane2,pause) == true) {
      if ($hget(Airplane2,Detail) == High) && ($hget(Airplane2,mscstat) == on) .splay -p pause
    }
  }
  elseif ($keyval != 112) && ($hget(Airplane2,Pause) != True) {
    var %k = $keyval
    hadd Airplane2 Keys $addtok($hget(Airplane2,Keys),%k,32)
  }
}
on *:KEYUP:@Airplane2:*: {
  var %k = $keyval
  hadd Airplane2 Keys $remtok($hget(Airplane2,Keys),%k,32)
}
on *:CLOSE:@Airplane2: {
  if ($hget(Airplane2,Detail) == High) && ($hget(Airplane2,mscstat) == on) .splay stop
  hfree -w Airplane2
  window -c @Air2_buf
  window -c @Air2_buf2
  window -c @Air2_buf3
}
menu @Airplane2 {
  uclick: { 
    if ($hget(Airplane2,Level) == Options) { 
      if ($inrect($mouse.x,$mouse.y,100,149,200,30)) {
        hadd Airplane2 Detail $iif($hget(Airplane2,Detail) == High, Low, High)
        if ($hget(Airplane2,Detail) == High) && ($hget(Airplane2,mscstat) == on) { 
          :song2
          var %song $+(",$scriptdir,song,$r(0,$findfile($scriptdir,song*.mp3,0)),.mp3,")
          if ($exists(%song)) .splay -p %song
          else goto song2
        }
        if ($hget(Airplane2,Detail) == High) && ($hget(Airplane2,Mscstat) == On) {
          :song3
          var %song $+(",$scriptdir,song,$r(0,$findfile($scriptdir,song*.mp3,0)),.mp3,")
          if ($exists(%song)) .splay -p %song
          else goto song3
        }
        else {
          .splay stop
        }
      }
      elseif ($inrect($mouse.x,$mouse.y,100,199,200,30)) && ($hget(Airplane2,Detail) == High) {
        hadd Airplane2 Mscstat $iif($hget(Airplane2,Mscstat) == On, Off, On)
        if ($hget(Airplane2,Mscstat) == On) {
          :song4
          var %song $+(",$scriptdir,song,$r(0,$findfile($scriptdir,song*.mp3,0)),.mp3,")
          if ($exists(%song)) .splay -p %song
          else goto song4
        }
        else {
          .splay stop
        }
      }
      elseif ($inrect($mouse.x,$mouse.y,100,349,200,30)) {
        hadd Airplane2 Level 0
      }
    }
    elseif ($hget(Airplane2,Level) == 0) {
      if ($inrect($mouse.x,$mouse.y,100,162,200,52)) {
        hadd Airplane2 Level 1
        hdel Airplane2 en.bullets
        hdel Airplane2 explosions
        hdel Airplane2 me.bullets
        hdel Airplane2 hpowerup
        hadd Airplane2 me.x 200 
        hadd Airplane2 me.y 350 
        hadd Airplane2 me.hp 100
        var %i 1
        while (%i <= 10) { 
          hadd Airplane2 enem. $+ %i $r(20,374) - $+ $r(100,400) 
          inc %i
        }
        hadd Airplane2 enem_max 10
        hadd Airplane2 time $ctime
      }
      elseif ($inrect($mouse.x,$mouse.y,100,220,200,52)) {
        hadd Airplane2 crdt.msg Airplane 2:Created by Foshizzle:-Graphics-:Created by Ari Feldman:AND:Foshizzle:Music by Many, Thanks!:Thanks to Testers!:—
        hadd Airplane2 crdt.msgnum 1
        hadd Airplane2 crdt.height 445
        hadd Airplane2 Level Credits
      }
      elseif ($inrect($mouse.x,$mouse.y,100,282,200,52)) {
        hadd Airplane2 Level Options
      }
      elseif ($inrect($mouse.x,$mouse.y,100,340,200,52)) {
        if ($hget(Airplane2,Detail) == High) && ($hget(Airplane2,mscstat) == on) .splay stop
        hfree Airplane2
        window -c @Airplane2
        window -c @Air2_buf
        window -c @Air2_buf2
        window -c @Air2_buf3
      }
    }
    elseif ($hget(Airplane2,Pause) == True) {
      if ($inrect($mouse.x,$mouse.y,100,350,200,30)) {
        hadd Airplane2 Pause false
        :song5
        var %song $+(",$scriptdir,song,$r(0,$findfile($scriptdir,song*.mp3,0)),.mp3,")
        if ($exists(%song)) .splay -p %song
        else goto song5
        hadd Airplane2 Level 0
      }
    }
    elseif ($hget(Airplane2,me.hp) <= 0 || $hget(Airplane2,Level) > 10) {
      hadd Airplane2 Level 0
    }
  }
}
on *:MP3END: {
  if ($hget(Airplane2,Detail) == High) && ($hget(Airplane2,mscstat) == on) {
    :song0
    var %song $r(0,$findfile($scriptdir,song*.mp3,0))
    if ($exists($+(",$scriptdir,Song,%song,.mp3,"))) && (%song !iswm $filename) {
      .splay -qp $+(",$scriptdir,Song,%song,.mp3,")
    }
    else { 
      goto song0
    }
  }
}
