; +-------------------------------------------+
; |                                           |
; |  C a l m   d o w n  and prepare to meet!  |
; |  T h e   # 1   m I R C - M E G A D E M O  |
; |  F r o g g i e s   b u t   g o o d i e s  |
; |                                           |
; +-------------------------------------------+----- --- -
;                                             |
;  .P.P.T. MEGADEMO                           .
;  PuRpLe Tentacles
;  inc 2003<>2004 ©
;
;  I'M A PICWIN MAN!
;
menu @- {
  mouse: %ø = $mouse.dx | %£ = $mouse.dy
  sclick: $&(0,sx 60) | $&(300,sx 85) | © $calc(%ø -$window(@-).x) $calc(%£ -$window(@-).y)
  dclick: °° | cw | sq | plm
}
alias -l © window @- $calc(%ø -$1) $calc(%£ -$2) | if $mouse.key & 1 .timer 1 0 © $1-
alias intro var %i 200,%j hadd -m,%_ 0 0 800 600 | %æ1 = 0 | %pp = 0 | %v = 0 | %.^ = 0 | %.l = 800 | %.h = 600 | %.a = 700 | %.b = 500 | %.o = $+(",%.z,gfx\bob2.PNG,") | %.& = %.o | %.mono = $+(",%.z,gfx\ppt-logoV2.png,") | %.colo = $+(",%.z,gfx\ppt-logoG2.png,") | %.g = %.mono | %.p = $pic(%.g).width | %.q = $pic(%.g).height | %.1 = $calc((%.l -%.p)/2) | window -pdoBfCk +dL @star %_ | drawrect -rf @star 0 0 %_ | d | while %i { %j s.x %i $r(1,500) | %j s.y %i $r(1,500) | %j s.z %i $r(100,1000) | %j s.T %i $r(5,10) | %j s.cx %i 0 | %j s.cy %i 0 | dec %i } | ¥ 4 jimmys_voyage-4.mod 255 | 1
alias -l Ü inc %.^ | if (%.^ > 42) set %.^ 1 | set %.u æ | £ 3 1 | £ 7 2 | £ 9 3 | £ 11 4 | £ 15 5 | £ 17 6 | £ 19 7 | £ 21 8 | £ 23 9 | £ 27 10 | £ 29 11 | £ 33 12 | £ 35 13 | £ 39 14 | £ 41 15 | $iif(%.^ > 6 && $r(0,1200) > 500,%.& =  $+(",%.z,gfx\bob $+ $r(1,9) $+ .PNG,"),%.& = %.o)
alias -l £ if %.^ = $1 { set %.u $hget(T,$2) | set %.x $hget(D,$2) | set %.y $hget(Y,$2) | set %.w $hget(W,$2) }
alias -l 1 {
  inc %v 3 | var %i 20,%e $cos(%v).deg,%f .3 * %v,%n 5 * $cos(%f).deg,%k 15 * $sin(%f).deg,%s $int($calc(%.q *%e)),%ù 90 * %n,%à 70 * %k,%q 100,%g,%mm 400 + %ù,%nn 400 - %ù | drawrect -nrf @star 0 0 0 0 800 600
  while %q { drawline -nr @star $calc(194536-400*(%k +%q)) %q %mm $calc(%q +300-%à) %nn $calc(%q +300+%à) | dec %q 10 }
  if (%.u != æ) drawtext -nor @star $calc(255*%e) impact %.x %.w %.y %.u
  while %i { hadd s.x %i $calc($hget(s.x,%i)+%n) | hadd s.y %i $calc($hget(s.y,%i)+%k) | hadd s.z %i $calc($hget(s.z,%i)-$hget(s.T,%i)) | hadd s.cx %i $calc($hget(s.x,%i)/$hget(s.z,%i)*%.a) | hadd s.cy %i $calc($hget(s.y,%i)/$hget(s.z,%i)*%.b) | if $hget(s.cx,%i) > 800 || $hget(s.cy,%i) > 600 || $hget(s.cx,%i) < 0 || $hget(s.cy,%i) < 0 { hadd s.x %i $r(1,500) | hadd s.y %i $r(1,500) | hadd s.z %i $r(100,1000) } | var %z = 50 - $int($calc($hget(s.z,%i)/25)) | if (%z < 10) set %z 10 | drawpic -ncts @star 0 $hget(s.cx,%i) $hget(s.cy,%i) %z %z %.& | dec %i }
  if $int($calc(255*%e)) = 0 Ü | drawpic -nstc @star 0 $iif(%v > 600,$calc(%.1 +40*%k),%.1) $calc((%.h /2)-(%.q /2)*%e) %.p %s $iif(%s < 0,%.colo,%.mono) | drawdot @star | .timer -h 1 0 1
}
alias -l fmod if ($isid) return $dll($scriptdirbin\fmod_mIRC.dll,$1,$2-)
on *:CLOSE:@star:end.st
menu @star {
  SCLICK: end.st
}
alias -l end.st °° | cw | var %a hfree | %a s.x | %a s.y | %a s.z | %a s.T | %a s.cx | %a s.cy | %a T | %a D | %a Y | %a W | unset %.* %a %v | sotb
on *:keydown:@star:*:{
  if $keyval = 32 end.st
}
alias -l d {
  var %a 1,%b hadd -m T,%\ hadd -m,%¤ drawrect,%] @star | %¤ -rfn %] 1966110 0 0 0 800 600 | %b 1 LES | %b 2 PÜRPLE TENTACLES PRAZANT | %b 3 A P.P.T. DESIGN | %b 4 M E G A D E M O | %b 5 "I AM A PICWIN MAN" | %b 6 CODe: | %b 7 ToKeN y StanZ | %b 8 FOR | %b 9 HTTP//:WWW.PICWIN.TK | %b 10 FULLSCREEn: | %b 11 BombStrike & Str3iber | %b 12 TEAMLEADEr: | %b 13 Lazy Zerg ;-) | %b 14 IT'S TIME TO CLICK YOUR | %b 15 RAT!
  while %a < 16 {
    var %i 0,%d %.l - 40,%[ = $hget(T,%a),%4 $fmod(MUSIC_SetMasterVolume,1,$calc(100-(6.25*%a)))
    while %i < 2000 { if $width(%[,impact,%i,1,0) >= %d { %\ D %a %i | set %i 2000 } | inc %i }
    %\ Y %a $calc((%.h -$height(%[,impact,$hget(D,%a)))/2) | %\ W %a $calc((%.l -$width(%[,impact,$hget(D,%a),1,0))/2) | drawtext -rn %] 6553700 terminal 40 190 150 Please wait ... | %¤ -rfen %] $calc(10+12*%a) 1 $calc((%.l /16)*(%a -1)) $calc((%.h /2)-30) $calc(%.l /16) 60 5 15 | %¤ -rfen %] 0 1 $calc(4+(%.l /16)*(%a -1)) $calc(+4+(%.h /2)-30) $calc(-8+%.l /16) 50 5 15 | inc %a | drawdot %]
  }
  Ü
}
alias sotb {
  splay -p skip | %.z = $scriptdir | ¥ 4 Beast1_4.mod 150 | %.l = 800 | %.h = 600 | %.1 = $int($calc(72*%.l /640)) | %.2 = $int($calc(109*%.h /400)) | %.4 = %.l / 2 | %.p = $+(",%.z,gfx/fond-sotb.png,") | %.b = $+(",%.z,gfx/barriere.png,") | %x1 = $ô(198,21,0) | %y2 = $ô(198,40,0) | %x3 = $ô(198,61,-1) | %y3 = $ô(198,19,0) | %x4 = $ô(198,79,0) | %y4 = $ô(198,9,0) | %x5 = $ô(199,88,0) | %y5 = $ô(198,7,0) | %x6 = $ô(198,94,0) | %y6 = $ô(198,73,0) | %x7 = $ô(198,167,-1) | %y7 = $ô(198,2,0) | %x8 = $ô(198,169,-2) | %y8 = $ô(198,3,0) | %x9 = $ô(198,172,-3) | %y9 = $ô(198,7,0) | %x10 = $ô(198,179,-4) | %y10 = $ô(198,7,0) | %x11 = $ô(198,186,-5) | %y11 = $ô(198,14,0) | %x12 = $ô(198,177,0) | %y12 = $ô(198,22,0)
  %a = 1 | %b = 1 | %c = 1 | %d = 1 | %e = 1 | %f = 1 | %g = 1 | %h = 1 | %p = 1 | %s = 0 | %.' = 0 | %m = 0 | %ss = 1 | %¥ = 0 | %app = 1 | %ø = 0 | %.po = 0 | %.arbre1 = $+(",%.z,gfx/arbre1.png,") | %.door = $+(",%.z,gfx/door.png,")
  var %i $str($chr(160),65),%j $str($chr(160),20) | %.tex = HEY BOoY ! %j YOU THINK YOU CAN BEAT DIS ? %j HEHE WHERE I HAVE ALLREADY HEARD THAT? %i WELCOME TO THE » 1ST » PURPLE TENTACLES MEGADEMO! %i SCROLLERS GALORE AND THIS IS THE MAIN-MENU : USE THE CUSORS KEYS TO CONTROL THE BEAST. %i FIND THE DOORS THAT WILL MAKE YOU GET INTO DIFFERENTS TWILIGHT ZONES! %i YA SHOULD PRESS DOWN INSTEAD OF PRONOUNCING SILLY WORDS AS "ABRACADABRA LAMAH inc" OR "OPEN SESAME! ltd". %i GO AHEAD RUN THE BEAST JUST JUMP LIKE A FREAK AND MOVE YOUR BODY! %j \o\ *yEaH* to the LEFt! *WoO* /o/ to the RIGHt!!! | window -pdBfC +dL @sotb 0 0 %.l %.h | go
}
alias -l ô return $calc(%.h /($1 /$2)+$3)
alias -l 7f set %æ1 2205 | set %pp 8808
alias -l 7g set %æ1 0 | set %pp 0
alias -l go {
  ¢ a 1 %a | ¢ b 2 %b | ¢ c 3 %c | ¢ d 4 %d | ¢ e 5 %e | ¢ f 6 %f | ¢ g 7 %g | × %f 0 %x1 0 21 | × %e %x1 %y2 22 39 | × %d %x3 %y3 61 19 | × %c %x4 %y4 80 9 | × %b %x5 %y5 89 7 | × %a %x6 %y6 95 73 | × %b %x7 %y7 168 2 | × %c %x8 %y8 169 3 | × %d %x9 %y9 172 7 | × %e %x10 %y10 179 7 | × %f %x11 %y11 186 12 | if (%ø¨)  %g %x12 %y12 0 21 | inc %m 4 | if (%s = 1) dec %pp 4 | if (%s = -1) inc %pp 4 | var %% $calc(170+85*$cos($calc(2*%m)).deg),%® $sin(%m).deg,%ã %® * 255,%½ 255 - %% | if (%æ1 < 0) 7f | if (%æ1 > 2205) 7g
  if (%pp > 292 && %pp < 1388) ö 1200 %pp World 1 $rgb(0,%ã,0) $rgb(0,%½,0) %% 200 225 | if (%pp > 1492 && %pp < 2588) ö 2400 %pp World 2 $rgb(0,0,%ã) $rgb(0,0,%½) %% 500 525 | if (%pp > 2692 && %pp < 3788) ö 3600 %pp World 3 %ã %½ %% 805 830 | if (%pp > 3892 && %pp < 4988) ö 4800 %pp World 4 $rgb(%ã,%ã,0) $rgb(%½,%½,0) %% 1105 1130 | if (%pp > 5092 && %pp < 6188) ö 6000 %pp World 5 $rgb(0,%ã,%ã) $rgb(0,%½,%½) %% 1405 1430 | if (%pp > 6292 && %pp < 7388) ö 7200 %pp World 6 $rgb(%ã,50,%ã) $rgb(%½,50,%½) %% 1705 1730 | if (%pp > 7492 && %pp < 8588) ö 8400 %pp World 7 $rgb(%ã,%ã,%ã) $rgb(%½,%½,%½) %% 2005 2030
  if %¥ = 1 { set %h 2 | inc %ø 5 | set %app 1 | var %z 80 * $cos($calc(-89-%ø)).deg | if %ø > 182 { set %¥ 0 | set %app 1 | set %z 0 | set %ø 0 | set %h 1 } } | if %.' != 0 { inc %h %.' | if (%h = 7) set %h 1 | var %pic = $+(",%.z,gfx/beast00 $+ $int(%h),.png,"),%yi $calc(%x9 -%.2 +%z) | if %s = -1 { drawpic -cnst @sotb 255 $calc((%.h +%.1)/2) %yi %.1 %.2 %pic | inc %æ1 } | else { drawpic -cnst @sotb 255 $calc(%.h -.35*%.h +%.1 /2) %yi $calc(-%.1) %.2 %pic | dec %æ1 } }
  else { var %pic = $+(",%.z,gfx/beast00 $+ $int(%h),.png,"),%yi $calc(%x9 -%.2 +%z) | if (%ss = 1) drawpic -cnst @sotb 255 $calc((%.h +%.1)/2) %yi %.1 %.2 %pic | else drawpic -cnst @sotb 255 $calc(%.h -.35*%.h +%.1 /2) %yi $calc(-%.1) %.2 %pic } | if %m < 10000 && %s = 0 { drawtext -nr @sotb 0 impact 100 $calc(1097-3*%m) -10 %.tex | drawtext -nr @sotb $rgb($calc(150+105*$cos(%m).deg),255,$calc(150-105*%®)) impact 100 $calc(1100-3*%m) -13 %.tex } | if (%s = 1) dec %ppp 4 | if (%s = -1) inc %ppp 4 | if (%ppp < -200) set %ppp 1000 | if (%ppp > 1000) set %ppp -200 | drawpic -cnt @sotb 0 $calc(2600-3*%ppp) 259 %.arbre1 | if (%jah) yp | drawdot @sotb | .timer -h 1 0 go
}
alias -l ¢ inc % $+ $1 $calc($2 *%s) | if ($3 > 320) set % $+ $1 1 | if ($3 < 1) set % $+ $1 320
alias -l × drawpic -cns @sotb 0 $2 %.l $3 $calc(320-$1) $4 320 $5 %.p
alias -l  drawpic -cnst @sotb 16711935 0 $2 %.l $3 $calc(320-$1) $4 320 $5 %.b
alias -l ö var %Ã drawtext -nr @sotb,%Ø $1 - $2 | drawpic -cnt @sotb 255 %Ø 347 %.door | %Ã $5 impact 27 %Ø 318 $3 $4 | %Ã $6 Webdings 140 $calc(-135+%Ø) $calc(350+$iif(%.po,$calc(30*$cos(%m).deg)))) 8 7 | if %æ1 > $8 && %æ1 < $9 { %Ã $calc(988+$7) Werdana 40 $calc(30+%Ø +2*$sin($calc(2*%m)).deg) 340 .. | %Ã 6892131 terminal 50 228 170 Press down | set %.po $4 } | else set %.po 0
alias -l yp drawtext -nr @sotb 255 terminal 10 0 591 TURBO MODE: PRESS [SPACEBAR] ** THIS SCREEN IS THE REMAKE OF THE LEGENDARY GAME "SHADOW OF THE BEAST" Reflections /  Psygnosis  1989 ** | drawtext -nr @sotb 0 terminal 25 210 160 Welcome stranger ! Choose your destiny. | drawtext -nr @sotb 0 terminal 25 210 200 Shadow of the Beast - PPT remake - 2004 | drawrect -nrifd @sotb 0 0 180 150 450 85 20 20 | drawrect -nrd @sotb 16777215 1 180 150 450 85 20 20
menu @sotb {
  sclick: °° | cw | kz | gen
}
alias -l quitdmo °° | cw | sq | fs Reset | fs ShowMouse | dll -u $+(",$scriptdir,bin\fullscreen.dll,") | plm | del
menu @f {
  sclick: quitdmo
}
alias -l mu °° | cw | kz
alias -l kz var %i 12 | while %i { unset %x $+ [ %i ] %y $+ [ %i ] | dec %i } | unset %a %b %c %d %e %f %g %h %p %s %m %ss %¥ %app %ø %to %.*
on *:keydown:@sotb:*:var %w $keyval | %jah = 0 | if %w = 37 { set %s 1 | set %.' .2 } | if %w = 39 { set %s -1 | set %.' .2 } | if %w = 38 { if (%ø = 0) if (%app = 1) set %¥ 1 } | if %w = 40 { var %& sc $+ %.po | if %.po { mu | [ %& ] } } | if %w = 32 { $iif(%ø¨ = 0,%ø¨ = 1,%ø¨ = 0) }
on *:keyup:@sotb:*:if $keyval = 37 { set %s 0 | set %.' 0 | set %ss 0 } | if $keyval = 39 { set %s 0 | set %.' 0 | set %ss 1 }
alias -l un %jah = 1 | %ppp = 0 | %a = -nr @- | %ø¨ = 1 | %1 = drawtext %a | %2 = drawline %a | %- = 800*600 16 BITS - CHOOSE YOUR FREQUENCY | %+ = FULLSCREEN | %_ = 60Hz : Notebook, LCD monitor, even BombStrike broken 17". | %\ = 85Hz : Best mode - Please use a 24" Eizo. | %i = 90 | %é = 0 0 640 400 | %@ = drawrect -nrf @- | window -pBCdo +dL @- %é | %@ 0 1 %é | %.z = $scriptdir | %lo = $+(",%.z,\gfx\cauldron2b.png,") | %s = 140 | ¥ 4 delicate0ooz.mod 50 | %bq = 1 | à | .timer 0 6 se
alias -l se set %bq $iif($r(0,1),$r(1,3),$calc(-$r(1,3)))
alias -l à {
  var %ç $calc(65+50*$cos(%s)),%à = %@ $rgb(0,%ç,%ç) 1 0,%¨ 640 100,%µ 20,%h = $abs($int($calc((4+3*$cos(%s).deg % 40)))) * 30,%{ 7895100 wingdings 110,%= terminal 8,%% $calc(6619135/%s *$sin(%i).deg) | %@ 0 0 0 94 640 210 | $&(0,%à 0 %¨,%@ 0 1 0 0 %¨) | $&(300,%à 300 %¨,%@ 0 1 0 300 %¨) | inc %s .5 | inc %i $calc(5*$sin(%s).deg) | if (%i > 270) set %i 90 | %1 $rgb(%ç,%ç,%ç) impact 95 95 140 %+ | while %µ { %1 $calc(180000+30000*%µ) wingdings 30 $calc(300+280*$sin($calc(5*%s +7.5*%µ)).deg) $calc(185+90*$cos($calc(5*%s +15*%µ /%bq)).deg) « | dec %µ } | %1 %{ 0 142 ¬ | %1 %{ 533 142 ¬ | %1 0 impact 25 20 30 %_ | %1 0 impact 25 100 335 %\ | set %a $calc(160*$cos($calc(-145+.5*%s)).deg)
  while %h { var %% %h + %i,%y 100 * $sin(%%).deg,%x %a * $cos(%%).deg,%r 158 + %x,%s 202 + %y,%t 202 - %y,%u 158 - %x,%w 477 - %x,%g 477 + %x | ç %r %s %w %s | ç %u %t %g %t | ç %u %t %r %s | ç %g %t %w %s | dec %h 15 }
  %1 $rgb(%%,%%,%%) %= 210 240 %- | drawpic -cni @- $calc(-120+2*%x) 40 %lo | drawrect -rn @- 13487360 5 %é | drawdot @- | .timer -h 1 0 à
}
alias -l ç %2 13487360 0 $1 $2 $3 $4
alias -l & $iif($inrect($mouse.x,$mouse.y,0,$1,640,100),$2,$3)
alias -l sx fs Fullscreen $window(@-).hwnd > 800 > 600 > 16 > $1 | cw | °° | fs HideMouse | sota
alias -l fs dll $+(",$scriptdir,bin\,fullscreen.dll,") $1-
alias -l ¥ if $fmod(FMOD_Connect,$scriptdirbin\fmod.dll)!=0 { } | if $fmod(SOUND_Init,44100 $1 0) { } | var %a $fmod(MUSIC_LoadSong,1 " $+ $scriptdir\msx\ $+ $2 $+ "),%a $fmod(MUSIC_PlaySong,1) ,"),%a $fmod(MUSIC_SetMasterVolume,1,$3)
alias -l sota ¥ 4 COS_NIESAMOWITEGO_2.MOD 100 | gc | ae | %" = -10 | %8 = 0 | %7 = 0 | .timery -m 1 300 sot
alias -l sot inc %" | inc %7 | var %f $calc(300+%" +%8),%h $calc(300-%" -%8),%ö drawrect -nrf @a | if %7 < 600 { %ö $calc(3932160+.2*%") 0 0 0 800 600 | $sha(140,185,PREPARE YOUR BRAIN) | $sha(110,255,FOR SOMETHING NEW !!) | $sha(7,325,FOR SOMETHING UNBELIEVABLE !) | $sha(7,395,THIS IS - PPT MEGADEMO -) } | if %7 > 600 { tvo | halt } | if (%" > 200) dec %" | if (%7 > 398) dec %8 | %ö 0 0 0 %f 800 300 | drawline -nr @a 16777215 3 -2 %f 802 %f | %ö 0 0 0 0 800 %h | drawline -nr @a 16777215 3 -2 %h 802 %h | drawdot @a | .timer -h 1 0 sot
alias -l sha drawtext -nr @a 0 terminal 40 $calc(-4+$1) $calc(4+$2) $3 | drawtext -nr @a 16777215 terminal 40 $1 $2 $3
alias -l tvo var %i 0,%j 0 | while %i < 800 { drawdot -r @a 0 10 $calc(-5+%i) 300 $calc(805-%i) 300 | inc %j .0002 | inc %i %j } | cw | intro
alias -l ae drawrect -rf @a 0 0 0 0 800 600
alias -l sc7 ¥ 4 reed-twentyfour_and_up.mod 255 | %.z = $scriptdir | %.c = drawrect -nfr @a 0 0 0 0 800 600 | gc | %a = 0 | %.t1 = .. LET'S BEGIN AT 5. -1- ! -2- YO LMAHZ YOU ENTERED THE RED SECTOR! OK THAT WASN'T 5 BUT GET READY FOR THE NEXT EFFECT ??? | %.t3 = $str($chr(160),188) AHAHAHAHAHAHAHAHA!!! OH, THIS IS TOO UGLY.. HEY STANZ, CA COMMENCE A GAVER TES SCROLLERS! HUM, JUST 10 SECONDS PLIZ... REALLY TEN THIS TIME? *OYEZZZ* -> THIS IS -> PART 2! | scr1
alias -l uns unset %a %s
alias -l scr1 {
  inc %a 30 | var %b %a / 3,%i 600 | %.c
  while %i { drawtext -nr @a $calc(155+100*$sin($calc(%b +%i)).deg)) impact 90 $calc(8-.1*%a) $calc(-94+%i) %.t1 | dec %i 75 } 
  var %i 800,%s $iif(%a % 9 < 5,0,1)
  while %i { var %z %a + %i | drawscroll -n @a %s $calc((80+70*$cos($calc(.05*%z)).deg)*$sin($calc(%i +%b)).deg +250*$cos($calc(.1*%z)).deg) $calc(-5+%i) 0 5 600 | dec %i 5 }
  drawdot @a | if %a > 36200 { uns | var %i 300, %a | while %i > 0 { drawrect -rfn @a $rgb(%i,0,%i) 0 0 0 800 $calc(300-%i) | drawrect -rfn @a $rgb(%i,%i,100) 0 0 $calc(301+%i) 800 $calc(300-%i) | drawdot @a | inc %a .07 | dec %i $calc(.15+%a) } | scr1-2 | halt } | .timer -h 1 0 scr1
}
alias -l scr1-2 {
  inc %a 25 | var %i 600,%b %a / 3,%k $sin($calc(-160+.15*%b)).deg,%j $iif(%k < 0,30,$calc(65+20*$sin($calc(.25*%a)).deg)),%d $iif(%k < 0,30,300) | if (%a > 7000) %.c | if (%a = 3025) %.c | set %.t2 $str($int($calc(10-%a /300)),90) | var %vg = $iif(%a > 3000,%.t3,%.t2)
  while %i { drawtext -nr @a $calc(255*$cos(%b).deg +65537*155+100*$sin($calc(.8*(%b +%i))).deg)) impact 36 $calc(8-.1*%a) $calc(-38+%i) %vg | dec %i %d }
  var %i 800 | while %i { drawscroll -n @a 0 $calc(%j *$sin($calc(%i +%b)).deg) $calc(-5+%i) 0 5 600 | dec %i 5 }
  if %k < 0 drawline -nr @a 0 60 0 0 800 0 | else inc %a $abs($calc(25*$cos($calc(.2*%a)).deg)) | drawline -nr @a 0 $iif(%k < 0,60,230) 0 600 800 600 | drawdot @a | if %a > 37100 { uns | scr1-3 | halt } | .timer -h 1 0 scr1-2
}
alias -l scr1-3 {
  ¥ 64 rez-monday.mod 140 | %.z = $scriptdir | %.g = $+(",%.z,gfx\double1.PNG,") | %.colo = %.g | %.p = $pic(%.g).width | %.q = $pic(%.g).height | %.1 = $calc((%.l -%.p)/2) | %t = 10 | var %i 255,%j 800,%9 0 0 800 600 | window -pdoBfC +dL @a %9 | drawrect -rf @a 501 0 %9
  while %j { drawline -nr @a $calc(100*%j) 2 -20 %j 800 %j | drawline -nri @a $calc(.1/10*%j) 2 %j -20 %j 600 | dec %j 2 }
  drawpic -nscmt @a 0 150 125 $calc(2*%.p) $calc(2*%.q) %.colo | drawrect -rn @a $rgb(150,50,150) 8 %9
  while %i { drawtext -rn @a $rgb(%i,3,%i) impact 80 $calc(260+.01*%i) $calc(.075*%i)) - PART II - | dec %i }
  drawdot @a | var %i %t
  while %i { window -pdoBfn +dL @a $+ %i %9 | drawrect -nrf @a $+ %i 0 0 %9 | dec %i }
  %a = 0 | %b = 0 | %c = 0 | .timerq -m 1 1400 etu
}
alias -l etu {
  var %ç drawline -nri @a
  while %b < 800 {
    if (%a = %t) set %a 0 | inc %a | inc %b | %ç $+ %a $calc(65006-(.7*%b)*%a) 10 -4 %b 800 %b | %ç $+ %a $calc(63000-50 *%b) 10 %b 0 %b 600
    %ç $+ %a %b 0 0 %b 800 %b | %ç $+ %a %b 0 %b 0 %b 600 | drawtext -nro @a $+ %a $calc(%a *%b) impact 15 $calc(408-160*$sin($calc(1.8*%b)).deg) $calc(282-160*$cos($calc(1.8*%b)).deg) PPT
    drawdot -nri @a $+ %a $calc(10552145+%b) 150 $calc(420+350*$cos($calc(.45*%b)).deg) $calc(295+350*$sin($calc(.45*%b)).deg) 
  }
  var %i 300, %a | while %i > 0 { drawrect -rfn @a $rgb(%i,0,%i) 0 0 0 800 $calc(300-%i) | drawrect -rfn @a $rgb(%i,%i,100) 0 0 $calc(301+%i) 800 $calc(300-%i) | drawdot @a | inc %a .07 | dec %i $calc(.15+%a) }
  %a = 0 | %b = 0 | %q = 0 | %g = 0 | et2
}
alias -l et2 {
  if %b > 1400 { et3 | halt } | inc %g | if (%a = %t) set %a 0 | inc %a | if (%g > 100) inc %b .5 | drawcopy -n @a $+ %a 0 0 800 600 @a 0 0
  if %b > 0 && %b < 8000 { if (%b < 30) inc %q 10 | drawrect -nrfi @a 0 1 0 $calc(290+600-%q) 800 85 | drawtext -nr @a 0 impact 200 0 $calc(170+600-%q) BEAT DIS!! | drawrect -nrf @a 0 1 0 $calc(170+600-%q) 800 15 | drawrect -nrf @a 255 1 0 $calc(400+600-%q) 800 15 | drawrect -nrfi @a 0 1 0 $calc(290+600-%q) 800 85 }
  if (%b > 360 && %b < 1183.5) drawpic -nstcm @a $+ %a 0 $calc(380-(%.p /1)*$cos($calc(1*%b)).deg) $calc(280-(%.p /2)*$sin($calc(.5*%b)).deg) $int($calc((%.p /1.5)*$cos($calc(4*%b)).deg)) $int($calc((%.p /1.5)*$sin($calc(2*%b)).deg)) %.colo
  drawdot @a | .timer -h 1 0 et2
}
alias -l et3 {
  clear -n @a | var %i 800,%0 drawrect -rfn @a | %b = 0
  while %i { drawline -nri @a $calc(300*5*%i) 0 0 %i 800 %i | drawline -nri @a $calc(200000+7*%i) 0 %i 0 %i 600 | dec %i }
  drawdot @a | var %i 10,%s terminal 100 0,%k drawtext -nr @a
  while %i { drawrect -rfn @a $+ %i 0 0 0 0 800 600 | dec %i }
  while %b < 800 {
    var %2 $r(0,150),%x $calc($r(0,16)*50),%y $calc($r(0,12)*50),%w $calc(300+100*$sin(%b).deg),%v $calc(300+80*$cos(%b).deg),%n drawdot -nri @a $+ %a,%g %b / 2,%m %w / 1.2 | drawdot -nri @a $+ %a $calc(9625145+%g) $calc(20+10*$sin(%g).deg) $calc(400+350*$cos($calc(18*%g)).deg) $calc(300+400*$sin($calc(4*%g)).deg) | %0 %2 0 %x %y 50 50 | %0 $calc(50+%2) 0 $calc(10+%x) $calc(10+%y) 30 30 | %0 $calc(105+%2) 0 $calc(20+%x) $calc(20+%y) 10 10 | drawrect -rn @a $calc(140+%2) 3 %x %y 50 50
    %k $rgb($calc(%v /1.7),%m,%v) %s 5 OK DAD. WE CAN | %k $rgb($calc(2*%v),%m,%v) %s 105 DO BETTER... | %k $rgb($calc(%v /2.3),%m,%v) %s 205 DON'T WORRY | %k $rgb($calc(%v /2.6),%m,%v) %s 305 BE HAPPY. IT'S  | %k $rgb($calc(%v /2.9),%m,%v) %s 405 JUST A JUMP TO | %k $rgb($calc(%v /3.2),%m,%v) %s 505 THE LEFT. | if (%a = %t) set %a 0 | inc %a | inc %b .5 | %n 15524005 %b 500 %v | %n 15524005 %b 300 %w | %n 15525145 %b 100 %w | %n 15525145 %b 700 %v | drawdot @a
  }
  %.z = $scriptdir | %.g = $+(",%.z,\gfx\cauldron2.png,") | %.p = $pic(%.g).width | %.q = $pic(%.g).height | %.1 = $calc((%.l -%.p)/2) | window -a @a | et4
}
alias -l et4 {
  inc %g | if (%a = %t) set %a 0 | inc %a | if (%g > 100) inc %b .5 | drawcopy -n @a $+ %a 0 0 800 600 @a 0 0 | if %b < 1200 { drawtext -nr @a 13112520 impact 45 $iif(%b < 1000,$calc(4000-(4*%b)),0) -8 %. KEFTALES » WITHOUT » PALETTE CYCLING - BOY }
  if %b > 1200 && %b < 1500 { drawrect -nrfi @a 0 1 0 0 800 600 | drawpic -nsctm @a 255 140 -20 $calc(2*%.p) $calc(2*%.q) %.g | drawtext -nr @a $rgb(205,20,155) impact 32 0 -5 GAAAAAH!!!! YOUR EYES WILL NOT BELIEVE THE FOLLOWING SCREEN... } | if %b > 1500 && %b < 1510 { if . isin %b { } | else { drawpic -nsctm @a $+ %a 255 140 -20 $calc(2*%.p) $calc(2*%.q) %.g | drawrect -nrf @a $+ %a 16777215 1 473 300 155 20 | drawtext -nor @a $+ %a 0 verdana 30 485 292 PICWIN | drawtext -nr @a $+ %a $rgb(255,255,255) impact 35 3 -5 >> GLENZ BITMAP WITH MIRC. ONLY PPT MAKE IT POSSIBLE! } }
  if %b > 1500 { drawtext -nor @a 0 impact 15 $calc(520+$r(1,5)) 343 GOT IT ? | drawtext -nr @a 255000 arial 10 658 30 HaMmEr, CaN't ToUcH DiS } | drawdot @a | .timer -h 1 0 et4
}
alias -l end.1 °° | cw | inc %aaa | unset %.g %.colo %.p %.q %.1 %t %b %c %q %g %aaa %1 %2 %- %+ %_ %\ %i %é %@ %lo %.c %.t1 %.t3 %.t2 %" %8 %7 %i %a % %x* %y* %z* %7 %8 %v | sotb
menu @a {
  sclick: end.1
}
on *:keydown:@a:*:{
  if $keyval = 32 end.1
}
alias -l sc2 ¥ 4 vim-not_again.mod 150 | gc | %n = 0 | xou
alias -l xou {
  drawrect -nrf @a 6555000 0 0 0 800 600 | inc %n | var %x 15 * $cos(%n).deg,%y 150 * $sin(%n).deg,%t 0,%e $sin($calc(2*%n)).deg,%[ $chr(266)
  while %t < 250 { drawline -rn @a %t $calc(250-%t) $calc(400+%x) $calc(300-%y +%t) $calc(400-%x) $calc(300+%y +%t) | inc %t 10 }
  if (%n > 300) drawtext -nr @a $calc(11555100-160*%e) impact 100 90 $calc(370+80*%e) OYEZ SAPAPAYA! | var %i 600
  while %i { drawscroll -n @a $int($calc(40*$sin($calc(%i +10*%n)).deg)) 0 0 $calc(%i -8) 800 10 | dec %i 8 }
  sh 80 65 40 $iif(%n < 200,P $+ $left(ürple tentacles inc,$calc(.2*%n)) $chr(266),Pürple tentacles inc)
  sh 30 90 180 $iif(%n > 250,T $+ $left(he fucking good =PPT= proudly present this gem.,$calc(.3*(%n -250))) %[,%[)
  sh 30 90 220 $iif(%n > 400,O $+ $left(nce again a new effect with mIRC called,$calc(.3*(%n -400))) %[,%[)
  sh 30 90 260 $iif(%n > 550," $+ $left(distortion" scripted in 185 secs because we rule!,$calc(.3*(%n -550))) %[,%[)
  if %n > 1200 { var %f %n - 1200 | drawtext -nr @a 0 wingdings $calc(16*%f) $calc(400-(7*%f)) $calc(300-(8.2*%f)) « | if (%f > 40) drawtext -nr @a $rgb($abs(%y),$calc(5*%y),200) impact 50 290 270 DISTORTION } | if %n > 1460 { %h = drawdot -nir @a | %ù = $+(",$scriptdir,gfx\paper.png ,") | dis | halt }
  drawdot @a | .timer -h 1 0 xou
}
alias -l sh drawtext -nr @a 0 impact $1 $calc(-3+$2) $calc(3+$3) $4- | drawtext -nr @a 11555510 impact $1 $2 $3 $4-
alias -l dis {
  inc %t 10 | inc %s 2 | var %i 470,%a $cos(%s).deg,%b $sin(%s).deg,%c $calc(400+60*%b),%d $calc(300+60*%a),%e 800 - %c,%f 600 - %d,%e $calc(%e +100*%b *%a) | drawrect -nrf @a $calc(%s +1500000-5*%a) 0 0 0 800 600 | if %t > 3000 { lol | halt }
  while %i { %h %e %i %c %d | %h %c %i %e %f | dec %i 10 }
  drawpic -ntc @a 16777215 0 0 %ù | drawdot @a | .timer -h 1 0 dis
}
alias -l lol var %p hadd -m,%l 0 0,%m -100,%n 100 | %v = drawfill -rn @a | % = 0 | %x* = 400 | %y* = 300 | %z* = 256 | %g = 1 | %p x 1 %m | %p x 2 %n | %p x 3 %n | %p x 4 %m | %p x 5 %n | %p x 6 %m | %p x 7 %m | %p x 8 %n | %p y 1 %m | %p y 2 %m | %p y 3 %n | %p y 4 %n | %p y 5 %m | %p y 6 %m | %p y 7 %n | %p y 8 %n | %p z 1 %m | %p z 2 %m | %p z 3 %m | %p z 4 %m | %p z 5 %n | %p z 6 %n | %p z 7 %n | %p z 8 %n | %p x2 %l | %p y2 %l | %p z2 %l | %p x3 %l | %p y3 %l | %p z3 %l | %p x5 %l | %p y5 %l | ba
alias -l ba {
  var %i 0,%s $cos(%),%j $int($calc(50+45*%s)),%e drawline -rin @a | drawrect -nrf @a 0 0 0 0 800 600 | drawtext -nr @a 255 impact 550 -13 -30 PPT
  while %i < $calc(800+%j) { %e %i %j -2 %i 800 %i | %e $calc(655350*%j +600*% -1.5*%i) %j %i -2 %i 600 | inc %i %j }
  inc %7 $calc(3*$cos(%8).deg) | set %z* $calc(700-520*$cos(%7).deg) | inc %8 | var %i 9,%r $sin(%) | if %8 > 800 { bu | halt }
  while %i { var %t = $hget(z3,%i) + %z*,%u hadd | %u x2 %i $calc($hget(x,%i)-200*$sin($calc(%s *%))) | %u y2 %i $calc(-50*%s +$hget(y,%i)*%s -$hget(z,%i)*%r) | %u z2 %i $calc($hget(y,%i)*%r +$hget(z,%i)*%s) | %u x3 %i $calc($hget(x2,%i)*%s +$hget(z2,%i)*%r) | %u y3 %i $hget(y2,%i) | %u z3 %i $calc(-1*$hget(x2,%i)*%r +$hget(z2,%i)*%s) | %u x5 %i $calc(256*$calc($hget(x3,%i)/%t)+%x*) | %u y5 %i $calc(256*$calc($hget(y3,%i)/%t)+%y*) | dec %i }
  var %i $calc(255-(.4*($hget(z3,1)+%z*))) | ha 5 6 %i | ha 6 7 %i | ha 7 8 %i | ha 8 5 %i | %v %i %i $calc(($hget(x5,8)+$hget(x5,6))/2) $calc(($hget(y5,8)+$hget(y5,6))/2) | var %a = $rgb(%i,%i,%i) | ha 6 1 %a | ha 2 5 %a | ha 5 6 %a | ha 1 2 %a | drawfill -rin @a %a %a $calc(($hget(x5,6)+$hget(x5,2))/2) $calc(($hget(y5,6)+$hget(y5,2))/2) | var %a = $rgb(%i,0,%i) | ha 3 4 %a | ha 4 7 %a | ha 7 8 %a | ha 8 3 %a | %v %a %a $calc(($hget(x5,8)+$hget(x5,4))/2) $calc(($hget(y5,8)+$hget(y5,4))/2) | var %a = $rgb(0,0,%i) | ha 1 2 %a | ha 2 3 %a | ha 3 4 %a | ha 4 1 %a | %v %a %a $calc(($hget(x5,4)+$hget(x5,2))/2) $calc(($hget(y5,4)+$hget(y5,2))/2) | inc % $calc(.1*$cos(%8).deg) | drawtext -nr @a 255 terminal 8 740 590 Backtro =) | drawdot @a | .timer -h 1 0 ba
}
alias -l ha drawline -nr @a $3 0 $hget(x5,$1) $hget(y5,$1) $hget(x5,$2) $hget(y5,$2)
alias -l bu {
  var %i -1000,%j hadd -m,%r hmake,%o .hfree | if $hget(t1,1) { %o t1 | %o t2 | %o t3 } | %r t1 1000 | %r t2 1000 | %r t3 1000 | ui | drawtext -rn @a 0 IMPACT 400 120 60 GO! | drawrect -nr @a 200 4 0 0 800 600 | drawdot @a
  while %i < 1000 { %j t1 %i $oz(%i,35,186) | %j t2 %i $oz(%i,45,77) | %j t3 %i $oz(%i,65,44) | inc %i }
  %k = -400 | %g = 0 | .timer 1 1 pa
}
alias -l plm unset %ø %£ %dll %pp %æ1 %n %ei %ez %ja %cc %ge %rt %fon %fr %vt %6 %s %h* %io %scr %kp %pic %pW %pH %o %txt %wox %u %tx %Ü %Ñ %ñ %É %® %Éd %Ë %å %ú %Ä %pik %p.H %p.W %aa %bb %r %m %to %jah %ù %k %ppp %ø¨ %a %1 %2 %- %+ %_ %\ %i %@ %.* %lo %s %é %bq %& %^ %% %~ %¨ %'_ %° %ç
alias -l pa {
  inc %k 5 | var %x 0,%y 0,%l $calc(65535*$sin(%k).deg)
  while %y < 150 {
    while %x < 150 { drawrect -rnf @a $calc(6535+80*$calc($hget(t1,$calc(%x +%k))+$hget(t2,$calc(%x +%y -%k))+$hget(t3,$calc(%x -%y +%k)))) 0 %x %y 4 4 | inc %x 5 }
    inc %y 5 | var %x 0
  }
  drawcopy -nsm @a 0 0 150 150 @a 0 0 800 600 | drawtext -nr @a %l impact 100 0 -10 PPT | drawtext -nr @a %l impact 43 180 2 >>>     NEVER FORGET US | drawdot @a | if %k > 1230 { end.1 | halt } | .timer -h 1 0 pa
}
alias -l oz return $calc($sin($calc($1 /$2)*$3))
alias -l ui {
  var %i 600,%( drawline -rin @a | while %i { drawline -rn @a $calc((%i /205)*65536) 0 0 %i 800 %i | dec %i }
  var %i 800 | while %i { %( %i 0 -2 %i 800 %i | %( %i 0 %i -2 %i 600 | dec %i }
}
alias -l sc3 {
  %zr = 0 | % = 0 | %ei = 0 | %ez = 0 | %za = -rni | %zi = 3 | %zo = 0 | %ja = 4500 | %cc = 6666661 | %ge = -nr | %rt = 1 | %.z = $scriptdir | %fon = $+(",%.z,gfx\ald2.png,") | ¥ 4 occ-san-geen.mod 255 | var %¨ 0 0 200 220,%£ drawrect -rfn
  gc | %£ @a 65555 0 0 0 800 600 | window -pdoBfCn +dL @b %¨ | %£ @b 13451225 0 %¨ | %fr = 0
  wb | var %i 220,%j hadd -m | while %i { drawtext -rn @b 0 webdings 5 0 $calc(%i -5) $str(h,50) | dec %i 5 }
  %j x4 1 0 | %j y4 1 0 | %j z4 1 0 | %a = 0 | %b = 0 | %è = 0 | %vt = 0 | %+ = drawrect -nrfi @a | %£ @a 16763135 0 0 505 800 5 | %6 = 2 | gra
}
alias -l gra {
  inc %è .1 | var %° 425,%h $calc(-360+300*$sin($calc(.4*%è))) | inc %a .2 | inc %b | while %° { var %_ $int($calc(40*$sin($calc(%è +.015*%°).deg))) | drawpic -nc @a %h $calc(70+%°) %_ %° 800 25 %fon | drawpic -nc @a $calc(750+%h -%_) $calc(70+%°) 0 %° 800 25 %fon | dec %° 25 } | var %h 50,%k 44 * $cos($calc(%6 *%b)).deg,%g 100 * $sin($calc(%6 *%a)).deg
  while %h { drawcopy -n @b %k $calc(%g +116-%h ^2/150) 318 1 @a $calc(%h -355) $calc(2*(300-%h)) $calc(4*(610-%h)) 4 | dec %h 2 }
  if %è > 50 { %+ 14145890 0 0 500 800 20 | %+ 14145850 0 0 520 800 35 | %+ 14145800 0 0 555 800 55 }
  drawcopy -n @a 0 505 800 105 @a 0 94 800 -105 | if %a = 160 mue | if %a < 400 { ×æ | if (%a > 200) { inc %vt .1 | set %x* $calc(180+40*$sin(%vt)) } } | else boud | if %a = 400 { ppt | set %6 2.5 } | if %a = 600 { %za = -rn | %zi = 0 | %zo = 1 } | if %a = 800 { set %ge -nir | dji } | if %a = 900 { set %rt 0 | set %ge -nr } | if %a = 1000 { set %ge -nri } | drawdot @a | .timer -h 1 0 gra
}
alias -l cw close -@
alias -l mue var %z drawtext -rn @b 14466815 terminal 8 | %z 0 100 Purple TenTacles inc | %z 5 20 MEGADEMO I :) how easy! | %z 80 70 <PPT> LMAH! | %z 30 120 We do it in real time | %z 60 160 <LMAH> Yeah??
alias -l wb % = 0 | %x* = 180 | %y* = 80 | %z* = 256 | var %i 1,%p hadd -m,%q hadd,%§ -100,%+ 100,%- 0 0 | %p x 1 %§ | %q x 2 %+ | %q x 3 %+ | %q x 4 %§ | %q x 5 %+ | %q x 6 %§ | %q x 7 %§ | %q x 8 %+ | %p y 1 %§ | %q y 2 %§ | %q y 3 %+ | %q y 4 %+ | %q y 5 %§ | %q y 6 %§ | %q y 7 %+ | %q y 8 %+ | %p Z 1 %§ | %q Z 2 %§ | %q Z 3 %§ | %q Z 4 %§ | %q Z 5 %+ | %q Z 6 %+ | %q Z 7 %+ | %q Z 8 %+ | %p x2 %- | %p y2 %- | %p Z2 %- | %p x3 %- | %p y3 %-
alias -l e drawfill %ge @a 0 %cc $calc(($hget(x3,$1)+$hget(x3,$2))/2) $calc(($hget(y3,$1)+$hget(y3,$2))/2) %Ñ
alias -l dji var %ï = $+(",%.z,gfx\purplet.png,"),%ë drawpic -nrt @b 255 | drawrect -nrf @b 0 0 0 0 200 300 | drawtext -nr @b 15537000 impact 80 10 50 2004 | %ë 10 15 %ï | %ë 85 30 %ï | %ë 40 80 %ï | %ë 120 120 %ï | %ë 130 5 %ï | %ë 5 130 %ï | %ë 60 160 %ï 
alias -l ×æ {
  inc %s 1 | set %z* $calc(500-200*$cos(%s).deg) | set %h* $calc(1-1*$cos(%s).deg) | inc %io | var %i 9,%q hadd
  while %i { var %1 = $hget(x,%i),%2 = $calc($hget(z2,%i)+%z*)),%3 $cos(%),%4 $sin(%),%5 = $hget(z,%i) | %q x2 %i $calc(%1 *%3 +%5 *%4) | %q y2 %i $hget(y,%i) | %q z2 %i $calc(-1*%1 *%4 +%5 *%3) | if %ei < 140 { %q x2 %i %1 | %q z2 %i $calc($hget(y,%i)*%4 +%5 *%3) } | %q x3 %i $calc(256*($hget(x2,%i)/%2)+%x* +220+%fr) | %q y3 %i $calc(256*($hget(y2,%i)/%2)+%y* +200) | dec %i }
  ¬ 1 6 3 | ¬ 2 5 3 | ¬ 3 8 3 | ¬ 4 7 3 | ¬ 5 6 4 | ¬ 6 7 4 | ¬ 7 8 4 | ¬ 8 5 4 | ¬ 1 2 5 | ¬ 2 3 5 | ¬ 3 4 5 | ¬ 4 1 5
  inc %ei | inc %zr | if (%ei > 200 && %ei < 400) { inc %ez .5 } | if (%ei > 400) dec %ez .5 | if (%ez < 0) set %ei 200 | var %¨ -100 + %ez,%° 100 - %ez,%^ %q x,%` %q Z
  %^ 1 %¨ | %^ 2 %° | %^ 6 %¨ | %^ 5 %° | %` 1 %¨ | %` 2 %¨ | %` 6 %° | %` 5 %°
  if %zr > 590 && %zr < 850 { %^ 4 %¨ | %^ 3 %° | %^ 7 %¨ | %^ 8 %° | %` 4 %¨ | %` 3 %¨ | %` 7 %° | %` 8 %° }
  if %zr > 1150 { %^ 4 %° | %^ 3 %¨ | %^ 7 %° | %^ 8 %¨ | %` 4 %° | %` 3 %° | %` 7 %¨ |  %` 8 %¨ }
  if (%zr > 1900) inc %fr 7 | inc % $calc(.1*$cos(%io).deg)
}
alias -l ¬ drawline -nr @a 16777215 2 $hget(x3,$1) $hget(y3,$1) $hget(x3,$2) $hget(y3,$2) | drawline -nr @a 14877215 2 $calc(-280+$hget(x3,$1)) $hget(y3,$1) $calc(-280+$hget(x3,$2)) $hget(y3,$2) | drawline -nr @a 255 2 $calc(280+$hget(x3,$1)) $hget(y3,$1) $calc(280+$hget(x3,$2)) $hget(y3,$2)
alias -l gc window -pdoBf +dL @a 0 0 800 600
alias -l ppt {
  var %i 34 | while %i { hadd x %i 0 | hadd y %i 0 | hadd Z %i 0 | dec %i } | %x* = 290 | %y* = 180 | %z* = 9825600 | % = 0 | var %a º x,%b º y | %a 1 -65 | %a 2 -35 | %a 3 -35 | %a 4 -65 | %a 5 -25 | %a 6 -25 | %a 7 -35 | %a 8 -25 | %a 9 -55 | %a 10 -55 | %a 11 -55 | %a 12 -65 | %a 13 -55 | %a 14 -15 | %a 15 15 | %a 16 15 | %a 17 -15 | %a 18 25 | %a 19 25 | %a 20 15 | %a 21 25 | %a 22 -5 | %a 23 -5 | %a 24 -5 | %a 25 -15 | %a 26 -5
  %a 27 35 | %a 28 75 | %a 29 75 | %a 30 35 | %a 31 50 | %a 32 60 | %a 33 60 | %a 34 50 | %b 1 25 | %b 2 25 | %b 3 15 | %b 4 15 | %b 5 25 | %b 6 5 | %b 7 5 | %b 8 -5 | %b 9 -5 | %b 10 5 | %b 11 -25 | %b 12 -25 | %b 13 15 | %b 14 25 | %b 15 25 | %b 16 15 | %b 17 15 | %b 18 25  | %b 19 5 | %b 20 5 | %b 21 -5 | %b 22 -5 | %b 23 5 | %b 24 -25 | %b 25 -25 | %b 26 15 | %b 27 25 | %b 28 25 | %b 29 15 | %b 30 15 | %b 31 15 | %b 32 15 | %b 33 -25 | %b 34 -25 | var %i 34 | while %i { hadd -m Z %i 0 | dec %i }
}
alias -l º hadd -m $1 $2 $3
alias -l boud {
  var %i 34 | inc %ja .03 | set %z* $iif(% < 9,$calc(810-80*%),90)
  while %i { hadd x2 %i $hget(x,%i) | hadd y2 %i $calc($hget(y,%i)*$cos(%ja)-$hget(z,%i)*$sin(%ja)) | hadd z2 %i $calc($hget(y,%i)*$sin(%ja)+$hget(z,%i)*$cos(%ja)) | hadd x4 %i $calc($hget(x2,%i)*$cos(%)+$hget(z2,%i)*$sin(%)) | hadd y4 %i $hget(y2,%i) | hadd z4 %i $calc(-1*$hget(x2,%i)*$sin(%)+$hget(z2,%i)*$cos(%)) | hadd x3 %i $calc(256*$calc($hget(x4,%i)/$calc($hget(Z4,%i)+%z*))+%x* +100) | hadd y3 %i $calc(256*$calc($hget(y4,%i)/$calc($hget(Z4,%i)+%z*))+%y* +100) | dec %i }
  inc % .1 | « 1 2 3 4 | « 2 5 6 7 | « 6 8 9 10 | « 11 12 4 13 | « 14 15 16 17 | « 15 18 19 20 | « 19 21 22 23 | « 24 25 17 26 | « 27 28 29 30 | « 31 32 33 34 | if %zo = 1 { if %rt = 1 { f 1 3 | f 2 8 | f 10 8 | f 4 11 | f 14 16 | f 15 19 | f 23 21 | f 17 24 | f 27 29 | f 31 33 } | else { inc %3 | if (%3 > 8) set %3 1 | set %Ñ $+(",%.z,gfx\text00,%3,.png,") | e 1 3 | e 2 8 | e 10 8 | e 4 11 | e 14 16 | e 15 19 | e 23 21 | e 17 24 | e 27 29 | e 31 33 } | set %cc $calc(65535*300*$abs($sin($calc(.0005*%ja)).deg)) | if (%rt = 0) set %cc 255 }
}
alias -l f drawfill %ge @a %cc %cc $calc(($hget(x3,$1)+$hget(x3,$2))/2) $calc(($hget(y3,$1)+$hget(y3,$2))/2)
alias -l « drawline %za @a %cc %zi $hget(x3,$1) $hget(y3,$1) $hget(x3,$2) $hget(y3,$2) $hget(x3,$2) $hget(y3,$2) $hget(x3,$3) $hget(y3,$3) $hget(x3,$3) $hget(y3,$3) $hget(x3,$4) $hget(y3,$4) $hget(x3,$4) $hget(y3,$4) $hget(x3,$1) $hget(y3,$1)
alias -l sc4 {
  sq | if ($fmod(FMOD_Connect,$scriptdirbin\fmod.dll) != 0) { } | if $fmod(SOUND_Init,44100 64 0) { } | var %a $fmod(SOUND_Sample_Load,1 " $+ $scriptdirmsx\dott.mp3" 1),%a $fmod(SOUND_PlaySound,1 1)
  gc | window -pdoBfCn @n 0 0 740 600 | window -pdoBfCn @s 0 0 740 300 | drawrect -nrf @s 255 1 0 0 740 300
  var %i 20,%b 0,%v 0,%- hadd -m,%~ drawcopy -nt @n 255 0
  while %i < 100 { inc %b | var %a $int($calc(1+.1*%i)) | %- AR %b %i | %- ARe %b %a | inc %i %a }
  var %b 1 | while %b < 31 { inc %v .1 | var %h $calc(-50*$sin(%v)+60),%p $calc(16-(%b -15)) | if (%b > 15) %- AR2 %b $hget(AR,%p) | %- AA %b %~ $calc(196-$hget(AR2,%b)) 740 1 @a %h $calc(196-$hget(AR2,%b)) 740 $hget(ARe,%p) | if (%b <= 15) %- AA %b %~ $hget(AR,%b) 740 1 @a %h $hget(AR,%b) 740 $hget(ARe,%b) | inc %b }
  var %i 20,%b 0,%v 0
  while %i < 100 { 
    var %i 20,%b 0
    while %i < 100 { inc %b | var %a $int($calc(13.5-(1+.1*%i))) | %- AR %b %i | %- ARe %b %a | inc %i %a }
    var %b 1,%v 0
    while %b < 31 {
    inc %v .1 | var %h $calc(60*$cos($calc(3.1-%v))+4*$sin(%v)),%p $calc(16-(%b -15)) | if %b > 15 { %- AR2 %b $hget(AR,%p) | %- DD %b %~ $calc(400+199-$hget(AR2,%b)) 740 1 @a $calc((6*(31-%b)+%h)-3) $calc(198-$hget(AR2,%b)) 740 $calc($hget(ARe,%p)+.1*%b) } | if (%b <= 15) %- DD %b %~ $calc($hget(AR,%b)+400) 740 1 @a $calc(8+6*%b -%h) $hget(AR,%b) 740 $hget(ARe,%b) | inc %b }
  }
  %zt = 0 | %c = 0 | %scr = 0 | %lo = $+(",$scriptdir,gfx\image2.png,") | var %h 3618765,%r 3620765 | drawrect -nrf @a 0 1 0 0 800 600 | dr
  ph 7400 %h 45 50 HUM, I'M THIRSTY. | ph 11300 %r 45 0 SHOULD DRINK THAT.. | ph 12100 %r 45 20 I DON'T THINK YOU | ph 14600 %h 70 50 *GLOOPS* | ph 15200 %r 45 0 IT LOOK BAD FOR YOU. | ph 17000 %h 60 60 - SlUrP ! - | ph 18300 %h 45 60 NON SENSE. | ph 20200 %h 55 70 GREAT! | ph 20800 %h 45 0 IT'S MAKE ME FEEL | ph 22000 %h 45 30 SMARTER | ph 22800 %h 45 30 MORE AGRESSIVE! | ph 27000 13618765 45 30 I FEEL LIKE I COULD | ph 30000 13618775 45 30 LIKE I COULD! | ph 38400 13618795 56 25 LIKE I COULD!! | ph 49200 13618885 80 10 WORLD!!! | ph 50000 13618885 60 10 THE | ph 50600 13618885 50 10 TAKE ON | .timer -m 1 57000 set %zt 1
}
alias -l ph .timer -m 1 $1 drawtext -nr @s $2 impact $3 $4 -5 $5-
alias -l dr {
  inc %c 4 | drawrect -nrf @a 0 1 0 20 100 160 | drawscroll -n @s 0 4 0 0 440 300 | drawcopy -n @s 0 100 740 300 @n 369 0 | if (%c > 200) set %c 0 | drawcopy -n @n 0 0 740 200 @n 0 597 740 -200 | drawrect -nrif @n 16776960 0 0 398 740 200 | var %i 1,%u 31,%y drawcopy -n @a 10 10 790 180 @a 10
  while %i < 30 { $hget(DD,%i) | inc %i }
  drawpic -cn @n 0 $calc(-200+%c) %lo | drawpic -cn @n 0 %c %lo
  while %u { $hget(AA,%u) | dec %u }
  if %zt > 0 { inc %zt .1 | var %g 0 | while %g < 200 { drawline -nr @a 0 %zt 0 %g 800 %g | inc %g $calc(600/(60-%zt)) } | if %zt > 13 { °° | drawrect -rf @a 0 1 0 0 800 600 | dot | halt } } | %y 360 790 -170 | %y 362 | %y 712 790 -170 | drawdot @a | .timer -h 1 0 dr
}
alias -l sq dll -u fmod_mIRC.dll
alias -l dot window -pCdo @a 0 0 800 600 | ¥ 4 Visual.mod 200 | %i = 0 | %ii = 0 | %s = 183 | %.z = $scriptdir | as
alias -l tu {
  if %i > 7500 { tl | halt } | if (%i > 4750) drawrect -nrf @a 0 0 0 0 800 600 | inc %i 5 | var %n 0,%a 0
  while %n < 1000 { var %1 -.5 * %n,%2 50 + %n,%3 %i + %n | drawrect -nre @a $calc(100+.1*%n) $calc(.01*%n) $calc(%1 +400+50*$sin(%3).deg) $calc(%1 +300-50*$cos(%3).deg) %2 %2 | inc %n %a | inc %a }
  if (%i > 1780) drawdot @a | .timer -h 1 0 tu
}
alias -l °° .timer* off
alias -l tl {
  var %n 0,%a 0 | if %i = 8900 { %t = 0 | drawrect -nrf @a 0 0 0 0 800 600 | bb | halt } | drawrect -nrf @a 0 0 0 0 800 600 | inc %i 5
  while %n < 1000 { var %1 50 + %n,%2 .5 * %n | drawrect -nre @a $calc(4000+200*$cos($calc(-.1*%n +%i)).deg) $calc(.01*%n) $calc(-%2 +350+(.1*%n +40)*$cos($calc(%i +%2)).deg) $calc(-%2 +250-(100*$cos($calc(.1*%i)).deg)*$sin($calc(%i -%2)).deg) %1 %1 | inc %n %a | inc %a 2 }
  drawdot @a | .timer -h 1 0 tl
}
alias -l as {
  var %n 0,%a 0,%2 0 0 0 800 600,%3 drawtext -nr @a,%4 MEGADEMO,%5 impact,%6 %5 176 | if %ii = 300 { var %1 drawline -r @a | drawrect -rf @a 2621480 %2 | %1 4587590 40 600 0 600 600 | %1 3932220 20 650 0 650 600 | %1 3276850 10 680 0 680 600 | drawtext -r @a 6553700 arial 500 0 20 ? | tu | halt } | drawrect -nrf @a 13107400 %2 | inc %ii | inc %i 5
  while %n < 1000 { drawrect -nref @a $calc(3932220+.5*%a) 0 0 $calc(-.5*%n +400+100*$cos($calc(%i +.2*%n)).deg) $calc(-.5*%n +600-50*$sin($calc(%i +%n)).deg) $calc(500-%n) $calc(1100-2*%n) | inc %n %a | inc %a 20 }
  var %v $calc((2500-2*%i)*$cos($calc(.5*%i)).deg),%n 0,%a 0,%7 %3 3932220 %5
  if ($calc((2500-2*%i)) <= 0) set %v 0
  %3 0 %6 %v 193 %4 | %3 5456 %6 $calc(8+%v) 185 %4 | %7 205 $calc(8-%v) -30 P U R P L E | %7 183 $calc(8-%v) 380 TENTACLES
  while %n < 1000 { drawrect -nre @a $calc(4000+200*$cos($calc(-.1*%n +.5*%i)).deg) $calc(3+2*$sin($calc(.05*%i +.1*%n))) $calc(-.5*%n +650+(.1*%n +60)*$cos($calc(%i +.5*%n)).deg) $calc(-.5*%n +400 - (120*$cos($calc(.1*%i)).deg)*$sin($calc(%i -.5*%n)).deg) $calc(250 -%n) $calc(250 -%n) | inc %n %a | inc %a 5 }
  drawdot @a | .timer -h 1 0 as
}
alias -l bb {
  if %i = 10500 { bj | ¥ 4 maktone-class5.mod 200 | halt } | if %i > 10300 { var %a $fmod(MUSIC_SetMasterVolume,1,$calc(10500-%i)) } | inc %t | if (%t = 9) set %t 1 | drawpic -cslni @a 0 0 800 600 $+(",%.z,gfx\text00,%t,.png,") | inc %i 5 | var %n 100,%a 0,%© $sin(%i).deg,%1 100 * %© | drawtext -nr @a $calc(150+%1) impact 88 %1 -15 WE'LL MAKE YOU HAPPY
  while %n < 200 { var %^ .5 * %n | drawrect -nre @a $calc(40000+.1*%n *21000*$cos($calc(%n *$sin(-.15*%n +%i))).deg) $calc(1+.1*%n) $calc(-%^ +350+(.12*%n +100)*$cos($calc(%i +2*%n)).deg) $calc(200+%n -(200*$cos($calc(.1*%i)).deg)*$sin($calc(%i -%^)).deg) $calc(50+%^) $calc(100+.2*%n /%©) | inc %n %a | inc %a .1 }
  drawdot @a | .timer -h 1 0 bb
}
alias -l bj {
  var %1 $sin(%i).deg,%2 drawtext -nr @a,%3 YOU SIMPLY CAN'T READ DIS!!,%4 impact 70,%5 wingdings 700,%6 400 * %1,%7 $chr(%s),%8 200 * %1,%n 100,%a 0 | %2 $calc(15000-65500*%1) %4 %6 -10 %3 | %2 $calc(15000+65500*%1) %4 $calc(-%6) -10 %3 | inc %t | if (%t = 9) set %t 1 | drawpic -cslni @a 0 0 800 600 $+(",%.z,gfx\text00,%t,.png,") | inc %i 5
  while %n < 1260 { drawrect -nrf @a $calc(65535+40000*$cos($calc(-.2*%a +.1*%i)).deg) 0 $calc(400-(%a +%n)*$sin(%i +5*%n).deg) $calc(700-%n) %a 600 | inc %n %a | inc %a }
  inc %s | if (%s > 194) set %s 183 | %2 0 %5 $calc(80+%8) -45 %7 | %2 1009970 %5 $calc(85+%8) -50 %7 | drawdot @a | .timer -h 1 0 bj
}
alias -l gen ¥ 4 kenet-funky_bubbles.mod 255 | var %i window,%j 0 0,%k 800 40 | %i -pdoBfC +dL @f %j 800 600 | %i -pdohn +dL @c %j %k | drawrect -nrf @c %j %j %k | drawpic -s @f %j 810 600 $+(",$scriptdir,gfx\domin.png,") | %ja = 128 | %txt = $+(",$scriptdir,bin\gtz.txt) | %wox = 0 | %m = 0 | %to = $lines(%txt) | %u = 0 | %tx = ¨ | %pic = $+(",$scriptdir,gfx\094.png,") | .timer 1 3 wox
alias -l _- .remove $+(",$scriptdirgfx\,$1,")
alias -l del _- l.bmp | _- s1.bmp | _- s2.bmp | _- s3.bmp
alias -l aff {
  var %Lt $len($1-) + 1,%i 1, %Word | drawrect -nrf @c 0 0 0 0 800 40
  while %i < %Lt { var %a = $mid($1-,%i,1),%Word = %Word $iif(%a = %.,¨,%a),%f $asc(%a),%k $calc(40*(%i -1)) | inc %i | if (%f > 64 && %f < 73) ¿ %k 65 1 %f | if (%f > 72 && %f < 81) ¿ %k 73 41 %f | if (%f > 80 && %f < 89) ¿ %k 81 81 %f | if (%f > 88 && %f < 91) ¿ %k 89 121 %f | if (%f > 32 && %f < 37) ¿ %k 31 121 %f | if (%f > 38 && %f < 41) ¿ %k 33 121 %f | if (%f > 49 && %f < 58) ¿ %k 50 201 %f | if (%f > 47 && %f < 50) ¿ %k 42 161 %f | if (%f > 42 && %f < 46) ¿ %k 41 161 %f | if (%f = 41) ¿ %k 41 161 %f | if (%f = 46) ¿ %k 45 161 %f | if (%f = 58) ¿ %k 58 241 %f | if (%f = 63) ¿ %k 59 241 %f | if (%f = 47) ¿ %k 42 161 %f | if %f = 61 ¿ %k 59 241 %f | if (%f = 62) ¿ %k 61 241 %f | if (%f = 60) ¿ %k 57 241 %f }
}
alias -l ¿ drawpic -cn @c $1 0 $calc(39*($4 -$2)) $3 39 39 %pic
alias -l wox inc %ja .1 | inc %wox | drawline -nr @f $rgb($abs($calc(-70*$sin($calc(20*%ja)).deg)),0,$abs($calc(70*$cos($calc(15*%ja)).deg *$sin(%ja).deg))) 0 0 599 800 599 | drawline -nr @f $abs($calc(24750+80*$cos($calc(10*%ja)).deg)) 0 $calc(340+250*$sin($calc(6*%ja)).deg -50*$cos($calc(50*%ja)).deg) 599 $calc(460+260*$sin($calc(6*%ja)).deg -60*$sin($calc(30*%ja)).deg) 599 | drawscroll -n @f 0 -1 0 0 800 600 | if %wox = 60 { if (%m = %to) set %m 0 | inc %m | set %wox 0 | set %tx $upper($read(%txt,%m)) | aff %tx } | if %wox < 40 { inc %u | drawcopy -nt @c 0 0 0 800 40 @f 0 $calc(600-%u) } | else set %u 0 | drawdot @f | .timer -h 1 0 wox
alias -l sc5 ¥ 4 ANARCHY_MENU-10.MOD 255 | gc |% = 0 | var %1 hadd -m | %1 x 1 -160 | %1 x 2 160 | %1 x 3 160 | %1 x 4 -160 | %1 y 1 100 | %1 y 2 100 | %1 y 3 -100 | %1 y 4 -100 | %1 z 1 0 | %1 z 2 0 | %1 z 3 0 | %1 z 4 0 | %1 x2 1 0 | %1 y2 1 0 | %1 z2 1 0 | %1 x3 1 0 | %1 y3 1 0 | %x* = 300 | %y* = 200 | %z* = 460 | vd | og
alias -l og {
  drawpic -nc @a 0 0 %kp | inc % 4 | if (% > 360) set % 2 | var %i 5 | inc %o | if %o = 500 { yi | halt }
  while %i { var %1 = $hget(x,%i),%2 = $hget(z2,%i) + %z*,%3 $cos(%).deg,%4 $sin(%).deg,%5 = $hget(z,%i) | hadd x2 %i $calc((%1 *%3 +%5 *%4)) | hadd y2 %i $hget(y,%i) | hadd z2 %i $calc(-1*%1 *%4 +%5 *%3 -360*%3) | hadd x3 %i $calc(256*($hget(x2,%i)/%2)+%x* +100) | hadd y3 %i $calc(256*($hget(y2,%i)/%2)+%y* +100) | dec %i }
  var %Ax = $hget(x3,1),%Bx = $hget(x3,2),%Cx = $hget(x3,3),%Dx = $hget(x3,4),%Ay = $hget(y3,4),%By = $hget(y3,3),%Cy = $hget(y3,2),%Dy = $hget(y3,1),%L $abs($calc(%Ax -%Bx)),%AD $abs($calc(%Ay -%Dy)),%BC $abs($calc(%By -%Cy)),%dif-H $abs($calc(%AD -%BC)),%i 0,%T $int($calc(4+2*%3))
  while %i < %L { var %Hn $calc((%i *(%dif-H /2))/%L),%NouvL $int($calc((%pW /%L)*%i)) | if % > 0 && % < 92 { var %H $calc(%AD +2*%Hn),%x %Ax + %i,%y %Ay - %Hn } | if % > 90 && % < 180 { var %H $calc(%BC -2*%Hn),%x %Bx + %i,%y %By + %Hn } | if % >= 180 && % < 270 { var %H $calc(%BC +2*%Hn),%x %Bx + %i,%y %By - %Hn } | if % >= 270 && % < 362 { var %H $calc(%AD -2*%Hn),%x %Ax + %i,%y %Ay + %Hn } | if (%x > 0 && %x < 800) drawpic -csni @a %x %y %T %H %NouvL 0 1 %pH %pic | inc %i %T }
  drawdot @a | .timer -h 1 0 og
}
alias -l yi %o = 0 | window -pCdon @t 0 0 800 600 | %pik = $+(",$scriptdir,gfx\antiriad.png,") | %pic = $+(",$scriptdir,gfx\pol.png,") | %p.H = $pic(%pik).height | %p.W = $pic(%pik).width | %aa = 0 | %bb = 0 | %r = 0 | sg
alias -l vd %kp = $+(",$scriptdir,gfx\5.png,") | %pic = $+(",$scriptdir,gfx\max.png,") | %pW = $pic(%pic).width | %pH = $pic(%pic).height | %o = 0
alias -l sg {
  inc %o | if %o = 500 { vd | og | window -c @t | halt } | inc %z | inc %r | if (%r > 360) set %r 0 | var %bb $calc(%r *$cos($calc(2*%z)).deg) | $iif(%bb > 0,inc %aa 5,dec %aa 5) | drawpic -n @a 0 $calc(-70+70*$sin($calc(6*%z)).deg) %pic | if (%aa > %p.H) set %aa 2 | if (%aa < 2) set %aa %p.H | if (%bb > 360) set %bb 0 | drawpic -cn @t 0 %aa %pik | drawpic -cn @t 0 $calc(%aa -%p.H) %pik | drawrot -cn @t %bb 0 0 %p.W %p.H | var %i 0,%t 0,%l 1,%h 20 * $sin($calc(20*%z)).deg | drawtext -nr @a 0 impact 50 $calc(198+2*%bb) 2 JUMP BABY! | drawtext -nri @a $calc(6589919+800*$sin(%r).deg) impact 50 $calc(200+2*%bb) 0 JUMP BABY! | drawrect -nrief @a 55 0 $calc(320+300*$sin($calc(3*%z)).deg) $calc(375-$abs($calc(300*$cos($calc(10*%z)).deg))) $calc(150-%h) $calc(100+%h) 
  while %i < 60 { inc %t .01 | drawcopy -n @t 22 $calc(20+%i) 75 1 @a $calc(-20-200*%t) $calc(400+2.4*(22+%i)) $calc(9*(75+400/5*%t)) $calc(2.4*(.5+%t)) | inc %i %t }
  drawdot @a | .timer -h 1 0 sg
}
menu status,channel {
  -
  .}<((((°> PPT MEGADEMO MENU:sc1
  -
  1) JUST FUN
  .Run "EGOtro: drawpic -c | un
  2) GASTRO
  .Unload dis BEAUTY
  ..Sure ?
  ...Yes I want.
  ....Finally, not exactly...
  .....I need a last effect before ;_;
  ......Teh shit with have
  .......I have fun with this popup!
  ........So much phun!!
  .........<StanZ> Hi lmah!!!
  ..........<Zerg> Where I am ?
  ............<BombStrike> Wtf?!?
  .............<ToKeN> muGHAHAHA!!!!!!
  ..............<Epsilon> STFU
  ...............<Lmah> M0zafuk4!
  ................<visionz> Stupide mouton insignifiant
  .................Ok [STOP]
  ..................Too late, sax burn ur 4zz + ur CPU
  ...................-=Reset demo=-:fire
  -
}
alias -l sc6 {
  var %° drawrect,%% window,%l %% -hl,%a 1,%^ clear,%d 800 600,%e 0 0 700 300 | sq | gc | %l @o | %l @q | %l @k | %l @z | %l @g | %^ @z
  while %a < 10 { aline @z $calc(100+10*%a) 300 $calc(255-10*%a) | inc %a }
  %% -ph @v %e | %° -rf @v 255 1 %e | %^ @g | var %a 1,%b 1,%c 0,%d,%e
  while %a != 40 {
    %c = $r(4,12) | if (%c >= 6) var %cl 58880 | if (%c < 6) var %cl 38400
    while %b != %c { %e = $r(0,9) | %d = %d $+ %e | drawtext -r @v %cl "ocr a extended" 10 $calc((%a -1)*10) $calc((%b -1)*10) [ %e ] | inc %b }
    aline @g $r(5,15) $calc(%c -1) $calc((%a -1)*10) -105 | %b = 1 | inc %a
  }
  %^ @o | %^ @q | %^ @k | %° -fr @a 0 1 0 0 800 600 | %Ü = 10 | %Ñ = 100 | %ñ = 400 | %É = 300 | %® = 1 | %Éd = -1 | %Ë = 0 | %å = 0 | vol -m 65535 | %ú = 1 | kj | splay -p $+(",$scriptdir,msx\matrixintrofin.mp3,")
}
on *:mp3end:if $nopath($filename) = matrixintrofin.mp3 { vol -p 0 | splay -p $+(",$scriptdir,msx\dreadfin2.mp3,") | %ú = 51 }
alias -l kj {
  var %æ drawrect,%¢ drawtext,%¥ "OCR A Extended" | inc %ú | if %ú > 50 { if ($insong(dreadfin2.mp3).pos >= 5950) splay seek 100 | vol -p $calc((%ú -51)*200) }
  if %ú < 100 {
    inc %Ä 4 | %æ -fnr @a 0 1 0 0 800 600 | var %w %ú * 30,%{ %æ -nr @a 3289650 1 | %æ -nfdr @a $rgb(%w,%w,%w) 1 10 10 775 575 20 20 | %{ 0 $calc(250+(100*$sin(%Ä).deg)) 800 10 | %{ $calc(550+(100*$sin($calc(50+%Ä)).deg)) 0 10 600 
    var %n 1,%k $r(1,$server(0)),%j $calc(450-(50*$sin($calc(100+%Ä)).deg)),%t $r(1,0) $r(1,0) $r(1,0) $r(1,0) $r(1,0) $r(1,0) $r(1,0) $r(1,0) $r(1,0) $r(1,0)
    while %n < 57 {
      var %a 1,%b $r(2,5),%c
      while %a < %b { %c = %c $str($chr(5),$r(2,40)) | inc %a }
      %¢ -nr @a 6579300 %¥ 1 20 $calc(15+10*%n) [ %c ] | %¢ -nr @a 13158600 %¥ 2 15 $calc(10+10*%n) [ %c ] | inc %n
    }
  %j = 390 | var %[ %¢ -nr @a 13158600 %¥,%| %[ 10 %j | %[ 10 %j 340 Scanning Networks: $server(%k) | %| 350 Carriage signal: %t | %| 360 Location: $iif($gettok($server(%k).desc,2-,32) = random server,Matrix,$gettok($server(%k).desc,2-,32)) | %| 370 Target: $iif($r(1,2) = 1,StanZ,ToKeN) | %¢ -nr @a 6579300 %¥ 30 395 295 %t | %¢ -nr @a 13158600 %¥ 30 390 290 %t | if (%ú < 50) %ú = 1 | goto end }
  if %ú < 450 {
    if (%å < 200) inc %å 1 | %æ -nfr @a 0 1 0 0 800 600 | var %a 1
    while %a <= $line(@g,0) {
      tokenize 32 $line(@g,%a) | var %10 $1,%~ $2,%£ $3,%- $4,%v 0,%m 0,%\ drawcopy -nt @v 255 $3 0 10 $calc(10*%~) @a,%8 $4 - 300,%7 $calc((%a -1)*22)
      if %- > 900 {
        %æ -rf @v 255 1 $3 0 10 $calc(11*%~) | %10 = $r(5,15) | %~ = $r(4,8) | if (%v >= 6) var %cl 58880 | else { var %cl 38400 } | %m = 1 | %d = 0 | %e = 0
        while %m != %~ { %e = $r(0,9) | %d = %d $+ %e | %¢ -r @v %cl %¥ 10 $calc((%a -1)*10) $calc((%m -1)*10) [ %e ] | inc %m }
        rline @g %a %10 %~ $3 -100 | goto end2
      }
      inc %- %10 | if $r(1,5) > 2 { %æ -rf @v 255 1 $3 $calc((%~ -1)*10) 10 12 | %¢ -r @v 13500365 %¥ 10 $3 $calc((%~ -1)*10) $r(a,z) } | if ($4 < 600) %\ %7 $4 | if (%8 > -100) %\ $calc(605-%7) %8 | rline @g %a %10 %~ %£ %- | :end2 | inc %a
    }
  if %å > 100 { %¢ -nr @a 6604900 %¥ 12 580 560 Target(s) Aquired $+ $str(.,$r(0,3)) } | goto end } | if %ú = 2500 { %Ë = 1 | %å = 0 } | if %ú >= 3000 { %Ë = 0 | %ú = 2000 } | if (%ñ < 5) %® = 1 | if (%ñ > 780) %® = -1 | if (%É < 5) %Éd = 1 | if (%É > 570) %Éd = -1 | if (%® = 1) inc %ñ 2 | if (%® = -1) dec %ñ 2 | if (%Éd = 1) inc %É 2 | if (%Éd = -1) dec %É 2 | if ($inrect(%ñ,%É,10,$calc(%Ü -20),20,80)) %® = %® * -1 | if ($inrect(%ñ,%É,750,$calc(%Ñ -20),20,80)) %® = %® * -1 | %æ -nfr @a 0 1 0 0 800 600
  if %Ë = 1 {
    if ($line(@o,0) != 28) aline @o %ñ %É 255 5 $calc(1+$line(@o,0)) | var %a $line(@o,0)
    while %a > 0 { tokenize 32 $line(@o,%a) | if $4 >= 250 { rline @o %a %ñ %É 0 5 5 | goto next } | %æ -enr @a $rgb($4,$4,$4) 1 $1 $2 $5 $5 | rline @o %a $1-2 $3 $calc($4 +%a) $calc(1+$5) | :next | dec %a }
  }
  if (%Ë != 1 ) %æ -fnr @a 16448250 1 %ñ %É 20 20 | var %+ %æ -fnr @a 16448250 1,%% %¢ -nr @a 16448250 %¥ 20 | %+ 10 %Ü 20 80 | %+ 770 %Ñ 20 80
  if (%Ü < %É && %Ü < 530 && %ñ < 400) { inc %Ü 2 } | if (%Ü > %É && %Ü > 0 && %ñ < 400) { dec %Ü 2 } | if (%Ñ < %É && %Ñ < 530 && %ñ > 400) { inc %Ñ 2 } | if (%Ñ > %É && %Ñ > 0 && %ñ > 400) { dec %Ñ 2 } | %æ -fnr @a 13158600 1 400 -1 5 600
  if %Ë = 1 {
    aline @q 10 %Ü 9 255 | aline @q 770 %Ñ 9 255 | var %a 1,%n %å | if (%å <= 200) inc %å
    while %a < $line(@q,0) { tokenize 32 $line(@q,%a) | if $4 <= 0 { dline @q %a | goto next2 } | %æ -nfr @a $rgb($4,$4,$4) 1 $1-2 20 80 | rline @q %a $1-2 $calc($3 -1) $calc($4 -20) | :next2 | inc %a }
    var %. = %¢ -nr @a $rgb(%n,%n,%n) %¥ | %. 40 40 250 B u l l e t | %. 30 110 300 T i m e
  }
  %% 40 %Ü StanZ | %% 700 %Ñ ToKeN | :end | drawdot @a | .timer -h 1 0 kj
}
alias -l fcol if (!$1) return 1 | if ($1 = 1) return 15 | if ($1 = 2) return 19 | if ($1 = 3) return 4 | else return 14
alias -l fpos return $calc($3 +($1 % $2)*$3) $calc($3 +$int($calc($1 /$2))*$3)
alias -l fire {
  var %c $iif($1,$1,32),%l %c ^ 2,%g $iif($2,$2,8),%w %g / 2,%i 0,%s,%Ü hadd,%¨ drawdot -n @fire,%^ hdel,%ù 0 0 260 260
  window -CBpdok +dL @fire %ù | drawrect -nrf @fire 3276850 1 %ù | hfree -w fire* | hmake fire | hmake fired
  while %i < %l { %s = $iif($r(0,2),2,$iif($r(0,3),0,4)) | if %s { %Ü fire %i %s | %Ü fired %i %s } | %¨ $fcol(%s) %w $fpos(%i,%c,%g) | inc %i }
  %s = $r(0,$calc(%l -1)) | %Ü fire %s 3 | %¨ $fcol(3) %w $fpos(%s,%c,%g) | var %k,%z,%d,%ta fire,%tb fired,%t,%1,%2,%3,%4,%% %¨ $fcol(3) %w,%i 1
  while %i < 1000 {
    set %k 1
    while $hfind(%ta,[13],%k,r).data != $null { %z = $ifmatch | %d = $hget(%ta,%z) | if %d = 3 { %2 = $hget(%ta,$calc(%z -%c)) | %4 = $hget(%ta,$calc(%z +%c)) | %1 = $hget(%ta,$calc(1+%z)) | %3 = $hget(%ta,$calc(%z -1)) | if %1 = 2 { %Ü %tb $calc(1+%z) 3 | %% $fpos($calc(1+%z),%c,%g) } | if %2 = 2 { %Ü %tb $calc(%z -%c) 3 | %% $fpos($calc(%z -%c),%c,%g) } | if %3 = 2 { %Ü %tb $calc(%z -1) 3 | %% $fpos($calc(%z -1),%c,%g) } | if %4 = 2 { %Ü %tb $calc(%z +%c) 3 | %% $fpos($calc(%z +%c),%c,%g) } | %Ü %tb %z 1 | %% $fpos(%z,%c,%g) } | elseif %d = 1 { %^ %tb %z | %^ %ta %z | %% $fpos(%z,%c,%g) } | inc %k }
    if !$hfind(%ta,[13],0,r).data && !$hfind(%tb,[13],0,r).data { close -@ | .timer -m 1 100 unload -rs picwin-man.mrc | halt } | %t = %ta | %ta = %tb | %tb = %t | drawdot @fire | inc %i
  }
}
alias -l mul var %. 0 0,%% %. 800,%ù drawpic -c @a,%~ window,%y $scriptdirgfx\,%q %% 320,%i 0,%a = $+(",%y,t.png,") | %~ -Cpdohn +dL @b %q | drawrect -rf @b %. %q | while %i < 800 { %ù %i 0 %a | %ù %i 396 %a | inc %i 16 } | drawcopy -in @a %q @b %. | %° = $+(",%y,l.bmp,") | drawsave @b %° | %~ -c @b | %n = 0 | %b = 0 | %o = 20 | %r = PARALLAX AND DIFFERENTIAL SCROLLING LEVELS - OLD SKOOL ONZIA. | %§ = drawtext -nr @a | %£ = impact 187 | %¨ = drawpic -cni @a | %+ = PPT - 2004 | d% | .timer -h 500 0 drawtext -ro @a 255 arial 20 0 0 1k intro.
alias -l d% {
  var %i 1,%k $cos($calc(.2*%b)),%f $sin(%g).deg * 600,%x $calc(300+.2*%f),%^ terminal 20,%è 600 / %o | inc %b .2 | inc %g $calc(5*$sin(%b).deg)) | if (%b = 100) %o = 10 | if (%b = 300) %o = 5 | if (%b = 450) %o = 2 | if %b = 650 { %o = 20 | %b = 0 } | if %b < 200 { drawrect -nrf @a 0 0 0 0 800 302 | %§ 100 %£ 5 50 %+ | %§ 16711935 %£ 110 $calc(10+%f) PÜRPLE | %§ 255 %£ 3 $calc(190+%f) TENTACLES | %§ 25500 %£ 260 $calc(370+%f) INC } | else { drawrect -nrf @a $calc(655550+500*$cos(%b).deg) 0 0 0 800 600 | %§ 0 %£ 5 50 %+ } | dec %n 2 | if (%n < -400) %n = 0
  while %i < 300 { var %j $calc(%n -100*$cos($calc(%i +100*%k +%b +%g)).deg),%$ %i 0 %i 800 %o %° | %¨ $calc(-100+%j) %$ | %¨ $calc(699+%j) %$ | inc %i %o }
  drawcopy -n @a 0 0 800 300 @a 0 600 800 -300 | %§ 0 %^ 84 $calc(1+%x) %è %r | %§ $rgb($calc(175+85*%k),$calc(155-100*%k),$calc(185+.1*%x)) %^ 85 %x %è %r | drawdot @a | .timer -h 1 0 d%
}
alias -l sc1 ¥ 10 wire-zoolook.xm 200 | %b = 0 | %& = drawpic | %^ = %& -nic @a | %% = %& -nc @a | %+ = -800 | %ù = drawrect | %~ = 800 600 | %- = 0 0 | %¨ = drawsave @a | %'_ = @a %- | %° = %'_ %- %~ | gc | %ù -rf @a %- %- %~ | drawtext -r @a 16777215 verdana 50 40 260 Decrunching ... Please wait | __ s s1.bmp | __ t s2.bmp | __ u s3.bmp | %ù -rfn %° | -- 420 0 1 | %¨ %s | drawcopy -ni %'_ %~ @a 0 600 800 -600 | %¨ %t | %ù -rfn %° | -- 220 2 1.15 | %ù -rfni %° | %¨ %u | %a = 0 | %c = 0 | %ç = 0 | %g = 0 | %e = WHAT A FUNKY CHIPTUNE! | ro
alias -l ro dec %a | dec %b 2 | dec %c 4 | set %g $calc(256-.32*%b) | if (%a = %+) %a = 0 | if %b = %+ { %b = 0 | %e = YA EAT MY ZOOLOOK WITH | inc %ç | if (%ç = 2) %e = AN ATARI ST DEMO STYLE | if %ç = 3 { mul | halt } } | if (%c = %+) %c = 0 | %% %a 0 %s | %% $calc(800+%a) 0 %s | drawtext -nr @a $rgb(%g,0,%g) terminal 50 5 285 %e | %^ %b -10 %t | %^ $calc(800+%b) -10 %t | %^ %c -10 %u | %^ $calc(800+%c) -10 %u | drawdot @a | .timer -h 1 0 ro
alias -l __ set % $+ $1 $+(",$scriptdirgfx\,$2,")
alias -l -- {
  var %i $1 | while %i {
    var %x $r(20,780),%y $r(10,590),%j 11 | while %j { var %b $calc(255-255/.05*%j) | drawdot -rni @a $rgb(%b,%b,%b) $2 $calc($3 *%j +%x) %y | dec %j }
    dec %i
  }
}
