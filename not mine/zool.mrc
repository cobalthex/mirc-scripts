; /zool
alias zool {
  %i = 0
  %j = 0
  %v = drawtext -nor @-
  %w = drawline -nr @-
  %1 = 0 0 694 590
  window -pCBdok +tLe @- %1
  drawrect -nfr @- 65535 0 %1
  titlebar @- AN INVITATION FOR YA ! SHOUTS 2 SDB.ORG, FR.FM & PICWIN.TK DUDES -
  a
}
alias -l a {
  inc %j .1 | var %i 600,%n 16,%s 8,%q $sin(%j),%d $calc(155+100*%q),%e $calc(155-100*%q),%2 .04 * $cos($calc(.1*%j))
  if %j > 43 drawdot -nr @- $rgb(%d,%e,60) 15 $calc(350+300*%q) $calc(300+200*$cos($calc(.5*%j)))
  while %n {
    var %o 255 - %n,%r 700 - %n,%g 562 - %n
    if %j > 60 %w $rgb(0,$calc(170000+10000*$cos($calc(.1*%n +%j)).deg),%o) %s 0 %n 700 %n
    if %j > 65 %w $rgb($calc(870000+10000*$sin($calc(.01*%n +%j)).deg),%o,%n) %s %n 0 %n 600
    if %j > 70 %w $rgb($calc(170000+10000*$cos($calc(.03*%n +%j)).deg),%n,%n) %s %r 0 %r 600
    if %j > 75 %w $rgb($calc(1700+10000*$sin($calc(.02*%n -%j)).deg),%o,%o) %s 0 %g 700 %g
    dec %n 4
  }
  if %j < 60 {
    var %t 255 * $cos(%j)
    if %j > 5 && %j < 10 %v $rgb(0,%t,0) arial 200 20 180 STANZ
    if %j > 15 && %j < 20 %v $rgb(0,0,%t) arial 130 40 200 PRESENT
    if %j > 24 && %j < 35 { %v $rgb(0,%t,0) arial 80 90 160 A NEW INTRO | %v $rgb(%t,0,%t) arial 80 200 310 CALLED }
    if %j > 40 && %j < 60 %v $rgb(-%t,%t,%t) impact 350 20 90 ZOOL
  }
  while %i { drawcopy -n @- $calc(17*$sin($calc((%2 *%i)+%j))) %i 700 10 @- 0 %i | dec %i 10 }
  var %i 700
  while %i { drawcopy -n @- %i $calc(8*$cos($calc(((.1+.8*%2)*%i)+%j))) 10 600 @- %i 0 | dec %i 10 }
  drawrect -nr @- $iif(%j > 8,0,%d) 16 0 0 692 567
  if %j > 75 %v $rgb(%d,200,200) verdana 12 15 551 ~~2Z~Prod~~ 1.77 Ko should be enough for everyone ! 2Z is looking for scripters, msx/gfx Artists.
  drawdot @- | .timera -mh 1 0 a
}
on *:close:@-:.timera off | unset %i %j %v %w %1
