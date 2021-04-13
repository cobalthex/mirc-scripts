;1 1 1 1 1 1 1 1 1 1 1 1
;1 0 0 0 0 0 0 0 0 0 0 1
;1 0 1 0 0 0 1 0 1 0 0 1
;1 0 0 0 0 0 0 0 1 0 0 1
;1 0 0 0 0 0 0 0 1 1 0 1
;1 0 1 0 0 1 0 0 0 1 0 1
;1 0 0 0 0 0 0 0 0 1 0 1
;1 0 1 1 0 1 1 0 1 1 0 1
;1 0 0 0 0 0 1 0 1 0 0 1
;1 0 0 1 0 0 1 0 1 0 0 1
;1 0 0 0 0 0 0 0 0 0 0 1
;1 0 0 1 0 0 0 0 0 0 0 1
;1 1 1 1 1 1 1 1 1 1 1 1

;====================================
;    ToKeN March 2006 - Presents
;
;        -=Fastcast Engine=-
;
;Place this file in your mIRC directory
;
;
;To load: /load -rs fastcastdemo.txt
;To run: /fastcast
;To run with wall fill: /fastcast 1
;
;Compatible with 6.16 Upwards. 
;Although 6.17 should not be used
;due to speed issues.
;====================================

alias fastcast {
  window -hpBt +d @fastcast.map 0 0 640 480
  window -hpBt +d @fastcast.map2 0 0 440 480
  window -pkodCfB +L @fastcast 0 0 320 180
  window -shl @fastcast.buff
  ; window -hl @fastcast.objstore
  clear @fastcast.buff
  fastcast.loadmap
  ;fastcast.loadobj
  unset %fastcast*
  %player.x = 167
  %player.y = 340
  %player.angle = 10

  var %ticks = $ticks
  runrun $1
}
alias fastcast.loadmap { var %sz = 40
  .fopen fcmap $qt($script)
  var %i = 1
  while (%i <= 13) {
    var %ln = $right($fread(fcmap),-1)
    var %j = 1
    while (%j <= $numtok(%ln,32)) {
      drawrect -rf @fastcast.map $iif($gettok(%ln,%j,32) == 1,255,0) 1 $calc((%j - 1) * %sz) $calc((%i - 1) * %sz) %sz %sz
      inc %j
    }
    inc %i
  }
  .fclose fcmap
}

;x y bitmapclass
alias fastcast.loadobj {
  aline @fastcast.objstore 156 95 officer.bmp
  aline @fastcast.objstore 82 95 officer.bmp
  aline @fastcast.objstore 75 139 officer.bmp
}
alias objecthandle {
  var %a = $line(@fastcast.objstore,0), %angle, %dist
  while (%a) { 
    tokenize 32 $line(@fastcast.objstore,%a)
    if (%player.x < $1) {

      if (%player.y < $2) {
        ;bottom right

        %angle = 360 - $atan($calc(($2 - %player.y) / ($1 - %player.x))).deg
        %dist = $calc(($1 - %player.x) / $cos(%angle).deg)

      }
      else {
        ;top right
        %angle = $atan($calc((%player.y - $2) / ($1 - %player.x))).deg
        %dist = $calc(($1 - %player.x) / $cos(%angle).deg)  
      }

    }
    else {
      if (%player.y < $2) {
        ;bottom left
        %angle = 180 + $atan($calc(($2 - %player.y) / ($1 - %player.x))).deg
        %dist = $calc(($1 - %player.x) / $cos(%angle).deg)  

      }
      else {
        ;top left
        %angle = 180 - $atan($calc((%player.y - $2) / (%player.x - $1))).deg
        %dist = $calc((%player.x - $1) / $cos(%angle).deg)
      }

    }
    if (%angle > $calc(%player.angle - 35)) && (%angle < $calc(%player.angle + 35)) {
      aline @fastcast.buff $base(%dist,10,10,4) 1000 %angle $3

    }
    drawdot -r @fastcast.map2 200 4 $1 $2

    dec %a
  }
}
alias fastcast.2d->3d { if (!$window(@fastcast)) halt
  var %drawwall = $6, %ray.x1 = $1, %ray.x2 = $1, %ray.y1 = $2, %ray.y2 = $2, %angle = $3, %dist12, %dist22, %n, %atemp
  drawdot -r @fastcast.map $rgb(0,255,0) 2 $1 $2
  var %max2 = %player.angle + 30, %max = %max2, %min = %max - 60

  while (%angle < %max2) {
    var %ray.x1 = $1, %ray.x2 = $1, %ray.y1 = $2, %ray.y2 = $2,

    if (%angle == 180) { %angle = 181 }
    if (%angle == 0) { %angle = 1 }

    ;echo angles %player.angle %angle
    if (%angle isnum 360-450) {

      %max = %player.angle + 30
      %max2 = %player.angle + 30
      %min = %player.angle - 30
      ;Goto first x line  

      %ray.y1 = $int($calc($2 / 30)) * 29.9999
      inc %ray.x1 $calc(($2 - %ray.y1) / $tan(%angle).deg)     

      %n = 30 / $tan(%angle).deg
      while ($getdot(@fastcast.map,%ray.x1,%ray.y1) == 255) {

        dec %ray.y1 30
        inc %ray.x1 %n
        ;drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1

      }

      %ray.x2 = $int($calc($1 / 30 + 1)) * 30.0001
      dec %ray.y2 $calc((%ray.x2 - $1) * $tan(%angle).deg)
      %n = 30 * $tan(%angle).deg
      ;drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2

      while ($getdot(@fastcast.map,%ray.x2,%ray.y2) == 255) {

        inc %ray.x2 30
        dec %ray.y2 %n
        ;drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2
        ;drawdot -r @fastcast.map2 $rgb(0,255,100) 2 %ray.x2 %ray.y2

      }


      var %dist1 = $calc((%ray.x1 - $1) / $cos(%angle).deg)
      var %dist2 = $calc((%ray.x2 - $1) / $cos(%angle).deg)

      if (%dist1 <= %dist2) { 

        ;Define wall left co
        var %fastcast.newx = $int($calc(%ray.x1 / 30)) * 29.9999
        ;Define wall right co
        var %ray.x1 = $int($calc(%ray.x1 / 30 + 1)) * 29.9999
        ;New angles
        ;Check to see out of
        if ($calc($atan($calc(($2 - %ray.y1) / (%ray.x1 - $1)) ).deg + 360) < %min) {
          %angle2 = $v2
          %dist13 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
        }
        else {
          %angle2 = $v1
          %dist13 = $calc((%ray.x1 - $1) / $cos(%angle2).deg)
        }
        if ($calc(%fastcast.newx - %player.x) < 0) { 
          if ($calc(540 - $atan($calc(($2 - %ray.y1) / ($1 - %fastcast.newx)) ).deg) > %max) {
            %angle = $v2
            %dist12 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
          }
          else {
            %angle = $calc($v1 - 360)

            %dist12 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
          }

        }
        else { 
          if ($calc($atan($calc(($2 - %ray.y1) / (%fastcast.newx - $1)) ).deg + 360) > %max) {
            %angle = $v2
            %dist12 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
          }
          else { %angle = $v1 | %dist12 = $calc((%fastcast.newx - $1) / $cos(%angle).deg) }
        }

        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x1 %ray.y1 %fastcast.newx %ray.y1
        ;drawdot -r @fastcast.map2 122344 4 %ray.x1 %ray.y1 

        aline @fastcast.buff $base(%dist13,10,10,4) %angle2 %dist12 %angle 

      }
      else { 
        ;Define top wall
        var %fastcast.newy = $int($calc(%ray.y2 / 30)) * 29.9999
        ;Define bottom wall
        var %ray.y2 = $int($calc(%ray.y2 / 30 + 1)) * 29.9999

        if ($calc($atan($calc(($2 - %fastcast.newy) / (%ray.x2 - $1)) ).deg + 360) > %max) {
          %angle = $v2
          %dist22 = $calc((%ray.x2 - $1) / $cos(%angle).deg)

        }
        else {
          %angle = $v1
          %dist22 = $calc(($2 - %fastcast.newy) / $sin(%angle).deg)
        }

        if ($calc(%player.y - %ray.y2) < 0) { 
          if ($calc(360 + $atan($calc(($2 - %ray.y2) / (%ray.x2 - $1)) ).deg) < %min) {
            %angle2 = $v2
            %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)
          } 
          else {
            %angle2 = $v1
            %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)
          }
        }
        else { 
          if ($calc($atan($calc(($2 - %ray.y2) / (%ray.x2 - $1)) ).deg + 360) < %min) {
            %angle2 = $v2
            %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)
          } 
          else {
            %angle2 = $v1
            %dist23 = $calc(($2 - %ray.y2) / $sin(%angle2).deg)
          }

        }
        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x2 %fastcast.newy %ray.x2 %ray.y2

        aline @fastcast.buff $base(%dist22,10,10,4) %angle %dist23 %angle2

      }   
      ; echo distance %dist1 %dist2 
      ;if ($?*!="no to continue") { .halt }
      ;   echo angle %angle $4

    }

    elseif (%angle < 0) {

      ;Goto first x line  
      %ray.y1 = $int($calc($2 / 30 + 1)) * 30.0001
      %n = 30 / $tan(%angle).deg

      dec %ray.x1 $calc((%ray.y1 - $2) / $tan(%angle).deg)
      ;drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1

      while ($getdot(@fastcast.map,%ray.x1,%ray.y1) == 255) {
        inc %ray.y1 30
        dec %ray.x1 %n
        ;drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1
      }

      %ray.x2 = $int($calc($1 / 30 + 1)) * 30.0001
      dec %ray.y2 $calc((%ray.x2 - $1) * $tan(%angle).deg)
      %n = 30 * $tan(%angle).deg
      ;drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2

      while ($getdot(@fastcast.map,%ray.x2,%ray.y2) == 255) {
        inc %ray.x2 30
        dec %ray.y2 %n 
        ;drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2
        ;drawdot -r @fastcast.map2 $rgb(0,255,100) 2 %ray.x2 %ray.y2


      }

      var %dist1 = $calc((%ray.x1 - $1) / $cos(%angle).deg)
      var %dist2 = $calc((%ray.x2 - $1) / $cos(%angle).deg)

      if (%dist1 <= %dist2) { 
        ;Define wall left co

        var %fastcast.newx = $int($calc(%ray.x1 / 30)) * 29.9999
        ;Define wall right co
        var %ray.x1 = $int($calc(%ray.x1 / 30 + 1)) * 29.9999
        ;New angles
        ;Check to see out of
        ;left
        if ($calc(-1 * $atan($calc((%ray.y1 - $2) / (%ray.x1 - $1)) ).deg) > %max) {
          %angle = $v2
          %dist13 = $calc((%ray.y1 - $2) / $sin(%angle).deg) * -1

        }
        else {
          %angle = $v1
          %dist13 = $calc((%ray.x1 - $1) / $cos(%angle).deg) * 1
        }
        if ($calc(%fastcast.newx - $1) < 0) { 
          if ($calc(-1 * $atan($calc((%ray.y1 - $2) / ($1 - %fastcast.newx)) ).deg) < %min) {
            %angle2 = $v2
            %dist12 = $calc((%ray.y1 - $2) / $sin(%angle2).deg) * -1
          }
          else {
            %angle2 = $v1
            %dist12 = $calc(($1 - %fastcast.newx) / $cos(%angle2).deg) * 1
          }
        }

        else { 
          if ($calc(-1 * $atan($calc((%ray.y1 - $2) / (%fastcast.newx - $1)) ).deg) < %min) {
            %angle2 = $v2
            %dist12 = $calc((%ray.y1 - $2) / $sin(%angle2).deg) * -1
          }
          else {
            %angle2 = $v1
            %dist12 = $calc((%fastcast.newx - $1) / $cos(%angle2).deg) * 1
          }
        }

        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x1 %ray.y1 %fastcast.newx %ray.y1
        ;     drawdot -r @fastcast.map2 122344 4 %ray.x1 %ray.y1 
        %angle = %angle
        %angle2 = %angle2
        aline @fastcast.buff $base(%dist12,10,10,4) %angle2 %dist13 %angle 
      }

      else { 
        ;Define top co
        var %fastcast.newy = $int($calc(%ray.y2 / 30)) * 29.9999
        ;Define bottom co
        var %ray.y2 = $int($calc(%ray.y2 / 30 + 1)) * 29.9999
        if ($calc(-1 * $atan($calc((%ray.y2 - $2) / (%ray.x2 - $1)) ).deg) < %min) {
          %angle2 = $v2
          %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg) * 1
        }
        else {
          %angle2 = $v1
          %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg) * 1
        }
        if ($calc(%fastcast.newy - %player.y) < 0) {
          if ($atan($calc(($2 - %fastcast.newy) / (%ray.x2 - $1)) ).deg > %max) {
            %angle = $v2
            %dist22 = $calc((%ray.x2 - $1) / $cos(%angle).deg) * 1
          }
          else {
            %angle = $v1
            %dist22 = $calc(($2 - %fastcast.newy) / $sin(%angle).deg) * 1
          }
        }
        else { 
          if ($calc($atan($calc(($2 - %fastcast.newy) / (%ray.x2 - $1)) ).deg * 1) > %max) {
            %angle = $v2
            %dist22 = $calc((%ray.x2 - $1) / $cos(%angle).deg) * 1
          }
          else {
            %angle = $v1
            %dist22 = $calc((%fastcast.newy - $2) / $sin(%angle).deg) * -1
          }

        }
        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x2 %fastcast.newy %ray.x2 %ray.y2
        aline @fastcast.buff $base(%dist22,10,10,4) %angle %dist23 %angle2

      } 
    }


    elseif (%angle isnum 0-90) {
      %max = %player.angle + 30
      %max2 = %max
      %min = %player.angle - 30
      ;Goto first x line  
      %ray.y1 = $int($calc($2 / 30)) * 29.9999

      inc %ray.x1 $calc(($2 - %ray.y1) / $tan(%angle).deg)
      %n = 30 / $tan(%angle).deg
      while ($getdot(@fastcast.map,%ray.x1,%ray.y1) == 255) {
        dec %ray.y1 30
        inc %ray.x1 %n
        ;drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1

      }

      %ray.x2 = $int($calc($1 / 30 + 1)) * 30.0001
      dec %ray.y2 $calc((%ray.x2 - $1) * $tan(%angle).deg)
      %n = 30 * $tan(%angle).deg
      while ($getdot(@fastcast.map,%ray.x2,%ray.y2) == 255) {
        inc %ray.x2 30
        dec %ray.y2 %n
        ; drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2
        ;drawdot -r @fastcast.map2 $rgb(0,255,100) 2 %ray.x2 %ray.y2

      }


      var %dist1 = $calc((%ray.x1 - $1) / $cos(%angle).deg)
      var %dist2 = $calc((%ray.x2 - $1) / $cos(%angle).deg)

      if (%dist1 <= %dist2) { 
        ;Define wall left co
        var %fastcast.newx = $int($calc(%ray.x1 / 30)) * 29.9999
        ;Define wall right co
        var %ray.x1 = $int($calc(%ray.x1 / 30 + 1)) * 29.9999
        ;New angles
        ;Check to see out of

        if ($atan($calc(($2 - %ray.y1) / (%ray.x1 - $1)) ).deg < %min) {
          %angle2 = $v2
          %dist13 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
          var %p = $calc(($v2 / $v1) * 64)
        }
        else {
          %angle2 = $v1
          %dist13 = $calc((%ray.x1 - $1) / $cos(%angle2).deg)
        }
        if ($calc(%fastcast.newx - %player.x) < 0) { 
          if ($calc(180 - $atan($calc(($2 - %ray.y1) / ($1 - %fastcast.newx)) ).deg) > %max) {
            %angle = $v2
            %dist12 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
          }
          else {
            %angle = $v1
            %dist12 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
          }

        }
        else { 

          if ($atan($calc(($2 - %ray.y1) / (%fastcast.newx - $1)) ).deg > %max) {
            %angle = $v2
            %dist12 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
          }
          else { %angle = $v1 | %dist12 = $calc((%fastcast.newx - $1) / $cos(%angle).deg) }
        }

        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x1 %ray.y1 %fastcast.newx %ray.y1
        ;drawdot -r @fastcast.map2 122344 4 %ray.x1 %ray.y1 
        aline @fastcast.buff $base(%dist13,10,10,4) %angle2 %dist12 %angle %p

      }
      else { 
        %p = 0
        ;Define top wall
        var %fastcast.newy = $int($calc(%ray.y2 / 30)) * 29.9999
        ;Define bottom wall
        var %ray.y2 = $int($calc(%ray.y2 / 30 + 1)) * 29.9999

        if ($atan($calc(($2 - %fastcast.newy) / (%ray.x2 - $1)) ).deg > %max) {
          %angle = $v2
          %dist22 = $calc((%ray.x2 - $1) / $cos(%angle).deg)

        }
        else {
          %angle = $v1
          %dist22 = $calc(($2 - %fastcast.newy) / $sin(%angle).deg)
        }

        if ($calc(%player.y - %ray.y2) < 0) { 
          if ($atan($calc(($2 - %ray.y2) / (%ray.x2 - $1)) ).deg < %min) {
            %angle2 = $v2
            %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)
          } 
          else {
            %angle2 = $v1
            %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)
          }
        }
        else { 
          if ($atan($calc(($2 - %ray.y2) / (%ray.x2 - $1)) ).deg < %min) {
            %angle2 = $v2
            %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)
          } 
          else {
            %angle2 = $v1
            %dist23 = $calc(($2 - %ray.y2) / $sin(%angle2).deg)
          }

        }
        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x2 %fastcast.newy %ray.x2 %ray.y2
        aline @fastcast.buff $base(%dist22,10,10,4) %angle %dist23 %angle2
      }   
      ; echo distance %dist1 %dist2 
      ;if ($?*!="no to continue") { .halt }
      ;   echo angle %angle $4

    }

    elseif (%angle isnum 90-180) {
      %angle = 180 - %angle
      ;Goto first x line  

      %ray.y1 = $int($calc($2 / 30)) * 29.9999
      dec %ray.x1 $calc(($2 - %ray.y1) / $tan(%angle).deg)
      %n = 30 / $tan(%angle).deg
      while ($getdot(@fastcast.map,%ray.x1,%ray.y1) == 255) {
        dec %ray.y1 30
        dec %ray.x1 %n
        ;drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1

      }

      %ray.x2 = $int($calc($1 / 30)) * 29.9999

      dec %ray.y2 $calc(($1 - %ray.x2) * $tan(%angle).deg)

      %n = 30 * $tan(%angle).deg
      while ($getdot(@fastcast.map,%ray.x2,%ray.y2) == 255) {
        dec %ray.x2 30
        dec %ray.y2 %n 

        ;drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2
        ;drawdot -r @fastcast.map2 $rgb(0,255,100) 2 %ray.x2 %ray.y2


      }

      var %dist1 = $calc(($1 - %ray.x1) / $cos(%angle).deg)
      var %dist2 = $calc(($1 - %ray.x2) / $cos(%angle).deg)


      if (%dist1 <= %dist2) { 

        ;Define wall left co
        var %fastcast.newx = $int($calc(%ray.x1 / 30)) * 29.9999
        ;Define wall right co
        var %ray.x1 = $int($calc(%ray.x1 / 30 + 1)) * 29.9999
        ;New angles
        ;Check to see out of

        if ($calc(180 - $atan($calc(($2 - %ray.y1) / ($1 - %fastcast.newx)) ).deg) > %max) {
          %angle = $v2
          %dist13 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
        }
        else {
          %angle = $v1
          %dist13 = $calc(($2 - %ray.y1) / $sin(%angle).deg)
        }
        if ($calc(%player.x - %ray.x1) < 0) { 
          if ($atan($calc(($2 - %ray.y1) / (%ray.x1 - $1)) ).deg < %min) {
            %angle2 = $v2
            %dist12 = $calc(($2 - %ray.y1) / $sin(%angle2).deg)
          }
          else {
            %angle2 = $v1
            %dist12 = $calc(($1 - %ray.x1) / $cos(%angle2).deg) * -1
          }
        }
        else { 
          if ($calc(180 - $atan($calc(($2 - %ray.y1) / ($1 - %ray.x1)) ).deg) < %min) {
            %angle2 = $v2
            %dist12 = $calc(($2 - %ray.y1) / $sin(%angle2).deg) * 1
          }
          else {
            %angle2 = $v1
            %dist12 = $calc(($1 - %ray.x1) / $cos(%angle2).deg) * -1
          }
        }

        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x1 %ray.y1 %fastcast.newx %ray.y1
        ;drawdot -r @fastcast.map2 122344 4 %ray.x1 %ray.y1 
        aline @fastcast.buff $base(%dist12,10,10,4) %angle2 %dist13 %angle 

      }
      else { 
        ;Define top co
        var %fastcast.newy = $int($calc(%ray.y2 / 30)) * 29.9999
        ;Define bottom co
        var %ray.y2 = $int($calc(%ray.y2 / 30 + 1)) * 29.9999

        if ($calc(180 - $atan($calc(($2 - %fastcast.newy) / ($1 - %ray.x2)) ).deg) < %min) {
          %angle2 = $v2
          %dist23 = $calc(($1 - %ray.x2) / $cos(%angle2).deg) * -1
        }
        else {
          %angle2 = $v1
          %dist23 = $calc(($2 - %fastcast.newy) / $sin(%angle2).deg)
        }

        if ($calc(%player.y - %ray.y2) < 0) { 
          if ($calc(180 + $calc(1 * $atan($calc((%ray.y2 - $2) / ($1 - %ray.x2)) ).deg)) > %max) {
            %angle = $v2
            %dist22 = $calc(($1 - %ray.x2) / $cos(%angle).deg) * -1
          }
          else {
            %angle = $v1
            %dist22 = $calc(($1 - %ray.x2) / $cos(%angle).deg) * -1
          }
        }
        else { 
          if ($calc(180 - $atan($calc(($2 - %ray.y2) / ($1 - %ray.x2)) ).deg) > %max) {
            %angle = $v2
            %dist22 = $calc(($1 - %ray.x2) / $cos(%angle).deg) * -1

          }
          else {
            %angle = $v1
            %dist22 = $calc(($2 - %ray.y2) / $sin(%angle).deg)

          }

        }
        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x2 %fastcast.newy %ray.x2 %ray.y2

        aline @fastcast.buff $base(%dist22,10,10,4) %angle %dist23 %angle2 


      }   
    }

    elseif (%angle isnum 180-270) {
      %angle = $calc(90 - (270 - %angle))
      ;Goto first x line  

      %ray.y1 = $int($calc($2 / 30 + 1)) * 30.0001
      %n = 30 / $tan(%angle).deg

      dec %ray.x1 $calc((%ray.y1 - $2) / $tan(%angle).deg)
      ;drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1

      while ($getdot(@fastcast.map,%ray.x1,%ray.y1) == 255) {
        inc %ray.y1 30
        dec %ray.x1 %n
        ;drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1

      }
      %ray.x2 = $int($calc($1 / 30)) * 29.9999
      %n = 30 * $tan(%angle).deg
      inc %ray.y2 $calc(($1 - %ray.x2) * $tan(%angle).deg)


      while ($getdot(@fastcast.map,%ray.x2,%ray.y2) == 255) {
        dec %ray.x2 30
        inc %ray.y2 %n

        ;drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2
        ;drawdot -r @fastcast.map2 $rgb(0,255,100) 2 %ray.x2 %ray.y2


      }

      var %dist1 = $calc(($1 - %ray.x1) / $cos(%angle).deg)
      var %dist2 = $calc(($1 - %ray.x2) / $cos(%angle).deg)

      if (%dist1 <= %dist2) { 

        ;Define wall left co
        var %fastcast.newx = $int($calc(%ray.x1 / 30)) * 29.9999
        ;Define wall right co
        var %ray.x1 = $int($calc(%ray.x1 / 30 + 1)) * 29.9999
        ;New angles
        ;Check to see out of
        ;left
        if ($calc(180 + $atan($calc((%ray.y1 - $2) / ($1 - %fastcast.newx)) ).deg) < %min) {
          %angle2 = $v2
          %dist12 = $calc((%ray.y1 - $2) / $sin(%angle2).deg) * -1

        }
        else {
          %angle2 = $v1
          %dist12 = $calc(($1 - %fastcast.newx) / $cos(%angle2).deg) * -1
        }


        if ($calc(%player.x - %ray.x1) < 0) { 

          if ($calc(270 + $atan($calc((%ray.x1 - $1) / (%ray.y1 - $2)) ).deg) > %max) {
            %angle = $v2
            %dist13 = $calc((%ray.y1 - $2) / $sin(%angle).deg) * -1

          }
          else {
            %angle = $v1
            %dist13 = $calc((%ray.x1 - $1) / $cos(%angle).deg)
          }
        }
        else { 
          if ($calc(180 + $atan($calc((%ray.y1 - $2) / ($1 - %ray.x1)) ).deg) > %max) {
            %angle = $v2
            %dist13 = $calc((%ray.y1 - $2) / $sin(%angle).deg) * -1
          }
          else {
            %angle = $v1
            %dist13 = $calc((%ray.x1 - $1) / $cos(%angle).deg)

          }
        }

        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x1 %ray.y1 %fastcast.newx %ray.y1
        ;drawdot -r @fastcast.map2 122344 4 %ray.x1 %ray.y1 

        aline @fastcast.buff $base(%dist12,10,10,4) %angle2 %dist13 %angle 
      }

      else { 
        ;Define top co
        var %fastcast.newy = $int($calc(%ray.y2 / 30)) * 29.9999
        ;Define bottom co
        var %ray.y2 = $int($calc(%ray.y2 / 30 + 1)) * 29.9999

        %angle2 = 180 + $atan($calc((%fastcast.newy - $2) / ($1 - %ray.x2)) ).deg

        if ($calc(180 + $atan($calc((%fastcast.newy - $2) / ($1 - %ray.x2)) ).deg) < %min) {
          %angle2 = $v2
          %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)

        }
        else {
          %angle2 = $v1 
          %dist23 = $calc(($2 - %fastcast.newy) / $sin(%angle2).deg)
        }
        if ($calc(%ray.y2 - %player.y) < 0) { 
          if ($calc(180 - $atan($calc(($2 - %ray.y2) / ($1 - %ray.x2)) ).deg) > %max) {
            %angle = $v2
            %dist22 = $calc(($1 - %ray.x2) / $cos(%angle).deg) * -1
          }
          else {
            %angle = $v1
            %dist22 = $calc((%ray.y2 - $2) / $sin(%angle).deg) * -1
          }
        }
        else { 
          if ($calc(180 + $atan($calc((%ray.y2 - $2) / ($1 - %ray.x2)) ).deg) > %max) {
            %angle = $v2
            %dist22 = $calc(($1 - %ray.x2) / $cos(%angle).deg) * -1
          }
          else {
            %angle = $v1
            %dist22 = $calc((%ray.y2 - $2) / $sin(%angle).deg) * -1
          }
        }

        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x2 %fastcast.newy %ray.x2 %ray.y2

        aline @fastcast.buff $base(%dist22,10,10,4) %angle %dist23 %angle2


      }   
    }


    elseif (%angle isnum 270-360) {
      %angle = $calc(%angle - 270)
      ;Goto first x line  
      %ray.y1 = $int($calc($2 / 30 + 1)) * 30.0001
      %n = 30 * $tan(%angle).deg

      inc %ray.x1 $calc((%ray.y1 - $2) * $tan(%angle).deg)
      ;    drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1

      while ($getdot(@fastcast.map,%ray.x1,%ray.y1) == 255) {
        inc %ray.y1 30
        inc %ray.x1 %n
        ;drawline -r @fastcast.map2 $rgb(0,255,0) 1 $1 $2 %ray.x1 %ray.y1

      }

      %ray.x2 = $int($calc($1 / 30 + 1)) * 30.0001
      inc %ray.y2 $calc((%ray.x2 - $1) / $tan(%angle).deg)
      %n = 30 / $tan(%angle).deg
      ;drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2

      while ($getdot(@fastcast.map,%ray.x2,%ray.y2) == 255) {
        inc %ray.x2 30
        inc %ray.y2 %n 

        ;drawline -r @fastcast.map2 $rgb(0,255,255) 1 $1 $2 %ray.x2 %ray.y2
        ;drawdot -r @fastcast.map2 $rgb(0,255,100) 2 %ray.x2 %ray.y2


      }

      var %dist1 = $calc((%ray.x1 - $1) / $sin(%angle).deg)
      var %dist2 = $calc((%ray.x2 - $1) / $sin(%angle).deg)
      if (%dist1 <= %dist2) { 
        ;Define wall left co
        var %fastcast.newx = $int($calc(%ray.x1 / 30)) * 29.9999
        ;Define wall right co
        var %ray.x1 = $int($calc(%ray.x1 / 30 + 1)) * 29.9999
        ;New angles
        ;Check to see out of
        ;left

        if ($calc(270 + $atan($calc((%ray.x1 - $1) / (%ray.y1 - $2)) ).deg) > %max) {
          %angle = $v2
          %dist13 = $calc((%ray.y1 - $2) / $sin(%angle).deg) * -1

        }
        else {
          %angle = $v1
          %dist13 = $calc((%ray.x1 - $1) / $cos(%angle).deg) * 1
        }

        if ($calc(%ray.x1 - $1) < 0) { 
          if ($calc(270 - $atan($calc((%ray.y1 - $2) / ($1 - %ray.x1)) ).deg) < %min) {
            %angle2 = $v2
            %dist12 = $calc((%ray.y1 - $2) / $sin(%angle2).deg) * -1
          }
          else {
            %angle2 = $v1
            %dist12 = $calc((%ray.x1 - $1) / $cos(%angle2).deg) * 1
          }
        }
        else { 
          if ($calc(270 + $atan($calc((%fastcast.newx - $1) / (%ray.y1 - $2)) ).deg) < %min) {
            %angle2 = $v2
            %dist12 = $calc((%ray.y1 - $2) / $sin(%angle2).deg) * -1
          }
          else {
            %angle2 = $v1
            %dist12 = $calc((%fastcast.newx - $1) / $cos(%angle2).deg) * 1
          }
        }

        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x1 %ray.y1 %fastcast.newx %ray.y1
        ;     drawdot -r @fastcast.map2 122344 4 %ray.x1 %ray.y1 
        %angle = %angle
        %angle2 = %angle2
        aline @fastcast.buff $base(%dist12,10,10,4) %angle2 %dist13 %angle 
      }

      else { 
        ;Define top co
        var %fastcast.newy = $int($calc(%ray.y2 / 30)) * 29.9999
        ;Define bottom co
        var %ray.y2 = $int($calc(%ray.y2 / 30 + 1)) * 29.9999

        if ($calc(270 + $atan($calc((%ray.x2 - $1) / (%ray.y2 - $2)) ).deg) < %min) {
          %angle2 = $v2
          %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)
        }
        else {
          %angle2 = $v1
          %dist23 = $calc((%ray.x2 - $1) / $cos(%angle2).deg)
        }
        if ($calc(%fastcast.newy - %player.y) < 0) { 
          if ($calc(360 + $atan($calc(($2 - %fastcast.newy) / (%ray.x2 - $1)) ).deg) > %max) {
            %angle = $v2
            %dist22 = $calc((%ray.x2 - $1) / $cos(%angle).deg)
          }
          else {
            %angle = $v1
            %dist22 = $calc(($2 - %fastcast.newy) / $sin(%angle).deg)
          }
        }
        else { 
          if ($calc(270 + $atan($calc((%ray.x2 - $1) / (%fastcast.newy - $2)) ).deg) > %max) {
            %angle = $v2
            %dist22 = $calc((%ray.x2 - $1) / $cos(%angle).deg)
          }
          else {
            %angle = $v1
            %dist22 = $calc(($2 - %fastcast.newy) / $sin(%angle).deg)
          }

        }
        ;drawline -r @fastcast.map2 $rgb(255,255,0) 1 %ray.x2 %fastcast.newy %ray.x2 %ray.y2
        aline @fastcast.buff $base(%dist22,10,10,4) %angle %dist23 %angle2

      } 
    }

    :end
    ; echo s ( %angle < %max ) 
    ; if ($?*!="no to continue") { .halt }
    ;echo s %angle $calc(%angle - (%player.angle - 30)) < 60
    %angle = $calc(%angle + .3)
  }
  drawrect -nrf @fastcast 0 1 0 0 320 180

  ;echo nup %angle %max2
  ; objecthandle

  var %a = $line(@fastcast.buff,0), %dist1 = 0, %dist2 = 0, %fov = 60, %screen = 320
  ;  echo fov %fov %screen
  while (%a) {
    tokenize 32 $line(@fastcast.buff,%a)
    ;   if ($2 == 1000) {
    ;     var %angle1 = $calc(%player.angle + 30 - $3), %x = 5.33333 * %angle1
    ;     if (%angle1 < 30) { %dist1 = $1 * $cos($calc(%angle1 - 30) ).deg  }
    ;     else { %dist1 = $1 * $abs($cos($calc(%angle1 - 30)).deg) }
    ;     %dist1 = $1
    ;     %dist1 = 3400 / %dist1
    ;     ;drawrect -n @fastcast 255 1 %x $calc(50 - (%dist1 / 2)) $calc(100 - (($1 / 100) *  64)) $calc(50 + (($1 / 100) *  64))

    ;drawpic -stcn @fastcast 255 %x  60 $calc(100 + (%dist1 / 2)) $4-
    ;     goto next
    ;   }

    var %angle1 = $calc(%player.angle + 30 - $2), %x1 = 5.33333 * %angle1, %angle2 = $calc(%player.angle + 30 - $4), %x2 = 5.33333 * %angle2

    if (%angle1 < 30) { %dist1 = $1 * $cos($calc(%angle1 - 30) ).deg  }
    else { %dist1 = $1 * $cos($calc(%angle1 - 30)).deg }

    %dist1 = 6400 / %dist1

    if (%angle2 < 30) { %dist2 = $3 * $cos($calc(%angle2 - 30)).deg }
    else { %dist2 = $3 * $abs($cos($calc(%angle2 - 30)).deg) }

    %dist2 = 6400 / %dist2

    if (%x1 >= %x2) { 
      goto b
      ;var %g = $calc(%x1 - %x2 + 0), %f = %g, %y = $calc(100 + (%dist1 / 2)), %y2 = $calc(100 - (%dist1 / 2)), %m = $calc(((100 + (%dist2 / 2)) - %y) / %f) * 2
      ;var %d = 2 , %q = 2

      if (%d == 0) {
        ;  drawpic -snc @fastcast %x2 $int(%y) 64 $int($calc(%y2 - %y)) 0 0 64 64 stone1.bmp
      }
      while (%g >= 0) {
        ; drawpic -msnc @fastcast $int($calc(%x2 + %g)) $int(%y) 3 $int($calc(%y2 - %y)) $int($calc((%g / %f) * 64)) 0 $calc(%d + 1) 64 stone1.bmp
        inc %y %m
        dec %y2 %m
        dec %g 2
      }
      :b
      drawline -nr @fastcast $rgb(180,180,180) 1 %x1 $calc(100 + (%dist1 / 2)) %x1 $calc(100 - (%dist1 / 2)) %x2 $calc(100 - (%dist2 / 2)) %x2 $calc(100 + (%dist2 / 2)) %x1 $calc(100 + (%dist1 / 2)) %x2 $calc(100 + (%dist2 / 2))
      if (%drawwall) { drawfill -nr @fastcast $rgb(180,180,180) $rgb(180,180,180) $calc(%x1 - 1) $calc(98 + (%dist1 / 2)) }

    } 
    else { 
      goto n

      ;var %g = $calc(%x2 - %x1 + 1), %f = %g, %y = $calc(100 + (%dist2 / 2)), %y2 = $calc(100 - (%dist2 / 2)), %m = $calc(((100 + (%dist1 / 2)) - %y) / %f) * 2
      ;var %d = 2 , %q = 2

      if (%d == 0) {
        drawpic -snc @fastcast %x2 $int(%y2) 64 $int($calc(%y - %y2)) 0 0 64 64 stone1.bmp
      }
      while (%g >= 0) {
        drawpic -snmc @fastcast $int($calc(%x1 + %g)) $int(%y2) 3 $int($calc(%y - %y2)) $int($calc((%g / %f) * (64 - 0))) 0 $calc(%d + 1) 64 stone2.bmp
        inc %y %m
        dec %y2 %m
        dec %g 2
      }
      :n

      drawline -nr @fastcast $rgb(80,80,80) 1 %x1 $calc(100 + (%dist1 / 2)) %x1 $calc(100 - (%dist1 / 2)) %x2 $calc(100 - (%dist2 / 2))  %x2 $calc(100 + (%dist2 / 2)) %x1 $calc(100 + (%dist1 / 2)) %x2 $calc(100 + (%dist2 / 2))

      if (%drawwall) {  drawfill -nr @fastcast $rgb(80,80,80) $rgb(80,80,80) $calc((%x2 + %x1)/ 2) 100 }
    }

    ; drawdot -rn @fastcast $rgb(0,0,255) 2 $calc(%x1 + 1) $calc(100 - (%dist2 / 2) + 10)

    :next
    dec %a

  }
  drawtext -rn @fastcast $rgb(100,100,100) "OCR A Extended" 12 190 160 $int($calc(1000 / ($ticks - %ticks))) Fps %player.angle Degrees
  drawtext -rn @fastcast $rgb(100,100,100) "OCR A Extended" 12 10 160 XY %player.x %player.y

  drawdot @fastcast
  clear @fastcast.buff

}
alias runrun {
  if (%fastcast.le) {
    inc %player.angle 2
  }
  if (%fastcast.ri) {
    dec %player.angle 2
  }
  if (%fastcast.up) {
    var %t.x = %player.x, %t.y = %player.y
    inc %t.x $calc(4 * $cos(%player.angle).deg)
    if ($getdot(@fastcast.map,%t.x,%t.y) != 255) { %player.x = %t.x }
    dec %t.y $calc(4 * $sin(%player.angle).deg)
    if ($getdot(@fastcast.map,%t.x,%t.y) != 255) { %player.y = %t.y }
  }
  if (%fastcast.do) {
    var %t.x = %player.x, %t.y = %player.y
    dec %t.x $calc(4 * $cos(%player.angle).deg)
    if ($getdot(@fastcast.map,%t.x,%t.y) != 255) { %player.x = %t.x }
    inc %t.y $calc(4 * $sin(%player.angle).deg)
    if ($getdot(@fastcast.map,%t.x,%t.y) != 255) { %player.y = %t.y }


  }
  unset %walls
  if (%player.angle >= 390) { %player.angle = 30 }
  if (%player.angle <= -50) { %player.angle = 310  }
  ;fastcast.loadmap
  %ticks = $ticks

  fastcast.2d->3d %player.x %player.y $calc(%player.angle - 30) %max $calc(%player.angle - 30) 30 $1
  .timerfastcast -hm 1 0 runrun $1

}
on *:CLOSE:@fastcast: { window -c @fastcast | window -c @fastcast.buff | window -c @fastcast.map | window -c @fastcast.map2 | unset %player* %fastcast* %dist* %angle* }

on *:KEYDOWN:@fastcast:*: {
  if ($keyval == 27) { window -c @fastcast | window -c @fastcast.buff | window -c @fastcast.map | window -c @fastcast.map2 | unset %player* %fastcast* %dist* %angle* }
  if ($keyval == 38) { %fastcast.up = 1 }
  if ($keyval == 40) { %fastcast.do = 1 }
  if ($keyval == 37) { %fastcast.le = 1 }
  if ($keyval == 39) { %fastcast.ri = 1 }
}

on *:KEYUP:@fastcast:*: {
  if ($keyval == 38) { %fastcast.up = 0 }
  if ($keyval == 40) { %fastcast.do = 0 }
  if ($keyval == 37) { %fastcast.le = 0 }
  if ($keyval == 39) { %fastcast.ri = 0 }
}
