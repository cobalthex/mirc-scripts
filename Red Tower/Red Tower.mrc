;The Red Tower -- by Type Studios
alias RedTower { 
  window -pkodCfBh +nt @RedTower -1 -1 500 500 $+(",$scriptdir,images\,Red Tower.ico,") 0
  window -pkodCfB +dL @Loading -1 -1 300 200 $+(",$scriptdir,images\,Red Tower.ico,") 0
  drawpic -c @Loading 0 0 $+(",$scriptdir,images\,Red Tower.png,")
  drawtext -ir @Loading 200 verdana 10 5 5 Loading, Please Wait...
  titlebar @RedTower Loading, Please Wait
  drawtext -r @Loading 150 verdana 10 170 0 Creating Directories
  window -pkCfBh +d @RedTower.fnt -1 -1 1164 40
  window -pkCfBh +d @RedTower.b1 -1 -1 600 600
  window -pkCfBh +d @RedTower.b2 -1 -1 600 600
  window -pkCfBh +d @RedTower.b3 -1 -1 500 500
  window -pkfBh +d @RedTower.b4 -1 -1 600 600
  window -kdCh +L @RedTower.Entity -1 -1 200 100 tahoma 2
  drawfill -r @RedTower.fnt 16711935 1 0 0
  drawfill -r @RedTower.b1 16711935 1 0 0
  drawfill -r @RedTower.b3 16711935 1 0 0
  drawfill -r @RedTower.b4 16711935 1 0 0
  drawtext -r @Loading 150 verdana 10 170 10 Gathering Data
  drawpic -cls @RedTower.b2 0 0 600 600 $+(",$scriptdir,Images\,grass.png,")
  drawpic -t @RedTower.b1 0 0 0 $+(",$scriptdir,Images\,Menu.png,")
  drawpic -t @RedTower.b1 16777215 0 215 $+(",$scriptdir,Images\,HUD.png,")
  drawpic -t @RedTower.b1 0 200 0 $+(",$scriptdir,Images\,player_ex.png,")
  drawpic -t @RedTower.b1 0 200 50 $+(",$scriptdir,Images\,player.png,")
  drawpic -t @RedTower.fnt 0 0 0 $+(",$scriptdir,Images\,Custom Font.png,")
  drawpic -t @RedTower.b1 16777215 5 550 $+(",$scriptdir,Images\,Border.png,")
  drawpic -t @RedTower.b1 4210688 0 455 $+(",$scriptdir,Images\,Load and Select.png,")
  drawpic -t @RedTower.b4 16711935 0 0 $+(",$scriptdir,Images\,Enem 1.png,")
  drawtext -r @Loading 150 verdana 10 170 20 Creating Buffers
  ;drawpic -t @RedTower.b1 0 5 300 $+(",$scriptdir,Images\,box.png,")
  ;drawpic -t @RedTower.b1 16777215 5 500 $+(",$scriptdir,Images\,tree.png,")
  ;drawpic -t @RedTower.b1 16777215 5 350 $+(",$scriptdir,Images\,health powerup.png,")
  var %3 0
  while (%3 <= 23) {
    drawcopy -nt @RedTower.b1 16711935 60 296 $iif(%3 == 23, 10, 16) 80 @RedTower.b3 $calc(61 + (%3 * 16)) 10
    inc %3
  }
  drawcopy -nt @RedTower.b1 16711935 0 296 56 80 @RedTower.b3 5 10
  drawcopy -nt @RedTower.b1 16711935 120 296 56 80 @RedTower.b3 439 10

  var %b 0 
  while (%b <= 194) {
    drawcopy -nt @RedTower.b1 16711935 50 377 2 64 @RedTower.b3 $calc(55 + (%b * 2)) 110
    inc %b
  }
  drawcopy -nt @RedTower.b1 16711935 0 377 50 64 @RedTower.b3 5 110
  drawcopy -nt @RedTower.b1 16711935 72 377 56 64 @RedTower.b3 440 110
  drawtext -r @Loading 150 verdana 10 170 30 Organizing Data
  hfree -w RedTower*
  hmake RedTower.main 100
  hmake RedTower.menu 10
  hadd RedTower.main me.x 250
  hadd RedTower.main me.y 250
  hadd RedTower.main me.dir D
  hadd RedTower.main me.hp 100
  hadd RedTower.main me.mag 10
  hadd RedTower.main me.gold 0
  hadd RedTower.main me.wlk na
  hadd RedTower.main me.wep shortsword
  hadd RedTower.main Stage Title
  hadd RedTower.menu Menu 300 8 Hide Inventory
  hadd RedTower.main HUD 5 5
  Hadd Redtower.main Load 0
  Entity Add AOBJ enem 200 200 0 1 D 30000 sword
  Entity Add AOBJ enem 200 200 0 1 U 30000 sword
  Entity Add AOBJ enem 200 200 0 1 L 30000 sword
  Entity Add AOBJ enem 200 200 0 1 R 30000 sword
  Msgbox -t100 This is the testers' playground where many things can be tested to make sure they work. You can do whatever you want in this space.
  %texpos = 500 | %pl = 0
  titlebar @RedTower
  window -c @Loading
  window -a @RedTower
  RedTower.Loop
}
alias Entity {
  if ($1 == Add) && ($0 >= 5) {
    if ($2 == OBJ) Aline 1 @RedTower.Entity OBJ $3-6 $iif("*" iswm $7-, $7-, $qt($3))
    elseif ($2 == AOBJ) aline 1 @RedTower.Entity AOBJ  $3-9 $iif("*" iswm $10-, $10-, $qt($3))
  }
}
alias customLoad {
  if ($0 >= 2)  && ($window(@RedTower)) {
    if ($3 == Refresh) var %ref $$4
    if ($3 == Clear) drawrect -frn @RedTower $$4 1 $1 $2 16 43
    drawcopy -tn @Redtower.b1 16711935 $calc(40 + ($hget(Redtower.main,Load) * 34)) 335 34 60 @RedTower $1 $2
    hadd RedTower.main Load $iif($calc($hget(Redtower.main,Load) + 1) <= 7, $v1, 0) if ($gettok($hget(RedTower.main,Load),2,32) == Show, $v1, )
    if (%ref) .timer -m 1 %ref customLoad $1-
} }
alias customTex {
  if ($0 >= 6) && ($window($1)) && ($window($2)) {
    if ($3 == 1) {
      var %i 1
      while (%i <= $len($6-)) {
        if ($mid($6-,%i,1) isalpha) {
          var %l $calc($asc($upper($mid($6-,%i,1))) - 64)
          drawcopy -nt $1 16711935 $calc((%l - 1) * 38) 0 38 40 $2 $calc($4 + ((%i - 1) * 38)) $5
        }
        inc %i
      }
    }
  }
  else {
    echo $color(info) -em * /customTex: insufficient parameters
  }
}
alias MsgBox {
  if ($1 != hide) && ($2-) {
    if (-t* iswm $1) hadd RedTower.main msghide $remove($1,-t)
    hadd RedTower.main msgbox show $iif(-t* iswm $1, $2-, $1-)
  }
  else {
    tokenize 32 $2-
    hdel RedTower.main msgbox
  }
}
alias HPBar {
  if ($0 >= 5) && ($4 <= $5) && ($4 >= 0) {
    drawrect -frn $1 16777215 1 $2 $3 42 6
    drawrect -rnf $1 $iif($4 != $5, $iif($calc($4 / $5) >= .5, $rgb($calc(255 / ($4 / $5)),255,0), $rgb(255,$calc(255 * ($4 / $5)),0)), $rgb(0,255,0)) 1 $calc($2 + 1) $calc($3 + 1) $calc(40 * ($4 / $5)) 4
    drawrect -rn $1 0 1 $2 $3 42 6
} }
alias -l RedTower.Loop {
  if ($window(@RedTower)) && ($hget(RedTower.main)) {
    hadd Redtower.main Ticks $ticks
    if ($hget(RedTower.main,Stage) == Title) {
      drawcopy -n @RedTower.b2 0 0 600 600 @RedTower -50 -50
      CustomTex @RedTower.fnt @RedTower 1 %texpos $calc(100+20* $sin($calc(%texpos / 20))) The Red Tower Created by Type Studios
      CustomTex @RedTower.fnt @RedTower 1 155 300 Start
      CustomTex @RedTower.fnt @RedTower 1 117 350 Credits
      CustomTex @RedTower.fnt @RedTower 1 117 400 Options
      CustomTex @RedTower.fnt @RedTower 1 174 450 Exit
      drawcopy -nt @RedTower.b1 16711935 $calc(200 + (%pl * 36)) 0 32 38 @RedTower 234 231
      if (%texpos <= -1500) %texpos = 500
      dec %texpos 6
      inc %pl | if (%pl > 3) %pl = 0
      if ($inrect($mouse.x,$mouse.y,150,295,200,50)) drawrect -nr @RedTower 39423 2 150 295 200 50
      if ($inrect($mouse.x,$mouse.y,112,345,275,50)) drawrect -nr @RedTower 39423 2 112 345 275 50
      if ($inrect($mouse.x,$mouse.y,112,395,275,50)) drawrect -nr @RedTower 39423 2 112 395 275 50
      if ($inrect($mouse.x,$mouse.y,169,445,161,50)) drawrect -nr @RedTower 39423 2 169 445 161 50
    }
    elseif ($hget(RedTower.main,Stage) == Credits) {
      drawfill -nr @RedTower 0 1 0 0
      drawpic -nc @RedTower 100 20 $+(",$scriptdir,images\,Red Tower.png,")
      drawrect -rn @RedTower 13209 1 100 20 300 200
      drawtext -onr @RedTower 1710643 verdana 10 7 7 Back
      drawtext -onr @RedTower 13209 verdana 10 5 5 Back
      drawtext -onr @RedTower 1710643 verdana 20 87 232 Developed by Type Studios
      drawtext -onr @RedTower 13209 verdana 20 85 230 Developed by Type Studios
      var %Cred  Lead Design and Development :Foshizzle: Assistant Development :Chimpanzee:Sophie:TennisMan:Srankie:SoulKeeper:Bazeballl: Testing:Rozza:Jabadahut:Many Others!:Graphics:Logo designed by Foshizzle:www.Spriters-Resource.com:JJT Games:Many Games!:Foshizzle:���::
      var %bgc $iif($hget(RedTower.main,CredScroll) >= 100, 1710643, $iif($hget(RedTower.main,CredScroll) >= 80, 1381673, $iif($hget(RedTower.main,CredScroll) >= 60, 1052703, $iif($hget(RedTower.main,CredScroll) >= 40, 723733, $iif($hget(RedTower.main,CredScroll) >= 20, 394763, 0)))))
      var %fgc $iif($hget(RedTower.main,CredScroll) >= 100, 13209, $iif($hget(RedTower.main,CredScroll) >= 80, 10619, $iif($hget(RedTower.main,CredScroll) >= 60, 8028, $iif($hget(RedTower.main,CredScroll) >= 40, 5438, $iif($hget(RedTower.main,CredScroll) >= 20, 2847, 0)))))
      drawtext -onpr @RedTower %bgc verdana 20 $calc(252 - ($width($gettok(%Cred,$hget(RedTower.main,CredPos),58),verdana,20,1,1) / 2)) $calc(262 + $hget(RedTower.main,CredScroll)) $gettok(%cred,$hget(RedTower.main,CredPos),58)
      drawtext -onpr @RedTower %fgc verdana 20 $calc(250 - ($width($gettok(%Cred,$hget(RedTower.main,CredPos),58),verdana,20,1,1) / 2)) $calc(260 + $hget(RedTower.main,CredScroll)) $gettok(%cred,$hget(RedTower.main,CredPos),58)
      if ($calc($hget(RedTower.main,CredScroll) - 2) < 0) hadd RedTower.main CredPos $iif($calc($hget(RedTower.main,CredPos) + 1) <= $gettok(%Cred,0,58), $v1, 1)
      hadd RedTower.main CredScroll $iif($calc($hget(RedTower.main,CredScroll) - 2) >= 0, $v1,  350)
    }
    elseif ($hget(RedTower.main,Stage) == Options) {
      drawfill -nr @RedTower 0 1 0 0 
      drawtext -onr @RedTower 1710643 verdana 50 137 12 Options
      drawtext -onr @RedTower 13209 verdana 50 135 10 Options
      hadd RedTower.main OptionScroll $iif($calc($hget(RedTower.main,OptionScroll) + 1) <= -5, $v1, -255)
      var %x 0 | while (%x <= 510) { drawscroll -n @RedTower 0 $calc(10 * $sin($calc(%x /10))) $calc(%x + $hget(RedTower.main,OptionScroll) + 140) 0 1 100 | inc %x } 
      drawtext -onr @RedTower 1710643 verdana 10 7 7 Back
      drawtext -onr @RedTower 13209 verdana 10 5 5 Back
    }
    else {
      ;Main Game
      ;;Setting up general data
      if ($hget(RedTower.main,stage) == 1) { var %lvl Dark Forest }
      if (!$window(@RedTower.b)) window -pkCfBh +d @RedTower.b -1 -1 500 500
      clear -n @RedTower.b
      drawfill -nr @RedTower.b 16777214 1 0 0
      drawfill -nr @RedTower 0 1 0 0
      if (!$hget(RedTower.main,Map)) hadd RedTower.main Map $read($+(",$scriptdir,maps\,%lvl,.dat,"),3)
      drawcopy -n @RedTower.b2 50 50 500 500 @RedTower 0 0
      ;;Entities
      var %entity 1
      while (%entity <= $line(@RedTower.entity,0)) {        
        tokenize 32 $line(@RedTower.entity,%entity)   
        if ($1 == AOBJ) {
          if ($2 == Enem) {
            drawcopy -nt @RedTower.b4 16711935 $iif($6 == 0, 0, $iif($6 == 1, 24, 48)) $iif($7 == U, 0, $iif($7 == R, 31, $iif($7 == D, 63, 95))) 24 30 @RedTower $calc($3 - 12) $calc($4 - 16)
            drawrect -frn @RedTower.b 16515072 1 $calc($3 - 12) $calc($4 - 16) 24 32
          }
        }
        if ($inrect($hget(RedTower.main,me.x),$hget(RedTower.main,me.y),$calc($3 - 20),$calc($4 - 20),32,32)) {
          if ($hget(RedTower.main,me.x) < $3) && ($hget(RedTower.main,me.dir) == R) hadd RedTower.main Keys $remtok($hget(RedTower.main,Keys),39,32)
          if ($hget(RedTower.main,me.y) < $4) && ($hget(RedTower.main,me.dir) == U) hadd RedTower.main Keys $remtok($hget(RedTower.main,Keys),38,32)
          if ($hget(RedTower.main,me.x) > $calc($3 + 16)) && ($hget(RedTower.main,me.dir) == L) hadd RedTower.main Keys $remtok($hget(RedTower.main,Keys),37,32)
          if ($hget(RedTower.main,me.y) > $calc($4 + 16)) && ($hget(RedTower.main,me.dir) == D) hadd RedTower.main Keys $remtok($hget(RedTower.main,Keys),40,32)
          if ($hget(RedTower.main,ShowInfo)) {
            hadd RedTower.menu Info $1 $2 $3 $5 $6 %entity
          }
          else hdel RedTower.menu Info
        }
        inc %entity
      }
      if ($istok($hget(RedTower.main,Keys),37,32)) {
        if ($hget(RedTower.main,me.dir) == L) hdec RedTower.main me.x 3
        else hadd RedTower.main me.dir L
      }
      elseif ($istok($hget(RedTower.main,Keys),38,32)) {
        if ($hget(RedTower.main,me.dir) == U) hdec RedTower.main me.y 3
        else hadd RedTower.main me.dir U
      }
      elseif ($istok($hget(RedTower.main,Keys),39,32)) {
        if ($hget(RedTower.main,me.dir) == R) hinc RedTower.main me.x 3
        else hadd RedTower.main me.dir R
      }
      elseif ($istok($hget(RedTower.main,Keys),40,32)) {
        if ($hget(RedTower.main,me.dir) == D) hinc RedTower.main me.y 3
        else hadd RedTower.main me.dir D
      }
      drawrect -nrf @RedTower.b 255 1 $calc($hget(RedTower.main,me.x) - 9) $calc($hget(RedTower.main,me.y) - 12) 18 24
      if ($hget(RedTower.main,me.wlk) isnum 0-7) {
        drawcopy -nt @RedTower.b1 16711935 $calc($replace($hget(RedTower.main,me.dir),D,215,U,200,L,218,R,217) + ($hget(RedTower.main,me.wlk) * $replace($hget(RedTower.main,me.dir),D,21,U,22,L,24,R,24))) $&
          $replace($hget(RedTower.main,me.dir),D,105,U,160,L,213,R,269) 18 24 @RedTower $calc($hget(RedTower.main,me.x) - 9) $calc($hget(RedTower.main,me.y) - 12)
        hadd RedTower.main me.wlk $iif($hget(RedTower.main,me.wlk) >= $replace($hget(RedTower.main,me.dir),D,6,U,7,L,5,R,5), 0, $calc($hget(RedTower.main,me.wlk) + 1))
      }   
      else {
        if ($hget(RedTower.main,me.dir) == D) drawcopy -nt @RedTower.b1 16711935 257 50 18 24 @RedTower $calc($hget(RedTower.main,me.x) - 9) $calc($hget(RedTower.main,me.y) - 12)
        elseif ($hget(RedTower.main,me.dir) == U) drawcopy -nt @RedTower.b1 16711935 295 50 18 24 @RedTower $calc($hget(RedTower.main,me.x) - 9) $calc($hget(RedTower.main,me.y) - 12)
        elseif ($hget(RedTower.main,me.dir) == L) drawcopy -nt @RedTower.b1 16711935 275 50 18 24 @RedTower $calc($hget(RedTower.main,me.x) - 9) $calc($hget(RedTower.main,me.y) - 12)
        elseif ($hget(RedTower.main,me.dir) == R) drawcopy -nt @RedTower.b1 16711935 314 50 18 24 @RedTower $calc($hget(RedTower.main,me.x) - 9) $calc($hget(RedTower.main,me.y) - 12)
      }
      if ($hget(RedTower.main,me.atk) == True) {
        drawcopy -nt @RedTower.b1 16711935 $replace($hget(RedTower.main,me.dir),D,244,U,284,L,262,R,303) 299 19 23 @RedTower $&
          $calc($hget(RedTower.main,me.x) - $iif($hget(RedTower.main,me.dir) == L || $hget(RedTower.main,me.dir) == D, 11, 9)) $calc($hget(RedTower.main,me.y) - $iif(4 // $hget(Redtower.main,me.wlk), 12, 11))
        if (3 // $ticks) hadd RedTower.main Hit $r(0,10) $hget(RedTower.main,me.x) $hget(RedTower.main,me.y) me 5
      } 
      ;;AI
      var %l 1 | while (%l <= $line(@RedTower.entity,0)) {
        tokenize 32 $line(@RedTower.entity,%l)
        if ($1 == AOBJ) && ($2 == Enem) {
          if ($inrect($mouse.x,$Mouse.y,$calc($3 - 12),$calc($4 - 16),24,32)) HPBar @RedTower $3 $calc($4 - 24) $8 30000
          var %b $r(1,4) | if (%b == 1) var %dir R | elseif (%b == 2) var %dir D | elseif (%b == 3) var %dir U | elseif (%b == 4) var %dir L
          if ($3 < 16) && ($7 == L) rline 1 @RedTower.entity %l $1-4 1 1 %dir $8-
          elseif ($4 < 16) && ($7 == U) rline 1 @RedTower.entity %l $1-4 1 1 %dir $8- 
          elseif ($3 > 484) && ($7 == R) rline 1 @RedTower.entity %l $1-4 1 1 %dir $8- 
          elseif ($4 > 484) && ($7 == D) rline 1 @RedTower.entity %l $1-4 1 1 %dir $8-
          tokenize 32 $line(@RedTower.entity,%l)
          if ($5 <= 30) && ($7 == D) rline 1 @RedTower.entity %l $1-2 $3 $calc($4 + 2) $calc($5 + 1) $iif($calc($6 + 1) <= 2, $v1, 0) $7 $8- 
          elseif ($5 <= 30) && ($7 == R) rline 1 @RedTower.entity %l $1-2 $calc($3 + 2) $4 $calc($5 + 1) $iif($calc($6 + 1) <= 2, $v1, 0) $7 $8- 
          elseif ($5 <= 30) && ($7 == U) rline 1 @RedTower.entity %l $1-2 $3 $calc($4 - 2) $calc($5 + 1) $iif($calc($6 + 1) <= 2, $v1, 0) $7 $8- 
          elseif ($5 <= 30) && ($7 == L) rline 1 @RedTower.entity %l $1-2 $calc($3 - 2) $4 $calc($5 + 1) $iif($calc($6 + 1) <= 2, $v1, 0) $7 $8- 
          elseif ($5 > 30) { var %g $r(1,4) | if (%g == 1) var %dir R | elseif (%g == 2) var %dir D | elseif (%g == 3) var %dir U | elseif (%g == 4) var %dir L | rline 1 @RedTower.entity %l $1-4 0 1 %dir $8 }
          if ($abs($calc($3 - $hget(Redtower.main,me.x))) <= 100) && ($abs($calc($4 - $hget(Redtower.main,me.y))) <= 100) { 
            if ($10 != atk) rline @RedTower.entity %l $1-9 atk 
            if (2 // $ticks) { 
              if  ($4 < $hget(Redtower.main,me.y)) rline @Redtower.entity %l $1-6 D $8-
            }
          }
          if ($abs($calc(($hget(RedTower.main,me.x) -9) - ($3 -16))) <= 16) && ($abs($calc(($hget(RedTower.main,me.y) -12) - ($4 -16))) <= 16) && ($hget(Redtower.main,Hit)) {
            HpBar @RedTower $3 $calc($4 - 24) $8 30000
            rline @RedTower.entity %l $1-7 $calc($8 - $gettok($hget(Redtower.main,hit),3,32)) $9-
            if ($8 <= 0) { 
              dline @RedTower.entity %l
              .timer -m 1 1000 aline 1 @RedTower.entity $1-2 $r(100,400) $r(100,400) 0 1 $7 30000 $9-
              var %b 0 | while (%b <= 3) { drawdot -rin @RedTower $r(0,16777215) 20 $3 $4 | inc %b }
            }
          }
        }
        inc %l
      }
      tokenize 32 $hget(RedTower.menu,Menu)
      if ($3 == show) {
        drawtext -nro @RedTower $iif($4 == Inventory, 45820, 1979166) verdana 12 $calc($1 + 20) $calc($2 + 152) Inventory
        drawtext -nro @RedTower $iif($4 == Equipment, 45820, 1979166) verdana 12 $calc($1 + 20) $calc($2 + 167) Equipment
        drawtext -nro @RedTower $iif($4 == Quests, 45820, 1979166) verdana 12 $calc($1 + 120) $calc($2 + 152) Quests
        drawtext -nro @RedTower $iif($4 == Magicks, 45820, 1979166) verdana 12 $calc($1 + 120) $calc($2 + 167) Magicks
        drawcopy -nt @RedTower.b1 16711935 0 0 192 210 @RedTower $1 $2
      }
      if ($hget(RedTower.main,me.hp) > 100) hadd RedTower.main me.hp 100
      drawcopy -nt @RedTower.b1 16711935 0 215 176 80 @RedTower $gettok($hget(RedTower.main,HUD),1-2,32)
      drawtext -nrio @RedTower 1644860 verdana 12 $calc($gettok($hget(RedTower.main,HUD),1,32) + 20) $calc($gettok($hget(RedTower.main,HUD),2,32) + 12) HP: $hget(RedTower.main,me.hp)
      drawtext -nrio @RedTower $iif($hget(RedTower.main,me.hp) <= 20, 220, 45820) verdana 12 $calc($gettok($hget(RedTower.main,HUD),1,32) + 20) $&
        $calc($gettok($hget(RedTower.main,HUD),2,32) + 10) HP: $hget(RedTower.main,me.hp)
      drawtext -nrio @RedTower 1644860 verdana 12 $calc($gettok($hget(RedTower.main,HUD),1,32) + 20) $calc($gettok($hget(RedTower.main,HUD),2,32) + 26) Magicka: $hget(RedTower.main,me.mag)
      drawtext -nrio @RedTower 45820 verdana 12 $calc($gettok($hget(RedTower.main,HUD),1,32) + 20) $calc($gettok($hget(RedTower.main,HUD),2,32) + 24) Magicka: $hget(RedTower.main,me.mag)
      drawtext -nrio @RedTower 1644860 verdana 12 $calc($gettok($hget(RedTower.main,HUD),1,32) + 20) $calc($gettok($hget(RedTower.main,HUD),2,32) + 40) Gold: $hget(RedTower.main,me.gold)
      drawtext -nrio @RedTower 45820 verdana 12 $calc($gettok($hget(RedTower.main,HUD),1,32) + 20) $calc($gettok($hget(RedTower.main,HUD),2,32) + 38) Gold: $hget(RedTower.main,me.gold)
      drawtext -nrio @RedTower 1644860 verdana 12 $calc($gettok($hget(RedTower.main,HUD),1,32) + 20) $calc($gettok($hget(RedTower.main,HUD),2,32) + 54) Weapon: $hget(RedTower.main,me.wep)
      drawtext -nrio @RedTower 45820 verdana 12 $calc($gettok($hget(RedTower.main,HUD),1,32) + 20) $calc($gettok($hget(RedTower.main,HUD),2,32) + 52) Weapon: $hget(RedTower.main,me.wep)
      if (show* iswm $hget(RedTower.main,msgbox)) { 
        if ($hget(RedTower.main,msghide)) hdec RedTower.main msghide
        if ($hget(RedTower.main,msghide) <= 0) { 
          hdel RedTower.main msgbox 
          hdel RedTower.main msghide
        }
        else {
          drawcopy -nt @RedTower.b3 16711935 0 100 500 100 @RedTower 0 420
          var %l 1
          while (%l <= $wrap($gettok($hget(RedTower.main,msgbox),2-,32),tahoma,12,400,0)) {
            if (%l <= 4) {
              drawtext -onr @RedTower 10274785 tahoma 12 40 $calc(425 + (%l * 15)) $wrap($gettok($hget(RedTower.main,msgbox),2-,32),tahoma,12,400,%l)
              drawtext -onr @RedTower 3355596 tahoma 12 40 $calc(423 + (%l * 15)) $wrap($gettok($hget(RedTower.main,msgbox),2-,32),tahoma,12,400,%l)
            }             
            inc %l
          }
        }
      }
      if ($hget(RedTower.main,Hit)) {
        tokenize 32 $v1
        drawtext -onr @RedTower $iif($1 > 0, 255, 16515072) verdana 12 $calc($2 + 5) $calc($3 - 25) $1
        $iif($5 > 1, hadd RedTower.main Hit $1-4 $calc($5 - 1), hdel RedTower.main hit)
      }
    }
    if ($window(@RedTower.b)) drawdot @RedTower.b
    if ($gettok($hget(RedTower.main,Load),2,32) == Show) CustomLoad 10 240 Refresh 40
    drawdot @RedTower 
    titlebar @RedTower - FPS: $iif($ceil($calc(1000 / ($ticks - $hget(RedTower.main,Ticks)))) < 10, $iif($v1 == 0, 100% Efficient, 0 $+ $v1), $v1)
    .timerRedTower -moh 1 10 RedTower.Loop
  } 
}
on *:KEYDOWN:@RedTower:*: {
  if ($keyval isnum 37-40) && ($hget(RedTower.main,me.wlk) == na) hadd RedTower.main me.wlk 0
  if ($keyval == 17) {
    if ($gettok($hget(RedTower.menu,Menu),3,32) == show) hadd RedTower.menu Menu $gettok($hget(RedTower.menu,Menu),1-2,32) Hide $gettok($hget(RedTower.menu,Menu),4,32) 
    else hadd RedTower.menu Menu $gettok($hget(RedTower.menu,Menu),1-2,32) Show $gettok($hget(RedTower.menu,Menu),4,32)  
  }
  if ($keyval == 32) hadd RedTower.main me.atk true
  if ($keyval == 8) hadd RedTower.main stage Title | %texpos = 500 | %pl = 0
  if ($keyval == 192) && ($gettok($hget(RedTower.menu,Menu),3,32) == show) { if ($gettok($hget(RedTower.menu,Menu),4,32) == Inventory) var %sp Equipment | elseif ($v1 == Equipment) var %sp Quests
  elseif ($v1 == Quests) var %sp Magicks | elseif ($v1 == Magicks) var %sp Inventory | hadd RedTower.menu Menu $gettok($hget(RedTower.menu,Menu),1-3,32) %sp }
  hadd RedTower.main Keys $addtok($hget(RedTower.main,Keys),$keyval,32)
}
on *:KEYUP:@RedTower:*: {
  if ($keyval isnum 37-40) && ($hget(RedTower.main,me.wlk) isnum) hadd RedTower.main me.wlk na
  if ($keyval == 32) hdel RedTower.main me.atk
  hadd RedTower.main Keys $remtok($hget(RedTower.main,Keys),$keyval,32)
}
menu @RedTower {
  uclick: {
    if ($inrect($mouse.x,$mouse.y,150,295,200,50)) && ($hget(RedTower.main,Stage) == Title) {
      hadd RedTower.main Stage 1
      drawpic -cls @RedTower.b2 0 0 600 600 $+(",$scriptdir,images\,grass.png,")
    }
    if ($inrect($mouse.x,$mouse.y,112,345,275,50)) && ($hget(RedTower.main,Stage) == Title) {
      hadd RedTower.main CredScroll 350
      hadd RedTower.main CredPos 1
      hadd RedTower.main Stage Credits
    }
    if ($inrect($mouse.x,$mouse.y,112,395,275,50)) && ($hget(RedTower.main,Stage) == Title) {
      hadd RedTower.main OptionScroll -255
      hadd RedTower.main Stage Options
    }
    if ($inrect($mouse.x,$mouse.y,169,445,161,50)) && ($hget(RedTower.main,Stage) == Title) {
      window -c @RedTower
      window -c @RedTower.b
      window -c @RedTower.b1
      window -c @RedTower.b2
      window -c @RedTower.b3
      window -c @RedTower.b4
      window -c @RedTower.fnt
      window -c @RedTower.Entity
      if ($window(@RedTower.tip)) windoow -c @RedTower.tip
      hfree -w RedTower.*
      halt
    }
    if ($inrect($mouse.x,$mouse.y,0,0,32,20)) && ($hget(RedTower.main,Stage) == Credits) {
      hadd RedTower.main Stage Title
    }
  }
}
on *:CLOSE:@RedTower: {
  window -c @RedTower.b
  window -c @RedTower.b1
  window -c @RedTower.b2
  window -c @RedTower.b3
  window -c @RedTower.b4
  window -c @RedTower.fnt
  window -c @RedTower.Entity
  if ($window(@RedTower.tip)) windoow -c @RedTower.tip
  hfree -w RedTower.*
  halt
}
on *:LOAD: {
  ;;File Unpacker here
  echo $color(info) -m The Red Tower Sucsessfully Loaded! Type /RedTower to Run
}
