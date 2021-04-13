alias -l a {
  inc %i .005 | inc %a %m | set %j 10
  if (%a > 359) set %m -1
  if (%a = 1) set %m 1
  if %i > 1.5 {
    drawpic -cn @- 0 $calc(-186+168*$cos(%i)) %h
    while %j { drawscroll -n @- $hget(n $+ %j,%a) | dec %j }
  }
  if %i > .7 && %i < 1.5 {
    set %o 11
    while %o { drawdot -nr @- 0 $r(1,3) $eval(%%,70) | dec %o }
    if %i > 1.1 { %ÿ 188 167 %& | %ÿ 188 163 %& | %ÿ 190 165 %& | %' $r(240,255) %ç 48 189 165 %& | %^ 16446745 %ç 16 198 300 %² }
    drawcopy -nm @- 120 120 280 280 @- 119 119 282 282
  }
  if %i < 5.3 {
    if %i > 4 { %= 0 0 640 $calc(120-200*(%i -4)) 0 $calc(360+200*(%i -4)) 640 120 | %_ $calc(120-200*(%i -4)) 660 $calc(240+400*(%i -4)) }
    else {
      if %i < 1 { %= 0 0 640 $calc(120+200*(%i -1)) 0 $calc(360-200*(%i -1)) 640 120 | %_ $calc(120+200*(%i -1)) 660 $calc(240-400*(%i -1)) }
      else { %= 0 0 640 120 0 360 640 120 | %_ 120 660 240 }
    }
    if (%i > 4.5) %^ $rgb($calc(155-150*(%i -4.5)),20,$calc(250-240*(%i -4.5))) impact 36 14 225 %°
  }
  else {
    if %i > 18 && $calc(%i % 4) < 3 {
      set %é 500 * %i | set %à 400 * %i | %µ -nri @- 10223615 0 -2 380 648 100 -2 210 648 100 -2 110 644 50 -2 50 644 25 -2 20 648 11 -2 4 648 6 | %µ -nrfi @- 8257535 0 0 380 640 100 0 210 640 100 0 110 640 50 0 50 640 25 0 20 640 11 0 4 640 6 | %^ $rgb($calc(100*%i),$calc(100*%i),255) %ç 10 1 208 GREETINGS TO PICWIN.TK MEMBERS. | %^ $rgb($calc(30+355*%i),%é,%à) %ç 10 1 378 YOU SHOULD EXIT THE DEMO NOW... | %^ $rgb($calc(60+355*%i),%é,%à) %ç 10 1 388 HEH, I GUESS U LOVE THE MODCHIP ! | %^ $rgb($calc(90+355*%i),%é,%à) %ç 10 1 398 UNE BELLE CHIPCHIP POUR ATTILA :) | %^ $rgb($calc(120+355*%i),%é,%à) %ç 10 1 408 SCRIPTED WITH MAGNA DOODLE TM.
    }
  }
  drawdot @- | %y 1 0 a
}
alias einpixel { ;start
  drawpic -c | var %@ $scriptdir | %% = $str($+($!r(120,380),$chr(32)),70) | %i = 10 | %h = $+(",%@,i.jpg,") | %y = .timera | %µ = drawrect | %^ = drawtext -nr @- | %= = %µ -nrf @- 0 0 | %_ = %µ -nr @- 16777215 2 -9 | %' = drawtext -nor @- | %ç = tahoma | %° = $decode(ZnVsbHNjcmVlbiArIGZ1bGwgZnJhbWVyYXRlICsgMSBwaXhlbCA9IHJ1bGV6,m) | %² = $decode(V2hhdCEgRGlzIGJlYXV0eT8=,m) | %ÿ = %' 3339775 %ç 48 | %& = BURN
  if $fmod(FMOD_Connect,%@ $+ \fmod.dll) != 0 { } | if $fmod(SOUND_Init,44100 4 0) { }
  var %a $fmod(MUSIC_LoadSong,1 " $+ %@ $+ \sextynt.mod" 2),%a $fmod(MUSIC_PlaySong,1 1)
  if %Ü = 2 { window -CpdBf +d @- 0 0 640 480 | fus Fullscreen $window($active).hwnd > 640 > 480 > 32 > 60 }
  else { window -CpdkBf +tn @- 0 0 640 480 }
  drawpic -sm @- 0 0 640 480 $+(",%@,c.png,")
  while %i {
    %k = n $+ %i
    if !$hget(%k) { hmake %k | hload %k $+(",$scriptdir,%k,.t,") }
    dec %i
  }
  %y 1 3 b
}
alias -l b { ;first screen
  drawcopy -nm @- 0 0 640 480 @- -10 -10 650 490 ;stretch image to 10px bigger than screen
  drawcopy -m @- 0 0 640 480 @- 10 10 630 470 //shrink image down to screen size 
  inc %i
  if (%i = 10) %^ 3302655 %ç 100 40 15 1 pixel rulez
  if %i = 60 { %= 520 440 120 40 | %^ 6592235 %ç 60 330 120 by StanZ }
  if %i > 90 { %i = 0 | c | halt }
  %y 1 0 b
}
alias -l c { ;snd screen
  dec %i | drawcopy @- 0 0 640 480 @- %i %i $calc(640-%i) $calc(480-%i) ;scroll first out off screen (up & to left)
  if %i < -45 { %i = 0 | drawpic -n @- 50 80 $+(",$scriptdir,d.jpg,") | a | halt } ;draw second screen
  %y -m 1 20 c
}
alias -l æ %y off | close -@ @- | %i = 10 | while %i { hfree n $+ %i | dec %i } | dll -u fmod_mirc.dll | if (%Ü = 2) fus Reset | unset %i %h %k %a %j %m %y %% %o %^ %= %' %ç %µ %_ %é %à %° %& %² %ÿ
on *:keydown:@-:*:if $keyval = 27 æ
on *:close:@-:æ
alias -l fmod if ($isid) return $dll($scriptdir\fmod_mIRC.dll,$1,$2-)
alias -l fus dll $+(",$scriptdir,fullscreen.dll,") $1-
menu status,menubar {
  .-
  $iif($window(@-),,¤ 1 pixel   [] rulez)
  .¤¤ Run:einpixel
  .-
  .¤¤ Mode
  ..¤¤¤ Windowed 640x480 $iif(%Ü = 1,[]):$iif(%Ü = 1,,%Ü = 1)
  ..-
  ..      [ESC] to quit:{}
  ..¤¤¤ Fullscreen 32 bpp $iif(%Ü = 2,[]):$iif(%Ü = 2,,%Ü = 2)
  .-
  .¤¤ Mouse cursor
  ..$iif(%ªÜ,¤¤¤ Show):fus ShowMouse | unset %ªÜ
  ..$iif(%ªÜ,,¤¤¤ Hide):fus HideMouse | %ªÜ = 1
  ..-
  ..¤¤¤ Unload script:unload -rs $+(",$script,")
  -
}
;    .:/ 1 PIXEL RULEZ \:.
; 4K intro - by StanZ - 2005 -
