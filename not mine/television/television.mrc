; purple television - StanZ 2004 - SDB version 2005
menu status,menubar {
  .-
  $iif($window(@ܣ),,> Purple television)
  .>> Run / Lancer
  ..>>> PPT1 TV:em
  ..-
  .>> Unload / Décharger
  ..>>> Ok:unload -rs $+(",$script,")
  -
}
alias -l ga {
  inc %dd .5 | drawcopy @£Ü 0 %dd 320 200 @ܣ 0 0
  if (%dd < 849) .timer 1 0 ga
  else { %dd = 256 | %¤ 1 1 %¤ 255 0 oo }
}
alias -l zk {
  drawdot -nr @ܣ 5263360 200 160 100 | inc %a | dec %d 2 | %/ 0 impact 40 $calc(377+%d) 79 %ç | %/ 0 impact 40 $calc(375+%d) 77 %ç | %/ 0 impact 40 $calc(373+%d) 77 %ç | %/ 0 impact 40 $calc(372+%d) 80 %ç | %/ 0 impact 40 $calc(373+%d) 82 %ç | %/ 0 impact 40 $calc(376+%d) 82 %ç | set %o 40 | set %p 40
  while %o { set %% 80 + %o | drawline -nri @ܣ $calc(1642560+55*$cos($calc(7*%o +16*%a)).deg) 5 0 %% 320 %% | dec %o 5 }
  %/ 0 impact 40 $calc(375+%d) 80 %ç
  while %p { set %% 80 + %p | drawline -nri @ܣ $calc(1642560+55*$cos($calc(7*%p +16*%a)).deg) 5 0 %% 320 %% | dec %p 5 }
  if %ë = 1 || %tr = 1 {
    set %i 318 | set %j 138
    while %i { %\ 0 $calc(50*$cos($calc(1.5*%i +12*%a)).deg) %i 35 3 137 | dec %i 3 }
    while %j { %\ $calc(25*$sin($calc(1.5*%j +6*%a)).deg) 0 0 $calc(32+%j) 320 3 | dec %j 3 }
  }
  drawcopy @ܣ 27 0 270 200 @ܣ 0 0 320 200
  if %a = 1300 && %ë = 1 { %¤ 1800 0 fm }
  elseif %a = 540 && %ë = 2 { qp }
  elseif %a = 600 && %ë = 3 { pq }
}
alias -l oo dec %dd | %/ $rgb(%dd,%dd,%dd) impact 20 51 85 $hget(Tk,64) | %/ $rgb(%dd,%dd,%dd) impact 20 69 107 $hget(Tk,65) | drawdot @ܣ | if (%dd = 1) die
on 1:KEYDOWN:@ܣ:*:if $keyval = 27 || $keychar = $chr(27) { die }
alias -l fs dll $+(",$scriptdir,fullscreen.dll,") $1-
alias -l sound %µ = $+(",$scriptdir,fmod_mIRC.dll,") | if $è(FMOD_Connect,$scriptdirfmod.dll) { if $è(SOUND_Init,22050 2 0) { } } | var %a $è(SOUND_Sample_Load,2 $+(",$scriptdir,ATARI ST GROOVE.ogg,") 2),%a $è(SOUND_PlaySound,2 1)
alias -l è return $dll(%µ,$1,$2-)
alias -l ha inc %v | drawtext -r @ܣ 3276850 terminal 8 $calc(78+50*$cos($calc(45*%v)).deg) $calc(20+45*$cos($calc(9*%v)).deg) $hget(Tk,1) | drawtext -r @ܣ $rgb($r(195,255),$r(0,25),$r(204,255)) terminal 8 $calc(79+50*$cos($calc(45*%v)).deg) $calc(19+45*$cos($calc(9*%v)).deg) $hget(Tk,1)
on *:close:@ܣ:.timera* off | fs Reset | fs ShowMouse | if (%µ) dll -u %µ | die
alias -l die .timera* off | window -c @ܣ | window -c @ÜE | window -c @ka | window -c @ÜE | window -c @£Ü | unset %fa %ve %v %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %{ %@ %rt %m %& %ë %ñ %® %d %ç %o %p %% %j %° %" %' %à %n %f %q %^ %x %z %~ %za %sh %s %tr %a %i %b %a1 %b1 %uo %¨ %. %g %dd %kb %bu %u %k %l %c %dd %\ %/ %§ %¤ | if $è(SOUND_Close,0) { } | if ($hget(K,1)) hfree K | if ($hget(D,1)) hfree D | if ($hget(Tk,1)) hfree Tk | if (%µ) dll -u %µ | fs Reset | fs ShowMouse | unset %µ %y %oldx %oldy %ipe %w %ui %mu %nu %tc | dll -u $+(",$scriptdir,fullscreen.dll,")
alias -l ø {
  set %za $calc(($hget(K,$3)-$hget(K,$2))*($hget(D,$1)-$hget(D,$2))-($hget(K,$1)-$hget(K,$2))*($hget(D,$3)-$hget(D,$2)))
  if %za > %fa || %ë = 3 || %ë = 5 {
    inc %~ | set %sh $calc(70+.0035*%za) | set %s $rgb(%sh,%sh,%sh)
    if (%ë = 1) set %s $rgb(0,%sh,0)
    elseif (%ë = 4) set %s $rgb($calc(((%sh -70)*(3+2*$sin(%°).deg))),$calc(.8*%sh),$abs($calc($sin(%°).deg *%sh)))  
    elseif (%ë = 5) set %s $rgb($calc(-60+1.6*%sh),60,$calc(-30+1.6*%sh))
    elseif (%ë = 6) set %s $rgb($calc((60+(%sh -70)*300)+60*$sin($calc(2*%°)).deg),$calc(70+70*$cos($calc(3*%°)).deg),$calc((%sh -70)*450)))
    if (%za < 0) set %s $rgb($calc(2.5*%sh),$calc(1.5*%sh),0)
    if %ë = 5 && %za < 0 { set %s $rgb(105,$calc(1.5*%sh),155) }
    if $6 = 15 && %ë = 4 { set %b -nri | set %s 8248570 }
    else set %b -nr
    if $6 = 15 && %ë = 5 { set %b -nri }
    if %ë = 7 { set %@ @ka | set %rt 0 | set %s $calc(70+.1*%za) }
    rline @ÜE %~ %za drawline -nr %@ %s %rt $hget(K,$1) $hget(D,$1) $hget(K,$2) $hget(D,$2) $hget(K,$3) $hget(D,$3) $hget(K,$1) $hget(D,$1) drawfill %b %@ %s %s $calc(((($hget(K,$3)+$hget(K,$2))/2)+$hget(K,$1))/2) $calc(((($hget(D,$3)+$hget(D,$2))/2)+$hget(D,$1))/2)
  }
}
alias -l mb %/ 0 terminal 8 $calc($2 -1) 1 $3- | %/ $1 terminal 8 $2 0 $3-
alias -l ro {
  var %j 0
  while %j < 52 {
    %i = 320
    while %i { %\ 0 $abs($calc(3*%j *$sin($calc(1200*$sin(%i)+.3*%j)).deg))) %i 0 1 200 | dec %i }
    inc %j | drawdot @ܣ
  }
  dll -u %µ | %¤ 1600 0 mi
}
alias -l jn {
  inc %u | inc %a 4 | inc %b -5 | inc %c 2 | %i = 6
  drawline -nr @ܣ $rgb($calc(130+125*$sin(%a).deg),$calc(130+125*$sin(%b).deg),$calc(130+125*$cos(%c).deg)) 0 0 199 320 199
  %k 0 -1 0 190 320 10 | %k 0 -10 0 0 320 200
  if %u < 1400 {
    set %i 200
    while %i { %\ $calc(15*$sin($calc(%a *$sin(%i)).deg)) 0 0 %i 320 5 | dec %i 5 }
    set %i 320
    while %i { %\ 0 $calc(15*$cos($calc(%a *%i).deg)) %i 0 5 200 | dec %i 5 }
  }
  elseif %u > 3100 && %u < 3600 {
    set %i 320
    while %i { %\ 0 $calc(4*$cos($calc(.23*%a *$cos($calc(.12*%i)).deg).deg)) %i 0 3 200 | dec %i 2 }
  }
  elseif %u > 3600 {
    if %u = 3601 { %a = 57188 | %b = -74685 | %c = 29874 | %d = -144 }
    set %i 320
    while %i { %\ 0 $abs($calc(71*$cos($calc(15 *$sin($calc(.01*%i +.0072*%a)).deg -.01*%i).deg))) %i 0 2 200 | dec %i 2 }
  }
  if %u > 2000 && %u < 3100 {
    set %i 400
    while %i { %\ $calc(10*$sin($calc(.02*%a +.02*%i).deg)) 0 0 %i 640 5 | dec %i 5 }
    set %i 640
    while %i { %\ 0 $calc(10*$cos($calc(.02*%a +.05*%i).deg)) %i 0 5 400 | dec %i 5 }
  }
  if (%u > 1000 && %u < 1300) mb 51200 4 $hget(Tk,4)
  elseif (%u > 1350 && %u < 1750) mb 250 4 $hget(Tk,5)
  elseif (%u > 1800 && %u < 2100) mb 51200 15 $hget(Tk,6)
  elseif %u > 2150 && %u < 2300 { if (%u = 2151) sound | mb 250 11 $hget(Tk,7) }
  elseif (%u > 2350 && %u < 2500) mb 250 9 $hget(Tk,8)
  elseif (%u > 2550 && %u < 2700) mb 51200 30 $hget(Tk,9)
  elseif (%u > 2750 && %u < 3000) mb 51200 36 $hget(Tk,10)
  elseif (%u > 3050 && %u < 3200) mb 250 19 $hget(Tk,11)
  elseif (%u > 3250 && %u < 3500) mb 250 26 $hget(Tk,12)
  elseif (%u > 3550 && %u < 3700) mb 51200 36 $hget(Tk,13)
  elseif (%u > 3750 && %u < 3900) mb 51200 36 $hget(Tk,14)
  elseif (%u > 3950 && %u < 4100) mb 250 5 $hget(Tk,15)
  elseif (%u > 4100) nj
  drawdot @ܣ
}
alias -l nj unset %a %u %l %b %c %k %i | %ç = $hget(Tk,16) | %d = 0 | %a = 0 | %¤ 1300 0 zk
alias -l ov {
  inc %ve 11 | set %uo $calc(1.35 +.35*$sin(%').deg) | set %9 0 0 %uo | set %10 0 0 -%uo | set %11 %uo 0 0 | set %12 -%uo 0 0 | set %13 0 %uo 0 | set %14 0 -%uo 0 | drawrect -rfn @ka 0 0 0 0 29 29 | æ %1 1 | æ %2 2 | æ %3 3 | æ %4 4 | æ %5 5 | æ %6 6 | æ %7 7 | æ %8 8 | æ %9 9 | æ %10 10 | æ %11 11 | æ %12 12 | æ %13 13 | æ %14 14 | inc %° 5 | inc %" 4 | dec %' 3 | clear @ÜE | set %~ 0
  ø 1 2 9 0 255 15 | ø 9 2 3 0 255 15 | ø 9 3 4 0 255 15 | ø 9 4 1 0 255 15 | ø 10 6 5 155 155 15 | ø 7 6 10 155 155 15 | ø 8 7 10 155 155 15 | ø 5 8 10 155 155 15 | ø 2 6 11 0 255 10 | ø 11 6 7 0 255 0 | ø 11 7 3 0 255 0 | ø 11 3 2 0 255 0 | ø 12 5 1 175 125 35 | ø 8 5 12 175 125 35 | ø 4 8 12 175 125 35 | ø 1 4 12 175 125 35 | ø 5 6 13 235 255 20 | ø 13 6 2 235 255 20 | ø 13 2 1 235 255 20 | ø 13 1 5 235 255 20 | ø 14 7 8 0 0 255 | ø 14 3 7 0 0 255 | ø 14 4 3 0 0 255 | ø 14 8 4 0 0 255 | filter -ctu 1 1 @ÜE @ÜE | set %i 1 | set %j 1 + %~
  while %i < %j { $gettok($line(@ÜE,%i),2-14,32) | $gettok($line(@ÜE,%i),15-,32) | inc %i }
  if ($getdot(@ka,1,1) = 0) drawcopy -n @ka 0 0 29 29 @ܣ 0 0
  if $calc(%ve % 20) > 6 { %\ 29 0 0 0 320 29 | %\ 0 29 0 0 320 200 }
  if (%ve > 300) drawdot @ܣ
  if %ve = 11000 { %fa = 50 | %ë = 7 | %@ = @ܣ | %rt = 0 | %à = 35 | %' = 0 | %" = 0 | %9 = 0 0 3 | %10 = 0 0 -3 | %11 = 3 0 0 | %12 = -3 0 0 | %13 = 0 3 0 | %14 = 0 -3 0 | %ñ = -6.8 | %® = -4.9 | %¤ 2000 0 gm }
}
alias -l qp %fa = 310 | %tr = 1 | unset %a %u %l %b %c %k %i | %ë = 3 | %ç = $hget(Tk,18) | %d = 0 | %a = 0 | %¤ 600 0 zk
alias -l pq %¤ 4500 0 fm
alias -l fm {
  inc %&
  if (%ë = 1) drawdot -nr @ܣ 0 200 160 100
  elseif %ë = 3 && %& > 3000 { set %ë 4 | drawdot -nr @ܣ 0 200 160 100 }
  elseif %ë = 4 {
    if %& > 4000 { set %fa 190 | set %ë 5 }
    set %{ 450 | inc %a1 5 | inc %b1 10 | drawdot -nr @ܣ $rgb($calc(130+125*$sin(%a1).deg),$calc(130+125*$sin(%b1).deg),0) 0 0 199 | %\ 0 -1 0 190 320 10 | %\ 0 -10 0 0 320 200 | drawcopy -n @ܣ 0 0 1 200 @ܣ 0 0 320 200
  }
  if %ë = 3 || %ë = 5 { drawpic -clsn @ܣ $calc(-100-100*$sin(%°).deg) $calc(-100-100*$cos(%°).deg) 520 400 0 0 80 88 %kb }
  drawdot -nr @ܣ 0 0 0 0
  if %ë = 3 { %9 = 0 0 2 | %10 = 0 0 -.2 | %11 = 2 0 0 | %12 = -2 0 0 | %13 = 0 2 0 | %14 = 0 -2 0 }
  elseif %ë = 4 { %9 = 0 0 2.4 | %10 = 0 0 -2.4 | %11 = $calc(1.5-.6*$sin($ticks).deg) 0 0 | %12 = $calc(-1.5-.6*$sin($ticks).deg) 0 0 | %13 = 0 2 0 | %14 = 0 -2 0 }
  elseif %ë = 5 {
    %{ = 550 | %9 = 0 0 3.5 | %10 = 0 0 -.2 | %11 = 5 $calc(4*$sin($calc(4*%")).deg) 0 | %12 = -5 $calc(4*$sin($calc(4*%")).deg) 0 | %13 = 0 2 0 | %14 = 0 -2 0 | drawrect -nre @ܣ 0 50 -36 -95 390 390 -35 -95 390 390 | set %i 198
    while %i { %\ $calc(10*$sin($calc(.02*%° +.02*%i).deg)) 0 0 %i 320 6 | dec %i 6 }
  }
  inc %° 4 | inc %" -5 | inc %' 2 | set %à 8.8
  if %ë = 5 { set %à $calc(22+4*$sin(%").deg) | set %ñ 1.9 * $sin(%").deg }
  æ %1 1 | æ %2 2 | æ %3 3 | æ %4 4 | æ %5 5 | æ %6 6 | æ %7 7 | æ %8 8 | æ %9 9 | æ %10 10 | æ %11 11 | æ %12 12 | æ %13 13 | æ %14 14 | iw
  if %ë = 5 {
    set %i 0
    while %i < 320 { %\ 0 $calc(10*$cos($calc(.02*%° +.05*%i).deg)) %i 0 3 200 | inc %i 3 }
  }
  if %ë = 1 {
    if (%& > 100 && %& < 300) mb 51200 16 $hget(Tk,19)
    elseif (%& > 350 && %& < 500) mb 250 31 $hget(Tk,20)
    elseif (%& > 550 && %& < 650) mb 51200 75 $hget(Tk,21)
    elseif (%& > 700 && %& < 800) mb 250 6 $hget(Tk,22)
    elseif (%& > 850 && %& < 950) mb 6908415 0 $hget(Tk,23)
    elseif (%& > 960 && %& < 1050) mb 250 20 $hget(Tk,24)
    elseif (%& > 1070 && %& < 1800) {
      if (%& = 1071) %fa = 70 | mb 250 30 $hget(Tk,25) | %/ 0 wingdings 40 $calc($mouse.dx -3) $calc(3+$mouse.dy) õ | %/ 16777215 wingdings 40 $mouse.dx $mouse.dy õ
      set %° -1 * $mouse.dx | set %" -1 * $mouse.dy
      if ($mouse.key & 2) inc %'
      dec %° 4 | dec %" -5 | dec %' 2
    }
    elseif (%& = 1800) mf
  }
  if (%& = 4500) rox
  if ($getdot(@ܣ,0,0) = 0) drawdot @ܣ
}
alias -l æ set %n ( $1 * $cos(%°).deg + $3 * $sin(%°).deg ) | set %f ( $3 * $cos(%°).deg - $1 * $sin(%°).deg  ) | set %q ( $2 * $cos(%").deg - %f * $sin(%").deg  ) | set %^ ( $2 * $sin(%").deg + %f * $cos(%").deg ) | set %x ( %n * $cos(%').deg + %q * $sin(%').deg ) | set %z ( %q * $cos(%').deg - %n * $sin(%').deg ) | je $4
alias -l Tk inc %i | hadd -m Tk %i $decode($1,m)
alias -l mf unset %a %u %l %b %c %k %i %tr | %ë = 2 | %ç = $hget(Tk,17) | %d = 0 | %a = 0 | %¤ 540 0 zk
alias -l mi {
  if (%a = 1) drawdot -rn @ܣ 0 400 160 100
  var %j -nior @ܣ,%k drawscroll %j,%i 90,%u 0 0 320 200,%% drawtext %j | inc %a | drawdot %j 0 99 $r(0,99) $r(0,99) | %k 0 -50 %u
  while %i { set %l $r(0,299) - %i | %k 0 %l %i 0 320 200 | %k %l 0 0 %i 320 200 | dec %i 9 }
  if %a > 400 && %a  < 900 { %% 0 terminal 8 49 10 $hget(Tk,2) | %% 51200 terminal 8 48 9 $hget(Tk,2) }
  if %a > 950 { %% 0 terminal 8 38 10 $hget(Tk,3) | %% 250 terminal 8 37 9 $hget(Tk,3) }
  drawrect -nrdf @ܣ 10161945 1 2 6 34 14 5 5
  if (%a > 1200) drawdot -nri @ܣ $rgb(0,$r(100,255),0) 20 $r(0,320) 180
  if (%a > 1100) drawpic -cni @ܣ 30 58 %bu
  %% 8247295 arial 14 3 5 PPT1 | if (%a > 30) drawdot @ܣ
  if %a = 1600 { inc %a 43000 | %¤ 4101 0 jn }
}
alias -l je hadd -m K $1 $calc(160+%{ *(%ñ +%x)/(%^ +%à)) | hadd -m D $1 $calc(100+%{ *(%® +%z)/(%^ +%à))
alias -l iw {
  clear @ÜE | set %~ 0
  if %ë != 3 { ø 1 2 9 0 255 15 | ø 9 2 3 0 255 15 | ø 9 3 4 0 255 15 | ø 9 4 1 0 255 15 | ø 10 6 5 155 155 15 | ø 7 6 10 155 155 15 | ø 8 7 10 155 155 15 | ø 5 8 10 155 155 15 }
  ø 2 6 11 0 255 10 | ø 11 6 7 0 255 0 | ø 11 7 3 0 255 0 | ø 11 3 2 0 255 0 | ø 12 5 1 175 125 35 | ø 8 5 12 175 125 35 | ø 4 8 12 175 125 35 | ø 1 4 12 175 125 35 | ø 5 6 13 235 255 20 | ø 13 6 2 235 255 20 | ø 13 2 1 235 255 20 | ø 13 1 5 235 255 20 | ø 14 7 8 0 0 255 | ø 14 3 7 0 0 255 | ø 14 4 3 0 0 255 | ø 14 8 4 0 0 255 | filter -ctu 1 1 @ÜE @ÜE | set %i 1 | set %j 1 + %~
  while %i < %j { $gettok($line(@ÜE,%i),2-14,32) | $gettok($line(@ÜE,%i),15-,32) | inc %i }
}
alias -l gm {
  inc %° -4 | inc %ve 9 | %\ 0 -30 0 0 320 200 | drawrect -rf @ka 0 0 0 0 104 39 | æ %1 1 | æ %2 2 | æ %3 3 | æ %4 4 | æ %5 5 | æ %6 6 | æ %7 7 | æ %8 8 | æ %9 9 | æ %10 10 | æ %11 11 | æ %12 12 | clear @ÜE | set %~ 0 | ø 1 2 9 | ø 9 2 3 | ø 9 3 4 | ø 9 4 1 | ø 10 6 5 | ø 7 6 10 | ø 8 7 10 | ø 5 8 10 | ø 2 6 11 | ø 11 6 7 | ø 11 7 3 | ø 11 3 2 | ø 12 5 1 | ø 8 5 12 | ø 4 8 12 | ø 1 4 12 | filter -ctu 1 1 @ÜE @ÜE | set %i 1 | set %j 1 + %~
  while %i < %j { $gettok($line(@ÜE,%i),2-14,32) | $gettok($line(@ÜE,%i),15-,32) | inc %i }
  set %¨ 600 * $cos($calc(2*$sin(%°).deg)) | set %i 30
  while %i { set %% 200 - %i | set %. 201 - %i | drawline -nr @ܣ $calc(168+%¨ +7*%i) 0 0 %% 320 %% | drawline -nr @ܣ 0 0 0 %. 320 %. | dec %i 2 }
  set %g -95 + 26 * $cos(%ve).deg | set %d $sin($calc(%° /3)).deg
  %§ 0 verdana 36 $calc(%g +75*%d) 161 $hget(Tk,29) | %§ $rgb($calc(150+105*$sin($calc(2*%°)).deg),$calc(160+95*$cos($calc(3*%°)).deg),$calc(155-100*$sin($calc(-3*%°)).deg)) verdana 36 $calc(%g +78*%d) 161 $hget(Tk,29)
  if ($getdot(@ka,1,1) = 0) drawcopy -nt @ka 0 0 5 104 38 @ܣ $calc(110+28*$sin($calc(1.4*%ve)).deg +110*$cos(%°).deg) 168
  %§ 0 arial 16 4 -2 $hget(Tk,30) | %§ 3670015 arial 16 5 -2 $hget(Tk,30) | set %i 12
  while %i { %\ $calc(2*$sin($calc(28*%i +8*%°)).deg) 0 0 %i 60 1 | dec %i }
  if (%ve = 29000) tf
  drawdot @ܣ
}
alias -l tf drawdot -r @ܣ 0 200 160 100 | drawdot -r @£Ü 0 1200 160 600 | %o = 31 | while %o < 66 { tx $hget(Tk,%o) | inc %o } | %dd = 0 | .timer 1 1 ga
alias -l tx drawtext -r @£Ü 16777215 impact 20 $calc((320-$width($1-,impact,20))/2) 978 $1- | drawscroll @£Ü 0 -22 0 0 320 1050
alias -l em {
  fs HideMouse | window -CBpfdohn +d @£Ü 0 0 320 1200 | drawpic -c | %i = 0 | %kb = $+(",$scriptdir,2_b7209cbf.png,") | %bu = $+(",$scriptdir,pptstar.png,") | %¤ = .timera
  %fa = 310 | %ve = 0 | %v = 0 | v£ | %9 = 0 0 2 | %10 = 0 0 -2 | %11 = 2 0 0 | %12 = -2 0 0 | %13 = 0 2 0 | %14 = 0 -2 0 | %{ = 550 | %@ = @ܣ | %rt = 0 | %\ = drawscroll -n @ܣ | %/ = drawtext -nr @ܣ | %§ = drawtext -nor @ܣ
  window -CpdofB +d @ܣ 0 0 320 200 | window -phnBfdo @ka 0 0 60 60 | window -lh @ÜE 0 0 0 0 | fs Fullscreen $window(@ܣ).hwnd > 320 > 200 > 16 > 60
  %µ = $+(",$scriptdir,fmod_mIRC.dll,") | if $è(FMOD_Connect,$scriptdirfmod.dll) { if $è(SOUND_Init,44100 2 0) { } } | var %a $è(SOUND_Sample_Load,2 $+(",$scriptdir,tv.ogg,") 2),%a $è(SOUND_PlaySound,2 1) 
  %x = 240 | %y = 120 | %g = 1 | %f = -1 | %oldx = 240 | %oldy = 120 | %ipe = 0 | %w = L | %tc = tahoma 10 | jui
}
; Only "to keep a bit the surprise". (btw a poor attempt to avoid Attila ugly pasting. He did.)
alias -l engleesh {
  Tk SEEh | Tk WUVTIE1ZIEZBVk9SSVRFIENIQU5ORUwuIFdIQVQgQUJPVVQgQ09MT1IgPw== | Tk REVBUiBTUEVDVEFUT1IgVEhBVCBJU04nVCBBIFBST0JMRU0gRk9SIFNUQU5aICE= | Tk VEhYIFNUQU5aLiBCVVQgSVQnUyBBIEJJVCBXRUlSRCAhIENBTiBZT1UgRklYIFRIQVQgPw== | Tk WU9VUiBXSElTSEVTIEFSRSBPUkRFUlMuIERPIFlPVSBMSUtFIFRIT1NFIFJBU1RFUlMgPw== | Tk U0VYWTogQlVUIElUJ1MgR0VUVElORyBCT1JJTkcuIEFORCBJIFdBTlQgTVVTSUMu | Tk U1RJTEwgQVQgWU9VUiBTRVJWSUNFLiBJIFNVR0dFU1QgQSBMSVRUTEUgUExBU01BLg== | Tk SSBNQURFIFRISVMgQ0hJUFRVTkUgV0lUSCBDVUJBU0UsIERPIFlPVSBMSUtFIElUID8= | Tk V09XICEgVEhBVCBNVVNUIEJFIENBTExFRCBBVEFSSSBTVCBHUk9PVkUu | Tk QlVUIFdIQVQgVEhFIEhFTEwgVEhJUyBST0JPQ09QLVZPSUNFIFNBWSA/ | Tk RE9OJ1QgQ0FSRSBUT08gTVVDSCwgQU5EIEZBU1RFTiBZT1VSIFNFQVRCRUxULg==
  Tk Q0FVU0UgWU9VIExPQURFRCBPVEhFUiBOSUNFIFRPWVMgSU4gWU9VUiBNSVJDLg== | Tk SSBGRUVMIEhPUk5ZLiBOT1cgSSBDQU4gSEFWRSBTRVggT04gSVJDICE= | Tk KlNISVQqIFRPTyBCQUQsIE1PTSBJUyBLTk9DS0lORyBBVCBUSEUgRE9PUiE= | Tk QldBSCEgSEEhIEhBISBIQSEgT0sgTEVUJ1MgQkVHSU4gVEhFIFJFQUwgLS0tPiBERU1PLg== | Tk RU5KT1kgVEhJUyBGTEVYSUJMRSBTQ1JPTExFUi4gSSBUSElOSyBXRSBHT1QgRU5PVUdIIEZMQVQgU1RVRkZTLCBMQU1FU1RVRkYgPyBIQUhBIFdIQVQgQSBGVU5OWSBOQU1FLqBSRUFEWSBGT1IgQSAyNyBGQUNFUyAtLT4gUkVBTCBUSU1FIDwtLSBDUkFQID8= | Tk RGlkIGhlIHNhaWQgcmFzdGVyaXplZCBzY3JvbGxlcnMgd2l0aCBtSVJDID8= | Tk Rk9SIFRIRSAxU1QgVElNRSBZT1UgV0lMTCBCRSBBQkxFIFRPIExPT0sgSU5TSURFIFQzSCBTSElULg==
  Tk SSdNIEJBQ0sgISEgVUJFUkNPT0wgUkVBTFRJTUUgVU5DSEVBVEVEIFRSSURJ | Tk SSdNIExBQ0tJTkcgT0YgV09SRFMgVE8gU0FZIEhPVyBJVCdTIExBTUUu | Tk V0hBVCA/IElUJ1MgQSBCSVQgU0xPVyA/ | Tk SVQnUyBTT1JURUQgV0hJTEUgVEhFUkUnUyBGQUNFQkFDSyBNRVRIT0QsIFNMT1cuLi4= | Tk Tk8sIElUJ1MgQSBMQU1FIC0+U1RBVElDICYgSE9SUklCTEUgLT5OT1JNQUwgLT5DUkFQLg== | Tk VElNRSBGT1IgVE8gU0hPVyBUSEUgRk9SQ0UgT0YgVEhJUyBST1VUSU5FICE= | Tk VVNFIFlPVVIgTU9VU0UgQU5EIFtDVFJMXSBLRVkgRk9SIFJPVEFUSU9OUy4=
  Tk MjA3OQ== | Tk VCBSIEkgQSBOIEcgTCBFIFM= | Tk TiBFIFcgoCBXIE8gUiBMIEQgoCBSIEUgQyBPIFIgRA== | Tk VEhFIEZJUlNUIFJVQkJFUiBFVkVS | Tk UFBUMQ== | Tk UFBU | Tk cHJlc2VudGVkIHlvdQ== | Tk IlB1cnBsZSB0ZWxldmlzaW9uIg== | Tk QSBtaXJjIGRlbW8= | Tk Y29kZWQgaW4gMjAwNC4= | Tk oA== | Tk QWxsIHNjcmlwdCwgZ2Z4IGFuZCBtdXNpYw== | Tk YnkgU3Rhblou | Tk oA== | Tk R3JlZXRpbmdzIHRvIDo= | Tk KG5vIHNwZWNpYWwgb3JkZXIp | Tk S2Vuamk= | Tk QmlnQmV6dXM= | Tk dmlzaW9ueg== | Tk RXBzaWxvbg== | Tk VG9LZU4= | Tk QXR0aWxh | Tk WmVyZw== | Tk Qm9tYlN0cmlrZQ== | Tk c2F4 | Tk Q2FtZWxvdA== | Tk Umltb3V4 | Tk T3B0aW11cw== | Tk oA== | Tk VG9vbHMgYW5kIGNyZWRpdHMgOg== | Tk RnVsbHNjcmVlbiBieSBTdHIzaWJlcg== | Tk Rm1vZCBmb3IgbWlyYyBieSBjYXB0YWluRU8= | Tk Q3ViYXNlIGJ5IFN0ZWluYmVyZw== | Tk SG9lZ2FhcmRlbiBhbmQgTGVmZmUgbW9yYWwgc3VwcG9ydHM= | Tk oA== | Tk oA== | Tk oA== | Tk oA== | Tk UFBUIHByb2QgLSBEZWNlbWJlciAyMDA0oA== | Tk qSBQdXJwbGUgdGVudGFjbGVzIGluYw== | ror
}
alias -l frensh {
  Tk SEEh | Tk T1VBSVMgTUEgQ0hBSU5FIFBSRUZFUkVFLiBNQUlTIExBIENPVUxFVVIgPw== | Tk Q0hFUiBTUEVDVEFURVVSIEVTVC1DRSBVTiBQUk9CTEVNRSBQT1VSIFNUQU5aICE= | Tk TUVSQ0kgU1RBTlouIEMnRVNUIFVOIFBFVSBaQVJCISBQRVVYIFRVIENIQU5HRVIgQ0EgPw== | Tk Vk9TIFNPVUhBSVRTIFNPTlQgREVTIE9SRFJFUy4gQUlNRVotVk9VUyBMRVMgUkFTVEVSUz8= | Tk U0VYWTogTUFJUyBDQSBERVZJRU5UIEVOTlVZQU5ULiBFVCBMQSBNVVNJUVVFICE/
  Tk VE9VSk9VUlMgQSBWT1RSRSBTRVJWSUNFLiBVTiBQTEFTTUEgUE9VUiBWT1MgWUVVWC4= | Tk SidBSSBGQUlTIENFVFRFIENISVBUVU5FIEFWRUMgQ1VCQVNFLCBWT1VTIEFJTUVaID8= | Tk V09VQUghIENBIERPSVQgRVRSRSBDQSBMRSBHUk9PVkUgQVRBUkkgU1Qu | Tk TUFJUywgUVVFIERJVCBDRVRURSBWT0lYIEEgTEEgIlJPQk9DT1AiID8= | Tk TkUgVk9VUyBFTiBGQUlURVMgUEFTLCBBVFRBQ0hFWiBWT1RSRSBDRUlOVFVSRS4= | Tk Q0FSIFZPVVMgQVZFWiBDSEFSR0UgREUgQkVBVVggSk9VRVRTIFBPVVIgTUlSQy4= | Tk Q0EgTUUgRk9VVCBVTiBORVJGIERFIEJPRVVGLiBWSVRFICNTRVhFICE= | Tk KkFSR0wqIElMIFkgQSBNQSBNRVJFIFFVSSBGUkFQUEUgQSBMQSBQT1JURSE= | Tk QldBSCEgSEEhIEhBISBIQSEgT0sgREVNQVJST05TIExBIFZFUklUQUJMRSAtPiBERU1PLg== | Tk S0lGRkUgU1VSIENFIFNDUk9MTFRFWFRFIE1PTiBHUkFORC4gQk9OLCBKRSBDUk9JUyBRVSdJTCBZIEEgRVUgQVNTRVogREUgUEVUSVRFIDJEIEEgUEFTIENIRVIuIFBSRVMgUE9VUiBVTiBQRVUgREUgM0QgQVZFQyAyNyBGQUNFUyBFTiBURU1QUyBSRUVMID8=
  Tk QSB0LWlsIGRpdCBzY3JvbGx0ZXh0ZSByYXN0ZXJpc+kgYXZlYyBtSVJDID8= | Tk UE9VUiBMQSBQUkVNSUVSRSBGT0lTLCBWT1VTIENPTVRFTVBMRVJFWiBTRVMgRU5UUkFJTExFUy4uLg== | Tk SEVZIFNUQU5aIEpFIFNVSVMgREUgUkVUT1VSLiBJTVBSRVNTSU9OTkFOVCAh | Tk SkUgTUFOUVVFIERFIE1PVFMgUE9VUiBESVJFIENPTU1FTlQgQyBOVUwu | Tk SEVJTj8gQydFU1QgVU4gUEVVIExFTlQ/ | Tk QklFTiBMRSBUUkkgKyBFTElNSU5BVElPTiBERVMgRkFDRVMgQ0FDSEVFUywgSFVNLi4= | Tk Tk9OLiBDJ0VTVCBMQU1FIENBUiBUUk9QIC0+IFNUQVRJUVVFIEVUIC0+ICJOT1JNQUwiLg== | Tk Vk9ZT05TIENFIFFVRSBDRVRURSBST1VUSU5FIEEgREFOUyBMRSBWRU5UUkUh | Tk VVRJTElTRVogVk9UUkUgU09VUklTIEVUIExBIFRPVUNIRSBbIENUUkwgXS4=
  Tk MjA3OQ== | Tk VCBSIEkgQSBOIEcgTCBFIFM= | Tk TiBFIFcgoCBXIE8gUiBMIEQgoCBSIEUgQyBPIFIgRA== | Tk VEhFIEZJUlNUIFJVQkJFUiBFVkVS | Tk UFBUMQ== | Tk UFBU | Tk cHJlc2VudGVkIHlvdQ== | Tk IlB1cnBsZSB0ZWxldmlzaW9uIg== | Tk QSBtaXJjIGRlbW8= | Tk Y29kZWQgaW4gMjAwNC4= | Tk oA== | Tk QWxsIHNjcmlwdCwgZ2Z4IGFuZCBtdXNpYw== | Tk YnkgU3Rhblou | Tk oA== | Tk R3JlZXRpbmdzIHRvIDo= | Tk KG5vIHNwZWNpYWwgb3JkZXIp | Tk S2Vuamk= | Tk QmlnQmV6dXM= | Tk dmlzaW9ueg== | Tk RXBzaWxvbg== | Tk VG9LZU4= | Tk QXR0aWxh | Tk WmVyZw== | Tk Qm9tYlN0cmlrZQ== | Tk c2F4 | Tk Q2FtZWxvdA== | Tk Umltb3V4 | Tk T3B0aW11cw== | Tk oA== | Tk VG9vbHMgYW5kIGNyZWRpdHMgOg== | Tk RnVsbHNjcmVlbiBieSBTdHIzaWJlcg== | Tk Rm1vZCBmb3IgbWlyYyBieSBjYXB0YWluRU8= | Tk Q3ViYXNlIGJ5IFN0ZWluYmVyZw== | Tk SG9lZ2FhcmRlbiBhbmQgTGVmZmUgbW9yYWwgc3VwcG9ydHM= | Tk oA== | Tk oA== | Tk oA== | Tk oA== | Tk UFBUIHByb2QgLSBEZWNlbWJlciAyMDA0oA== | Tk qSBQdXJwbGUgdGVudGFjbGVzIGluYw== | ror
}
alias -l jui {
  inc %ipe .15
  if $getdot(@ܣ,$calc(1+%x),$calc(3+%y)) != 16439215 || $getdot(@ܣ,$calc(15+%x),$calc(3+%y)) != 16439215 || $getdot(@ܣ,$calc(1+%x),$calc(17+%y)) != 16439215 ||  $getdot(@ܣ,$calc(15+%x),$calc(17+%y)) != 16439215 { %w = L | %x = %Oldx | %y = %oldy | %f = 3 * $cos(%ipe) | %g = 3 * $sin(%ipe) }
  %oldx = %x | %oldy = %y | drawdot -rn @ܣ 16439215 400 160 100 | drawrect -rnf @ܣ 16439210 0 166 102 88 8 160 52 102 8 59 5 115 16 | drawline -nr @ܣ 16439210 0 170 145 248 145 270 186 260 188 260 195 210 195 170 155 170 145 | drawfill -nr @ܣ 16439210 16439210 171 146
  if (%x < 0) %g = 1
  elseif (%x > 304) %g = -1
  if (%y < -2) %f = 1
  elseif (%y > 182) %f = -1
  inc %x %g | inc %y %f | %/ 16435350 wingdings 20 %x %y %w | drawrect -rn @ܣ 16763030 0 310 5 5 5
  if $inrect($mouse.dx,$mouse.dy,310,5,5,5) {
    if $mouse.key & 1 { die | halt }
  }
  drawpic -cn @ܣ 60 90 $+(",$scriptdir,picwin_logo2.png,")
  if $inrect($mouse.dx,$mouse.dy,60,90,88,31) {
    drawrect -rn @ܣ $calc(255*$sin(%ipe)) 0 60 90 88 31 | %w = J
    if $mouse.key & 1 { engleesh | halt }
  }
  else { drawrect -rni @ܣ 0 0 60 90 88 31 | %w = K }
  drawpic -cn @ܣ 60 40 $+(",$scriptdir,sdbban1.png,") | drawrect -rn @ܣ 0 0 60 40 88 31
  if $inrect($mouse.dx,$mouse.dy,60,40,88,31) {
    drawrect -rn @ܣ $calc(255*$sin(%ipe)) 0 60 40 88 31 | %w = J
    if $mouse.key & 1 { frensh | halt }
  }
  else { drawrect -rni @ܣ 0 0 60 40 88 31 }
  %/ 9861220 %tc 160 50 VERSION FRANCAISE | %/ 16775920 %tc 161 49 VERSION FRANCAISE | %/ 9861220 %tc 166 100 ENGLISH VERSION | %/ 16775920 %tc 167 99 ENGLISH VERSION | %/ 13153430 tahoma 20 59 1 CABLE MENU | %/ 16742420 tahoma 20 60 0 CABLE MENU | drawpic -cn @ܣ 60 140 $+(",$scriptdir,parental.png,") | drawrect -rnfd @ܣ 16763030 0 169 146 78 11 2 2 | %/ 9866360 %tc 169 146 PPT1 purple TV | %/ 9866360 %tc 179 156 XXX CHANNEL | %/ 9866360 %tc 189 166 CANAL mIRC | %/ 9866360 %tc 199 176 TELE achiat | %/ 9866360 %tc 209 186 Crappy TV | %/ $rgb(255,$r(220,250),$r(1,255)) %tc 170 145 PPT1 purple TV | %/ 986312 %tc 180 155 XXX CHANNEL | %/ 986312 %tc 190 165 CANAL mIRC | %/ 986312 %tc 200 175 TELE achiat | %/ 986312 %tc 210 185 Crappy TV | drawrect -nrf @ܣ 0 0 7 0 26 200 | inc %ui
  if (%ui > 27) %ui = 0
  drawrect -nrf @ܣ 10195324 0 10 $calc(%ui -27) 20 20 10 %ui 20 20 10 $calc(27+%ui) 20 20 10 $calc(%ui +54) 20 20  10 $calc(81+%ui) 20 20 10 $calc(108+%ui) 20 20 10 $calc(136+%ui) 20 20 10 $calc(163+%ui) 20 20 10 $calc(190+%ui) 20 20 | %mu = $mouse.dx | %nu = $mouse.dy | %/ 4600400 wingdings 50 $calc(%mu -4) $calc(%nu -6) õ | %/ 255 wingdings 50 $calc(%mu -3) $calc(%nu -7) õ | drawfill -nr @ܣ $rgb(220,$calc(200+55*$sin(%ipe)),100) 255 $calc(6+%mu) $calc(7+%nu) | drawdot @ܣ | .timera 1 0 jui
}
alias -l ror drawpic -c | drawdot -r @ܣ 5244245 400 160 100 | drawpic -smt @ܣ 0 72 12 176 176 %kb | %¤ $+ d -m 1 480 splay -w $+(",$scriptdir,krazy.wav,") | %¤ $+ c -m 11 380 ha | %¤ $+ b 1 4 drawdot -r @ܣ 255 4 150 63 158 63 | %m = 0 | %a = 0 | %u = 350 | %k = %\ | %& = 0 | %ë = 1 | %ñ = 0 | %® = 0 | %¤ 1 6 ro
alias -l v£ %1 = -1 1 1 | %2 = 1 1 1 | %3 = 1 -1 1 | %4 = -1 -1 1 | %5 = -1 1 -1 | %6 = 1 1 -1 | %7 = 1 -1 -1 | %8 = -1 -1 -1 | %9 = 0 0 1 | %10 = 0 0 -1 | %11 = 1 0 0 | %12 = -1 0 0 | %13 = 0 1 0 | %14 = 0 -1 0
alias -l rox drawpic -c | drawdot -nr @ܣ 16728114 400 160 100 | %§ 11799040 impact 160 1 -20 $hget(Tk,26) | %§ 11799040 impact 53 4 141 $hget(Tk,27) | %§ 13762560 impact 160 2 -21 $hget(Tk,26) | %§ 13762560 impact 53 5 140 $hget(Tk,27) | %/ 10158080 arial 10 83 -2 $hget(Tk,28) | drawdot @ܣ | %¤ 1 3 yl
alias -l yl %ve = 0 | %i = 320 | while %i { drawscroll @ܣ -1 0 0 0 320 200 | dec %i } | %fa = 3 | %ë = 6 | %à = 80 | %ñ = -21 | %® = -12.5 | %@ = @ka | %rt = 7 | %¤ 1000 0 ov
