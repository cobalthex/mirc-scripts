;;Binary clock
;;By Daveoh (#DAVEOH @ QUAKENET)
alias bclock {
  if ($1 == tick) {
    if (!$window(@Binary.Clock)) { timerbclock off | echo -a Binary clock stopped | halt }
    drawrect -f @Binary.Clock %bcol.bk 0 0 200 260 85
    drawtext @Binary.Clock %bcol.t WST_Engl 54 15 203 $left($asctime(HH),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 55 203 $right($asctime(HH),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 97 203 $left($asctime(nn),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 135 203 $right($asctime(nn),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 177 203 $left($asctime(ss),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 215 203 $right($asctime(ss),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 78 198 :
    drawtext @Binary.Clock %bcol.t WST_Engl 54 158 198 :
    if ($left($asctime(HH),1) > 1) { drawfill @Binary.Clock %bcol.on %bcol.bor 20 114 } ;h11 on
    if ($left($asctime(HH),1) <= 1) { drawfill @Binary.Clock %bcol.off %bcol.bor 20 114 } ;h11 off
    if ($left($asctime(HH),1) isin 13) { drawfill @Binary.Clock %bcol.on %bcol.bor 20 160 } ;h12 on
    if ($left($asctime(HH),1) !isin 13) { drawfill @Binary.Clock %bcol.off %bcol.bor 20 160 } ;h12 off
    if ($right($asctime(HH),1) >= 8) { drawfill @Binary.Clock %bcol.on %bcol.bor 60 20 } ;h21 on
    if ($right($asctime(HH),1) <= 7) { drawfill @Binary.Clock %bcol.off %bcol.bor 60 20 } ;h21 off
    if ($right($asctime(HH),1) isin 4567) { drawfill @Binary.Clock %bcol.on %bcol.bor 60 67 } ;h22 on
    if ($right($asctime(HH),1) !isin 4567) { drawfill @Binary.Clock %bcol.off %bcol.bor 60 67 } ;h22 off
    if ($right($asctime(HH),1) isin 2367) { drawfill @Binary.Clock %bcol.on %bcol.bor 60 114 } ;h23 on
    if ($right($asctime(HH),1) !isin 2367) { drawfill @Binary.Clock %bcol.off %bcol.bor 60 114 } ;h23 off
    if ($right($asctime(HH),1) isin 13579) { drawfill @Binary.Clock %bcol.on %bcol.bor 60 160 } ;h24 on
    if ($right($asctime(HH),1) !isin 13579) { drawfill @Binary.Clock %bcol.off %bcol.bor 60 160 } ;h24 off
    if ($left($asctime(nn),1) >= 4) { drawfill @Binary.Clock %bcol.on %bcol.bor 100 67 } ;m11 on
    if ($left($asctime(nn),1) <= 3) { drawfill @Binary.Clock %bcol.off %bcol.bor 100 67 } ;m11 off
    if ($left($asctime(nn),1) isin 23) { drawfill @Binary.Clock %bcol.on %bcol.bor 100 114 } ;m12 on
    if ($left($asctime(nn),1) !isin 23) { drawfill @Binary.Clock %bcol.off %bcol.bor 100 114 } ;m12 off
    if ($left($asctime(nn),1) isin 135) { drawfill @Binary.Clock %bcol.on %bcol.bor 100 160 } ;m13 on
    if ($left($asctime(nn),1) !isin 135) { drawfill @Binary.Clock %bcol.off %bcol.bor 100 160 } ;m13 off
    if ($right($asctime(nn),1) >= 8) { drawfill @Binary.Clock %bcol.on %bcol.bor 140 20 } ;m21 on
    if ($right($asctime(nn),1) <= 7) { drawfill @Binary.Clock %bcol.off %bcol.bor 140 20 } ;m21 off
    if ($right($asctime(nn),1) isin 4567) { drawfill @Binary.Clock %bcol.on %bcol.bor 140 67 } ;m22 on
    if ($right($asctime(nn),1) !isin 4567) { drawfill @Binary.Clock %bcol.off %bcol.bor 140 67 } ;m22 off
    if ($right($asctime(nn),1) isin 2367) { drawfill @Binary.Clock %bcol.on %bcol.bor 140 114 } ;m23 on
    if ($right($asctime(nn),1) !isin 2367) { drawfill @Binary.Clock %bcol.off %bcol.bor 140 114 } ;m23 off
    if ($right($asctime(nn),1) isin 13579) { drawfill @Binary.Clock %bcol.on %bcol.bor 140 160 } ;m24 on
    if ($right($asctime(nn),1) !isin 13579) { drawfill @Binary.Clock %bcol.off %bcol.bor 140 160 } ;m24 off
    if ($left($asctime(ss),1) >= 4) { drawfill @Binary.Clock %bcol.on %bcol.bor 180 67 } ;s11 on
    if ($left($asctime(ss),1) <= 3) { drawfill @Binary.Clock %bcol.off %bcol.bor 180 67 } ;s11 off
    if ($left($asctime(ss),1) isin 23) { drawfill @Binary.Clock %bcol.on %bcol.bor 180 114 } ;s12 on
    if ($left($asctime(ss),1) !isin 23) { drawfill @Binary.Clock %bcol.off %bcol.bor 180 114 } ;s12 off
    if ($left($asctime(ss),1) isin 135) { drawfill @Binary.Clock %bcol.on %bcol.bor 180 160 } ;s13 on
    if ($left($asctime(ss),1) !isin 135) { drawfill @Binary.Clock %bcol.off %bcol.bor 180 160 } ;s13 off
    if ($right($asctime(ss),1) >= 8) { drawfill @Binary.Clock %bcol.on %bcol.bor 220 20 } ;s21 on
    if ($right($asctime(ss),1) <= 7) { drawfill @Binary.Clock %bcol.off %bcol.bor 220 20 } ;s21 off
    if ($right($asctime(ss),1) isin 4567) { drawfill @Binary.Clock %bcol.on %bcol.bor 220 67 } ;s22 on
    if ($right($asctime(ss),1) !isin 4567) { drawfill @Binary.Clock %bcol.off %bcol.bor 220 67 } ;s22 off
    if ($right($asctime(ss),1) isin 2367) { drawfill @Binary.Clock %bcol.on %bcol.bor 220 114 } ;s23 on
    if ($right($asctime(ss),1) !isin 2367) { drawfill @Binary.Clock %bcol.off %bcol.bor 220 114 } ;s23 off
    if ($right($asctime(ss),1) isin 13579) { drawfill @Binary.Clock %bcol.on %bcol.bor 220 160 } ;s24 on
    if ($right($asctime(ss),1) !isin 13579) { drawfill @Binary.Clock %bcol.off %bcol.bor 220 160 } ;s24 off
  }
  elseif ($1 == off) {
    .timerbclock off
    window -c @Binary.Clock
    echo -a Binary clock stopped
    halt
  }
  else {
    ;colours
    set %bcol.bk 14 | ;background of time
    set %bcol.bbk 10 | ;border of binary area
    set %bcol.bt 1 | ;background of binary area
    set %bcol.t 10 | ;colour of time
    set %bcol.off 5 | ;colour of binary time off
    set %bcol.on 4 | ;colour of binary time on
    set %bcol.bor 14 | ;colour of binary time border
    echo -a Binary clock started
    window -aCdk0p @Binary.Clock 0 0 260 285
    drawtext @Binary.Clock 4 Arial 15 5 5 Initializing...
    var %time = $asctime(ss)
    while (%time == $asctime(ss)) {
      ;Waiting
    }
    drawrect -f @Binary.Clock %bcol.bk 0 0 0 260 285
    drawrect -f @Binary.Clock %bcol.bbk 0 0 0 260 200
    drawrect -f @Binary.Clock %bcol.bt 0 5 5 240 190
    drawtext @Binary.Clock %bcol.t WST_Engl 54 15 203 $left($asctime(HH),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 55 203 $right($asctime(HH),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 97 203 $left($asctime(nn),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 135 203 $right($asctime(nn),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 177 203 $left($asctime(ss),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 215 203 $right($asctime(ss),1)
    drawtext @Binary.Clock %bcol.t WST_Engl 54 78 198 :
    drawtext @Binary.Clock %bcol.t WST_Engl 54 158 198 :
    drawrect -f @Binary.Clock %bcol.off 0 10 104 30 40
    drawrect -f @Binary.Clock %bcol.off 0 10 150 30 40
    drawrect @Binary.Clock %bcol.bor 5 10 104 30 40
    drawrect @Binary.Clock %bcol.bor 5 10 150 30 40
    drawrect -f @Binary.Clock %bcol.off 0 50 10 30 40
    drawrect -f @Binary.Clock %bcol.off 0 50 57 30 40
    drawrect -f @Binary.Clock %bcol.off 0 50 104 30 40
    drawrect -f @Binary.Clock %bcol.off 0 50 150 30 40
    drawrect @Binary.Clock %bcol.bor 5 50 10 30 40
    drawrect @Binary.Clock %bcol.bor 5 50 57 30 40
    drawrect @Binary.Clock %bcol.bor 5 50 104 30 40
    drawrect @Binary.Clock %bcol.bor 5 50 150 30 40
    ;drawrect -f @Binary.Clock %bcol.off 0 90 10 30 40
    drawrect -f @Binary.Clock %bcol.off 0 90 57 30 40
    drawrect -f @Binary.Clock %bcol.off 0 90 104 30 40
    drawrect -f @Binary.Clock %bcol.off 0 90 150 30 40
    drawrect @Binary.Clock %bcol.bor 5 90 57 30 40
    drawrect @Binary.Clock %bcol.bor 5 90 104 30 40
    drawrect @Binary.Clock %bcol.bor 5 90 150 30 40
    drawrect -f @Binary.Clock %bcol.off 0 130 10 30 40
    drawrect -f @Binary.Clock %bcol.off 0 130 57 30 40
    drawrect -f @Binary.Clock %bcol.off 0 130 104 30 40
    drawrect -f @Binary.Clock %bcol.off 0 130 150 30 40
    drawrect @Binary.Clock %bcol.bor 5 130 10 30 40
    drawrect @Binary.Clock %bcol.bor 5 130 57 30 40
    drawrect @Binary.Clock %bcol.bor 5 130 104 30 40
    drawrect @Binary.Clock %bcol.bor 5 130 150 30 40
    ;drawrect -f @Binary.Clock %bcol.off 0 170 10 30 40
    drawrect -f @Binary.Clock %bcol.off 0 170 57 30 40
    drawrect -f @Binary.Clock %bcol.off 0 170 104 30 40
    drawrect -f @Binary.Clock %bcol.off 0 170 150 30 40
    drawrect @Binary.Clock %bcol.bor 5 170 57 30 40
    drawrect @Binary.Clock %bcol.bor 5 170 104 30 40
    drawrect @Binary.Clock %bcol.bor 5 170 150 30 40
    drawrect -f @Binary.Clock %bcol.off 0 210 10 30 40
    drawrect -f @Binary.Clock %bcol.off 0 210 57 30 40
    drawrect -f @Binary.Clock %bcol.off 0 210 104 30 40
    drawrect -f @Binary.Clock %bcol.off 0 210 150 30 40
    drawrect @Binary.Clock %bcol.bor 5 210 10 30 40
    drawrect @Binary.Clock %bcol.bor 5 210 57 30 40
    drawrect @Binary.Clock %bcol.bor 5 210 104 30 40
    drawrect @Binary.Clock %bcol.bor 5 210 150 30 40
    if ($left($asctime(HH),1) > 1) { drawfill @Binary.Clock %bcol.on %bcol.bor 20 114 }
    if ($left($asctime(HH),1) isin 13) { drawfill @Binary.Clock %bcol.on %bcol.bor 20 160 }
    if ($right($asctime(HH),1) >= 8) { drawfill @Binary.Clock %bcol.on %bcol.bor 60 20 }
    if ($right($asctime(HH),1) isin 4567) { drawfill @Binary.Clock %bcol.on %bcol.bor 60 67 }
    if ($right($asctime(HH),1) isin 2367) { drawfill @Binary.Clock %bcol.on %bcol.bor 60 114 }
    if ($right($asctime(HH),1) isin 13579) { drawfill @Binary.Clock %bcol.on %bcol.bor 60 160 }
    if ($left($asctime(nn),1) >= 4) { drawfill @Binary.Clock %bcol.on %bcol.bor 100 67 }
    if ($left($asctime(nn),1) isin 23) { drawfill @Binary.Clock %bcol.on %bcol.bor 100 114 }
    if ($left($asctime(nn),1) isin 135) { drawfill @Binary.Clock %bcol.on %bcol.bor 100 160 }
    if ($right($asctime(nn),1) >= 8) { drawfill @Binary.Clock %bcol.on %bcol.bor 140 20 }
    if ($right($asctime(nn),1) isin 4567) { drawfill @Binary.Clock %bcol.on %bcol.bor 140 67 }
    if ($right($asctime(nn),1) isin 2367) { drawfill @Binary.Clock %bcol.on %bcol.bor 140 114 }
    if ($right($asctime(nn),1) isin 13579) { drawfill @Binary.Clock %bcol.on %bcol.bor 140 160 }
    if ($left($asctime(ss),1) >= 4) { drawfill @Binary.Clock %bcol.on %bcol.bor 180 67 }
    if ($left($asctime(ss),1) isin 23) { drawfill @Binary.Clock %bcol.on %bcol.bor 180 114 }
    if ($left($asctime(ss),1) isin 135) { drawfill @Binary.Clock %bcol.on %bcol.bor 180 160 }
    if ($right($asctime(ss),1) >= 8) { drawfill @Binary.Clock %bcol.on %bcol.bor 220 20 }
    if ($right($asctime(ss),1) isin 4567) { drawfill @Binary.Clock %bcol.on %bcol.bor 220 67 }
    if ($right($asctime(ss),1) isin 2367) { drawfill @Binary.Clock %bcol.on %bcol.bor 220 114 }
    if ($right($asctime(ss),1) isin 13579) { drawfill @Binary.Clock %bcol.on %bcol.bor 220 160 }
    .timerbclock -m 0 500 bclock tick
} }
