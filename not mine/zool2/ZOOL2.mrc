;        ZOOL -2-
;     Script & music
;      by StanZ/PPT
; _______________________ ______ _
menu status,channel {
  -
  > ZOOL
  .>> NORMAL:zool2 .1
  .>> WEIRD:zool2 0
  -
}
alias zool2 {
  .timer -mh 0 11150 g
  %f = $1
  %i = 0
  %j = 0
  %v = drawtext -nor @-
  %w = drawline -nr @-
  %1 = 0 0 694 590
  window -pCBdok +tLe @- %1
  drawrect -nfr @- 65535 0 %1
  titlebar @- THE POWER OF PICWIN TK -
  a
}
alias -l a {
  inc %j .1 | var %i 660,%n 16,%s 8,%q $sin(%j),%d $calc(155+100*%q),%e $calc(155-100*%q),%2 .04 * $cos($calc(.1*%j)) | if %j > 43 drawdot -nr @- $rgb(%d,%e,60) 15 $calc(350+300*%q) $calc(300+200*$cos($calc(.5*%j)))
  while %n { var %o 255 - %n,%r 700 - %n,%g 562 - %n | if %j > 60 %w $rgb(0,$calc(170000+10000*$cos($calc(.1*%n +%j)).deg),%o) %s 0 %n 700 %n | if %j > 65 %w $rgb($calc(870000+10000*$sin($calc(.01*%n +%j)).deg),%o,%n) %s %n 0 %n 600 | if %j > 70 %w $rgb($calc(170000+10000*$cos($calc(.03*%n +%j)).deg),%n,%n) %s %r 0 %r 600 | if %j > 75 %w $rgb($calc(1700+10000*$sin($calc(.02*%n -%j)).deg),%o,%o) %s 0 %g 700 %g | dec %n 4 }
  if (%j = 110) %w = drawline -nri @- | if %j < 60 { var %t 255 * $cos(%j) | if %j > 5 && %j < 10 %v $rgb(0,%t,0) arial 200 20 180 STANZ | if %j > 15 && %j < 20 %v $rgb(0,0,%t) arial 130 40 210 PRESENT | if %j > 24 && %j < 35 { %v $rgb(0,%t,0) arial 80 90 160 A NEW INTRO | %v $rgb(%t,0,%t) arial 80 200 310 CALLED } | if %j > 40 && %j < 60 %v $rgb(-%t,%t,%t) impact 350 20 90 ZOOL }
  while %i { drawscroll -n @- $calc(17*$sin($calc((%2 *%i)+%j))) 0 0 %i 694 5 | drawscroll -n @- 0 $calc(8*$cos($calc(((%f +.8*%2)*%i)+%j))) %i 0 5 590 | dec %i 5 }
  drawrect -nr @- $iif(%j > 8,0,%d) 16 0 0 692 567
  if %j > 75 %v $rgb(%d,200,200) verdana 12 15 551 ~P�rPle Tentacles inc~ ������ Greetings to Zerg - BombStrike - Epsilon - ToKeN - kenji - visionz & sax.
  drawdot @- | .timer -mh 1 0 a
}
on *:close:@-:.timer* off | unset %j %v %w %1 %f %� %� | .timer -m 2 100 splay skip
alias -l g splay -c $+(",$scriptdir,powah.mp3,")
