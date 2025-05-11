alias Cave {
  if ($window(@cave)) return
  window -pkodCfB +nt @Cave 0 0 320 240
  titlebar @Cave Dwellers

  hmake cave_c 10
  hadd cave_c version 0.1
  hadd cave_c pms $mouse.x $mouse.y $mouse.key
  hadd cave_c uiclr 16777215
  hadd cave_c svr_name N/A
  hadd cave_c mode lobby

  hmake cave_map 100

  drawrect -fr @cave 0 1 0 0 320 240
  drawpic -cnt @cave 16711935 18 18 $qt($scriptdirlogo.png)
  drawtext -nr @cave 4210752 tahoma 10 158 112 v $+ $hget(cave_c,version)
  drawtext -ncrp @cave $hget(cave_c,uiclr) tahoma 10 $calc(255 - $width($strip($hget(cave_c,svr_name)),tahoma,10) / 2) 4 110 14 $hget(cave_c,svr_name)
  cvlob_draw ;draw all the controls
}
menu @cave {
  mouse: if ($hget(cave_c,mode) == lobby) cvlob_draw
  sclick: if ($hget(cave_c,mode) == lobby) cvlob_clk
}
alias -l cvlob_clk { 
  if (!$window(@cave)) cvdie
  if ($inrect($mouse.x,$mouse.y,10,210,50,20) && $$input(Are you sure you wish to exit?,yvwu,Exit) == $yes) cvdie
  elseif ($inrect($mouse.x,$mouse.y,200,180,110,20)) { ;ready / join game
    if ($hget(cave_c,server)) { ;join }
    else cave_client_start $$input(Enter the ip address of the server and the tcp port separated by a space,eu,Join Game)
  }
  ;create game
  elseif ($inrect($mouse.x,$mouse.y,200,210,110,20)) {
    if (!$script(cave_server.mrc)) var %v $input(To use this feature $+ $chr(44) $crlf please load cave_server.mrc from your Cave Dwellers folder.,ohu,Error)
    else $iif($hget(cave_c,server),cave_server_stop,cave_server_start_dialog)
  }

  if ($inrect($mouse.x,$mouse.y,10,10,160,104)) cvabt 
}
alias cvlob_draw {
  if (!$window(@cave)) cvdie
  btn 10 210 50 20 Exit
  btn 70 210 50 20 Options
  btn 200 210 110 20 $iif($hget(cave_c,server),Leave Game,Create Game)
  btn 200 180 110 20 $iif($hget(cave_c,server),Ready,Join Game)
  lst 200 20 110 150

  drawdot @cave
}

;draw a button x y w h [text] or returns true if pressed
alias -l btn { 
  var %inr $inrect($mouse.x,$mouse.y,$1,$2,$3,$4)
  drawrect -fnr @cave 0 0 $1-4
  drawrect -nr @cave $hget(cave_c,uiclr) 1 $1-4
  var %inr $inrect($mouse.x,$mouse.y,$1,$2,$3,$4)
  if (%inr) drawrect -nr @cave $hget(cave_c,uiclr) 1 $calc($1 + 2) $calc($2 + 2) $calc($3 - 4) $calc($4 - 4)
  if ($5) drawtext -ncr @cave $hget(cave_c,uiclr) tahoma 10 $calc($1 + ($3 / 2) - $width($5-,tahoma,10) / 2) $calc($2 + ($4 / 2) - $height($5-,tahoma,10) / 2) $3-4 $5-
  if (%inr) return 1
}

;draws a list x y w h start_index list-(sep by space) (wraps if greater than items in list) - no scrollbars
alias -l lst {
  drawrect -fnr @cave 0 0 $1-4
  drawrect -nr @cave $hget(cave_c,uiclr) 1 $1-4
  if ($5 > $calc($0 - 5)) return
  var %i $iif($5 > 0,$5,1), %h 0 
  while %i <= $numtok($hget(cave_c,nicks),32) {
    if ($calc(%h + 14) > $4) break
    if ($calc(%i % 2) == 0) drawrect -nrf @cave 1052688 1 $calc($1 + 2) $calc($2 + 2 + %h) $calc($3 - 4) 12
    drawtext -nrc @cave $hget(cave_c,uiclr) tahoma 10 $calc($1 + 4) $calc($2 + 2 + %h) $calc($3 - 6) 14 $gettok($hget(cave_c,nicks),%i,32)
    inc %i | inc %h 14
  }
}

;load a csv map 
alias -l csv { 
  .fopen cvmap $$1 
  var %ln 0
  while (!$ferr(cvmap) && !$feof(cvmap)) {
    var %v $fread(cvmap), %i 1
    while (%i <= $numtok(%v,44)) { hadd cave_map %ln $+ . $+ $calc(%i - 1) $gettok(%v,%i,44) | inc %i }
    inc %ln
  }
  .fclose cvmap
}

on *:CLOSE:@cave: cvdie
alias cvdie { 
  ;close the game
  window -c @cave
  hfree -w cave_c
  hfree -w cave_map
  cave_server_stop
  cave_client_stop
  hfree -w cave_c
  halt
}

alias -l cvabt var %v $input(Cave Dwellers $crlf By CobaltHex and Wims,oiu,About)
