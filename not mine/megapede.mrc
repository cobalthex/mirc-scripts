alias ContextMenuDemo window -pkodCfB +nt @CMD -1 -1 800 600 | window -pfhB @p 0 0 99 99 | drawpic @p 0 0 "C:\Users\Matt\Documents\ContextMenu\ContextMenu.png" | %1 = -1 | %2 = 0 | %3 = 0 | cmdl
alias -l cmdl { if (!$window(@CMD)) halt | clear -n @CMD | if (!%3) %3 = $mouse.y | if (%1 > 0) { var %d = drawcopy -n @p | %d 6 0 12 39 @cmd %2 %3
    %d 18 0 1 39 @CMD $calc(%2 + 12) %3 160 39 | %d 19 0 12 39 @CMD $calc(%2 + 172) %3 | %d 7 40 23 1 @CMD $calc(%2 + 1) $calc(%3 + 39) 182 1 | var %= = $calc(%3 + 35 * 4 + 38)
    %d 7 41 11 1 @CMD $calc(%2 + 1) $calc(%3 + 40) 11 $calc(35 * 4 - 2) | %d 18 41 1 1 @CMD $calc(%2 + 12) $calc(%3 + 40) 160 $calc(35 * 4 - 2) | %d 17 44 16 17 @CMD $calc(%2 $&
      + 168) $calc(%= + 1) | %d 19 41 11 1 @CMD $calc(%2 + 172) $calc(%3 + 40) 11 $calc(35 * 4 - 2) | %d 7 42 23 1 @CMD $calc(%2 + 1) %= 182 1 | %d 0 44 16 17 @CMD %2 $&
      $calc(%= + 1) | %d 17 44 1 17 @CMD $calc(%2 + 16) $calc(%= + 1) 152 17 | var %i = 1 | while %i < 4 { %d 0 5 2 2 @CMD $calc(%2 + 3) $calc(%3 + 38 + (%i * 35))
    %d 2 5 1 2 @CMD $calc(%2 + 5) $calc(%3 + 38 + (%i * 35)) 174 2 | %d 3 5 2 2 @CMD $calc(%2 + 179) $calc(%3 + 38 + (%i * 35)) | inc %i } | 
    %` = $int($calc(($mouse.y - (%3 + 39)) / 35)) | if (%` >= 0 && %` < 4) { %d 0 8 2 31 @CMD %2 $calc(%3 + 41 + %` * 35)
    %d 2 8 1 31 @CMD $calc(%2 + 2) $calc(%3 + 41 + %` * 35) 180 31 | %d 3 8 2 31 @CMD $calc(%2 + 182) $calc(%3 + 41 + %` * 35) }
} | drawdot @CMD | .timer -oh 1 0 cmdl }
on *:keydown:@CMD:27: { window -c @CMD | window -c @p } 
menu @CMD {
  sclick: { 
    %2 = $mouse.x | %3 = $mouse.y | %1 = $calc(%1 * -1)
  }
}

on 1:load: {
  echo -a Loaded Megapede v1.01 for mIRC 5.31
  echo -a Written by Hawkee (http://www.hawkee.com)
  echo -a Type /megapede to start.
}
alias megapede {
  mp.init.variables
  ;Settings that change from level to level
  %mp-megapede-length = 4
  %mp-current-level = 1
  %mp-tree-total = 50
  %mp-score = 0
  %mp-lives = 3
  ;Fit window in middle of screen
  %mp.width = $window(-1).w
  %mp.height = $window(-1).h
  %mp.x.pos = $calc((%mp.width / 2) - 180)
  %mp.y.pos = $calc((%mp.height / 2) - 235)
  window -p +nt @Megapede %mp.x.pos %mp.y.pos 340 350 @Megapede
  ;Initial black
  drawfill -r @Megapede %mp.screen.color 1 0 0
  ;border around entire screen, grey
  drawrect -r @Megapede %mp.border.color 1 0 0 336 325
  ;inner border around playing field, brown
  drawrect -r @Megapede %mp.panel.color 3 1 1 334 344
  ;inner inner border around playing field, brown
  drawrect -r @Megapede %mp.panel.color 2 5 5 330 339
  ;line separating fields
  drawline -r @Megapede %mp.border.color 1 245 0 245 345
  ;fill up the panel
  drawfill -r @Megapede %mp.panel.color %mp.border.color 250 5
  ;little line in top to get rid of grey
  drawline -r @Megapede %mp.panel.color 1 245 1 245 7
  ;line from top of panel to right side, black
  drawline -r @megapede %mp.screen.color 1 245 4 332 4
  ;line from top to bottom of panel, black
  drawline -r @Megapede %mp.screen.color 1 332 4 332 345
  ;line along bottom to fill in frame, brown
  drawline -r @Megapede %mp.panel.color 4 0 327 336 328
  ;cover up grey in panel, brown
  drawline -r @Megapede %mp.panel.color 2 245 326 332 326
  ;fix dot of grey with black
  drawdot -r @Megapede %mp.panel.color 1 4 325
  ;add line at bottom left corner, grey
  drawline -r @Megapede %mp.border.color 1 0 326 0 330
  ;add line of black at bottom left
  drawline -r @Megapede %mp.screen.color 1 4 325 4 330
  ;add speck in corner
  drawdot -r @Megapede %mp.speck.color 1 245 325
  ;fix lower right corner
  drawline -r @Megapede %mp.border.color 1 336 325 336 330
  drawline -r @Megapede %mp.screen.color 1 332 324 332 330
  drawtext -ro @Megapede %mp.text.color Arial bold 266 30 Score
  mp.frame 255 50 65 25
  drawtext -ro @Megapede %mp.text.color Arial bold 268 110 Level
  mp.frame 255 130 65 25
  drawtext -ro @Megapede %mp.text.color Arial bold 267 190 Ships
  mp.frame 255 210 65 25
  ;Draw ships in side bar and on playing field
  mp.draw.ship 275 219
  mp.draw.ship 303 219
  mp.draw.ship 123 284
  mp.window Starting level one...  
}
alias -l mp.init.variables {
  ;cleans up all the dirty variables and resets the essential variables
  unset %mp.*
  %mp.tree.color = 56320
  %mp.megapede.color = 6062080
  %mp.screen.color = 0000000
  %mp.border.color = 10064271
  %mp.speck.color = 16777215
  %mp.panel.color = 2697513
  ;Feel free to change the %mp.panel.color to whatever you wish
  ;the value which is commented out will make everything blue
  ;%mp.panel.color = 6563840
  %mp.text.color = 13551310
  %mp.score.color = 55039
  %mp.shot.speed = 10
  %mp.shot.length = 5
  %mp.p1.color = 16777215
  %mp.max.shots = 3
  %mp.speed.test = 0
  %mp.loops = 0
  %mp.kills = 0
}
alias -l mp.start.level {
  ;clears the playing field and starts the appropriate level
  if ( %mp-lives == 0 ) { 
    megapede
    return
  }
  titlebar @Megapede Level: %mp-current-level
  drawtext -rob @Megapede %mp.score.color %mp.screen.color Arial bold 284 135 %mp-current-level
  drawrect -rf @Megapede %mp.screen.color 1 7 7 235 315
  mp.draw.megapede
  mp.draw.trees
  .timermp.update -mo 0 100 mp.update
}
alias -l mp.draw.trees {
  ;fills the playing field with %mp-tree-total trees
  %mp.loop = 1
  :loop
  if %mp.loop > %mp-tree-total goto end
  %mp.x = $r(2,24)
  %mp.y = $r(2,27) 
  set %mp. $+ $calc(10 * %mp.x) $+ . $+ $calc(10 * %mp.y) 5
  drawdot -r @Megapede %mp.tree.color 5 $calc((10 * %mp.x) - 3) $calc(10 * %mp.y)
  inc %mp.loop
  goto loop
  :end
}
alias -l mp.draw.megapede {
  ;creates the megapede according to %mp-megapede-length segments
  %mp.loop = 1
  :loop
  if (%mp.loop > %mp-megapede-length) goto end
  set %mp. $+ $calc(10 * %mp.loop + 10) $+ . $+ 20 6 %mp.loop
  if (%mp.loop == %mp-megapede-length) { set %mp.body. $+ %mp.loop $calc(10 * %mp.loop + 10) 20 r d h }
  else { set %mp.body. $+ %mp.loop $calc(10 * %mp.loop + 10) 20 r d b }
  drawdot -r @Megapede %mp.megapede.color 5 $calc((10 * %mp.loop + 10) - 3) 20
  inc %mp.loop
  goto loop
  :end
}
alias -l mp.move.megapede {
  ;moves segment number $1 of the megapede in the appropriate direction
  set %mp.current %mp.body. [ $+ [ $1 ] ]
  if (%mp.current != $null) {
    if ($gettok(%mp.current,5,32) == h) {
      %mp.direction.x = $gettok(%mp.current,3,32)
      %mp.direction.y = $gettok(%mp.current,4,32)
      if (%mp.direction.x == r) {
        %mp.next.x = $calc($gettok(%mp.current,1,32) + 10)
      }
      else {
        %mp.next.x = $calc($gettok(%mp.current,1,32) - 10)
      }
      %mp.next.y = $gettok(%mp.current,2,32)
      %mp.tree.check = %mp. [ $+ [ %mp.next.x ] [ $+ . [ $+ [ %mp.next.y ] ] ] ]
      if (%mp.tree.check < 6 && %mp.tree.check != $null) { %mp.tree = $true }
      else { %mp.tree = $false }
      if ((%mp.tree || %mp.next.x > 240) && %mp.direction.y == d && %mp.direction.x == r) {
        %mp.direction.x = l
        %mp.next.x = $gettok(%mp.current,1,32)
        %mp.next.y = $calc(%mp.next.y + 10)
      }
      elseif ((%mp.tree || %mp.next.x > 240) && %mp.direction.y == u && %mp.direction.x == r) {
        %mp.direction.x = l
        %mp.next.x = $gettok(%mp.current,1,32)
        %mp.next.y = $calc(%mp.next.y - 10)
      }
      elseif ((%mp.tree || %mp.next.x < 15) && %mp.direction.y == d && %mp.direction.x == l) {
        %mp.direction.x = r
        %mp.next.x = $gettok(%mp.current,1,32)
        %mp.next.y = $calc(%mp.next.y + 10)
      }
      elseif ((%mp.tree || %mp.next.x < 15) && %mp.direction.y == u && %mp.direction.x == l) {
        %mp.direction.x = r
        %mp.next.x = $gettok(%mp.current,1,32)
        %mp.next.y = $calc(%mp.next.y - 10)
      }
      if (%mp.next.y > 310) { set %mp.direction.y u }
      elseif (%mp.next.y < 290) { set %mp.direction.y d }
      %mp.x = $gettok(%mp.current,1,32)
      %mp.y = $gettok(%mp.current,2,32)
      set %mp. $+ %mp.next.x $+ . $+ %mp.next.y 6 $1
      unset %mp. $+ $calc(%mp.x) $+ . $+ $calc(%mp.y)
      set %mp.body. $+ $1 %mp.next.x %mp.next.y %mp.direction.x %mp.direction.y h
    } 
    else {
      %mp.next.x = %mp.x
      %mp.next.y = %mp.y
      %mp.direction.x = $gettok(%mp.current,3,32)
      %mp.direction.y = $gettok(%mp.current,4,32)
      %mp.x = $gettok(%mp.current,1,32)
      %mp.y = $gettok(%mp.current,2,32)
      set %mp. $+ %mp.next.x $+ . $+ %mp.next.y 6 $1
      unset %mp. $+ $calc(%mp.x) $+ . $+ $calc(%mp.y)
      set %mp.body. $+ $1 %mp.next.x %mp.next.y %mp.direction.x %mp.direction.y b
    }
    drawdot -rn @Megapede %mp.screen.color 5 $calc(%mp.x - 3) %mp.y 
    drawdot -rn @Megapede %mp.megapede.color 5 $calc(%mp.next.x - 3) %mp.next.y
  }
}
on 1:close:@Megapede {
  if ( $window(@Mp.window) ) window -c @Mp.window
  if ( %mp.active == $false ) {
    unset %mp.*
    unset %mp-*
  }
}
alias -l mp.update {
  ;updates one frame
  %mp.timer = $ticks
  %mp.active = $true
  if ( $window(@Megapede) == $null ) {
    .timermp.update off   
    unset %mp.*
    unset %mp-*
    return
  }
  %mp.loop = %mp-megapede-length
  :loop
  if (%mp.loop < 1) { goto end }
  mp.move.megapede %mp.loop
  mp.move.bullets %mp.loop
  dec %mp.loop
  goto loop
  :end
  drawdot @Megapede
  mp.collision.check
  if ($mouse.key & 1) { mp.release.shot }
  if ( %mp-debug ) {
    inc %mp.loops
    inc %mp.speed.test $calc($ticks - %mp.timer)
    set %mp.ticks $calc(%mp.speed.test / %mp.loops)
    set %mp.refreshes.per.second $calc(1000 / %mp.ticks)
    drawtext -rob @Megapede %mp.text.color %mp.panel.color Arial bold 253 260 FPS: $round(%mp.refreshes.per.second,1)
  }
}
alias -l mp.move.bullets {
  ;moves bullet number $1 up the screen one spot if it exists
  if (%mp.bullet [ $+ [ $1 ] ] != $null) {
    %mp.current = %mp.bullet [ $+ [ $1 ] ]
    %mp.bullet.x = $calc(($gettok(%mp.current,1,32) - ($gettok(%mp.current,1,32) % 10)) + 10)
    %mp.bullet.y = $calc($gettok(%mp.current,2,32) - ($gettok(%mp.current,2,32) % 10))
    %mp.coordinate.check = %mp. [ $+ [ %mp.bullet.x ] [ $+ . [ $+ [ %mp.bullet.y ] ] ] ]
    if (%mp.coordinate.check == $null) { goto next }
    else {
      unset %mp.bullet $+ $1
      %mp.size = $gettok(%mp.coordinate.check,1,32)
      drawdot -r @Megapede %mp.screen.color %mp.size $calc(%mp.bullet.x - 3) %mp.bullet.y
      dec %mp.size
      if (%mp.size == 5) {
        inc %mp.kills 
        %mp.part = $gettok(%mp.coordinate.check,2,32)
        unset %mp.body. $+ $calc(%mp.part)
        dec %mp.part
        %mp.previous.part = %mp.body. [ $+ [ %mp.part ] ]
        if (%mp.previous.part != $null) { set %mp.body. $+ %mp.part $gettok(%mp.previous.part,1-4,32) h }
        drawdot -r @Megapede %mp.tree.color %mp.size $calc(%mp.bullet.x - 3) %mp.bullet.y
        set %mp. $+ %mp.bullet.x $+ . $+ %mp.bullet.y %mp.size
        inc %mp-score 50
        drawtext -rob @Megapede %mp.score.color %mp.screen.color Arial bold 265 55 %mp-score
        if ( %mp.kills == %mp-megapede-length ) { mp.level.complete }
      }
      elseif (%mp.size < 3) {
        unset %mp. $+ $calc(%mp.bullet.x) $+ . $+ $calc(%mp.bullet.y)
        inc %mp-score 5
        drawtext -rob @Megapede %mp.score.color %mp.screen.color Arial bold 265 55 %mp-score
      }
      else {
        drawdot -r @Megapede %mp.tree.color %mp.size $calc(%mp.bullet.x - 3) %mp.bullet.y
        set %mp. $+ %mp.bullet.x $+ . $+ %mp.bullet.y %mp.size
      }
      drawline -r @Megapede %mp.screen.color 1 %mp.current $gettok(%mp.current,1,32) $calc($gettok(%mp.current,2,32) + %mp.shot.length)
      goto end
    }
    :next
    drawline -r @Megapede %mp.screen.color 1 %mp.current $gettok(%mp.current,1,32) $calc($gettok(%mp.current,2,32) + %mp.shot.length)
    %mp.current = $gettok(%mp.current,1,32) $calc($gettok(%mp.current,2,32) - %mp.shot.speed)
    drawline @Megapede 0 1 %mp.current $gettok(%mp.current,1,32) $calc($gettok(%mp.current,2,32) + %mp.shot.length)
    if ($gettok(%mp.current,2,32) < 20) { 
      unset %mp.bullet $+ $1
      drawline -r @Megapede %mp.screen.color 1 %mp.current $gettok(%mp.current,1,32) $calc($gettok(%mp.current,2,32) + %mp.shot.length)
    }
    else { set %mp.bullet $+ $1 %mp.current }
  }
  :end
}
alias -l mp.release.shot {
  ;sets the next bullet in line to true and gives it a starting coordinate to move up from
  %mp.loop = 1
  :loop
  if (%mp.loop > %mp.max.shots) { goto end }
  if (%mp.bullet [ $+ [ %mp.loop ] ] == $null) {
    mp.coordinates
    set %mp.bullet $+ %mp.loop %mp.mouse.x $calc(%mp.mouse.y - 3)
    halt
  }
  inc %mp.loop
  goto loop    
  :end
}
menu @Megapede {
  mouse {
    if (%mp.active) {
      if ( %mp.point && %mp.lower.left && %mp.lower.right ) {      
        drawline -r @Megapede %mp.screen.color 2 %mp.point %mp.lower.left
        drawline -r @Megapede %mp.screen.color 2 %mp.point %mp.lower.right
      }
      mp.coordinates
      mp.draw.ship %mp.mouse.x %mp.mouse.y    
    }
  }
  dclick {
    mp.release.shot
  }
  Reset:.timermp.update off | megapede
  $mp.pause:mp.pause.switch
  $mp.fps:mp.fps.switch
  -
  Quit: {
    window -c @Megapede
    if ( $window(@Mp.window) ) window -c @Mp.window
    if ( %mp.active == $false ) {
      unset %mp.*
      unset %mp-*
    }
  }
}
;Menu aliases
alias -l mp.fps {
  if ( %mp-debug ) { return Hide FPS }
  else { return Show FPS }
}
alias -l mp.fps.switch {
  if ( %mp-debug ) { 
    unset %mp-debug
    drawrect -rf @Megapede %mp.panel.color 1 250 260 80 15
  }
  else { %mp-debug = $true }
}
alias -l mp.pause {
  if ($timer(mp.update).status == 0) {
    return Unpause
  }
  else { return Pause }
}
alias -l mp.pause.switch {
  if ($timer(mp.update).status == 0) {
    %mp.active = $true
    timermp.update -m 0 1 mp.update
  }
  else { 
    .timermp.update off 
    %mp.active = $false
  }
}
alias -l mp.frame {
  ;draws a little box, used in the side bar for score, level and lives
  drawrect -r @Megapede %mp.border.color 1 $1 $2 $3 $4
  drawfill -r @Megapede %mp.screen.color %mp.border.color $calc($1 + 2) $calc($2 + 2)
  drawline -r @Megapede %mp.panel.color 2 $1 $2 $calc($1 + $3) $2
  drawline -r @Megapede %mp.panel.color 2 $calc($1 + 3) $calc($2 + 3) $calc($1 + $3 - 2) $calc($2 + 3)
  drawline -r @Megapede %mp.panel.color 2 $calc($1 + 3) $calc($2 + 2) $calc($1 + 3) $calc($2 + $4)
  drawline -r @Megapede %mp.panel.color 2 $1 $2 $1 $calc($2 + $4)
  drawdot -r @Megapede %mp.screen.color 1 $calc($1 + 1) $calc($2 + $4)
  drawdot -r @Megapede %mp.screen.color 1 $calc($1 + 1) $calc($2 + $4 +1)
}
alias -l mp.window {
  ;creates the window to notify you of what is happening
  %mp.width = $window(-1).w
  %mp.height = $window(-1).h
  %mp.x.pos = $calc((%mp.width / 2) - 100)
  %mp.y.pos = $calc((%mp.height / 2) - 100)
  window -pt +nf @Mp.window %mp.x.pos %mp.y.pos 190 90 @Mp.window.menu
  drawfill -r @Mp.window %mp.panel.color 1 0 0
  mp.window.button up
  drawtext -ro @Mp.window %mp.text.color Arial 14 137 54 Ok
  if ( $1 ) {
    drawtext -ro @Mp.window %mp.text.color Arial 14 $round($calc( 112 - ( $width($1-,Arial,14,1,0) / 2 ) ),0) 20 $1-
  }
  if ( %mp-score != 0 ) {
    drawtext -ro @Mp.window %mp.text.color Arial 14 20 40 Score: %mp-score
  }
}
alias -l mp.window.button {
  ;down parameter creates a button in the down position, while up draws it in the up position
  if $window(@Mp.window) {
    if $1 == down {
      drawline -r @Mp.window %mp.border.color 1 120 70 170 70
      drawline -r @Mp.window %mp.border.color 1 170 70 170 50
      drawline -r @Mp.window %mp.screen.color 1 120 70 120 50
      drawline -r @Mp.window %mp.screen.color 1 120 50 170 50
    }
    else if $1 == up {
      drawline -r @Mp.window %mp.screen.color 1 120 70 170 70
      drawline -r @Mp.window %mp.screen.color 1 170 70 170 50
      drawline -r @Mp.window %mp.border.color 1 120 70 120 50
      drawline -r @Mp.window %mp.border.color 1 120 50 170 50
    }
  }
}
alias -l mp.window.click {
  ;used to check if the user clicked and released the mouse button while over the "ok" button of the window
  if ( $mouse.key & 1 ) { .timer -m 1 100 mp.window.click }
  else if $inrect($mouse.x,$mouse.y,120,50,50,20) {
    unset %mp.button.click
    window -c @Mp.window
    mp.window.closed
  }
}
menu @Mp.window.menu {
  ;these events were used to determine when the button should be down and when the window will be closed
  sclick {
    if ( $inrect($mouse.x,$mouse.y,120,50,50,20) ) { 
      mp.window.button down
      %mp.button.click = $true
      .timer -m 1 100 mp.window.click
    }
  }
  dclick  {
    if ( $inrect($mouse.x,$mouse.y,120,50,50,20) ) { 
      mp.window.button down
      %mp.button.click = $true
      .timer -m 1 100 mp.window.click
    }
  }
  mouse {
    if ( $inrect($mouse.x,$mouse.y,120,50,50,20) == $false ) { mp.window.button up }
    else if %mp.button.click && $mouse.key & 1 { mp.window.button down }
  }
  drop {
    if ( $inrect($mouse.x,$mouse.y,120,50,50,20) && %mp.button.click ) { 
      window -c @Mp.window
      mp.window.closed
    }
    else if ( %mp.button.click ) { unset %mp.button.click }
  }
}
alias -l mp.collision.check {
  ;checks to see if anything is touching your ship, if so you die
  mp.coordinates
  %mp.mid.left = $calc(%mp.mouse.x - 5) $calc(%mp.mouse.y + 5)
  %mp.mid.right = $calc(%mp.mouse.x + 5) $calc(%mp.mouse.y + 5)
  %mp.left.tip = $calc(%mp.mouse.x - 10) $calc(%mp.mouse.y + 10)
  %mp.right.tip = $calc(%mp.mouse.x + 10) $calc(%mp.mouse.y + 10)
  %mp.tip = $getdot(@Megapede,%mp.mouse.x,$calc(%mp.mouse.y - 2))
  %mp.mid.left = $getdot(@Megapede,$calc($gettok(%mp.mid.left,1,32) + 5),$gettok(%mp.mid.left,2,32))
  %mp.mid.right = $getdot(@Megapede,$calc($gettok(%mp.mid.right,1,32) + 5),$gettok(%mp.mid.right,2,32))
  %mp.left.tip = $getdot(@Megapede,$calc($gettok(%mp.left.tip,1,32) - 2),$gettok(%mp.left.tip,2,32))
  %mp.right.tip = $getdot(@Megapede,$calc($gettok(%mp.right.tip,1,32) + 2),$gettok(%mp.right.tip,2,32))
  if ((%mp.tip != %mp.screen.color) || (%mp.left.tip != %mp.screen.color) || (%mp.right.tip != %mp.screen.color) || (%mp.mid.left != %mp.screen.color) || (%mp.mid.right != %mp.screen.color)) {
    %mp-dead = $true
    mp.level.complete   
  }
}
alias -l mp.coordinates {
  ;adjusts the $mouse.x and $mouse.y coordinates so they map to some place in the playing area for the ship
  if ($mouse.y < 275) { %mp.mouse.y = 275 }
  elseif ($mouse.y > 310) { %mp.mouse.y = 310 }
  else { %mp.mouse.y = $mouse.y }
  if ($mouse.x > 232) { %mp.mouse.x = 232 }
  elseif ($mouse.x < 19) { %mp.mouse.x = 19 }
  else { %mp.mouse.x = $mouse.x }
}
alias -l mp.draw.ship {
  ;draws a ship at point $1, $2
  %mp.point = $1 $2
  %mp.lower.left = $calc($1 - 10) $calc($2 + 10)
  %mp.lower.right = $calc($1 + 10) $calc($2 + 10)
  drawline -r @Megapede %mp.p1.color 2 $1 $2 $calc($1 - 10) $calc($2 + 10)
  drawline -r @Megapede %mp.p1.color 2 $1 $2 $calc($1 + 10) $calc($2 + 10)
}
alias -l mp.level.complete {
  ;called when you either die or pass a level, adjusts variables according to your status and restarts the play field
  .timermp.update off
  drawrect -rf @Megapede %mp.screen.color 1 7 7 235 315
  mp.init.variables
  if ( %mp-dead ) {
    unset %mp-dead
    if ( %mp-lives == 3 ) {
      %mp.p1.color = %mp.screen.color
      mp.draw.ship 275 219
      %mp.p1.color = 16777215
      dec %mp-lives
      mp.window You died. %mp-lives ships remaining.
    }
    else if ( %mp-lives == 2 ) {
      %mp.p1.color = %mp.screen.color
      mp.draw.ship 303 219
      %mp.p1.color = 16777215
      dec %mp-lives
      mp.window You died. %mp-lives ship remaining.
    }
    else if ( %mp-lives == 1 ) {
      dec %mp-lives
      mp.window Game over,  no more ships
    } 
  }
  else if ( %mp-current-level == 1 ) {
    %mp-tree-total = 100
    %mp-current-level = 2
    %mp-megapede-length = 4
    mp.window Starting Level two...
  }
  else if ( %mp-current-level == 2 ) {
    %mp-tree.total = 100
    %mp-current-level = 3
    %mp-megapede-length = 3
    mp.window Starting level three...
  }
  else if ( %mp-current-level == 3 ) {
    %mp-tree.total = 150
    %mp-current-level = 4
    %mp-megapede-length = 2
    mp.window Starting level four...
  }
  else if ( %mp-current-level == 4 ) {
    %mp-tree.total = 200
    %mp-current-level = 5
    %mp-megapede-length = 1
    mp.window Starting level five...
  }
  else if ( %mp-current-level == 5 ) {
    window -c @Megapede
    mp.window You win! Congratulations!
  }
}
alias -l mp.window.closed {
  ;this is called when the @Mp.window is closed
  ;a new level always starts when it's closed unless 
  ;@Megapede has been shut down
  if ( $window(@Megapede) ) mp.start.level
  else {
    unset %mp.*
    unset %mp-*
  }
}
