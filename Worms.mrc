alias Worms {
  if ($window(@Worms)) halt
  ;create our windows  - a main window that shows the game, a window with all of our sprites, and a buffer window that has the mountains and such that we can blow up :P
  window -pkodCfB +nt @Worms -1 -1 640 480 
  window -pkfBh @Wm.buf1 -1 -1 640 480
  window -pkfBh @Wm.buf2 -1 -1 640 480
  ;free the table if it exists, create the table, add our page variable so we know what page we're on, and goto the loop
  hadd -m Worms Page Menu
  ;create our options data
  hadd Worms Server IRC.swiftirc.net
  hadd Worms Port 6668
  hadd Worms On-Top True
  ;draw our sprites and our sprite window lime(a color that not many things use)
  drawdot -r @Wm.buf1 65280 600 320 240
  drawrect -rf @Wm.buf2 8355711 1 0 300 640 380
  hadd Worms p1 100 100
  Worms.loop
}
alias -l Worms.loop {
  ;check to make sure the game is still running!, otherwise halt the game, and then set the ticks variable for the fps at the end of the script
  if (!$window(@Worms)) halt
  var %ticks $ticks
  ;clear the screen - (draws a huge white dot - bigger than the screen - in the middle of the screen)
  drawdot -nr @Worms 16777215 600 320 240
  ;we need to check what to draw
  if ($hget(Worms,Page) == Menu) {
    ;draw the title 
    var %i 0 | while (%i <= 10) { drawtext -nr @Worms $calc(100 + (%i * 10)) arial 60 224 $calc(60 - %i) Worms | inc %i }
    ;our set of precalculated data so that it doesnt slow down the game
    var %s = 1,%m = 1;1;1;2;2;3;4;5;6;7;7;8;8;8;9;9;9;8;8;8;7;7;6;5;4;3;2;2;1;1;1;0;0;0;0;0;-1;-1;-1;-2;-2;-3;-4;-5;-6;-7;-7;-8;-8;-8;-9;-9;-9;-8;-8;-8;-7;-7;-6;-5;-4;-3;-2;-2;-1;-1;-1;0;0;0;0;0
    while (%s <= 72) { 
      ;tell us what to scroll and how high
      var %c = 0 $gettok(%m,%s,59),%t = 50 1 84, %o = $hget(Worms,Menuscroll)
      ;the actual scroller
      drawscroll -n @Worms %c $calc(%s + %o + 224) %t %c $calc(%s + %o + 258) %t %c $calc(%s + %o + 292) %t %c $calc(%s + %o + 326) %t %c $calc(%s + %o + 360) %t %c $calc(%s + %o + 394) %t
      inc %s 
    }
    ;change our scroller value so the wave moves
    hadd Worms Menuscroll $iif($calc(%o + 1) <= 192, $v1, -192)
    ;draw the rest of the menu 
    ;this is to underline if the mouse is near them
    if ($inrect($mouse.x,$mouse.y,282,200,76,46)) {
      drawtext -nrp @Worms 3618615 arial 40 282 202 Play
      drawtext -nrp @Worms 200 arial 40 282 200 Play
    }
    else {
      drawtext -nr @Worms 3618615 arial 40 282 202 Play
      drawtext -nr @Worms 200 arial 40 282 200 Play
    }
    if ($inrect($mouse.x,$mouse.y,288,400,64,46)) {
      drawtext -nrp @Worms 3618615 arial 40 288 402 Exit
      drawtext -nrp @Worms 200 arial 40 288 400 Exit
    }
    else {
      drawtext -nr @Worms 3618615 arial 40 288 402 Exit
      drawtext -nr @Worms 200 arial 40 288 400 Exit
    }
    if ($inrect($mouse.x,$mouse.y,253,330,134,46)) {
      drawtext -nrp @Worms 3618615 arial 40 253 332 Options
      drawtext -nrp @Worms 200 arial 40 253 330 Options
    }
    else {
      drawtext -nr @Worms 3618615 arial 40 253 332 Options
      drawtext -nr @Worms 200 arial 40 253 330 Options
    }
  }
  ;our lobby
  if ($hget(Worms,Page) == Lobby) {
    ;draw the screen blue
    drawdot -nr @Worms 16762980 500 320 240
    ;draw the frames
    drawrect -nr @Worms 0 1 10 10 620 140
    drawrect -nr @Worms 0 1 10 170 460 140
    drawrect -nr @Worms 0 1 10 330 460 140
    drawline -nr @Worms 0 1 10 450 470 450
    drawline -nr @Worms 0 1 440 450 440 470
    drawrect -nr @Worms 0 1 150 152 100 16
    drawrect -nr @Worms 0 1 260 152 100 16
    drawrect -nr @Worms 0 1 370 152 100 16
    drawrect -nr @Worms 0 1 480 149 150 16 
    drawtext -nr @Worms 0 tahoma 9 484 151 $iif($line(@Wm.games,0), $v1, 0) $iif($v1 == 1, Game, Games)
    if ($hget(Worms,Connected) == True) drawtext -nr @Worms 0 tahoma 9 $iif($hget(Worms,Game), 172 154 Modify, 167 154 Create a) Game 
    if ($hget(Worms,GameSel)) drawtext -nr @Worms 0 tahoma 9 288 154 Join Game 
    drawtext -nr @Worms 0 tahoma 9 397 154 Main Menu 
    ;only draw 'Send' if theres text
    if ($hget(Worms,chm)) drawtext -nr @Worms 0 tahoma 10 444 454 Send
    drawrect -nr @Worms 0 1 480 170 150 300
    drawline -nr @Worms 0 1 10 294 470 294
    drawline -nr @Worms 0 1 480 454 630 454
    ;draw the refresh button for the news
    drawrect -nr @Worms 0 1 10 155 50 16
    drawtext -nr @Worms 0 tahoma 9 20 158 Refresh
    ;draw the clear button for the chat box
    drawrect -nr @Worms 0 1 10 315 50 16
    drawtext -nr @Worms 0 tahoma 9 23 318 Clear
    ;draw the refresh for the games list
    drawrect -nr @Worms 0 1 80 149 50 16
    drawtext -nr @Worms 0 tahoma 9 90 152 Refresh
    ;draw our total users
    drawtext -nr @Worms 0 tahoma 9 484 456 $iif($Line(@Wm.chat,0,1) == 0, 0, $v1) $iif($v1 == 1, Player, Players)
    ;draw the users
    var %3 1 | while (%3 <= $iif($line(@Wm.chat,0,1) > 23, 23, $v1)) { 
      if ($line(@Wm.chat,$calc(%3 + %Wm.ppos),1)) drawtext -nrc @Worms 0 tahoma 9 484 $calc(163 + (%3 * 12)) 142 12 $v1
      inc %3
    }
    ;draw the text to the chat
    var %l 1 | while (%l <= $iif($line(@Wm.chat,0) > 9, 9, $v1)) { 
      if ($line(@Wm.chat,$calc(%l + %Wm.cpos))) drawtext -nrc @Worms 0 tahoma 9 14 $calc(445 - (%l * 12)) 450 12 $v1
      inc %l
    }
    ;draw the little beam on the edit box if @worms is the active window
    if ($active == @Worms) && ($appactive) && ($ticks & 8) && ($hget(Worms,Connected) == True) {
      if ($width($hget(Worms,chm),tahoma,9) <= 420) {
        var %p $calc(13 + $width($left($hget(Worms,chm),$hget(Worms,CPos)),tahoma,9))
      drawline -nr @Worms 0 1 %p 453 %p 467 }
      if (!$hget(Worms,Chm)) drawline -nr @Worms 0 1 13 453 13 467
    }
    ;draw the games
    var %o 1 | while (%o <= $iif($line(@Wm.Games,0) > 11, 11, $v1)) {
      if ($line(@Wm.Games,$calc(%o + %Wm.gpos))) drawtext -nrc @Worms 0 tahoma 9 14 $calc(2 + (%o * 12)) 616 12 %o $+ : $v1
      inc %o
    }
    ;draw our news
    var %b 1 | while (%b <= $line(@Wm.news,0)) { 
      drawtext -nrc @Worms 0 tahoma 9 14 $calc(162 + (%b * 12)) 450 12 $line(@Wm.news,%b)
      inc %b
    }
    ;draw the motd 
    drawtext -nrc @Worms 0 tahoma 9 14 296 451 12 Message of the day: $iif($hget(Worms,MOTD), $v1, None.)
    ;draw the chat message we type
    if ($hget(Worms,chm)) drawtext -nrc @Worms 0 tahoma 9 14 455 421 12 $v1
    ;draw the scroll boxes
    drawrect -nrf @Worms 16762980 1 455 330 15 15
    drawrect -nr @Worms 0 1 455 330 15 15
    drawrect -nrf @Worms 16762980 1 455 436 15 15
    drawrect -nr @Worms 0 1 455 436 15 15
    drawrect -nrf @Worms 16762980 1 615 440 15 15
    drawrect -nr @Worms 0 1 615 440 15 15
    drawrect -nrf @Worms 16762980 1 615 170 15 15
    drawrect -nr @Worms 0 1 615 170 15 15
    drawrect -nrf @Worms 16762980 1 615 10 15 15
    drawrect -nr @Worms 0 1 615 10 15 15
    drawrect -nrf @Worms 16762980 1 615 135 15 15
    drawrect -nr @Worms 0 1 615 135 15 15
  }
  ;if were in Create a game mode
  if ($hget(Worms,Page) == Create) {
    drawdot -nr @Worms 16762980 500 320 240
    drawrect -nr @Worms 0 1 600 10 30 20
    drawtext -nr @Worms 0 tahoma 9 605 15 Back
    drawtext -nr @Worms 0 arial 20 20 20 Game Name: $gettok($hget(Worms,GameSets),2,58)
    drawtext -nr @Worms 0 arial 20 20 60 Players (2-4): $gettok($hget(Worms,GameSets),3,58)
    drawrect -nr @Worms 0 1 500 400 130 70
    drawtext -nr @Worms 0 arial 40 505 412 $iif($hget(Worms,Game), Modify, Create)
    if ($hget(Worms,Game)) { 
      drawrect -nr @Worms 0 1 10 450 100 20
      drawtext -nr @Worms 0 tahoma 12 24 452 Delete Game
    }
  }
  ;lovely options to choose from
  if ($hget(Worms,Page) == Options) {
    drawdot -nr @Worms 16762980 500 320 240
    drawrect -nr @Worms 0 1 600 10 30 20
    drawtext -nr @Worms 0 tahoma 9 604 14 Menu
    drawtext -nr @Worms 0 arial 20 20 20 Server: $hget(Worms,Server) 
    drawtext -nr @Worms 0 arial 20 20 60 Port: $hget(Worms,Port)
    drawtext -nr @Worms 0 arial 20 20 100 Keep on top of other windows: $hget(Worms,On-Top)
    drawtext -nr @Worms 0 arial 20 400 20 Change
    drawtext -nr @Worms 0 arial 20 400 60 Change
    drawtext -nr @Worms 0 arial 20 400 100 Change
  }
  ;our game!
  if ($hget(Worms,Page) == Game) { 
    /* 
    *****
    *********************
    ******************************
    *********************************
    THIS IS WHERE YOU WRITE THE GAME :)
    ************************************
    ********************************
    **************************
    *********************
    *****************
    *************
    ********
    *****
    **
    *
    */
  }
  ;Draw the FPS
  drawtext -nr @Worms 0 verdana 8 1 0 FPS: $iif($ceil($calc(1000 / ($ticks - %ticks))) == 0, 100%, $v1)
  ;update our window so we can see!, and loop back to the beginning
  drawdot @Worms
  titlebar @Worms - $hget(Worms,Page)
  .timer -oh 1 0 Worms.loop
}
;Our exit alias, that removes everything that the game was using
alias Worms.Exit {
  if ($window(@Worms)) window -c @Worms
  window -c @Wm.buf1
  window -c @Wm.buf2
  window -c @Wm.chat
  window -c @Wm.news
  window -c @Wm.Games
  hfree -w Worms
  WMS.close
  sockclose WM*
  unset %WM*
}
;our On Close event
on *:CLOSE:@Worms: {
  worms.exit
}
menu @Worms {
  uclick: {
    ;check if our page is the menu
    if ($hget(Worms,Page) == Menu) {
      ;if we hit the play button
      if ($inrect($mouse.x,$mouse.y,282,200,76,46)) {
        ;goto the lobby
        hadd Worms page Lobby
        ;create the window for messages
        window -khl30 @Wm.chat
        window -kh @Wm.news 
        window -kh @Wm.Games
        ;create a value for our cursor position(text box)
        hadd Worms CPos 0
        hdel -w Worms chm
        ;create position variables for our scroller postitions in the chat boxes
        %Wm.gpos = 0 | %Wm.ppos = 0 | %Wm.cpos = 0 
        ;we check the users online by opening the socket
        .sockclose Wm.News
        sockopen Wm.News worms.vndv.com 80 
      }
      ;if we hit the exit button
      elseif ($inrect($mouse.x,$mouse.y,288,400,64,46)) {
        worms.exit
      }
      ;if we hit options
      elseif ($inrect($mouse.x,$mouse.y,253,330,134,46)) {
        hadd Worms Page Options
      }
    }
    ;anything we do in the Lobby is recorded :P
    if ($hget(Worms,Page) == Lobby) { 
      ;see if we pressed the send button, and that theres text
      if ($inrect($mouse.x,$mouse.y,440,450,30,20)) && ($hget(Worms,chm)) {
        ;add the text to the message box and delete it from the chat edit box
        iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ $me $+ > $v1
        hdel Worms chm
      }
      ;if we hit refresh, get the news again - and only if were connected, so we dont interupt it
      if ($inrect($mouse.x,$mouse.y,10,155,50,16)) && ($hget(Worms,Connected) == True) {
        clear @Wm.news
        .sockclose Wm.News
        sockopen Wm.News worms.vndv.com 80 
      }
      ;clear button
      if ($inrect($mouse.x,$mouse.y,10,315,50,16)) && ($hget(Worms,Connected) == True) {
        clear @Wm.chat
      }
      ;main menu
      if ($inrect($mouse.x,$mouse.y,370,152,100,16)) {
        sockclose WM*
        hdel Worms Connected
        window -c @Wm.chat
        window -c @Wm.news
        window -c @Wm.Games
        hadd Worms Page Menu
      }
      ;the join a game
      if ($inrect($mouse.x,$mouse.y,260,152,100,16)) {

      }
      ;create/modify game
      if ($inrect($mouse.x,$mouse.y,150,152,100,16)) && ($hget(Worms,Connected) == True) {
        hadd Worms page Create
        ;create some settings for our game
        hadd Worms GameSets $me $+ : $+ $me $+ 's Game:3
      }
    }
    ;our options page
    if ($hget(Worms,Page) == Options) {
      ;if we want to change the server or the port
      if ($inrect($mouse.x,$mouse.y,400,20,105,36)) hadd Worms Server $iif($input(Enter a server,eqdo,New Server), $v1, $Hget(Worms,Server))
      if ($inrect($mouse.x,$mouse.y,400,60,105,36)) hadd Worms Port $iif($input(Enter a port,eqdo,New Port), $v1, $Hget(Worms,Port))
      ;go back if we click menu
      if ($inrect($mouse.x,$mouse.y,600,10,30,20)) hadd Worms Page Menu
    }
    ;the create a game page
    if ($hget(Worms,Page) == Create) {
      ;if we click to go back
      if ($inrect($mouse.x,$mouse.y,600,10,30,20)) hadd Worms Page Lobby
      ;if we click create
      if ($inrect($mouse.x,$mouse.y,500,400,130,70)) { 
        ;create our game and delete the settings
        hadd Worms Game $hget(Worms,GameSets) | hdel Worms GameSets
        sockwrite -n WMP PRIVMSG #Worms WM.Create $hget(Worms,Game)
        iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ Server> You have successfully created a new game.
        hadd Worms Page Lobby
      }
      ;delete a game
      if ($inrect($mouse.x,$mouse.y,10,450,100,20)) && ($hget(Worms,Game)) {
        sockwrite -n WMP PRIVMSG #Worms WM.Del $me $+ : $+ $gettok($hget(Worms,Game),2,58)
        hdel Worms Game 
        iline 1 @Wm.Chat 1 < $+ $asctime(hh:nn:ss) ~ Server> You have successfully ended your game.
        hadd Worms Page Lobby
      }
    }
  }
  sclick: {
    ;scroll bars clicking and the games list box
    if ($hget(Worms,Page) == Lobby) {
      if ($inrect($mouse.x,$mouse.y,455,330,15,15)) && (%Wm.cpos < $calc($line(@Wm.Chat,0) - 1)) inc %Wm.cpos
      if ($inrect($mouse.x,$mouse.y,455,436,15,15)) && (%Wm.cpos > 0) dec %Wm.cpos
      if ($inrect($mouse.x,$mouse.y,615,440,15,15)) && (%Wm.ppos < $calc($line(@Wm.Chat,0,1) - 1)) inc %Wm.ppos
      if ($inrect($mouse.x,$mouse.y,615,170,15,15)) && (%Wm.ppos > 0) dec %Wm.ppos
      if ($inrect($mouse.x,$mouse.y,615,135,15,15)) && (%Wm.gpos < $calc($line(@Wm.Games,0) - 1)) inc %Wm.gpos
      if ($inrect($mouse.x,$mouse.y,615,10,15,15)) && (%Wm.gpos > 0) dec %Wm.gpos
      ;what happens when we click this ? hmm..
      if ($inrect($mouse.x,$mouse.y,10,10,620,140)) {
        var %numgames $calc($floor($calc(($mouse.y - 10) / 12)) + %Wm.gpos)
        if ($calc($line(@Wm.Games,0) - 1) >= %numgames) && ($line(@Wm.Games,%numgames)) hadd Worms GameSel $calc(%numgames + 1)
      }
      ;;write a join game function here -- this has all of the pre game setup, like variable declarations and stuff like that
      /**************************************************
      ***************************************************
      **************************************************/
    }
  }
}
;our keydown events for keypressing
on *:KEYDOWN:@Worms:*: { 
  ;check if its the lobby, so we can use the chat box
  if ($Hget(Worms,Page) == Lobby) && ($hget(Worms,Connected) == True) { 
    ;if we press the space bar, replace it with '?' due to mIRC's weird space handling
    if ($keyval == 32) { hadd Worms chm $regsubex($hget(worms,chm),/(.)/g,$iif(\n == $hget(worms,cpos),$+(\t,$chr(160)),\t)) | hinc Worms CPos }
    ;if we press the backspace key we delete the last key(if there is one)
    elseif ($keyval == 8) { if ($hget(Worms,chm)) { hadd Worms chm $regsubex($hget(Worms,chm),/(.)/g,$iif(\n != $hget(Worms,Cpos),\t)) } | if ($hget(Worms,CPos) > 0) hdec Worms CPos }
    ;if we press enter, add the message to the chat window and delete it from our temp
    elseif ($keyval == 13) { if ($hget(Worms,chm)) {
        iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ $me $+ > $v1
        sockwrite -n WMP PRIVMSG #Worms $v1
        hdel Worms chm
        hadd Worms CPos 0
    } }
    ;if we click up, read the buffer
    elseif ($keyval == 38) {
      hinc worms buffer 
      if ($fline(@wm.chat,*~ $me $+ >*,$hget(worms,buffer)).text) { hadd -m worms chm $regsubex($v1,/^(<.+>)/,) | hadd -m worms cpos $len($regsubex($v1,/^(<.+>)/,)) }
      else hdec worms buffer
    } 
    elseif ($keyval == 40) && ($hget(worms,buffer)) {
      hdec worms buffer 
      if ($hget(worms,buffer) == 0) { hdel worms buffer | hdel worms chm | hdel worms cpos }
      elseif ($fline(@wm.chat,*~ $me $+ >*,$hget(worms,buffer)).text) {  hadd -m worms chm $regsubex($v1,/^(<.+>)/,) | hadd -m worms cpos $len($regsubex($v1,/^(<.+>)/,)) }
    } 
    ;move the cursor around
    elseif ($keyval == 37) { if ($hget(Worms,CPos) > 0) hdec Worms CPos }
    elseif ($keyval == 39) { if ($hget(Worms,CPos) < $len($hget(Worms,chm))) hinc Worms CPos }
    ;end key
    elseif ($keyval == 35) hadd Worms CPos $len($hget(Worms,chm))
    ;home key
    elseif ($keyval == 36) hadd Worms CPos 0
    ;delete key
    elseif ($keyval == 46) hadd Worms chm $regsubex($hget(Worms,chm),/(.)/g,$iif($calc(\n -1) != $hget(Worms,Cpos),\t))
    ;otherwise, just add the letter to the message
    else {
      hadd Worms chm $left($hget(Worms,chm),$hget(Worms,CPos)) $+ $keychar $+ $right($hget(Worms,chm),$calc($len($hget(Worms,chm)) - $hget(Worms,CPos))) 
  if (!$istok(16.17,$keyval,46)) hinc Worms CPos }  }
  hadd Worms Keys $addtok($hget(Worms,Keys),$keyval,151)
}
;when we release a key, remove it from the list
on *:KEYUP:@Worms:*:hadd Worms Keys $remtok($hget(Worms,Keys),$keyval,151)
on *:sockopen:Wm.News: {
  if ($sock(Wm.News)) sockwrite -nt $sockname GET /index.html HTTP/1.0 $+ $crlf $+ Host: worms.vndv.com $+ $str($crlf,2)
}
on *:sockread:Wm.News: {
  ;if theres no window, we halt!
  if (!$window(@Worms)) && (!$sock(Wm.news)) halt
  if ($sockerr)  {
    ;if there was an error in the socket we say it
    hadd Worms News There was an error while gathering the news, please try again later.
    ;then we re-open a new socket and get back to sockwrite
    sockopen News. $+ $right($ticks,6) worms.vndv.com 80
    sockclose $sockname
  }
  else {
    ;otherwise we read our source
    var %New | sockread %New
    if (~ isin %new) {
      if ($window(@Worms)) aline 1 @Wm.news $nohtml(%New)
    }
    if (Message of the day: isin %new) {
      if ($window(@Worms)) hadd Worms MOTD $remove($nohtml(%New),Message of the day:)
    }
  }
  ;connect to the chat server
  if (!$sock(WMP)) {
    WMS.Connect
    iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ Server> Connecting to $hget(Worms,Server) $+ ...
  }
}
;strip HTML from our stuffs..
alias -l nohtml return $regsubex($1-,/(^[^<]+>|<[^>]+>|<[^>]+$)/g,$null)
;our socket commands for connecting to the server to chat and play 
alias wms.connect { sockopen WMP $hget(Worms,Server) $hget(Worms,Port) }
;this will disconnect us with the message of "Worms for mIRC!"
alias wms.close { if ($sock(WMP)) sockwrite -n WMP QUIT Worms for mIRC! | sockclose WMP }
on *:SOCKOPEN:WMP: {
  ;send the data the server requires
  if (!$sock(WMP)) halt
  sockwrite -n $sockname NICK Wm_ $+ $me
  sockwrite -n $sockname USER Worms. $+ $me "" $+(",$server,") :Worms_Player
}

on *:SOCKREAD:WMP: {
  if (!$window(@Worms)) halt
  ;if theres an error end
  if ($sockerr > 0) return
  ;our loop so we can stay connected
  :1
  if (!$window(@Worms)) || (!$sock(WMP)) halt
  sockread %wmp
  tokenize 32 %wmp
  ;if we didnt read anything, end
  if ($sockbr == 0) return
  ;if theres nothing that we read, set the var to a - so we dont have an error
  if (!%wmp) %wmp = -
  ;this is for when we connect, join #Worms, and add welcome to the chat box
  if ($2 == 001) { 
    iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ Server> Welcome to the Worms lobby. 
    hadd Worms Connected True 
    sockwrite -n WMP JOIN #Worms
  }
  ;if we have a bad nickname
  if ($2 == 455) iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ Server> Connect failed! Invalid nickname. A better nick would be $regsubex($me,/[^[:alnum:]]/g,) $+ .
  ;send a PONG when we are PING'd
  if ($1 == PING) sockwrite -n WMP PONG $2
  ;create variables for our nick and our message
  var %Wnick = $right($gettok($1,1,33),-1), %Wmsg = $right($4-,-1) 
  ;when someone says something and they're a Worms player add their message
  if ($2 == PRIVMSG) && (WM_* iswm %Wnick) && (WM* !iswm %wmsg) iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ $remove(%Wnick,WM_) $+ > %Wmsg
  if ($2 == PRIVMSG) && (WM.Create* iswm %Wmsg) && (%wnick != WM_ $+ $me) { 
    aline 1 @Wm.Games $remove($gettok(%wmsg,2,58),WM.Create ) hosted by $remove($gettok(%wmsg,1,58),WM.Create ) $+ . Up to $gettok(%wmsg,3,58) players can play.
    iline 1 @Wm.Chat 1 < $+ $asctime(hh:nn:ss) ~ Server> $& 
      $remove($gettok(%wmsg,1,58),WM.Create ) has just created a game: $remove($gettok(%wmsg,2,58),WM.Create ) $+ . Up to $gettok(%wmsg,3,58) players can play.
  }
  ;when someone deletes a game
  if ($2 == PRIVMSG) && (WM.Del* iswm %Wmsg) && (%wnick != WM_ $+ $me) && ($hget(Worms,Game)) { 
    if ($me isin $gettoK($hget(Worms,Game),2,59)) {
      hdel Worms Game
      iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ Server> $remove(%Wnick,WM_) has ended their game. You are no longer part of their game.
    }
  }
  ;when someone ends their game in general
  if ($2 == PRIVMSG) && (WM.Del* iswm %Wmsg) && (%wnick != WM_ $+ $me) { 
    iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ Server> $remove(%Wnick,WM_) has ended their game.
  }
  ;when someone joins the channel, add their nick to the list, and tell everyone
  if ($2-3 == JOIN :#Worms) && (WM_* iswm %Wnick) && (%wnick != WM_ $+ $me) {
    aline -l @Wm.chat $remove(%Wnick,WM_)
    iline 1 @Wm.chat 1 < $+ $asctime(hh:nn:ss) ~ Server> $remove(%Wnick,WM_) has connected to the lobby.
  }
  ;this is for when someone quits
  if ($2 == PART) || ($2 == QUIT) && (WM_* iswm %Wnick) { 
    iline 1 @WM.chat 1 < $+ $asctime(hh:nn:ss) ~ Server> $remove(%Wnick,WM_) has left the lobby. $&
      $iif($hget(Worms,Game) && $me isin $gettok($hget(Worms,Game),2,59), You are no longer part of their game., )
    if ($hget(Worms,Game)) && ($Me isin ($gettok$(hget(Worms,Game,2,59)) {

    }
    var %1 1 | while (%1 <= $line(@Wm.chat,0,1)) {
      if ($line(@WM.chat,%1,1) == $remove(%Wnick,WM_)) { dline -l @WM.chat %1 | return }
      inc %1
  } }
  ;when we get a names request reply, this adds the names to the names list
  if ($2 == 353) {
    var %names $regsubex($6-,/[!~`^@&%+-?]/g,)
    clear -l @Wm.chat
    var %. 1 | while (%. <= $numtok(%names,32)) { 
      if (WM_* iswm $gettok(%names,%.,32)) aline -l @Wm.chat $remove($v2,WM_)
      inc %.
    }
  }
  ;loop back
  goto 1
} 
;our load event
on *:LOAD: {
  ;sorry, your version sucks :P
  if ($version < 6.12) { echo $color(info) -m Sorry, but your version of mIRC is too out of date. Please upgrade at http://www.mIRC.com | unload -rs $script }
  else { 
    ;good job!
    echo $color(info) -m Worms for mIRC Successfully loaded!
  } 
}
;say bye bye :(
on *:UNLOAD:echo $color(info) -m Thanks for playing Worms for mIRC!
