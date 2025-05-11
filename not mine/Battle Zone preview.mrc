; Battle Zone preview
; Atari 1980 remake by StanZ -Sept 2006-
;
; /bz [windowed]
; /bz a or sumthing [Fullscreen] Just get the *file* and put this into the script directory.
; *fullscreen.dll* by Str3iber [http://picwin.scriptsdb.org/comments.php?id=127]
; 
; Use the arrow keys
; Space bar = shot
; ESC = exit
;
; Greetings to
; Epsilon, Zerg, kenji, ToKeN, visionz, loele, Str3iber, Averell
; crosbow, Ättilä Fuck you!! =D hum <3
; sax, BigBezus, BombStrike, Hawkee, Zmodem and QuickStep
; Hip hop to remakes.org
;
alias -l vv {
  inc %i
  if (%i > 62) set %i 1
  tokenize 32 $hget(D,%i) | drawline -nr @aa 46080 1 $1-16 | drawline -nr @aa 46080 1 $17-28 | drawline -nr @aa 46080 1 $29-38 | drawline -nr @aa 46080 1 $39-48 | drawline -nr @aa 46080 1 $49-76 | drawline -nr @aa 46080 1 $77-96 | drawline -nr @aa 46080 1 $97-110 | drawline -nr @aa 46080 1 $111-120 | drawline -nr @aa 46080 1 $121-130 | drawline -nr @aa 46080 1 $131-144 | drawline -nr @aa 46080 1 $145- | drawdot -nr @aa 13500290 1 $1-
}
alias -l " set %. %. $1- $1-2 | hadd D %q %. | unset %è
alias bz {
  hmake D 120 | set %a 62
  while %a {
    unset %. %è | inc %9 .1 | inc %q | ' -405 75 | ' -305 75 | ' -260 60 | ' -285 45 | ' -260 20 | ' -305 5 | ' -405 5 | " %è | ' -360 60 | ' -330 60 | ' -360 42 | ' -330 25 | ' -360 25 | " %è | ' -260 5 | ' -185 75 | ' -110 5 | ' -190 20 | " %è | ' -210 35 | ' -185 50 | ' -160 35 | ' -185 40 | " %è | ' -160 75 | ' -160 60 | ' -85 60 | ' -60 5 | ' -35 60 | ' 35 60 | ' 65 10 | ' 85 60 | ' 160 60 | ' 160 5 | ' 285 5 | ' 210 25 | ' 210 75 | " %è | unset %è
    ' 285 75 | ' 285 5 | ' 405 15 | ' 330 25 | ' 335 35 | ' 380 45 | ' 330 50 | ' 335 60 | ' 405 65 | " %è | ' -380 -5 | ' -185 -5 | ' -280 -60 | ' -185 -75 | ' -380 -75 | ' -280 -25 | " %è | ' -185 -5 | ' -35 -5 | ' -35 -75 | ' -185 -75 | " %è | ' -135 -25 | ' -85 -25 | ' -85 -55 | ' -135 -55 | " %è | ' -10 -5 | ' 135 -40 | ' 185 -5 | ' 185 -75 | ' 35 -40 | ' -10 -70 | " %è | ' 185 -5 | ' 310 -15 | ' 230 -25 | ' 230 -30 | ' 280 -40 | ' 235 -50 | ' 235 -55 | ' 305 -65 | ' 185 -75 | " %è | dec %a
  }
  vo $1
}
alias -l ' set %z 800 - $1 * $sin(%9) | set %è %è $or($calc(456*$1 *$cos(%9)/(%z)+320)) $or($calc(-656*$2 /(%z)+240))
alias -l vo {
  unset %9 %q %. | var %x 0,%y 0,%o 0,%oo 0,%z 0,%h $pi,%° %h,%c drawdot -r @aa,%w window -pdfhnB +d,%f close -@,%g drawline -r @aa,%q %g 25600 0,%| %g 180 0 | %w @aa 0 0 320 200 | %w @b 0 0 1070 680
  while %z < 211 {
    %c 0 999 0 0 | inc %z 2 | inc %o .1
    if (%o > 3.5) set %o 0
    if (%z < 175) %c $rgb(0,$calc(255-28*%o),0) 0 $calc(75+15*$cos(%o)) $calc(110-44*$sin(%o))
    inc %oo .09 | if (%oo > 3.5) set %oo 0
    if (%z < 233) %c $rgb(0,$calc(255-32*%oo),0) 0 $calc(75+12*$cos(%oo)) $calc(110-34*$sin(%oo))
    inc %h .1 | if (%h > 3.5) set %h 0
    if (%z < 210) %c $rgb(0,$calc(255-32*%h),0) 0 $calc(115-20*$cos(%h)) $calc(110-50*$sin(%h))
    inc %° .11 | if (%° > 3.5) set %° 0
    if (%z < 159) %c $rgb(0,$calc(255-28*%°),0) 0 $calc(105-10*$cos(%°)) $calc(110-30*$sin(%°))
    drawdot -ri @aa 0 999 0 0
    if %x > 12 { set %x 0 | inc %y 82 }
    drawcopy @aa 57 57 82 82 @b $calc(82*%x) %y | inc %x
  }
  drawsave -b8 @b volc.bmp | %f @aa | %f @b | %w @aa 0 0 3941 101 | drawfill -r @aa 0 0 10 10
  %q 0 100 9999 100 | %q 50 100 100 70 120 80 110 90 100 70 110 90 75 85 110 90 120 80 140 80 170 100 140 80 200 100 | %q 280 100 320 80 335 100 320 80 340 60 355 100 340 60 370 100 355 80 370 55 390 80 410 50 430 100 410 50 445 100 431 80 450 65 540 100
  %q 650 100 730 80 770 80 900 100 | %q 860 94 890 75 900 100 950 50 980 80 | %q 970 100 1004 30 1009 35 1013 30 1018 35 1022 30 1055 100 1100 58 1140 100 1100 58 1170 100 | %q 1140 82 1165 58 1220 100 1190 77 1225 65 1240 100 1225 65 1280 100 | %q 1400 100 1520 75 1555 100 1535 86 1570 55 1595 78 1585 85 1595 78 1626 55 1645 55 1660 76 1626 55 1660 76 1625 100 1700 48 1752 100 1732 80 1770 100 1732 80 1700 48 1750 70 1870 100
  %g 65280 0 1889 40 1896 39 1902 35 1906 32 1909 28 1911 25 1913 22 1913 16 1913 14 1909 1 | %g 38400 0 1902 35 1911 35 1911 31 1906 28 | %g 38400 0 1913 16 1920 13 | %q 1940 100 1970 65 1995 100 1970 65 2040 100 1970 65 1990 75 2020 50 2040 70 2120 100 2020 50 2120 100 2220 70 2300 100
  %c 47360 0 1940 100 1970 65 1995 100 2040 100 1990 75 2020 50 2040 70 2120 100 2220 70 2300 100 1400 100 1520 75 1555 100 1535 86 1570 55 1595 78 1585 85 1626 55 1645 55  1660 76 1625 100 1700 48 1752 100 1732 80 1770 100 1750 70 1870 100 280 100 320 80 335 100 340 60 355 100 370 100 355 80 370 55 390 80 410 50 430 100 445 100 431 80 450 65 540 100 50 100 100 70 120 80 110 90 75 85 140 80 170 100 200 100 1140 82 1165 58 1220 100 1190 77 1225 65 1240 100 1280 100 650 100 730 80 770 80 900 100 860 94 890 75 950 50 980 80 970 100 1004 30 1055 100 1100 58 1140 100 1022 30 1170 100
  var %i 0,%j 13
  while %i < 16 { set %4 30 * %i | %g $iif(%i > 9,65280,25600) 0 $calc(1900+22*$cos($calc(30+%4)).deg) $calc(22+22*$sin($calc(30+%4)).deg) $calc(1900+22*$cos(%4).deg) $calc(22+22*$sin(%4).deg) | inc %i }
  while %j { %c 47360 0 $calc(1900+22*$cos($calc(30*%j)).deg) $calc(22+22*$sin($calc(30*%j)).deg) | dec %j }
  drawcopy @aa 0 0 641 101 @aa 2300 0 | drawsave -b8 @aa bg.bmp | %f @aa | %w @aa 0 0 620 200 | drawfill -r @aa 0 0 10 10 | %| 389 19 394 24 416 24 420 20 397 14 393 18 389 19 | %| 404 16 417 16 417 18 413 18 | %c 7894015 0 389 19 394 24 416 24 420 20 397 14 393 18 404 16 417 16 417 18 413 18 | drawcopy @aa 385 0 40 30 @aa 423 0 | drawcopy @aa 385 0 40 30 @aa 461 0
  %| 398 33 389 33 389 40 398 40 398 47 389 47 | %| 411 33 402 33 402 47 411 47 | %| 415 33 423 33 423 47 415 47 415 33 | %| 428 47 428 33 436 33 436 40 429 40 436 47 | %| 449 33 441 33 441 47 449 47 441 47 441 40 448 40 | %c 7894015 0 398 33 389 33 389 40 398 40 398 47 389 47 411 33 402 33 402 47 411 47 415 33 423 33 423 47 415 47 428 47 428 33 436 33 436 40 429 40 436 47 449 33 441 33 441 47 449 47 448 40
  %| 389 64 389 71 389 68 393 68 393 64 393 71 | %| 395 64 399 64 397 64 397 71 395 71 399 71 | %| 406 66 406 64 401 64 401 71 406 71 406 69 404 69 | %| 408 64 408 71 408 68 412 68 412 71 412 64 | %c 7894015 0 389 64 389 71 393 64 393 71 393 68 389 68 395 64 399 64  395 71 399 71 406 66 406 64 401 64 401 71 406 71 406 69 404 69 408 64 408 71 408 68 412 68 412 71 412 64
  %| 427 64 423 64 423 68 427 68 427 71 423 71 | %| 433 64 429 64 429 71 433 71 | %| 435 64 440 64 440 71 435 71  435 64 | %| 442 71 442 64 446 64 446 68 442 68 446 71 | %| 452 64 448 64 448 71 452 71 448 71 448 68 450 68 | %c 7894015 0 427 64 423 64 423 68 427 68 427 71 423 71 433 64 429 64 429 71 433 71 435 64 440 64 440 71 435 71 442 71 442 64 446 64 446 68 442 68 446 71 452 64 448 64 448 71 452 71 450 68
  %| 319 9 319 14 | %| 319 85 319 90 | %| 281 50 286 50 | %| 352 50 357 50 | %g 215 0 319 49 319 52 | %c 7894015 0 319 9 319 14 319 85 319 90 281 50 286 50 352 50 357 50 | %w @i 0 0 217 83 | drawfill -r @i 0 0 10 10 | drawcopy -i @aa 280 0 640 200 @i 0 -8 | drawsave -b16 @i count.bmp | %f @i | %f @aa | drawpic -c | mot $1
}
alias -l mot {

  if (!$1) window -pCdoBf @aa 0 0 640 480
  else window -pdoBfC +t @aa 0 0 640 480
  drawdot -nr @aa 0 999 0 0
  if ($exists($scriptdirfullscreen.dll) && $1) { fs Fullscreen $window(@aa).hwnd > 640 > 480 > 16 > 60 | fs HideMouse }
  %up = 1 | %ù = 2048 | var %s drawrect -nrf @aa %ù 0 | set %gg -.5 | %% = 526344 | %% = 2 | %%% = 0

  %angle = -72 | %O.x = -117 | %O.y = 277 | %upz = .

  %mmm = -60 | %up = 0 | %dw = 0 | %ri = 0 | %lf = 0 | %anglepas = 2 | %pas = 3 | %= = 0

  drawdot -nr @aa 0 999 0 0 | %s 198 78 45 45 | %s 358 78 45 45 | %s 78 38 45 45 | %s 438 278 45 45 | %s 158 318 45 45 | %s 278 318 45 45 | window -pdkBfnh @b 0 0 640 480 | drawcopy -n @aa 0 0 800 600 @b 0 0 | %ri = 1 | %up = 1 | %ds = .05 | %nn = 0 | %bb = 0 | set %z 0 | %tira = 0 | %tir = 0 | %us = 0 | %a11 = %a1 | %a22 = %a2 | %shotX = 0 | %vectX = %O.x | %shotY = 0 | %vectY = %O.y | %angleV = %angle | %sho = 0
  drawpic -c | .timerh -m 1 40 dd | .timera 0 0 r
}
alias -l dd set %ri 0 | set %up 1 | .timerh 1 0 set %up 0
alias -l r {
  drawdot -nr @aa 0 405 320 240 | set %an 330 - %u | set %ana 390 - %u | inc %a .01 | set %Tc $cos(%a) | set %Ts $sin(%a)
  set %Tcc $cos(%DANGLE) | set %Tss $sin(%DANGLE) | set %mmX 7 * %Ts | set %mmY $calc(.5+1.1*%Tc) | set %TankOx $calc(320-40*%mmX) | set %TankOy $calc(200+40*%mmY) | drawdot -nri @b %ù 25 %TankOx %TankOy
  if $getdot(@b,$calc(320+%O.x),$calc(200+%O.y) = 16775167) { dec %a .01 | goto v }
  set %Dx %TankOLDx - %TankOx | set %Dy %TankOLDy - %TankOy | set %TankOLDx %TankOx | set %TankOLDy %TankOy
  if (%Dx > 0) set %DANGLE $atan($calc(%Dy /%Dx))
  else set %DANGLE 3.14 + $atan($calc(%Dy /%Dx))
  :v
  if %up {
    inc %O.x %a1 | inc %O.y %a2
    if $getdot(@b,$calc(320+%O.x),$calc(200+%O.y)) = %ù { dec %O.x %a1 | dec %O.y %a2 }
    if $getdot(@b,$calc(320+%O.x),$calc(200+%O.y)) = 16775167 { dec %O.x %a1 | dec %O.y %a2 }
    set %Xcam 320 + %O.x | set %Ycam 200 + %O.y
  }
  elseif %dw {
    dec %O.x %a1 | dec %O.y %a2
    if $getdot(@b,$calc(320+%O.x),$calc(200+%O.y)) = %ù { inc %O.x %a1 | inc %O.y %a2 }
    set %Xcam 320 + %O.x | set %Ycam 200 + %O.y
  }
  if %lf {
    if (!%angle) set %z 0
    dec %angle %anglepas
    if (%angle = -360) set %angle 0
    set %a1 %pas * $cos(%angle).deg | set %a2 %pas * $sin(%angle).deg | set %u %z - %angle | set %uu %u + 450 | set %s2 $sin(%uu).deg | set %c2 $cos(%uu).deg
  }
  elseif %ri {
    if (!%angle) set %z 360
    inc %angle %anglepas
    if (%angle = 360) set %angle 0
    set %a1 %pas * $cos(%angle).deg | set %a2 %pas * $sin(%angle).deg | set %u %z - %angle | set %uu %u + 450 | set %s2 $sin(%uu).deg | set %c2 $cos(%uu).deg
  }
  drawpic -cn @aa 0 140 $or($calc(2300-6.4*%u)) 0 641 101 bg.bmp
  if %u isnum 180-310 {
    inc %nn 82
    if %nn > 1066 {
      set %nn 246 | inc %bb 82
      if (%bb > 656) set %bb -82
    }
    drawpic -cin @aa $calc(-1320+6.4*%u) 117 %nn %bb 82 82 volc.bmp
  }
  poly 6.2 -1 -3.4 4.8 -1 -3.4 5.8 1 -3 5.2 1 -3 6 .5 -3.7 5 .5 -3.7 6 1 -4 5 1 -4 | cube 3 0 -2 2 0 -2 3 0 -3 2 0 -3 | cube -1 0 -2 -2 0 -2 -1 0 -3 -2 0 -3 | fLa 999 1 -1 -999 1 -1 | fLa 999 1 2 -999 1 2 | tri -3 1 2 -4 1 2 -3.5 1 3 -3.5 0 2.3 | tri 4 1 3 3 1 3 3.5 1 4 3.5 0 3.3 | cube 1 1 3 0 1 3 1 1 4 0 1 4 | inc %mmm .5
  if (%mmm > 70) set %mmm -70
  plane 5.1 -.8 .2 3.5 -.8 .2 5.1 -.8 .8 3.5 -.8 .8 4.7 -1 .48 3.5 -1 .3 4.7 -1 .48 3.5 -1 .72 | aile 4. -.9 .2 3.8 -.9 .2 4. -.9 -.3 3.8 -.9 -.1 4. -.9 .8 3.8 -.9 .8 4. -.9 1.3 3.8 -.9 1.1 | cup 3.5 -1 .5 3.62 -1 .5 3.5 -1.25 .5 | tank .5 1 -.35 -.5 1 -.35 .5 1 .35 -.5 1 .35 .6 .8 -.55 -.6 .8 -.55 .6 .8 .55 -.6 .8 .55 .3 .7 -.35 -.4 .7 -.35 .3 .7 .35 -.4 .7 .35 -.25 .5 -.35 -.25 .5 .35 .6 .61 .04 .6 .56 .04 .6 .61 -.02 .6 .56 -.02 .05 .61 .04 -.075 .56 .04 .05 .61 -.02 -.075 .56 -.02
  if (!%tankoff) antenne -.25 .5 0 -.25 .45 0 -.25 .45 .07 -.25 .45 -.07 -.25 .34 .07 -.25 .34 -.07 -.15 .37 -.13 -.15 .42 -.13 -.15 .37 .13 -.15 .42 .13
  if %dd isnum 275-365 { set %cible 1 | drawtext -nr @aa 170 terminal 10 100 47 ENEMY IN RANGE }
  else unset %cible
  if %p & 2 {
    if %cible { drawrect -nr @aa 48640 0 320 140 1 60 320 280 1 60 | drawline -nr @aa 48640 0 280 200 297 217 280 200 360 200 343 217 | drawline -nr @aa 48640 0 280 280 297 263 280 280 360 280 343 263 | drawdot -nr @aa 6618980 0 280 280 320 280 360 280 280 200 320 200 360 200 }
    else { drawrect -nr @aa 48640 0 320 140 1 60 320 280 1 60 280 200 80 1 280 280 80 1 280 200 1 17 360 200 1 17 280 263 1 17 360 263 1 17 | drawdot -nr @aa 6618980 0 280 280 320 280 360 280 280 200 320 200 360 200 }
  }
  drawpic -cni @aa 280 8 count.bmp | set %p $ticks / 300 | drawline -nr @aa 200 0 319 50 $calc(319+34*$cos(%p)) $calc(50+34*$sin(%p)) 319 50 $calc(319+34*$cos(%an).deg) $calc(50+34*$sin(%an).deg) 319 50 $calc(319+34*$cos(%ana).deg) $calc(50+34*$sin(%ana).deg)
  if (412 isin $ticks) set %ton 1
  if %ton {
    inc %clr
    if %clr = 10 { set %s $r(100,540) | set %t %s + $r(0,100) | set %n %t - $r(0,99) | set %k %n + $r(0,99) | set %j %k - $r(0,99) | drawdot -nrfi @aa 16732415 405 320 240 }
    elseif (%clr = 20) drawline -nr @aa 720650 0 %s 0 %t 50
    elseif (%clr = 30) drawline -nr @aa 720650 0 %s 0 %t 50 %n 100 %k 150
    elseif %clr = 40 { drawline -nr @aa 720650 0 %s 0 %t 50 %n 100 %k 150 %j 200 | unset %clr %ton }
  }
  if $calc($ticks -%=) > 999 { set %° ( $+ %ƒ $+ ) | set %= $ticks | unset %ƒ }
  inc %ƒ | drawtext -nr @aa 155 terminal 10 70 47 %°
  if %tir {
    if %sho = 0 { %a11 = %a1 | %a22 = %a2 | %vectX = %O.x | %vectY = %O.y }
    set %xS %Xcam | set %yS %Ycam | inc %sho
    if %sho isnum 3-4 { inc %shotX $calc(.5*%a11) | inc %shotY $calc(.5*%a22) }
    elseif %sho isnum 5-15 { inc %shotX %a11 | inc %shotY %a22 }
    elseif %sho isnum 15-20 { inc %shotX $calc(2*%a11) | inc %shotY $calc(2*%a22) }
    else { inc %shotX $calc(4*%a11) | inc %shotY $calc(4*%a22) }
    if ($getdot(@b,$calc(320+%vectX +%shotX),$calc(200+%vectY  +%shotY)) = %ù || $getdot(@b,$calc(320+%vectX +%shotX),$calc(200+%vectY  +%shotY)) = 16775167) {
      %tira = 0 | %tir = 0 | %us = 0 | %a11 = %a1 | %a22 = %a2 | %shotX = 0 | %vectX = %O.x | %shotY = 0 | %vectY = %O.y | %angleV = %angle | %sho = 0
      if ($v1 = 16775167) .timerb 9 0 bli
      goto s
    }
    if %sho > 150 { %tira = 0 | %tir = 0 | %us = 0 | %a11 = %a1 | %a22 = %a2 | %shotX = 0 | %vectX = %O.x | %shotY = 0 | %vectY = %O.y | %angleV = %angle | %sho = 0 }
    set %xS %xCam | set %yS $calc(200+%vectY +%shotY) | set %xS $calc(.05+(8-(%xS /40))) | set %doX $calc(320+%vectX +%shotX) | set %doY $calc(200+%vectY  +%shotY)
    set %XXcam 320 + %O.x | set %YYcam 200 + %O.y | set %xs $calc(.05+(8-(%Xcam /40))) | set %XcamWorld $calc(-.05 +%Xcam /40 -8) | set %ZcamWorld $calc(5 -%Ycam /40)
    set %xs -1 * %XcamWorld | set %dys $calc(((((%doX -%XXcam)^2)+((%doY -%YYcam)^2))^.5 /40)) | set %ys $calc(%dys -2-%ZcamWorld)
    cubeT %xS 0 %yS $calc(%xS -.1) 0 %yS %xS 0 $calc(%yS -.1) $calc(%xS -.1) 0 $calc(%yS -.1)
  }
  :s
  if (%upz) vv
  drawdot -nri @b %ù 25 %TankOx %TankOy | drawdot @aa
}
alias -l bli {
  if !%hj || !%jh { set %hj %Xcam | set %jh %Ycam }
  inc %bd | set %Xcam %Xcam + $sin($r(1,9)) | set %Ycam %Ycam + $cos($r(1,9))
  if %bd > 8 { %Xcam = %hj | %Ycam = %jh | unset %hj %bd %jh }
}
alias -l tank {
  unset %face %b %tankoff | æ $1-3 | æ $4-6 | æ $7-9 | æ $10-12 | æ $13-15 | æ $16-18 | æ $19-21 | æ $22-24 | æ $25-27 | æ $28-30 | æ $31-33 | æ $34-36 | æ $37-39 | æ $40-42 | æ $43-45 | æ $46-48 | æ $49-51 | æ $52-54 | æ $55-57 | æ $58-60 | æ $61-63 | æ $64-
  if (!%b) tankface %face
  else set %tankoff .
}
alias -l tankface drawline -nr @aa 32000 0 $1-4 $7-8 $5-6 $1-2 $9-12 $3-4 $11-12 $15-16 $7-8 $15-16 $13-14 $5-6 $13-14 $9-10 $17-20 $11-12 $19-20 $23-24 $15-16 $23-24 $21-22 $13-14 $21-22 $17-18 $25-26 $19-20 $25-28 $21-22 $27-28 $23-24 | drawline -nr @aa 32000 0 $29-32 $35-36 $33-34 $29-30 $37-40 $31-32 $39-40 $43-44 $35-36 $43-44 $41-42 $33-34 $41-42 $37-38 | drawdot -nr @aa 64000 0 $1-
alias -l æ {
  set %ex $1 *%Tcc + $3 * %Tss - 8 + %Xcam / 40 + %mmX | set %ez $3 * %Tcc - $1 * %Tss + 5- %Ycam / 40 + %mmY
  if ($calc(1+%c2 *(%ez)-(%ex)*%s2) > 0) set %face %face $calc(320+450*(%c2 *(%ex)+(%ez)*%s2)/$v1) $calc(240+450*($2 -.5)/$v1)
  else set %b .
}
alias -l antenne inc %ax .2 | set %Cc $cos(%ax) | set %Ss $sin(%ax) | unset %face %b | æ $1-3 | æ $4-6 | ¢ $7-9 | ¢ $10-12 | ¢ $13-15 | ¢ $16-18 | ¢ $19-21 | ¢ $22-24 | ¢ $25-27 | ¢ $28- | if (!%b) antenneface %face
alias -l antenneface drawline -nr @aa 32000 0 $1-8 $11-12 $9-10 $5-6 $9-16 $7-8 $5-6 $19-20 $17-18 $9-10 | drawdot -nr @aa 64000 0 $1- | set %dd $1
alias -l ¢ {
  set %x' (.25 + $1) * %Cc + $3 * %Ss -.25 | set %z' $3 * %Cc - (.25 + $1) * %Ss | set %ex ( %x' ) * %Tcc + ( %z' ) * %Tss - 8 + %Xcam / 40 + %mmX | set %ez ( %z' ) * %Tcc - ( %x' ) * %Tss + 5 - %Ycam / 40 + %mmY
  if ($calc(1+%c2 *(%ez)-(%ex)*%s2) > 0) set %face %face $calc(320+450*(%c2 *(%ex)+(%ez)*%s2)/$v1) $calc(240+450*($2 -.5)/$v1)
  else set %b .
}
alias -l plane unset %face %b %plane | ± $1-3 | ± $4-6 | ± $7-9 | ± $10-12 | ± $13-15 | ± $16-18 | ± $19-21 | ± $22- | if (!%b) p %face
alias -l p drawline -nr @aa 32000 0 $1-4 $7-8 $5-6 $1-2 $9-12 $3-4 $11-12 $15-16 $7-8 $15-16 $13-14 $5-6 $13-14 $9-10 | set %plane $1-
alias -l aile unset %face %b | ± $1-3 | ± $4-6 | ± $7-9 | ± $10-12 | ± $13-15 | ± $16-18 | ± $19-21 | ± $22- | if (!%b) a %face
alias -l a drawline -nr @aa 32000 0 $1-4 $7-8 $5-6 $1-2 | drawline -nr @aa 32000 0 $9-12 $15- $13-14 $9-10 | set %plane %plane $1-
alias -l cup unset %face %b | ± $1-3 | ± $4-6 | ± $7- | if (!%b) c %face
alias -l c drawline -nr @aa 32000 0 $1-4 $7- $5-6 $1-2 | drawdot -nr @aa 64000 0 $1- %plane
alias -l ± {
  set %ex $1 -8+%Xcam /40 +%mmm | set %ez $3 +5-%Ycam /40
  if ($calc(1+%c2 *(%ez)-(%ex)*%s2) > 0) set %face %face $calc(320+450*(%c2 *(%ex)+(%ez)*%s2)/$v1) $calc(240+450*$2 /$v1)
  else set %b .
}
alias -l poly unset %face %b | º $1-3 | º $4-6 | º $7-9 | º $10-12 | º $13-15 | º $16-18 | º $19-21 | º $22- | if (!%b) polyfac %face
alias -l polyfac drawline -nr @aa 32000 0 $1-4 $7-8 $5-6 $13- $7-8 $15- $11-12 $3-4 $11-12 $9-10 $1-2 $5-6 $13-14 $9-10 | drawdot -nr @aa 64000 0 $1-
alias -l tri unset %face %b | º $1-3 | º $4-6 | º $7-9 | º $10- | if (!%b) trifac %face
alias -l trifac drawline -nr @aa 32000 0 $1- $1-2 $5- $3-4 | drawdot -nr @aa 64000 0 $1-
alias -l º {
  set %ex $1 -8+%Xcam /40 | set %ez $3 +5-%Ycam /40
  if ($calc(1+%c2 *(%ez)-(%ex)*%s2) > 0) set %face %face $calc(320+450*(%c2 *(%ex)+(%ez)*%s2)/$v1) $calc(240+450*($2 -.5)/$v1)
  else set %b .
}
alias -l cube unset %face %b | ÷ $1-3 | ÷ $4-6 | ÷ $7-9 | ÷ $10- | if (!%b) e %face
alias -l e tokenize 32 $1- $1 $calc(480-$2) $3 $calc(480-$4) $7 $calc(480-$8) $5 $calc(480-$6) | drawline -nr @aa 32000 0 $1-4 $7-8 $5-6 $15- $13-14 $11-12 $9-10 $1-2 $5-6 $15- $9-12 $3-4 $7-8 $13-14 | drawdot -nr @aa 64000 0 $1-
alias -l ÷ {
  set %ex $1 -8+%Xcam /40 | set %ez $3 +5-%Ycam /40
  if ($calc(1+%c2 *(%ez)-(%ex)*%s2) > 0) set %face %face $calc(320+450*(%c2 *(%ex)+(%ez)*%s2)/$v1) $calc(240-225/$v1)
  else set %b .
}
alias -l fLa {
  set %exA $1 -8+%Xcam /40 | set %ezA $3 +5-%Ycam /40 | set %exB $4 -8+%Xcam /40 | set %ezB $6 +5-%Ycam /40 | set %dA $calc(1+%c2 *(%ezA)-(%exA)*%s2) | set %dB $calc(1+%c2 *(%ezB)-(%exB)*%s2)
  if (%dA < 0 && %dB < 0) return
  if (%dA > 0) set %PA $calc(320+450*(%c2 *(%exA)+(%ezA)*%s2)/%dA) $calc(240+225/%dA)
  else { set %f %dB /(%dB -%dA) | set %PA $calc(99999*(%c2 *(%exB +(%exA -(%exB))*%f)+(%ezB +(%ezA -(%ezB))*%f)*%s2)) 50000 }
  if (%dB > 0) set %PB $calc(320+450*(%c2 *(%exB)+(%ezB)*%s2)/%dB) $calc(240+225/%dB)
  else { set %f %dA /(%dA -%dB) | set %PB $calc(99999*(%c2 *(%exA +(%exB -(%exA))*%f)+(%ezA +(%ezB -(%ezA))*%f)*%s2)) 50000 }
  drawline -nr @aa 25600 0 %PA %PB
}
alias -l cubeT unset %face %b | roT $1-3 | roT $4-6 | roT $7-9 | roT $10- | if (!%b) T %face
alias -l T tokenize 32 $1- $1 $calc(480-$2) $3 $calc(480-$4) $7 $calc(480-$8) $5 $calc(480-$6) | drawline -nr @aa 32000 0 $1-4 $7-8 $5-6 $15-16 $13-14 $11-12 $9-10 $1-2 $5-6 $15-16 $9-12 $3-4 $7-8 $13-14 | drawdot -nr @aa 64000 0 $1-
alias -l roT {
  if (%ri = 1) dec %us .01
  elseif (%lf = 1) inc %us .01
  set %s2a %us | set %c2a 1 | set %ex $1 -8+%Xcam /40 | set %ez $3 +5-%Ycam /40
  if ($calc(1+%c2a *(%ez)-(%ex)*%s2a) >= 0) set %face %face $calc(320+450*(%c2a *(%ex)+(%ez)*%s2a)/$v1) $calc(240+450*(.05)/$v1)
  else set %b .
}
on *:close:@aa:d
on *:keydown:@aa:37:set %lf 1
on *:keydown:@aa:38:unset %upz | set %up 1
on *:keydown:@aa:39:set %ri 1
on *:keydown:@aa:40:set %dw 1
on *:keydown:@aa:32:set %tir 1 | unset %tira
on *:keydown:@aa:13:.timera -p
on *:keydown:@aa:27:d
on *:keyup:@aa:37:unset %lf
on *:keyup:@aa:38:unset %up
on *:keyup:@aa:39:unset %ri
on *:keyup:@aa:40:unset %dw
on *:keyup:@aa:32:set %tira 1
on *:keyup:@aa:13:.timera -r
alias -l fs dll $+(",$scriptdir\,fullscreen.dll,") $1-
alias -l d .timera off | close -@ @aa | hfree D | unset %4 %ù %gg %% %%% %angle %O.x %O.y %mmm %anglepas %pas %= %ds %nn %bb %z %tir %us %a11 %a22 %shotX %vectX %shotY %vectY %angleV %sho %an %ana %a %dw %ri %Tc %Ts %Tcc %Tss %mmX %mmY %TankOx %TankOy %Dx %Dy %TankOLDx %TankOLDy %DANGLE %Xcam %Ycam %a1 %a2 %u %uu %s2 %c2 %ex %ez %exA %ezA %exB %ezB %dA %dB %f %PA %PB %ax %Cc %Ss %x' %z' %dd %p %° %i %xS %yS %doX %doY %XXcam %YYcam %XcamWorld %ZcamWorld %dys %s2a %c2a %cible %tira %ƒ %plane %face %upz %lf %up %b %ton %clr %s %t %n %k %j %tankoff %hj %bd %jh | .remove bg.bmp | .remove count.bmp | .remove volc.bmp | if $exists($scriptdirfullscreen.dll) { fs Reset | fs ShowMouse }
