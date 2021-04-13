;;; Space Harrier ;;;
;Programmed by STanZ;
;Crak'd by CobaltHex;
;;;;;;;;;;;;;;;;;;;;;

;game
alias -l ko {
  drawdot -nr @H 16762980 180 160 80 | set %Á $calc(120+.3*%y) | set %& 200 - %Á | set %¥ -320 / %& | set %t 0 | set %a 0
  if (%µ > %ß) %ß = %µ
  if (%y > 100) set %ã %ð
  else { set %ã %Ð }
  if (%# < 0) set %# 640
  if (%# > 640) set %# 0
  drawpic -cn @H 0 $calc(%Á -14) %# 0 640 18 %> ;mountains
  if (%¼ < 0) set %¼ 320
  if (%¼ > 320) set %¼ 0
  if (%½ < 0) set %½ 320
  if (%½ > 320) set %½ 0
  if (%¬ < 0) set %¬ 320
  if (%¬ > 320) set %¬ 0
  set %® %& / 32 | drawpic -ctn @H 0 0 $calc(%Á -146+8*%®) %¬ 0 320 19 %¨ | drawpic -ctn @H 0 0 $calc(%Á -118+4*%®) %½ 19 320 9 %¨ | drawpic -ctn @H 0 0 $calc(%Á -98) %¼ 28 320 6 %¨ | inc %{ | ;draw clouds
  if (%{ > 7) set %{ 0
  set %¿ %ã * %¥ | set %ª $int(%¿) | set %ø %h - %{
  while %t < %& { inc %a %ª | inc %t %ã | drawpic -cns @H %a $calc(%Á +%t) $calc(329-2*%a) %ã %» $calc((%t -%a)/(%& -%a)*%ø) %w 1 %/ } | ;draw floor
  dec %+ .1
  if %+ < .5 { dec %嬵 | if (%嬵 < 0) Ἕ | set %Ñ 0 | set %+ 9 | set %Ã $r(1,300) | set %ñ $null | set %ó $r(0,99) * $cos($r(0,99)) }
  if (%% = 1) inc %Ñ 2
  if (%% = 2) dec %Ñ 2
  if !%ñ || %à < 5 { set %é $cos($calc(.8*%+)) * %ó | set %" $calc(%Ã +%Ñ +%é) | set %} $sin(%+) | set %] $calc(80+10*%}) | set %^ 106 / %+ | drawrect -nref @H %~ 0 $calc(%" -5) $calc(38-4*(%+ +.5*%})+%Á) $calc(12+100/%+) $calc(4+36/%+) | drawpic -cntsm @H 16711935 %" %] $int(%^) $int($calc(47/%+)) 79 102 106 47 %² } ;draw enemies (shadow then enemy)
  ;%^ size of enemy, %} y pos, %" x pos (on screen), %+ z position
  if $mouse.key & 1 && $mouse.y < 134 || %` > 2 {
    if (%` = 4) var %a $fmod(SOUND_PlaySound,3 3),%a $fmod(SOUND_SetPan,3 $calc(.8*%x))
    if %` < 3 { %[ = %x | %| = %y | %è = %& | %ç = 0 }
    if (%% = 1) inc %ç 2
    if (%% = 2) dec %ç 2
    inc %`
    if %` < 25 && !%ñ { set %' $calc(%[ -1+%ç) | drawrect -nrfe @H %~ 0 %' $calc(200-%` *.04*%&)) $calc(20/(.2*%`)) $calc(10/(.2*%`)) | %= = $calc(15+%| +%è -%&) $calc(50/(.4*%`)) $calc(25/(.4*%`)) | drawrect -nref @H $calc(2892562-5*%`) 0 %' %= | drawrect -nre @H $calc(39892562-5*%`) 0 %' %= } | ;bullets
    else { set %` 2 } ;bullet z pos (starting pos)
  }
  inc %° .3
  if (%° > 4) set %° 0
  if $mouse.x || $mouse.y { ;check positions on screen and move objects on screen accordingly
    set %x $mouse.x | set %y $mouse.y
    if (%x < 8) set %x 8
    if (%x > 278) set %x 278
    if (%y < 0) set %y 0
    if (%y > 134) set %y 134
    set %% 3 ;used in bullet physics (direction moving, makes sure they stay in a line) - in cooperation with %ç
    if %x < 90 { dec %» | dec %# 2 | set %% 1 | dec %¼ | dec %½ 2 | dec %¬ 3 }
    if %x > 210 { inc %» | inc %# 2 | set %% 2 | inc %¼ | inc %½ 2 | inc %¬ 3 }
    if (%» < 1) set %» 8 | ;floor scroller direction
    if (%» > 8) set %» 0
  }
  if %` > 2 && !%ñ { ;collisions
    if $inrect(%',$calc(20+%| +%è -%&),%",%],%^,$calc(47/%+)) {
      if $calc(%^ /(50/(.4*%`))) > 4 { var %a $fmod(SOUND_PlaySound,2 2),%a $fmod(SOUND_SetPan,2 $calc(.8*%[)) | inc %嬵 | set %ñ 1 | set %à 0 | inc %µ }
    }
    else { unset %ñ } ;no collision
  }
  if %ñ {
    inc %à
    if (%à < 2) set %- %é
    if (%à < 14) drawpic -cnts @H 16711935 $calc(%Ã +%Ñ +%-) $calc(65+8*%}) $int($calc(%^ +2*%à)) $int($calc(%^ +2*%à)) $calc(35*%à) 0 35 40 %¤ ;explosions
  }
  if %y = 134 { drawrect -nrfe @H %~ 0 $calc(%x -8) 180 50 18 | drawpic -cnt @H 16711935 %x %y $calc(1+36*$int(%°)) 0 33 65 %² } ;running on the ground
  else { drawrect -nrfe @H %~ 0 $calc(%x -8) 180 50 18 | drawpic -cnt @H 16711935 %x %y $calc(144+1+36*$int(%°)) 0 36 65 %² } ;flying
  var %嬸 0 | while %嬸 <= %嬵 { drawpic -cnt @H 16711935 $calc(16 + %嬸 * 8) 180 0 115 5 8 %² | inc %嬸 }
  drawpic -cnt @H 16711935 22 14 0 102 30 12 %² | drawpic -cnt @H 16711935 190 14 31 102 48 12 %² | inc %@ | bn 250 16 1 %µ | bn 65 16 0 %ß | drawtext -nro @H 2 verdana 11 5 210 %\ FPS | drawdot @H | .timera -ho 1 0 ko | ;%\ = fps, %µ = score, %ß = highscore --- top, score, draw the text for them
  if $calc($ticks -%_) > 249 { set %\ %@ * 4 | set %@ 0 | set %_ $ticks }
}
;beginning intro rainbow draw (inc %m <speed>)
alias -l ft {
  inc %u | drawdot -r @b 0 204 9 200 | set %i 45 | set %t 0 | inc %m 4 | set %j 60
  while %i { drawline -nr @H $rgb($calc(150+100*$sin($calc(%u +3*%i)).deg),$calc(150+100*$cos($calc(3*%u +5*%i)).deg),$calc(150+100*$cos($calc(4*%u +%i)).deg)) 3 0 %i 320 %i | dec %i 3 } | ;draw copper bars
  while %t < 6 { drawpic -c @b 0 $calc(19+60*%t) $calc(%i +%m +60*%t) 0 60 25 o.bmp | inc %t } | ;draw font
  while %j { drawscroll @b 0 $calc(4*$sin($calc(6*%j)).deg) %j 0 1 350 | dec %j } | ;draw waving
  if (%m > 3590) set %m 0 | ;loop intro
  drawcopy -r @b 0 60 60 60 @b 60 0 | drawcopy -r @b 0 120 60 60 @b 120 0 | drawcopy -r @b 0 180 60 60 @b 180 0 | drawcopy -r @b 0 240 60 60 @b 240 0 | drawcopy -r @b 0 300 60 60 @b 300 0 | drawcopy -nrt @b 255 0 0 320 60 @H 0 -3 | drawscroll @H 0 48 0 0 320 200 | ;copy font 3x and scroll
  if $mouse.key & 1 { %£ @b | var %a $fmod(MUSIC_StopSong,1 1) | if $fmod(SOUND_Init,22050 4 0) { } | var %a $fmod(SOUND_Sample_Load,1 " $+ $scriptdir\s.mp3" 2),%a $fmod(SOUND_PlaySound,1 1),%a $fmod(SOUND_Sample_Load,2 %§),%a $fmod(SOUND_Sample_Load,3 %<) | drawpic -c | kou }
  else { .timera 1 0 ft }
}
;format: yo <floor color (inv'd)> <shadow color> --- starts game (on intro)
alias yo {
  if (!%ß) %ß = 0
  if (!%æÜ) %æÜ = 1
  if %æÜ = 4 { %ð = 1 | %Ð = 1 }
  if %æÜ = 1 { %ð = 1 | %Ð = 2 }
  if %æÜ = 2 { %ð = 2 | %Ð = 3 }
  if %æÜ = 3 { %ð = 3 | %Ð = 4 }
  window -CpdokfB +t @H 0 0 320 200 | window -pdokfBh @s 0 0 160 80 | %µ = 0 | %Ã = 1 | %# = 1 | %i = 0
  while %i < 101 { drawline -nr @H $rgb($calc(155+1.6*%i),220,255)  1  0 %i 200 %i | inc %i } | ;draw floor pattern (this and stuff below)
  %y = 0 | %£ = close -@
  while %y < 40 {
    %x = 0
    while %x < 120 { drawrect -nrf @H 14468005 0 $calc(%x +%y) %y 2 2 | inc %x 4 }
    inc %y 2
  }
  drawcopy -m @H 40 0 80 40 @s 0 0 160 80
  if $1 { drawrect -nrif @s $1 0 0 0 320 200 | %~ = $2 }
  else %~ = 13153435
  %i = $scriptdir | %/ = $+(",%i,m.bmp,") | drawsave @s %/ | %£ @s | drawpic -c | %, = $+(",%i,s.png,") | %² = $+(",%i,p.png,") | %> = $+(",%i,o.png,") | %¨ = $+(",%i,c.png,") | %¤ = $+(",%i,e.png,") | %§ = $+(",%i,i.wav,") | %< = $+(",%i,l.wav,") | %w = $pic(%/).width | %h = $pic(%/).height | %¼ = 1 | %½ = 1 | %¬ = 1 | %» = 1 | drawdot -r @H 0 600 0 0 | fus Fullscreen $window(@H).hwnd > 320 > 200 > 16 > 60 | if $fmod(FMOD_Connect,$scriptdir\fmod.dll) != 0 { } | if $fmod(SOUND_Init,44100 4 0) { } | var %a $fmod(MUSIC_LoadSong,1 " $+ $scriptdir\new horizon.mod" 2),%a $fmod(MUSIC_PlaySong,1 1)
  %i = 0 | if ($window(-1).w = 320) fus HideMouse
  drawpic -c | window -pfdonBh +t @¢ 0 0 2100 25 | window -pfdohnB +t @ô 0 0 4000 27 | window -pfdonBh +t @b 0 0 320 360 | var %i 1,%r 0
  while %i < 8 { drawpic -cn @¢ $calc((%i -1)*320) 0 0 %r 320 25 $+(",$scriptdir,KNIGHT4.png,") | inc %i | inc %r 25 }
  drawfill -r @ô 0 0 0 0 | %Ë = $decode(Pz8/Pz8/Pz8gY29iYWx0aGV4IHByZXNlbnRzIGEgZ2FtZSBieSBzdGFuelogb25seSBiZXR0ZXJBIFtdWyBncmVldHogdG8gYWxsIHRoZSBraWRzIG91dCB0aGVyZUFBQS4uLg==,m) | var %i 1,%u $len(%Ë) + 1
  while %i < %u {
    set %d $asc($mid(%Ë,%i,1)) - 64
    if (%d = -25) %d = 32
    if (%d = -18) %d = 14
    drawcopy @¢ $calc(32*%d) 0 32 25 @ô $calc((%i -1)*37) 0 | inc %i
  }
  drawsave @ô o.bmp | %£ @¢ | %£ @ô | drawpic -c | %m = 0 | ft
}
;(cobalthex) draw graphic numbers: x y red/green(0,1) number
alias -l bn var %Ȯ 1 | while %Ȯ <= $len($4) { drawpic -ctn @H 16711935 $calc($1 + ((%Ȯ - 1) * 8)) $2 $calc($mid($4,%Ȯ,1) * 8) $calc(85 + $3 * 8) 8 8 $+(",$scriptdir,p.png,") | inc %Ȯ }
;set up & intro fade in text effect (on picture screen) - (inc %i <speed> :: note: causes picture display issues)
alias -l kou {
  inc %i | %v = 0 | %g = 161 - %i | %嬵 = 3
  while %v < %g { drawpic -nc @H %v 0 $calc(160-%i) 0 1 200 %, | drawpic -nc @H $calc(319-%v) 0 $calc(159+%i) 0 1 200 %, | inc %v }
  if %i > 160 { %i = 0 | .timera 1 2 SHdo | halt }
  drawdot @H | .timera 1 0 kou
}
alias -l Ἕ { var %Ắ GAME OVER, %Ċ Georgia 48, %1 $width(%Ắ,Georgia,48) / 2, %2 $height(%Ắ,Georgia,48) / 2
  drawdot -r @H 0 400 150 150
  drawtext -r @H 72 %Ċ $calc(155 - %1) $calc(100 - %2) %Ắ
  drawtext -r @H 72 %Ċ $calc(165 - %1) $calc(100 - %2) %Ắ
  drawtext -r @H 72 %Ċ $calc(160 - %1) $calc(95 - %2) %Ắ
  drawtext -r @H 72 %Ċ $calc(160 - %1) $calc(105 - %2) %Ắ
  drawtext -r @H 255 %Ċ $calc(160 - %1) $calc(100 - %2) %Ắ
  drawtext -r @H 255 Georgia 12 $calc(160 - $width(SCORE: %µ,Georgia,12) / 2) 150 SCORE: %µ
  halt
}
;run the "get ready" screen
alias -l SHdo inc %i .1 | drawrect -nrf @H 0 0 138 182 45 18 | drawtext -nr @H 100 tahoma 10 135 185 Get ready ! | drawtext -nr @H $calc(200+55*$sin(%i)) tahoma 10 135 184 Get ready ! | drawdot @H | if %i > 20 { drawpic -c | ko | halt } | .timera 1 0 SHdo
alias ql { yo 12061200 7879725
  %£ @b | var %a $fmod(MUSIC_StopSong,1 1) | if $fmod(SOUND_Init,22050 4 0) { } | var %a $fmod(SOUND_Sample_Load,1 " $+ $scriptdir\s.mp3" 2),%a $fmod(SOUND_PlaySound,1 1),%a $fmod(SOUND_Sample_Load,2 %§),%a $fmod(SOUND_Sample_Load,3 %<) | drawpic -c | kou
  %i = 20 | SHdo
}
;fullscreen
alias -l fus dll $+(",$scriptdir,fullscreen.dll,") $1-
;fmod (sound)
alias -l fmod if ($isid) return $dll($scriptdir\fmod_mIRC.dll,$1,$2-)
;events
on *:keydown:@H:*:if $keyval = 27 die
on *:close:@H:die
alias -l die .timera off | %£ @H | %£ @b | .remove %/ | .remove o.bmp | unset %µ %嬵 %# %i %y %x %~ %w %h %¼ %½ %¬ %» %v %g %Á %& %¥ %t %a %ã %® %{ %¿ %ª %+ %Ñ %ñ %ó %é %" %} %] %^ %° %% %@ %\ %_ %` %' %= %[ %| %è %ç %à %- %Ã %ø %² %¨ %¤ %§ %/ %, %> %< %ð %Ð %Ë %d %m %u %j %£ | dll -u fmod_mIRC.dll | fus Reset | fus ShowMouse | dll -u $+(",$scriptdir,fullscreen.dll,") | drawpic -c
menu * {
  .-
  $iif($window(@H),, Space Harrier)
  . Run
  .. Orange:yo 6047737 6574200
  .. Grey:yo
  .. Pink:yo 12344063 7881110
  .. Blue:yo 12061200 7879725
  .. Red:yo 5520017 5520017
  ..    Green:yo 4235824 5799960
  .-
  .   * Quick Launch *:ql 
  .-
  . Mode
  .. Nice Komp+ $iif(%æÜ = 4,<--):$iif(%æÜ = 4,,%æÜ = 4)
  .. P4 2.5 Ghz $iif(%æÜ = 1,<--):$iif(%æÜ = 1,,%æÜ = 1)
  ..-
  .. Low $iif(%æÜ = 2,<--):$iif(%æÜ = 2,,%æÜ = 2)
  .. Ugly $iif(%æÜ = 3,<--):$iif(%æÜ = 3,,%æÜ = 3)
  .-
  . Services
  .. Show mouse:fus ShowMouse
  .. Hide mouse:fus HideMouse
  ..-
  .. Unload script:unload -rs $+(",$script,")
  -
}
