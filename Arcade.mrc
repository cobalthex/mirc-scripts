;;;;;;;;;;
;The Arcade - By Foshizzle
;Version 0.2 Beta
;To Run: type /Arcade or right click anywhere in mIRC and click The Arcade
;;;;;;;;;;

alias TC var %d (100 / $$7) | return $rgb($iif($calc(($1 / %d) + ($4 / %d)) <= 255, $ceil($v1), 255) $+ , $+ $iif($calc(($2 / %d) + ($5 / %d)) <= 255, $ceil($v1), 255) $+ , $+ $iif($calc(($3 / %d) + ($6 / %d)) <= 255, $ceil($v1), 255))
alias -l AC { if ($1 == bg) return 4597790 | elseif ($1 == fr) return 6569030 | elseif ($1 == li) return 8542820 | elseif ($1 == tx) return 11832470 }
alias Arcade {
  ;Create Game Table
  hfree -w Arcade
  hmake Arcade 100
  hadd Arcade Page Menu
  hadd Arcade 3dcube 0
  window -pkw0odCfB +nd @Arcade -1 -1 640 510 $mircexe 18
  window -kh @A.Gm
  if ($isfile(Arcade.dat)) { var %i 1 | while (%I <= $lines(Arcade.dat)) {
      aline 1 @A.Gm $read(Arcade.dat,%i) $replace($read(Arcade.dat,%i),_,$chr(32))
      inc %i
  } }
  drawrect -ir @Arcade 0 1 0 0 640 510
  drawtext -ir @Arcade 0 arial 30 10 5 Loading 
  Arcade.Menu
}
alias -l Arcade.DrawFrame {
  if ($1 != na) drawdot -nr @Arcade $AC(bg) 500 320 270
  drawrect -nr @Arcade $AC(fr) 1 0 0 640 510
  drawrect -nrf @Arcade $AC(bg) 1 0 0 640 30
  drawline -nr @Arcade $AC(fr) 1 0 30 640 30
  drawrect -nr @Arcade $AC(li) 1 611 2 27 27
  drawrect -nr @Arcade $AC(li) 1 583 2 27 27
  drawline -nr @Arcade $AC(li) 2 618 9 630 21
  drawline -nr @Arcade $AC(li) 2 630 9 618 21
  drawline -nr @Arcade $AC(li) 1 586 25 605 25 605 24 585 24
  drawtext -nr @Arcade $AC(tx) Verdana 24 6 1 ARCADE - $replace($hget(Arcade,Page),_,$chr(32))
}
alias -l Arcade.Clear {
  drawdot -nr @Arcade $AC(bg) 850 0 0
  drawrect -nr @Arcade $AC(fr) 1 0 0 640 510
}
alias -l Arcade.DrawButton {
  if (!$window(@Arcade)) halt
  if ($inrect($mouse.x,$mouse.y,$1,$2,$3,$4)) drawrect -frn @Arcade $AC(fr) 1 $1-4
  else drawrect -frn @Arcade $AC(bg) 1 $1-4
  drawrect -rn @Arcade $AC(li) 1 $1-4
  drawtext -nr @Arcade $AC(tx) verdana 12 $calc($1 + (($3 / 2) - ($width($gettok($5-,1,34),verdana,12) / 2))) $calc($2 + (($4 / 2) - ($height($gettok($5-,1,34),verdana,12) / 2))) $gettok($5-,1,34)
  if ($inrect($mouse.x,$mouse.y,$1,$2,$3,$4) && ($mouse.key & 1)) {
    if (EXIT isin $gettok($5-,2,34)) Arcade.End 
    if (MENU isin $gettok($5-,2,34)) { hadd Arcade Page Menu | Arcade.Menu }
    if (INIT isin $gettok($5-,2,34)) arcade.InitGame $gettok($5-,2,39) 
    if (OK isin $gettok($5-,2,34)) { hdel Arcade Input | $iif($gettok($5-,3,34), $v1, ) }
    if (CANCEL isin $gettok($5-,2,34)) { hdel Arcade Input | $iif($gettok($5-,3,34), $v1, ) }
    if (CREDITS isin $gettok($5-,2,34)) hadd Arcade Input O;Credits; Arcade Created by Foshizzle. $crlf Credit to all the other game designers. $crlf � Copyright PicWin Studios 2008
  }
}
alias -l Arcade.Input {
  if (!$window(@Arcade)) halt
  var %l $wrap($gettok($1-,3,59),verdana,12,290,1,0) 
  drawrect -nrf @Arcade $AC(bg) 1 170 205 300 $calc(55 + (%l * 15)) 
  drawrect -nr @Arcade $AC(fr) 1 170 205 300 $calc(55 + (%l * 15)) 
  if (O isin $gettok($1,1,59)) Arcade.DrawButton $calc(295 - (($len($gettok($1,1,59)) - 1) * 25)) $calc(240 + (%l * 15))  50 16 $iif(Y isin $v2, "Yes", "OK") OK $eval($gettok($1-,4,59),2)
  if (C isin $gettok($1-,1,59)) Arcade.DrawButton $calc(297 + (($len($gettok($1,1,59)) - 1) * 25)) $calc(240 + (%l * 15))  50 16 $iif(Y isin $v2, "No", "Cancel") CANCEL $eval($gettok($1-,5,59),2)
  drawtext -nr @Arcade $AC(tx) Arial 16 $calc(320 - ($width($gettok($1-,2,59),Arial,16) / 2)) 208 $gettok($1-,2,59)
  var %i 1 | while (%i <= %l) { var %t $wrap($gettok($1-,3,59),verdana,12,290,1,%i)
  drawtext -nr @Arcade $ac(tx) verdana 12 $calc(320 - ($width(%t,verdana,12) / 2)) $calc(216 + (%i * 15)) %t | inc %i }
}
alias -l Arcade.ProgBar {
  if (!$window(@Arcade)) halt
  drawrect -nrf @Arcade $AC(bg) 1 $1-4
  drawrect -nrf @Arcade $AC(fr) 1 $calc($1 + 1) $calc($2 + 1) $calc(($3 - 2) * ($5 / 100)) $calc($4 - 2) 
  drawrect -nr @Arcade $AC(li) 1 $1-4
  if ($gettok($1-,2,34)) drawtext -nr @Arcade $AC(tx) verdana 10 $calc($1 + (($3 / 2) - ($width($gettok($1-,2,34),verdana,10) / 2))) $calc($2 + (($4 / 2) - 7)) $gettok($1-,2,34)
}
alias -l Arcade.Tip {
  if (!$window(@Arcade)) halt
  var %h $calc(30 + ($wrap($4-,verdana,10,190,1,0) * 13))
  drawrect -nrf @Arcade $AC(bg) 1 $1-2 200 %h
  if ($inrect($mouse.x,$mouse.y,$calc($1 + 180),$2,20,20)) drawrect -nrf @Arcade $AC(li) 1 $calc($1 + 180) $2 20 20
  drawrect -nr @Arcade $AC(fr) 1 $1-2 200 %h
  drawline -nr @Arcade $ac(fr) 1 $calc($1 + 180) $2 $calc($1 + 180) $calc($2 + 20) $calc($1 + 200) $calc($2 + 20)
  drawdot -nr @Arcade $ac(tx) 4 $calc($1 + 191) $calc($2 + 12)
  drawtext -nr @Arcade $ac(tx) arial 14 $calc($1 + (100 - ($width($3,arial,14) / 2))) $calc($2 + 5) $3
  var %i 1 | while (%i <= $wrap($4-,verdana,10,190,1,0)) { var %m $wrap($4-,verdana,10,190,1,%i)
  drawtext -nr @Arcade $ac(tx) verdana 10 $calc(($1 + 100) - ($width(%m,verdana,10) / 2)) $calc($2 + (14 + (%i * 13))) %m | inc %i }
  if ($inrect($mouse.x,$mouse.y,$calc($1 + 180),$2,20,20)) && ($mouse.key & 1) hdel Arcade Tip
}
alias Arcade.Download {
  if (!$1) halt
  .sockclose ArcadeDL
  sockopen ArcadeDL picwin-studios.vndv.com 80
  sockmark ArcadeDL $1-
}
on *:SOCKOPEN:ArcadeDL: {
  sockwrite -n $sockname GET /Arcade/ $+ $sock(Arcade).mark HTTP/1.1
  sockwrite -n $sockname Host: www.picwin-studios.vndv.com
  sockwrite -n $sockname $crlf
}
on *:SOCKREAD:ArcadeDL: {
  if ($sockerr) halt
  sockread &Arcade-DL
  if ($exists($sock(Arcade).mark)) .remove $sock(Arcade).mark
  bwrite $sock(Arcade).mark -1 -1 ; $+ $gettok($bvar(&Arcade-DL,1-).text,2,59)
}
on *:CLOSE:@Arcade: Arcade.End
alias -l Arcade.End {
  if ($window(@Arcade)) window -c @Arcade 
  window -c @A.Gm
  hfree Arcade
}
alias -l Arcade.Menu {
  if ($window(@Arcade)) && ($hget(Arcade,Page) == Menu) {
    var %t $ticks
    Arcade.Clear
    3dcube $hget(Arcade,3dcube) $hget(Arcade,3dcube) $hget(Arcade,3dcube)
    Arcade.DrawButton 10 40 100 20 "Options" NULL
    Arcade.DrawButton 10 70 100 20 "Credits" CREDITS
    Arcade.DrawButton 10 100 100 20 "Exit" EXIT 
    var %c 1 | while (%c <= $line(@A.Gm,0)) {
      Arcade.DrawButton 530 40 100 20 " $+ $gettok($line(@A.Gm,%c),2-,32) $+ " INIT ' $+ $gettok($line(@A.Gm,%c),1,32) $+ '
      inc %c
    }
    if ($hget(Arcade,Input)) Arcade.Input $hget(Arcade,Input)
    if ($window(@Arcade)) drawtext -nr @Arcade $AC(tx) verdana 8 2 500 FPS: $iif($ceil($calc(1000 / ($ticks - %t))) == 0, 100%, $v1)
    if ($window(@Arcade)) Arcade.DrawFrame na
    if ($window(@Arcade)) drawdot @Arcade
    .timer -ho 1 10 Arcade.Menu
} }
alias -l Arcade.InitGame {
  hadd Arcade Page $1
  $1-
}
alias -l Arcade.Load {
  if (!$1) halt
  if ($isfile(Arcade.dat)) {
    var %e 1 | while (%e <= $lines(Arcade.dat)) { 
      if ($read(Arcade.dat,%e) == $1) halt
      else return
      inc %e
    }
    write Arcade.dat $1
  }
  else write Arcade.dat $1
}
alias -l 3dcube {
  var %v1 100 100 100, %v2 100 100 -100, %v3 100 -100 -100, %v4 100 -100 100, %v5 -100 100 100, %v6 -100 100 -100, %v7 -100 -100 -100, %v8 -100 -100 100
  var %d 500, %xrot $1, %yrot $2, %zrot $$3
  var %i 1 | while (%i <= 8) { tokenize 32 %v [ $+ [ %i ] ]
    var %vt $+ %i $round($calc(320 + (($1 * $cos(%xrot)) * %d / (($3 * $tan(%zrot)) + %d))),0) $round($calc(255 + (($2 * $sin(%yrot)) * %d / (($3 * $tan(%zrot)) + %d))),0)
    ;drawdot -nr @Arcade $iif($ticks & 2, $AC(tx), $AC(li)) 2 %vt [ $+ [ %i ] ]
    var %vt2 $+ %i $round($calc(321 + (($1 * $cos(%xrot)) * %d / (($3 * %zrot) + %d))),0) $round($calc(256 + (($2 * $sin(%yrot)) * %d / (($3 * %zrot) + %d))),0)
    drawdot -nr @Arcade $iif($ticks & 1, $AC(tx), $AC(li)) 2 %vt2 [ $+ [ %i ] ] 
    drawdot -nr @Arcade $iif($ticks & 1, $AC(tx), $AC(li)) 2 %vt2 [ $+ [ %i ] ] 
    drawdot -nr @Arcade $iif($ticks & 1, $AC(tx), $AC(li)) 2 %vt2 [ $+ [ %i ] ] 
    inc %i
  }
  var %c 1 | while (%c <= 8) {
    drawline -nr @Arcade $AC(fr) 1 %vt [ $+ [ %c ] ] %vt [ $+ [ $iif($calc(%c + 1) <= 7, $v1, 1) ] ]
    inc %c
  }
  hadd Arcade 3dcube $iif($calc($hget(Arcade,3dcube) + 1) <= 50, $v1, 0)
}
menu @Arcade {
  sclick: if ($mouse.y <= 30) ArcDrag $mouse.x $mouse.y
  uclick: if ($inrect($mouse.x,$mouse.y,583,2,27,27)) window -n @Arcade | if ($inrect($mouse.x,$mouse.y,611,2,27,27)) Arcade.End
}
alias -l ArcDrag if ($mouse.key & 1) { window @Arcade $calc($mouse.dx - $1) $calc($mouse.dy - $2) | .timer -oh 1 10 ArcDrag $1 $2 }
on *:KEYDOWN:@Arcade:*: {
  hadd Arcade Keys $addtok($hget(Arcade,Keys),$keyval,151)
}
on *:KEYUP:@Arcade:*: { 
  hadd Arcade Keys $remtok($hget(Arcade,Keys),$keyval,151)
}
menu * {
  The Arcade:Arcade
}
;;;;;
;Example Script
;;;;;
on *:LOAD: {
  ;Arcade
  echo 2 -m The Arcade was sucsessfully loaded!
  ;Shoot Em Up
  Arcade.load Shoot_Em_Up
  echo 2 -m Shoot Em Up sucsessfully loaded!
}
alias Shoot_Em_Up {
  if (!$window(@Arcade)) halt
  hfree -w TB
  hmake TB 100
  hadd TB me 320 255
  hadd TB prcnt 0
  hadd TB Target 400 400
  hadd TB Score 0
  hadd TB Bullets 100
  hadd TB Time $ctime
  Shoot_Em_Up.Loop
} 
alias -l Shoot_Em_Up.Loop {
  if ($window(@Arcade)) && ($hget(Arcade,Page) == Shoot_Em_Up) {
    var %ticks $ticks
    Arcade.Clear
    ;;Code
    if ($istok($hget(Arcade,Keys),37,151)) hadd TB me $calc($gettok($hget(TB,me),1,32) - 1) $gettok($hget(TB,me),2,32)
    if ($istok($hget(Arcade,Keys),38,151)) hadd TB me $gettok($hget(TB,me),1,32) $calc($gettok($hget(TB,me),2,32) - 1) 
    if ($istok($hget(Arcade,Keys),39,151)) hadd TB me $calc($gettok($hget(TB,me),1,32) + 1) $gettok($hget(TB,me),2,32)
    if ($istok($hget(Arcade,Keys),40,151)) hadd TB me $gettok($hget(TB,me),1,32) $calc($gettok($hget(TB,me),2,32) + 1)
    var %t 8 | while (%t >= 1) { drawdot -nr @Arcade $iif(%t & 2, 255, 16777215) $calc(%t * 2) $hget(TB,Target) | dec %t }
    if ($getdot(@Arcade,$r($calc($mouse.x - 5),$calc($mouse.x +  5)),$r($calc($mouse.y - 5),$calc($mouse.y +  5))) == 255 || $getdot(@Arcade,$r($calc($mouse.x - 5),$calc($mouse.x +  5)),$r($calc($mouse.y - 5),$calc($mouse.y +  5))) == 16777215) && ($mouse.key & 1) && ($hget(TB,Bullets) > 0) {
    hadd TB Target $r(100,540) $r(100,410) | hinc TB Score 50 | hinc TB Bullets 2 }
    if ($inrect($mouse.x,$mouse.y,1,31,638,478)) {
      drawdot -nir @Arcade 32764 12 $mouse.x $mouse.y | drawdot -inr @Arcade 32764 10 $mouse.x $mouse.y
      drawline -nri @Arcade 32764 1 $calc($mouse.x - 20) $calc($mouse.y - 2) $calc($mouse.x + 18) $calc($mouse.y - 2)
      drawline -nri @Arcade 32764 1 $calc($mouse.x - 2) $calc($mouse.y - 20)  $calc($mouse.x - 2) $calc($mouse.y + 18) 
    }
    drawdot -nr @Arcade 32329 6 $hget(TB,me)
    drawdot -nr @Arcade 32399 2 $calc($gettok($hget(TB,me),1,32) - 2) $calc($gettok($hget(TB,me),2,32) - 2)
    if ($mouse.key & 1) && ($inrect($mouse.x,$mouse.y,0,30,640,480)) && (2 // $ticks) && ($hget(TB,Bullets) > 0) {
      hdec TB Bullets
      var %i 0 | while (%i <= 10) {
        drawline -rn @Arcade $iif($r(0,1) == 0, 65535, 32764) $r(1,5) $mouse.x $mouse.y $r($calc($mouse.x - 40),$calc($mouse.x + 40)) $r($calc($mouse.y - 40),$calc($mouse.y + 40)) 
        inc %i 
      }
    }
    if ($mouse.key & 1) && ($inrect($mouse.x,$mouse.y,70,484,560,16)) hadd Arcade Tip 150 150 Example This is an example tip. It was activated because you pressed the progress bar.
    drawtext -nr @Arcade $AC(tx) arial 30 10 40 Score: $hget(TB,Score)
    drawtext -nr @Arcade $AC(tx) arial 20 10 80 Bullets: $hget(TB,Bullets)
    if ($hget(TB,Bullets) <= 0) {
      if ($hget(TB,Time)) { hadd TB TTime $calc($ctime - $v1) | hdel TB Time }
      Arcade.Clear
      drawtext -nr @Arcade $AC(tx) arial 40 $calc(320 - ($width(Game Over,arial,40) / 2)) 100 Game Over
      Arcade.Input O;Game Over;Click Ok to return to the main menu. $crlf Score: $Hget(TB,Score) $crlf Time: $hget(TB,TTime) Seconds;Arcade.Menu
    }
    ;;
    Arcade.DrawButton 10 484 50 16 "Home" MENU
    if ($hget(Arcade,Tip)) Arcade.Tip $v1
    Arcade.ProgBar 70 484 560 16 $hget(TB,prcnt) " $+ $iif($hget(TB,Bullets) > 0, Shoot Em Up, Game Over) $+ "
    Arcade.DrawFrame na
    drawtext -nr @Arcade $AC(tx) verdana 8 3 32 FPS: $iif($ceil($calc(1000 / ($ticks - %ticks))) == 0, 100%, $v1)
    drawdot @Arcade
    hadd TB prcnt $iif($calc($hget(TB,prcnt) + 1) <= 100, $v1, 0)
    .timer -oh 1 10 Shoot_Em_Up.Loop
  }
}
