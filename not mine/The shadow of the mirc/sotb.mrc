alias -l � {
  dec %m 3 | dec %o 5 | inc %f | inc %i | inc %e .5 | inc %d .25 | drawpic -cn @s 0 0 %�1
  if (%i > 321) set %i 1
  if (%m < -1640) set %m 320
  if (%o < -1640) set %o 320
  if (%f > 1600) set %f 1
  if (%e > 14) set %e 1
  if (%d = 7) set %d 1
  $hget(S,%i) | drawpic -cnt @s 255 10 117 $calc(-32+32*$int(%d)) 0 32 52 %�3 | drawpic -cnt @s 255 %m 0 %q | drawpic -cnt @s 0 %o 12 %u | drawpic -cnt @s 0 $calc(-.4*%m) $calc(50+40*$sin($calc(%o /400))) $calc(34*$int(%e)) 0 34 87 %�2 | $hget(B,%i) | $hget(L,%f) | drawdot @s | .timer� 1 0 �
}
alias sotb {
  var %i 0,%z 0,%% drawpic -cnt @s 255,%, window | %, @@ 0 0 0 0 | drawpic -c | - . b | - � r | � Fullscreen $window(@@).hwnd > 320 > 200 > 16 > 60 | if ($1) � HideMouse | %, -CdopBf +d @s 0 0 640 200 | %, -a @s 0 0 640 200 | drawfill -r @s 0 1 1 1 | - q m | drawpic @s 0 0 %q
  while %i < 321 {
    inc %i | set %u 1 | dec %z 7 | if (%z < -321) set %z 0 | hadd -m B %i %% %z 177 %.
    while %u < 7 { inc %� $+ %u $calc(-7+%u) | set %q % $+ � $+ %u | if ($eval(%q,2) < -321) set %� $+ %u 0 | inc %u }
    hadd -m S %i drawscroll -n @s %�1 0 0 0 960 21 %�2 0 0 21 960 40 %�3 0 0 61 960 19 %�4 0 0 80 960 9 %�5 0 0 89 960 6 %�6 0 0 95 960 73 %�5 0 0 168 960 2 %�4 0 0 170 960 3 %�3 0 0 173 960 7 %�2 0 0 180 960 7 %�1 0 0 187 960 11
  }
  var %i 1,%z 0
  while %i < 1600 {
    inc %i
    if %i > 500 && %i < 660 { dec %z 2 }
    elseif %i > 1100 && %i < 1260 { inc %z 2 }
    hadd -m L %i %% %z 1 %�
  }
  - q a | - u s | - �1 k | - �2 i | - �3 g | if $�(FMOD_Connect,$scriptdirbin\fmod.dll)!=0 { if $�(SOUND_Init,44100 4 0) { } } | if $�(MUSIC_LoadSong,0 " $+ $scriptdirbin\s") { } | if $�(MUSIC_PlaySong,0) { } | �
}
alias -l � dll $+(",$scriptdirbin\,fullscreen.dll,") $1-
alias -l - set % $+ $1 $+(",$scriptdirbin\,$2,.png,")
alias -l � if ($isid) return $dll($scriptdirbin\fmod_mIRC.dll,$1,$2-)
on *:keydown:@s:*:if $keyval = 27 { .timer� off | close -@ @s | unset %�* %u %q %m %o %f %i %. %� %e %d | if $�(MUSIC_StopSong,0) { } | dll -u fmod_mIRC.dll | hfree B | hfree S | hfree L | � Reset | close -@ @@ | � ShowMouse | dll -u fullscreen.dll }
