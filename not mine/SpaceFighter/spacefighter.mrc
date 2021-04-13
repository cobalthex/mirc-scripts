;Version 1.40
;SpaceFighter was created & scripted by ToKeN (Justin Mammarella)
;Web: http://www.spacefighter.cjb.net/
;Email: j_ustin_@hotmail.com
;
; ---------------------------------------------------------- - -- --- -- -   -   -     -       - 
; |                    [*Warning*] 
; |  Any slight modifications of this file will cause 
; |  version errors when connecting to a remote system.
; |
; |  To Run The Menu /spacefighter
; |  To Run A Userdefined Connection /spacefighter -c ip/addy port [ server name (optional) ] 
; |  To Open The Server List /spacefighter -L
; |  To Run The Speed Test /spacefighter -st
; |  To Run A Connection Test [Local Connection] /spacefighter -ct
; |  To Get Up Game Settings /spacefighter -gs
; |  To Manually Set A Deafult Ip Address For Client Connetions /spacefighter -ip [ ip address ]
; |  To Run The Bug Report And Comment Dialog /spacefighter -fb
; |  To Run Help /spacefighter -h
; |  To Update /spacefighter -up
; |  To View Build Number /spacefighter -build
; |  To View Version /spacefighter -version   
; |  To View Version Infomation /spacefighter -v
; |  To Send A Sever Message To All Active Users Type /spacefighter -smsg [Message]
; |  To Create A Server /spacefighter -cs
; |  To Run The MapMaker /spacefighter -mm
; ---------------------------------------------------------- - -- --- -- -   -   -     -       -
;
;Begin
on *:LOAD: { spf.f.load }
alias spf.f.load { 
  if ($version < 5.91) { echo SpaceFighter needs at least version 5.91 of mIRC to run. Get it at http://www.mirc.com/ | .unload -rs $script | .halt }
  window -lCbdok[n] +s @Spf 250 250 390 95 Verdana 12
  window -a @Spf
  aline @Spf ---------------------------------------------------------
  aline @Spf SpaceFighter Ver $spf.ver(2) by ToKeN Loaded. 
  aline @Spf After completing the speedtest please type /spacefighter
  aline @Spf Then read the helpfile
  aline @Spf ---------------------------------------------------------
  aline @Spf Double Click To Close This Window
  if ($window(-1).w < 1024) { spf.error SpaceFighter requires a screen resolution of 1024 * 768 or higher, many aspects of the game will not appear correctly or will not appear at all. }
}
menu @spf {
  dclick:{ window -c @spf | spacefighter -st }
}
on *:CLOSE:@Spf:{ spf.process.d }
menu menubar,status {
  SpaceFighter
  .&Start: spacefighter
  .&Server List: spacefighter -l
  .-
  .&Game Settings: spacefighter -gs
  .-
  .&Update ( $+ Current Version $spf.ver(2) $+ ): spacefighter -up
  .&Version Info: spacefighter -v
  .-
  .&Help: spacefighter -h
  .-
  .&http $+ $chr(58) $+ $chr(47) $+ $chr(47) $+ www.spacefighter.cjb.net $+ $chr(47): url -n $spacefighter(-url)
  .-
  .&Uninstall: if ($?!="Do you wish to UnInstall SpaceFighter?") { spf.uninstall }
}
;Starting Alias /spacefighter
alias Spacefighter {
  if ($ip == $null) { .localinfo -uh }
  if (!%Spf.winmeth.1) { %Spf.winmeth.1 = 2 }
  spf.scheck 2
  ;splay spacefighter.mp3
  inc %spf.open.num
  if (%spf.editbox.temp == $null) { set %spf.editbox.temp $colour(editbox) }
  if (%spf.editbox.temp2 == $null) { set %spf.editbox.temp2 $color(editbox text) }
  color editbox 1
  color editbox text 9
  unset %spf.mapmaker
  if ($1 == -l) { spf.multi findserv | return }
  if ($1 == -st) { spf.speedtest | return }
  if ($1 == -build) { echo < Build $spf.ver(1) > | return }
  if ($1 == -version) { echo < Version = $spf.ver(2) > | return }
  if ($1 == -url) { return http://www.spacefighter.cjb.net/ | .halt }
  if ($1 == -ct) { spf.multi testcon | return }
  if ($1 == -ip) { if (!$2) { unset %spf.ip | echo Ip Address Removed | .halt } | %spf.ip = $2 | echo Ip Address Manually Inserted, This Ip Address Is Now Fixed. mIRC Will Now Resort To This Ip Address Instead Of The Default One For Use Within The Script SpaceFighter. | echo To Remove This Fixed Ip Type /spacefighter -ip | .halt }
  if ($1 == -h) { run spacefighter\readme.txt | return }
  if ($1 == -fb) { spf.feedback | return }
  if ($1 == -cs) { spf.serv.d | return }
  if ($1 == -gs) { spf.gs | return }
  if ($1 == -up) { spf.dl | return }
  if ($1 == -v) { run spacefighter\version.txt | .halt }
  if ($1 == -smsg) { if (%spf.multi.ip) { spf.s.1.as.tcp SMSG $2- } | .halt }
  if ($1 == -c) { if ($2 == $null) || ($3 == $null) { window -c @Spacefighter | spf.error You Specified Incorrect Parameters! | .halt } | spf.multi c $2- | return } 
  if ($1 == -mm) { spf.mapmaker | .halt }
  if ($1 == -a) { $2- }
  spf.window
  spf.close
  spf.menu
}
;Default Menu Screen
alias -l spf.menu {
  if ($1 == refresh) { goto refresh }
  if ($1 == shiprefresh) { 
    goto shiprefresh 
  }
  unset %spf.game
  spf.scheck
  %spf.menu = on
  spf.window
  titlebar @Spacefighter - Menu
  drawrect -rf @Spacefighter 0 1 -1 -1 680 610
  spf.gradient
  :drawmenu
  set %Spf.bmp.menu1 0 62 34 35
  set %Spf.sd.menu1 left
  set %Spf.sd.menu2 right
  set %Spf.bmp.menu2 1 98 34 40
  set %Spf.ship.menu1 SpaceFighter\Bitmaps\ship1.bmp
  set %Spf.ship.menu2 SpaceFighter\Bitmaps\ship1.bmp
  %spf.m0 = 0
  %spf.m1 = $rgb(255,255,255)
  %spf.m2 = $rgb(255,255,255)
  %spf.m3 = $rgb(255,255,255)
  %spf.m4 = $rgb(255,255,255)
  %spf.m5 = $rgb(255,255,255)
  drawrect -r @Spacefighter 16777215 1 -10 190 690 370
  drawline -r @Spacefighter 0 1 12 97 200 97
  drawline -r @Spacefighter 0 1 11 98 199 98
  drawline -r @Spacefighter 0 1 10 99 198 99
  drawline -r @spacefighter 16777215 1 9 100 197 100 
  drawtext -r @Spacefighter 0 Verdana 18 12 74 S p a c e F i g h t e r
  drawtext -r @Spacefighter 0 Verdana 18 11 75 S p a c e F i g h t e r
  drawtext -r @Spacefighter 16777215 Verdana 18 10 76 S p a c e F i g h t e r
  :refresh
  drawtext -nro @Spacefighter %spf.m1 Verdana 12 288 300 Find Games
  drawtext -nro @Spacefighter %spf.m2 Verdana 12 281 320 Create Server
  drawtext -nro @Spacefighter %spf.m3 Verdana 12 300 340 Updater
  drawtext -nro @Spacefighter %spf.m4 Verdana 12 290 360 Map Maker
  drawtext -nro @Spacefighter %spf.m5 Verdana 12 287 380 Help & Stuff
  drawdot @Spacefighter 
  :shiprefresh
  if (!%Spf.bmp.menu1) set %Spf.bmp.menu1 0 62 34 35
  if (!%Spf.sd.menu1) set %Spf.sd.menu1 left
  if (!%Spf.sd.menu2) set %Spf.sd.menu2 right
  if (!%Spf.bmp.menu2) set %Spf.bmp.menu2 1 98 34 40
  if (!%Spf.ship.menu1) set %Spf.ship.menu1 SpaceFighter\Bitmaps\ship1.bmp
  if (!%Spf.ship.menu2) set %Spf.ship.menu2 SpaceFighter\Bitmaps\ship1.bmp
  drawrect -nrf @Spacefighter 0 1 105 327 40 40
  drawrect -nrf @Spacefighter 0 1 520 327 40 40
  drawpic -nct @Spacefighter 4227327 105 327 %Spf.bmp.menu1 %spf.ship.menu1
  drawpic -nct @Spacefighter 4227327 520 327 %Spf.bmp.menu2 %spf.ship.menu2
  drawdot @Spacefighter
}
alias spf.gradient {
  var %x = 0, %y = 0
  :loop 
  if (%x >= 680) { goto end }  
  if (%y >= 610) { .halt }
  drawpic @Spacefighter %x %y $scriptdir $+ Bitmaps\pbak.bmp
  if (%x <= 680) { inc %x 10 }
  goto loop
  :end
}
menu @Spacefighter {
  mouse: {
    if (%spf.slist != on) && (%spf.game != on) && (%spf.st != on) && (%spf.mapmaker != on) && (%spf.load != on) && (%spf.slist != on) {
      inc %spf.m0
      if (2.5 // %spf.m0) {
        spf.changedraw menu1 le
        spf.changedraw menu2 ri
        spf.menu shiprefresh
      }
      if ($inrect($mouse.x,$mouse.y,288,300,80,17)) { %spf.m2 = $rgb(255,255,255) | %spf.m3 = $rgb(255,255,255) | %spf.m4 = $rgb(255,255,255) | %spf.m5 = $rgb(255,255,255) | %spf.m1 = $rgb($rand(1,255) $+ , $+ $rand(1,255) $+ , $+ $rand(150,255)) | spf.menu refresh }
      if ($inrect($mouse.x,$mouse.y,281,320,100,17)) { %spf.m1 = $rgb(255,255,255) | %spf.m3 = $rgb(255,255,255) | %spf.m4 = $rgb(255,255,255) | %spf.m5 = $rgb(255,255,255) | %spf.m2 = $rgb($rand(1,255) $+ , $+ $rand(1,255) $+ , $+ $rand(150,255)) | spf.menu refresh }
      if ($inrect($mouse.x,$mouse.y,300,340,50,17)) { %spf.m1 = $rgb(255,255,255) | %spf.m2 = $rgb(255,255,255) | %spf.m4 = $rgb(255,255,255) | %spf.m5 = $rgb(255,255,255) | %spf.m3 = $rgb($rand(1,255) $+ , $+ $rand(1,255) $+ , $+ $rand(150,255)) | spf.menu refresh }
      if ($inrect($mouse.x,$mouse.y,290,360,75,17)) { %spf.m1 = $rgb(255,255,255) | %spf.m2 = $rgb(255,255,255) | %spf.m3 = $rgb(255,255,255) | %spf.m5 = $rgb(255,255,255) | %spf.m4 = $rgb($rand(1,255) $+ , $+ $rand(1,255) $+ , $+ $rand(150,255)) | spf.menu refresh }
      if ($inrect($mouse.x,$mouse.y,287,380,80,17)) { %spf.m1 = $rgb(255,255,255) | %spf.m2 = $rgb(255,255,255) | %spf.m3 = $rgb(255,255,255) | %spf.m4 = $rgb(255,255,255) | %spf.m5 = $rgb($rand(1,255) $+ , $+ $rand(1,255) $+ , $+ $rand(150,255)) | spf.menu refresh }
    }
  }
  sclick: {
    if (%spf.game != on) && (%spf.mapmaker != on) && (%spf.st != on) && (%spf.slist != on) && (%spf.load != on) {
      if ($inrect($mouse.x,$mouse.y,520,327,40,40)) { spf.shake 1 }
      if ($inrect($mouse.x,$mouse.y,105,327,40,40)) { spf.shake 1 }
      if ($inrect($mouse.x,$mouse.y,288,300,80,17)) { spf.multi findserv }
      if ($inrect($mouse.x,$mouse.y,281,320,100,17)) { spf.serv.d }
      if ($inrect($mouse.x,$mouse.y,300,340,50,17)) { spf.dl }
      if ($inrect($mouse.x,$mouse.y,290,360,75,17)) { spf.mapmaker }
      if ($inrect($mouse.x,$mouse.y,287,380,80,17)) { window -c @SpaceFighter | spf.close | run spacefighter\readme.txt }
    }     

  }
}
alias spf.list.screen {
  unset %spf.menu
  %spf.slist = on
  if ($hget(spf.servlist) != $null) { hfree spf.servlist | unset %spf.multi.servnum }
  if (!%spf.scroll) { %spf.scroll = 1 }
  spf.window
  titlebar @Spacefighter - The Server List
  drawrect -rf @Spacefighter 0 1 -1 -1 680 610
  var %x = 0, %y = 0
  :loop
  if (%x >= 680) {
    spf.scroll.refresh
    spf.slist.echo Establishing Connection With The Server
    .halt 
  }  
  if (%y >= 610) { .halt }
  drawpic @Spacefighter %x %y SpaceFighter\Bitmaps\pbak.bmp
  if (%x <= 680) { inc %x 10 }
  goto loop
}
alias -l spf.slist.echo {
  drawrect -fnr @Spacefighter 0 1 10 220 675 15
  drawtext -nrb @Spacefighter 16777215 1 Verdana 12 10 220 $1-
  drawdot @Spacefighter
}
alias spf.slist.echo2 {
  drawrect -fnr @Spacefighter 0 1 10 500 490 300
  if (!$1) { goto end }
  drawtext -nrb @Spacefighter 16617090 1 Verdana 10 12 510 Server Description:
  if ($len($1-) >= 60) { var %length = $len($1-) | goto 2 }
  drawtext -nrb @Spacefighter 16617090 1 Verdana 10 12 520 $1-
  goto end
  :2
  drawtext -nrb @Spacefighter 16617090 1 Verdana 10 12 530 $left($1-,60)
  %length = $calc(%length - 60)
  drawtext -nrb @Spacefighter 16617090 1 Verdana 10 12 540 $right($1-,%length)
  :end
  drawdot @Spacefighter
}
alias -l spf.scroll.list {
  spf.scroll.refresh 1
  if (!%spf.multi.servnum) { goto end }
  var %xt = %spf.scroll, %x = %spf.scroll, %y = 280, 
  :loop
  if ($gettok($hget(spf.servlist,[ %x ]),1,5)) { 
    drawtext -nr @Spacefighter 16617090 Verdana 12 12 %y $gettok($hget(spf.servlist,[ %x ]),1,5) 
    drawtext -nr @Spacefighter 16617090 Verdana 12 402 %y $gettok($hget(spf.servlist,[ %x ]),6,5) 
    drawtext -nr @Spacefighter 16617090 Verdana 12 502 %y $gettok($hget(spf.servlist,[ %x ]),5,5) 
  }
  inc %y 20
  if (%x != %spf.multi.servnum) && ($calc(%x - %xt) != 10) { inc %x | goto loop }
  :end
  drawdot @Spacefighter
}
alias spf.scroll.refresh {
  var %h = 1, %i = 1, %j = 1, %k = 240
  :loop2 
  %j = 7413274
  if (%i = 1) { %j = 6166295 | %i = 0 | goto skip }
  if (%i = 0) { %i = 1 }
  :skip 
  inc %k 20
  if ($1 == 1) { drawrect -nrf @Spacefighter %j 1 10 %k 643 20 }
  if ($1 != 1) { drawrect -nrf @Spacefighter %j 1 10 %k 655 20 }
  if (%h != 12) { inc %h | goto loop2 }  
  drawline -nr @Spacefighter 16617090 1 10 279 654 279
  if ($1 != 1) { 
    spf.button1.color.2
    spf.button2.color.2
    drawrect -fnr @Spacefighter 15731512 1 653 280 12 20 | drawrect -fnr @Spacefighter 15731512 1 653 480 12 20 
  }
  drawrect -nr @Spacefighter 16617090 1 653 279 12 221
  drawrect -nr @Spacefighter 16617090 1 10 260 655 240
  drawline -nr @Spacefighter 16617090 1 500 260 500 500
  drawline -nr @Spacefighter 16617090 1 400 260 400 500
  drawtext -onr @Spacefighter 16617090 Verdana 12 12 262 Server Name:
  drawtext -onr @Spacefighter 16617090 Verdana 12 502 262 Current Users:
  drawtext -onr @Spacefighter 16617090 Verdana 12 402 262 Version:
  drawtext -onr @Spacefighter 16617090 Verdana 12 655 282 +
  drawtext -onr @Spacefighter 16617090 Verdana 12 656 482 -
  drawdot @Spacefighter
}
menu @Spacefighter {
  sclick: {
    if (%spf.slist == on) && (%spf.game != on) && (%spf.st != on) && (%spf.mapmaker != on) && (%spf.load != on) && (%Spf.menu != on) {
      if ($inrect($mouse.x,$mouse.y,653,280,12,20)) && (%spf.scroll != 1) { spf.scroll.inc }
      if ($inrect($mouse.x,$mouse.y,653,480,12,20)) && (%spf.scroll < %spf.multi.servnum) { spf.scroll.dec }
      if ($inrect($mouse.x,$mouse.y,10,280,645,220)) { 
        spf.scroll.list
        drawrect -r @Spacefighter 16617090 1 10 $calc($calc($calc($int($calc($mouse.y / 20)) - 14) * 20) + 279) 644 21
        %spf.scroll.list.sel = $calc($int($calc($mouse.y / 20)) - 13)
        spf.slist.echo2 $gettok($hget(spf.servlist,[ $calc(%spf.scroll.list.sel + %spf.scroll - 1) ]),4,5)
      }
      if ($inrect($mouse.x,$mouse.y,500,510,165,20)) { 
        .timerspf.button -om 1 50 spf.button1.color
        if ($hget(spf.servlist) != $null) { hfree spf.servlist | spf.scroll.refresh 1 }
        spf.slist.echo Refreshing Server List | spf.multi findserv 1
      }
      if ($inrect($mouse.x,$mouse.y,500,540,165,20)) { 
        .timerspf.button2 -om 1 50 spf.button2.color
        if (!$hget(spf.servlist,[ $calc(%spf.scroll.list.sel + %spf.scroll - 1) ])) { .halt } 
        spf.multi join $hget(spf.servlist,[ $calc(%spf.scroll.list.sel + %spf.scroll - 1) ])
      }
    }
  }
}
alias -l spf.button2.color {
  if (%spf.load == on) { .halt }
  drawrect -fr @Spacefighter 16617090 1 500 540 165 20
  drawrect -r @Spacefighter 15731512 1 500 540 165 20
  drawtext -or @Spacefighter 15731512 Verdana 12 550 542 Join Game
  if ($mouse.key & 1) { .timerspf.button2 -om 1 50 spf.button2.color | .halt }
  spf.button2.color.2
}
alias -l spf.button2.color.2 {
  if (%spf.load == on) { .halt }
  drawrect -fr @Spacefighter 15731512 1 500 540 165 20
  drawrect -r @Spacefighter 16617090 1 500 540 165 20
  drawtext -or @Spacefighter 16617090 Verdana 12 550 542 Join Game
}
alias -l spf.button1.color {
  drawrect -fr @Spacefighter 16617090 1 500 510 165 20
  drawrect -r @Spacefighter 15731512 1 500 510 165 20
  drawtext -or @Spacefighter 15731512 Verdana 12 545 512 Refresh List
  if ($mouse.key & 1) { .timerspf.button -om 1 50 spf.button1.color | .halt }
  spf.button1.color.2
}
alias -l spf.button1.color.2 {
  drawrect -fr @Spacefighter 15731512 1 500 510 165 20
  drawrect -r @Spacefighter 16617090 1 500 510 165 20
  drawtext -or @Spacefighter 16617090 Verdana 12 545 512 Refresh List
}
alias -l spf.scroll.inc {
  if (%spf.scroll == 1) { goto end }
  dec %spf.scroll | spf.scroll.list 1 | %spf.scroll.d = on
  drawrect -nfr @Spacefighter 16617090 1 653 280 12 20 | drawtext -nor @Spacefighter 15731512 Verdana 12 655 282 +
  drawdot @Spacefighter
  if ($mouse.key & 1) { .timerspf.scroll -om 1 50 spf.scroll.inc | .halt }
  :end
  spf.scroll.buttons
}
alias -l spf.scroll.dec {
  if (%spf.scroll == $lines(spflist.txt)) { goto end }
  inc %spf.scroll | spf.scroll.list 1 | %spf.scroll.d = on
  drawrect -fr @Spacefighter 16617090 1 653 480 12 20 | drawtext -or @Spacefighter 15731512 Verdana 12 656 482 -
  drawdot @Spacefighter
  if ($mouse.key & 1) { .timerspf.scroll -om 1 50 spf.scroll.dec | .halt }
  if ($mouse.key & 1) { echo ha }
  :end
  spf.scroll.buttons
}
alias -l spf.scroll.buttons {
  drawrect -nfr @Spacefighter 15731512 1 654 480 10 19 | drawtext -nor @Spacefighter 16617090 Verdana 12 656 482 -
  drawrect -nfr @Spacefighter 15731512 1 654 280 10 20 | drawtext -nor @Spacefighter 16617090 Verdana 12 655 282 +
  drawdot @Spacefighter
}
alias -l spf.window {
  if (!$window(@Spacefighter)) && (%Spf.winmeth.1 == 1) {
    window -odCpk[n] +eL @SpaceFighter 0 0 685 610 @SpaceFighter
    window -a @SpaceFighter
  }
  if (!$window(@Spacefighter)) && (%Spf.winmeth.1 == 2) {
    window -dCpk[n] +tnm @SpaceFighter 0 0 685 610 @SpaceFighter
    window -a @SpaceFighter
  }
}
alias -l spf.ldscreen {
  %spf.load = on
  spf.window
  titlebar @Spacefighter - The Loading Screen
  drawrect -rf @Spacefighter 0 1 -1 -1 680 610
  var %x = 0, %y = 0
  :loop
  if (%x >= 680) {
    spf.menudraw Connecting To The Server [ %spf.multi.2.sname ] $+ ... [ %spf.multi.2.ip ] $+ : $+ [ %spf.multi.2.port ]
    drawtext -rb @Spacefighter 16777215 1 Veranda 12 10 270 S p a c e F i g h t e r
    set %Spf.g.x 10
    set %Spf.g.y 240
    set %Spf.g.x2 10
    set %Spf.g.y2 240
    set %spf.g.id inc
    .timerSpf.menu -m 0 50 spf.menugraph  
    .halt 
  }  
  if (%y >= 610) { .halt }
  drawpic @Spacefighter %x %y SpaceFighter\Bitmaps\pbak.bmp
  if (%x <= 680) { inc %x 10 }
  goto loop
}
alias -l spf.menugraph {
  if (%spf.g.x2 == 652) { spf.menudraw Connection To Server Timed Out }
  inc %spf.g.x2 1
  drawline -r @Spacefighter 16777215 1 %spf.g.x %spf.g.y %spf.g.x2 %spf.g.y2
  drawline -r @Spacefighter 16777215 1 %spf.g.x $calc(%spf.g.y + 220) %spf.g.x2 $calc(%spf.g.y2 + 220)
}
alias -l spf.menudraw { drawscroll @Spacefighter 0 30 0 290 600 150 | drawtext -rb @Spacefighter 16777215 1 Veranda 12 10 320 $1- }
alias -l spf.scheck { 
  if (!%spf.max.s) || (!$exists(spacefighter\spf.set)) { Spf.speedtest | .halt }
}
alias -l spf.error { if ($dialog(spf.error)) { %spf.error = $1- | dialog -a spf.error | .halt } | %spf.error = $1- | dialog -omd spf.error spf.error | dialog -a spf.error }
dialog spf.error {
  title "SpaceFighter - Domestics!"
  size -1 -1 150 66
  option dbu
  button "&Close",1,5 50 40 10, cancel 
  button "&Help",6,104 50 40 10, 
  box "An Error Has Occured" 4, 2 2 146 62
  edit %spf.error, 3, 5 10 140 37, read multi vsbar
}
on *:DIALOG:spf.error:*:*: { 
  if ($devent == sclick) && ($did == 6) { spacefighter -h }
}
alias spf.notice { if ($dialog(spf.error)) { %spf.notice = $1- | dialog -a spf.notice | .halt } | %spf.notice = $1- | dialog -omd spf.notice spf.notice | dialog -a spf.notice }
dialog spf.notice {
  title "SpaceFighter - Server Notice"
  size -1 -1 150 66
  option dbu
  button "&Close",1,5 50 40 10, cancel 
  box "Server Notice" 4, 2 2 146 62
  button "&Help",6,104 50 40 10, 
  edit %spf.notice, 3, 5 10 140 37, read multi vsbar
}
on *:DIALOG:spf.notice:*:*: { 
  if ($devent == sclick) && ($did == 6) { spacefighter -h }
}
alias -l spf.con.check {
  if ($sock(spf.2.main)) { spf.error A SpaceFighter Connection Has Already Been Detected, Please Close SpaceFighter Before Using This Command Again! | .halt }
}
alias -l spf.iperror { 
  spf.error mIRC was unable to retrieve your ip address. To correct this problem type /localinfo -uh in mIRC to retrieve your ip or insert an ip address manually by typing /spacefighter -ip < Ip Address > | spf.close | .halt
}
;Multiplayer Hub... Central place where various types of connections can be made
alias -l spf.multi { 
  if (!$me) { window -c @spacefighter | spf.close | spf.error You have not chosen a mIRC nickname. You must correct this by typing /nick MyNickName | .halt }
  spf.con.check 
  if ($1 == serv) { 
    unset %Spf.u5 
    unset %Spf.u2
    unset %Spf.u3
    unset %Spf.u4
    %spf.tusr.num = 0
  sockudp -k spf.1 $calc(%spf.multi.port - 1) | socklisten spf.s.main [ $calc(%spf.multi.port + 1) ] | %spf.multi.server = on | sockopen spf.servadd irc.austnet.org 6667 }
  if ($1 == findserv) { sockclose spf.findserv | sockopen spf.findserv irc.austnet.org 6667 | if (!$2) { spf.list.screen | .halt } | spf.scroll.refresh 1 }
  if ($1 == join) { 
    tokenize 5 $2-  
    if (!$ip) && (!%spf.ip) { spf.iperror } 
    %spf.multi.client = on
    %spf.multi.2.nick = $me 
    %spf.multi.2.sname = $1
    %spf.multi.2.ip = $2
    %spf.multi.2.port = $3 
    sockopen spf.2.main %spf.multi.2.ip [ $calc(%spf.multi.2.port + 1) ] 
    spf.ldscreen
  }
  if ($1 == testcon) {
    %spf.multi.client = on 
    %spf.multi.2.sname = Test Connection
    %spf.multi.2.nick = $me
    %spf.multi.2.ip = $ip
    if (!$ip) %spf.multi.2.ip = 127.0.0.1
    %spf.multi.2.port = 8989 
    sockopen spf.2.main %spf.multi.2.ip $calc(%spf.multi.2.port + 1)
    spf.ldscreen
  }
  if ($1 == c) {
    %spf.multi.client = on 
    %spf.multi.2.sname = $4
    if (!$4) { %Spf.multi.2.sname = Unknown Server } 
    %spf.multi.2.nick = $me
    if (!$ip) && (!%spf.ip) { spf.iperror }
    %spf.multi.2.ip = $2
    %spf.multi.2.port = $3 
    sockopen spf.2.main %spf.multi.2.ip $calc(%spf.multi.2.port + 1)
    spf.ldscreen
  }
}
;%spf.2.un = user num
;%spf.2.main = sockread 
; 1 = Server
; 2 = Client..... used 1 and 2 so that a server can run and the same user can play on their server using the same mIRC :)
;1PTP PROTOCOL -- This Is The Whole Multiplayer Protocol Enjoy!
;Client
alias -l spf.jm.send.tcp { sockwrite -tn spf.2.main $1- }
on *:SOCKOPEN:spf.2.main: { 
  if ($sockerr > 0) { spf.menudraw Error Cannot Connect! Make Sure You Are Connected To The Internet. | .timerSpf.menu off | return }
  spf.menudraw Connected To The Server
}
on *:SOCKCLOSE:spf.2.main: { spf.chatdraw 37632 *Disconnected From Server* | titlebar @spacefighter - Disconnected | spf.close | spf.menu refresh | sockclose spf.2 } 
on *:SOCKREAD:spf.2.main: { 
  sockread %spf.2.main
  spf.2.main.read %spf.2.main
}
on *:UDPREAD:spf.2: {
  sockread %spf.2.udp
  %spf.udp.data.s = 20
  spf.2.udp.read %spf.2.udp
}
alias -l spf.packet {   
  spf.jm.send.udp %spf.2.un DATA %Spf.hs.1 %Spf.vs.1 %Spf.bmp.1
  inc %spf.2.pakloss
}
alias -l spf.2.udp.read {
  if ($2 == CDATA) {
    if (!$3) || (!$4) { spf.packet | .halt }
    var %pak.tmp = $3
    tokenize 44 $4-
    if (%spf.2.u [ $+ [ $gettok(%pak.tmp,1,44) ] ]) { %spf.ud. [ $+ [ $gettok(%pak.tmp,1,44) ] ] = $1 }
    if (%spf.2.u [ $+ [ $gettok(%pak.tmp,2,44) ] ]) { %spf.ud. [ $+ [ $gettok(%pak.tmp,2,44) ] ] = $2 }
    if (%spf.2.u [ $+ [ $gettok(%pak.tmp,3,44) ] ]) { %spf.ud. [ $+ [ $gettok(%pak.tmp,3,44) ] ] = $3 }
    if (%spf.2.u [ $+ [ $gettok(%pak.tmp,4,44) ] ]) { %spf.ud. [ $+ [ $gettok(%pak.tmp,4,44) ] ] = $4 }
    spf.packet
    .halt
  }
  if ($2 == FIRE) { Spf.fire $3- | .halt }
  if ($2 == TDATA) { spf.chatdraw 37632 * Sent By Server = $3 Received By Server = $4 * | .halt }
  if ($2 == PONG) { spf.chatdraw 37632 * Your Current Ping Is At $calc($uptime(mirc,ms) - %spf.ping) $+ ms * | .halt }
  if ($2 == PAKLOSS) { spf.chatdraw 37632 * Your Current Packet Loss Is At $3 * | .halt }
  if ($2 == AOK) { .timerspf.udpcheck off | spf.menudraw All Systems Go, Select A Ship | spf.shipwin $3- }
}
alias -l spf.jm.send.udp { sockudp -tkn spf.2 %spf.multi.2.port %spf.multi.2.ip $calc(%spf.multi.2.port - 1) $1- }
alias -l spf.chatdraw { 
  if (%spf.load) { goto end }
  if ($len($2-) >= 60) { var %length = $len($2-) | goto 2 }
  drawscroll @Spacefighter 0 -15 250 502 500 200 
  drawtext -rob @Spacefighter $1 1 Verdana 10 250 550 $2-
  goto end
  :2
  drawscroll @Spacefighter 0 -15 250 500 500 200 
  drawtext -rob @Spacefighter $1 1 Verdana 10 250 550 $left($2-,60)
  %length = $calc(%length - 60)
  drawscroll @Spacefighter 0 -15 250 500 500 200 
  drawtext -rob @Spacefighter $1 1 Verdana 10 250 550 $right($2-,%length)
  :end
}
alias -l spf.msgd { if (!$dialog(spf.msgd)) { dialog -om spf.msgd spf.msgd | dialog -a spf.msgd spf.msgd } | else { dialog -a spf.msgd spf.msgd } }
dialog spf.msgd {
  title "SpaceFighter - Chat"
  size -1 -1 100 15
  option dbu
  edit "" 10, 2 2 70 10, autohs tab 1
  button "&Send",1,75 2 20 10, ok
}
on *:DIALOG:spf.msgd:*:*: {
  if ($did == 1) && ($devent == sclick) { spf.input $did(spf.msgd,10).text | dialog -x spf.msgd | window -a @Spacefighter }
}
alias -l spf.msgwin {
  window -c @Spf.msg
  window -Beopahkd +dL @Spf.msg $calc($window(@Spacefighter).x + 250) $calc($window(@Spacefighter).y + 585) 400 13 @Spf.msg verdana 10
  window -a @Spf.msg
}
on *:ACTIVE:@Spacefighter:{
  if ($lactive != @Spacefighter) && ($window(@Spf.ship)) { window -a @Spf.ship }
  window -c @spf.msg 
}
on *:KEYDOWN:@Spf.msg:*: { 
  if ($keyval == 27) { window -c @spf.msg }
}
alias spf.input {
  if ($1 == /me) { spf.chatdraw 255 * $+ %spf.multi.2.nick $remove($left($2-,100),,,) $+ * | spf.jm.send.tcp chat me $remove($left($2-,100),,,) | goto end }
  if ($1 == /msg) { spf.chatdraw 16515072 < $+ %spf.multi.2.nick $+ > ( $+ $2 $+ ) $remove($left($3-,100),,,) | spf.jm.send.tcp chat priv $2 $remove($left($3-,100),,,) | goto end }
  if (// == $left($1,2)) { spf.chatdraw 16515072 < $+ %spf.multi.2.nick $+ > ( $+ $remove($1,/) $+ ) $remove($left($2-,100),,,) | spf.jm.send.tcp chat priv $remove($1,/) $remove($left($2-,100),,,) | goto end }
  if (%spf.splayer) { goto next }
  if ($1 == ?ping) { %spf.ping = $uptime(mirc,ms) | spf.jm.send.udp [ %spf.2.un ] PING | goto end }
  if ($1 == ?packetloss) { spf.jm.send.udp [ %spf.2.un ] PAKLOSS %Spf.2.pakloss | goto end }
  if ($1 == ?data) { spf.jm.send.udp [ %spf.2.un ] TDATA | goto end } 
  if ($1 == ?users) { spf.jm.send.tcp ALLUSR | goto end }
  if (/ == $left($1,1)) { spf.chatdraw 37632 * Command Not Supported * | goto end }
  if (? == $1) { goto next }
  if (? == $left($1,1)) && (?? != $left($1,2)) { spf.jm.send.tcp $1- | goto end }
  :next
  spf.chatdraw 65535 < $+ %spf.multi.2.nick $+ > $remove($left($1-,100),,,)
  spf.jm.send.tcp chat n $remove($left($1-,100),,,)
  :end
  window -a @spacefighter
  dialog -x spf.msgd
  .halt
}
on *:INPUT:@Spf.msg: {
  if ($1 == /me) { spf.chatdraw 255 * $+ %spf.multi.2.nick $remove($left($2-,100),,,) $+ * | spf.jm.send.tcp chat me $remove($left($2-,100),,,) | goto end }
  if ($1 == /msg) { spf.chatdraw 16515072 < $+ %spf.multi.2.nick $+ > ( $+ $2 $+ ) $remove($left($3-,100),,,) | spf.jm.send.tcp chat priv $2 $remove($left($3-,100),,,) | goto end }
  if (// == $left($1,2)) { spf.chatdraw 16515072 < $+ %spf.multi.2.nick $+ > ( $+ $remove($1,/) $+ ) $remove($left($2-,100),,,) | spf.jm.send.tcp chat priv $remove($1,/) $remove($left($2-,100),,,) | goto end }
  if (%spf.splayer) { goto next }
  if ($1 == ?ping) { %spf.ping = $uptime(mirc,ms) | spf.jm.send.udp [ %spf.2.un ] PING | goto end }
  if ($1 == ?packetloss) { spf.jm.send.udp [ %spf.2.un ] PAKLOSS %Spf.2.pakloss | goto end }
  if ($1 == ?data) { spf.jm.send.udp [ %spf.2.un ] TDATA | goto end } 
  if ($1 == ?users) { spf.jm.send.tcp ALLUSR | goto end }
  if (/ == $left($1,1)) { spf.chatdraw 37632 * Command Not Supported * | goto end }
  if (? == $1) { goto next }
  if (? == $left($1,1)) && (?? != $left($1,2)) { spf.jm.send.tcp $1- | goto end }
  :next
  spf.chatdraw 65535 < $+ %spf.multi.2.nick $+ > $remove($left($1-,100),,,)
  spf.jm.send.tcp chat n $remove($left($1-,100),,,)
  :end
  window -a @spacefighter
  window -c @spf.msg
  .halt
}
;1 Score
;2 Frags
;3 Deaths
alias -l spf.scoredraw { 
  if (!$window(Spf.score)) { .halt }
}
alias -l spf.2.main.read {
  if ($2 == CHAT) {
    if ($3 == n) { spf.chatdraw 32764 < $+ $gettok(%Spf.2.u [ $+ [ $1 ] ],2,1) $+ > $4-  } 
    if ($3 == me) { spf.chatdraw 255 * $+ $gettok(%Spf.2.u [ $+ [ $1 ] ],2,1) $4- $+ * }
    if ($3 == priv) { if ($4 == %spf.multi.2.nick) { spf.chatdraw 32764 < $+ $gettok(%Spf.2.u [ $+ [ $1 ] ],2,1) $+ > ( $+ %spf.multi.2.nick $+ ) $5- } }
    .halt
  }
  if ($2 == SVICE) { 
    if (%Spf.dmeth.1 != 3) && (%spf.fps.av) && (%spf.fps.av != 0) { spf.speedconfig $calc($calc(30 - %spf.fps.av) * 10) 2 }
    .halt 
  }
  if ($1 == SMSG) { spf.chatdraw 37632 * <Server Msg> $2- * | .halt }
  if ($1 == ALLUSR) { spf.chatdraw 37632 * This Server Has Had $2 Users Over Its LifeSpan * | .halt }
  if ($1 == SERVREPLY) { spf.chatdraw 37632 * $2- * | .halt }
  if ($1 == SCORE) {
    if (!$window(@Spf.score)) { .halt }
    spf.scorewin 2
    drawtext -rpob @Spf.score 173566 1 Verdana 10 20 20 _Game Scores_ 
    drawtext -rob @Spf.score 173566 1 Verdana 10 20 50 Nick Score/Frags/Deaths
    var %spf.sc.pak.tmp = $2, %spf.sc.draw = 80
    tokenize 5 $3-
    if ($gettok(%spf.sc.pak.tmp,1,44) == %spf.2.un) { drawtext -orpb @Spf.score 255 1 Verdana 10 20 %spf.sc.draw * $+ %spf.multi.2.nick $gettok($1,1,44) $+ / $+ $gettok($1,2,44) $+ / $+ $gettok($1,3,44) $+ * | inc %spf.sc.draw 20 }
    if ($gettok(%spf.sc.pak.tmp,2,44) == %spf.2.un) { drawtext -orpb @Spf.score 255 1 Verdana 10 20 %spf.sc.draw * $+ %spf.multi.2.nick $gettok($2,1,44) $+ / $+ $gettok($2,2,44) $+ / $+ $gettok($2,3,44) $+ * | inc %spf.sc.draw 20 }
    if ($gettok(%spf.sc.pak.tmp,3,44) == %spf.2.un) { drawtext -orpb @Spf.score 255 1 Verdana 10 20 %spf.sc.draw * $+ %spf.multi.2.nick $gettok($3,1,44) $+ / $+ $gettok($3,2,44) $+ / $+ $gettok($3,3,44) $+ * | inc %spf.sc.draw 20 }
    if ($gettok(%spf.sc.pak.tmp,4,44) == %spf.2.un) { drawtext -orpb @Spf.score 255 1 Verdana 10 20 %spf.sc.draw * $+ %spf.multi.2.nick $gettok($4,1,44) $+ / $+ $gettok($4,2,44) $+ / $+ $gettok($4,3,44) $+ * | inc %spf.sc.draw 20 }
    if (%Spf.2.u [ $+ [ $gettok(%spf.sc.pak.tmp,1,44) ] ]) { drawtext -porb @Spf.score 255 1 Verdana 10 20 %spf.sc.draw $gettok(%Spf.2.u [ $+ [ $gettok(%spf.sc.pak.tmp,1,44) ] ],2,1) $gettok($1,1,44) $+ / $+ $gettok($1,2,44) $+ / $+ $gettok($1,3,44) | inc %spf.sc.draw 20 }
    if (%Spf.2.u [ $+ [ $gettok(%spf.sc.pak.tmp,2,44) ] ]) { drawtext -porb @Spf.score 255 1 Verdana 10 20 %spf.sc.draw $gettok(%Spf.2.u [ $+ [ $gettok(%spf.sc.pak.tmp,2,44) ] ],2,1) $gettok($2,1,44) $+ / $+ $gettok($2,2,44) $+ / $+ $gettok($2,3,44) | inc %spf.sc.draw 20 }
    if (%Spf.2.u [ $+ [ $gettok(%spf.sc.pak.tmp,3,44) ] ]) { drawtext -porb @Spf.score 255 1 Verdana 10 20 %spf.sc.draw $gettok(%Spf.2.u [ $+ [ $gettok(%spf.sc.pak.tmp,3,44) ] ],2,1) $gettok($3,1,44) $+ / $+ $gettok($3,2,44) $+ / $+ $gettok($3,3,44) | inc %spf.sc.draw 20 }
    if (%Spf.2.u [ $+ [ $gettok(%spf.sc.pak.tmp,4,44) ] ]) { drawtext -porb @Spf.score 255 1 Verdana 10 20 %spf.sc.draw $gettok(%Spf.2.u [ $+ [ $gettok(%spf.sc.pak.tmp,4,44) ] ],2,1) $gettok($4,1,44) $+ / $+ $gettok($4,2,44) $+ / $+ $gettok($4,3,44) | inc %spf.sc.draw 20 }
    .halt 
  }
  if ($2 == HIT) { 
    if ($3 == %spf.2.un) { spf.chatdraw 37632 *** %spf.multi.2.nick was killed by $gettok(%Spf.2.u [ $+ [ $4 ] ],2,1) *** | .halt }
    if ($4 == %spf.2.un) { spf.chatdraw 37632 *** $gettok(%Spf.2.u [ $+ [ $3 ] ],2,1) was killed by %spf.multi.2.nick *** | .halt }
    spf.chatdraw 37632 *** $gettok(%Spf.2.u [ $+ [ $3 ] ],2,1) was killed by $gettok(%Spf.2.u [ $+ [ $4 ] ],2,1) *** 
    .halt
  }
  if ($2 == JOIN) { 
    %spf.2.u [ $+ [ $1 ] ] = act $+ $chr(1) $+ $gettok($4,1,1)
    %spf.ud. [ $+ [ $1 ] ] = -200 -200 0 62 34 35 SpaceFighter\Bitmaps\ship1.bmp 
    spf.chatdraw 37632 * $gettok($4,1,1) Is Joining The Game *
    if ($active != @Spacefighter) { flash -b @SpaceFighter }
    .halt 
  }
  if ($2 == DOWN) { 
    if (!$gettok(%Spf.2.u [ $+ [ $1 ] ],2,1)) { goto next }
    spf.chatdraw 37632 * $gettok(%Spf.2.u [ $+ [ $1 ] ],2,1) Has Left The Game *
    :next
    unset %spf.2.u [ $+ [ $1 ] ]
    unset %spf.ud. [ $+ [ $1 ] ]
    .halt
  }
  if ($1 == UBAN) { 
    spf.chatdraw 37632 * $gettok(%Spf.2.u [ $+ [ $2 ] ],2,1) Has Been Banned *
    unset %spf.2.u [ $+ [ $3 ] ]
    unset %spf.ud. [ $+ [ $3 ] ]
    .halt
  }
  if ($1 == BANNED) { spf.menudraw You Have Been Banned From This Server | .timerSpf.menu off | .halt }
  if ($1 == BANNED2) { spf.chatdraw 37632 * You Have Been Banned From This Server * | titlebar @Spacefighter - Banned! | spf.close | spf.menu refresh | .halt }
  if ($1 == VERROR) { 
    if ($spf.ver(2) < $2) { spf.menudraw Your Version $spf.ver(2) Is To Old Or Is Invalid, Get Ver $2 }
    if ($spf.ver(2) == $2) { spf.menudraw Your Build Version Is Not Matching The Servers. | spf.menudraw If You See This Message On Other Servers Re-install }
    spf.menudraw Your Version $spfver(2) Is Newer Than The Servers, There Is Therefor Is An Incompatiblity Error
    titlebar @Spacefighter - The Loading Screen - Disconnected - Version Error | .timerSpf.menu off | spf.dl | .halt
  }
  if ($1 == MAP) {
    if ($exists(SpaceFighter\Maps\ $+ $2)) && ($file(SpaceFighter\Maps\ $+ $2).size == $3) { 
      spf.menudraw You Do Not Need To Download The Map: $2
      if (%spf.ip) { spf.jm.send.tcp CONFIRM [ %spf.multi.2.nick ] $+ $chr(1) $+ [ %spf.ip ] | .halt } 
      if ($ip) { spf.jm.send.tcp CONFIRM [ %spf.multi.2.nick ] $+ $chr(1) $+ [ $ip ] | .halt }
      spf.jm.send.tcp CONFIRM [ %spf.multi.2.nick ] $+ $chr(1) $+ [ 127.0.0.1 ] | .halt 
    } 
    if ($exists(SpaceFighter\Maps\ $+ $2)) { .remove SpaceFighter\Maps\ $+ $2 }
    %spf.2.maptotal = $4
    %spf.2.mapdone = 0
    spf.jm.send.tcp GETMAP 0
    spf.menudraw Downloading Map $2
    titlebar @Spacefighter - The Loading Screen - Downloading %0
    .halt
  } 
  if ($1 == RECMAP) {
    inc %spf.2.mapdone
    titlebar @Spacefighter - The Loading Screen - Downloading % $+ $int($calc(%spf.2.mapdone / %spf.2.maptotal * 100))
    write SpaceFighter\Maps\ $+ $2-
    if (%spf.2.mapdone != %spf.2.maptotal) { spf.jm.send.tcp GETMAP %spf.2.mapdone | .halt }
    if (%spf.ip) { spf.jm.send.tcp CONFIRM [ %spf.multi.2.nick ] $+ $chr(1) $+ [ %spf.ip ] | .halt } 
    if ($ip) { spf.jm.send.tcp CONFIRM [ %spf.multi.2.nick ] $+ $chr(1) $+ [ $ip ] | .halt } 
    spf.menudraw Download Of Map Complete
    spf.jm.send.tcp CONFIRM [ %spf.multi.2.nick ] $+ $chr(1) $+ [ 127.0.0.1 ] | .halt 
  }
  if ($1 == USRNUM) { 
    spf.menudraw Synchronizing Data With Server 
    %spf.2.un = $2 
    spf.jm.send.tcp VCHECK $spf.ver(1)
    .halt 
  }
  if ($1 == FTJ) { 
    titlebar @Spacefighter - The Loading Screen - Testing UDP
    spf.menudraw Testing Udp & Joining Game!
    if ($2 == 0) { goto end }
    if ($2 != 0) {
      tokenize 5 $3- 
    }
    var %a = 1
    var %b = 1
    :loop  
    if ($gettok($ [ $+ [ %a ] ],1,44) == %b) { 
      set %Spf.2.u [ $+ [ %b ] ] act $+ [ $chr(1) ] $+ $gettok($ [ $+ [ %a ] ],2,44) 
      if (%b == 5)  { 
        set %Spf.ud. [ $+ [ %b ] ] -200 -200 0 62 34 35 SpaceFighter\Bitmaps\ship1.bmp
      }
      if (%b == 2) { 
        set %Spf.ud. [ $+ [ %b ] ] -200 -200 1 98 34 40 SpaceFighter\Bitmaps\ship1.bmp
      }
      if (%b == 3) { 
        set %Spf.ud. [ $+ [ %b ] ] -200 -200 1 98 34 40 SpaceFighter\Bitmaps\ship1.bmp
      }
      if (%b == 4) { 
        set %Spf.ud. [ $+ [ %b ] ] -200 -200 0 62 34 35 SpaceFighter\Bitmaps\ship1.bmp
      }
      goto 2 
    } 
    if (%b == 5) { goto 2 }
    if (%b != 5) { inc %b | goto loop }
    :2
    if (%a == 4) { goto end }
    %b = 0 | inc %a | goto loop
    :end
    %spf.2.ip = $ip
    if (!$ip) { %spf.2.ip = 127.0.0.1 }
    spf.jm.send.udp [ %spf.2.un ] TEST
    .timerspf.udpcheck -o 1 20 spf.udp.error
  }
}
alias -l spf.udp.error {
  spf.menudraw UDP Test Failed
  spf.menudraw Type /localinfo -uh In mIRC And Please Try Again
  spf.menudraw For More Infomation Check Trouble Shooting
}
;%Spf.ud. == User Details eg 12 3 0 0 BITMAP.1 BLAH BLAH BLAH


;Server
;Udp Send
alias -l spf.s.1.send.udp { sockudp -tkn spf.1 $calc(%spf.multi.port - 1) $1 %spf.multi.port $2- }
;Tcp Send
alias -l spf.s.1.send.tcp { if ($sock(spf.s.1.u [ $+ [ $1 ] ])) sockwrite -tn spf.s.1.u [ $+ [ $1 ] ] $2- }
;All Send will send all data to active users excluding the user who the original data it received data from
;All Send!! TCP
alias -l spf.s.1.as.tcp {
  if ($gettok(%Spf.u5,1,1) == act) && ($1 != 5) { spf.s.1.send.tcp 5 $1- }
  if ($gettok(%Spf.u2,1,1) == act) && ($1 != 2) { spf.s.1.send.tcp 2 $1- }
  if ($gettok(%Spf.u3,1,1) == act) && ($1 != 3) { spf.s.1.send.tcp 3 $1- }
  if ($gettok(%Spf.u4,1,1) == act) && ($1 != 4) { spf.s.1.send.tcp 4 $1- } 
}
;All Send!! UDP
alias -l spf.s.1.as.udp {
  if ($gettok(%Spf.u5,1,1) == act) && ($1 != 5) { spf.s.1.send.udp $gettok(%Spf.u [ $+ [ 5 ] ],3,1) 5 $2- }
  if ($gettok(%Spf.u2,1,1) == act) && ($1 != 2) { spf.s.1.send.udp $gettok(%Spf.u [ $+ [ 2 ] ],3,1) 2 $2- }
  if ($gettok(%Spf.u3,1,1) == act) && ($1 != 3) { spf.s.1.send.udp $gettok(%Spf.u [ $+ [ 3 ] ],3,1) 3 $2- }
  if ($gettok(%Spf.u4,1,1) == act) && ($1 != 4) { spf.s.1.send.udp $gettok(%Spf.u [ $+ [ 4 ] ],3,1) 4 $2- } 
}
alias -l spf.s.udpcompile { 
  unset %spf.s.ctemp
  if (%spf.1.ud.5) { %spf.s.ctemp = %spf.s.ctemp $+ %spf.1.ud.5 $+ , | %spf.s.ctemp2 = 5, }
  if (%spf.1.ud.2) { %spf.s.ctemp = %spf.s.ctemp $+ %spf.1.ud.2 $+ , | %spf.s.ctemp2 = %spf.s.ctemp2 $+ 2, }
  if (%spf.1.ud.3) { %spf.s.ctemp = %spf.s.ctemp $+ %spf.1.ud.3 $+ , | %spf.s.ctemp2 = %spf.s.ctemp2 $+ 3, }
  if (%spf.1.ud.4) { %spf.s.ctemp = %spf.s.ctemp $+ %spf.1.ud.4 | %spf.s.ctemp2 = %spf.s.ctemp2 $+ 4 }
  spf.s.1.as.udp 6 CDATA %spf.s.ctemp2 %spf.s.ctemp
  unset %spf.s.ctemp
  unset %spf.s.ctemp2
}
;Manages The Udp Connections... Hmm Hopefully this will work
on *:UDPREAD:spf.1: {
  sockread %spf.s.udp
  spf.s.udp.read $sock($sockname).saddr %spf.s.udp
}
alias -l spf.s.udp.read {
  inc %spf.pak.2. [ $+ [ $2 ] ]
  if ($1 != $gettok(%Spf.u [ $+ [ $2 ] ],3,1)) { spf.servecho Error In Recieved Udp Data, Ip Mismatch < $+ $asctime(hh:nn:ss) $+ > | spf.servecho $1- | .halt }
  if ($3 == DATA) { set %spf.1.ud. [ $+ [ $2 ] ] $4- | .halt }
  if ($3 == FIRE) { spf.s.1.as.udp $2- | .halt }
  if ($3 == PING) { spf.s.1.send.udp $1 $2 PONG | .halt }
  if ($3 == PAKLOSS) { spf.s.1.send.udp $1 $2 PAKLOSS $round($calc(100 - $calc($4 / %spf.pak.2. [ $+ [ $2 ] ] * 100)),0) $+ % | .halt }
  if ($3 == TDATA) { spf.s.1.send.udp $1 $2 TDATA $round($calc($sock(spf.1).sent / 1024),1) $+ k $round($calc($sock(spf.1).rcvd / 1024),1) $+ k | .halt }
  if ($3 == TEST) { spf.servecho Server Has Recieved A UDP Test Packet | spf.s.1.send.udp $gettok(%Spf.u [ $+ [ $2 ] ],3,1) $2 AOK $nopath(%Spf.multi.map) | .halt }
}
;Listens And Assigns Incoming Game Connection To Server
on *:SOCKLISTEN:spf.s.main: {
  spf.servecho Incoming Connection Detected
  if (%spf.tusr.num == %spf.usrmax.num) { spf.servecho Server Full | .halt }
  if ($gettok(%Spf.u5,1,1) != act) && (!$sock(spf.s.1.u5)) { %spf.s.usr.num = 5 | goto end }
  if ($gettok(%Spf.u2,1,1) != act) && (!$sock(spf.s.1.u2)) { %spf.s.usr.num = 2 | goto end }
  if ($gettok(%Spf.u3,1,1) != act) && (!$sock(spf.s.1.u3)) { %spf.s.usr.num = 3 | goto end }
  if ($gettok(%Spf.u4,1,1) != act) && (!$sock(spf.s.1.u4)) { %spf.s.usr.num = 4 | goto end } 
  spf.error An Over/Under Calculation error has been detected in the server script, Things should be fine but user may experience problems joining your server. Report This Bug 
  .halt
  :end
  sockaccept spf.s.1.u [ $+ [ %spf.s.usr.num ] ]
  inc %spf.tusr.num
  inc %spf.s.all
  spf.s.1.send.tcp %spf.s.usr.num USRNUM %spf.s.usr.num
}
on *:SOCKREAD:spf.s.1.u*: { 
  sockread %spf.s.1.read
  spf.s.1.read $mid($sockname,10,10) [ %spf.s.1.read ]
}
on *:SOCKCLOSE:spf.s.1.u*: { 
  spf.servecho User $gettok(%Spf.u [ $+ [ $mid($sockname,10,10) ] ],2,1) Has Disconnected
  spf.downuser $mid($sockname,10,10)
} 
alias -l spf.downuser {
  dec %spf.tusr.num 
  unset %Spf.u [ $+ [ $1 ] ] 
  unset %spf.pak.2. [ $+ [ $1 ] ]
  unset %spf.1.ud. [ $+ [ $1 ] ] 
  if ($2 != ban) { spf.s.1.as.tcp $1 DOWN $1 }
}
;1 Score
;2 Frags
;3 Deaths
;5 HIT 4 
;CONFIRM... what happens after this is that it creates a list of all the active users details and sends it via tcp to the user who requires it. If the user is the only user a 0 is sent
alias -l spf.s.1.read {
  if ($2 == CHAT) { spf.s.1.as.tcp $1- | .halt }
  if ($2 == HIT) {
    var %s1 = $gettok(%Spf.s.sc. [ $+ [ $1 ] ],1,44) | dec %s1 10
    var %s2 = $gettok(%Spf.s.sc. [ $+ [ $1 ] ],2,44)
    var %s3 = $gettok(%Spf.s.sc. [ $+ [ $1 ] ],3,44) | inc %s3 1
    var %s4 = $gettok(%Spf.s.sc. [ $+ [ $3 ] ],1,44) | inc %s4 10
    var %s5 = $gettok(%Spf.s.sc. [ $+ [ $3 ] ],2,44) | inc %s5 1
    var %s6 = $gettok(%Spf.s.sc. [ $+ [ $3 ] ],3,44)
    %Spf.s.sc. [ $+ [ $1 ] ] = %s1 $+ $chr(44) $+ %s2 $+ $chr(44) $+ %s3
    %Spf.s.sc. [ $+ [ $3 ] ] = %s4 $+ $chr(44) $+ %s5 $+ $chr(44) $+ %s6
    spf.s.1.as.tcp 6 HIT $1 $3
    .halt
  }
  if ($2 == SCORE) {
    unset %Spf.s.sc.compile
    if ($gettok(%Spf.u5,1,1) == act) { %Spf.s.sc.compile = %Spf.s.sc.5 $+ $chr(5) | %spf.s.sc.compile2 = 5, }
    if ($gettok(%Spf.u2,1,1) == act) { %Spf.s.sc.compile = %Spf.s.sc.compile $+ %Spf.s.sc.2 $+ $chr(5) | %spf.s.sc.compile2 = %spf.s.sc.compile2 $+ 2, }
    if ($gettok(%Spf.u3,1,1) == act) { %Spf.s.sc.compile = %Spf.s.sc.compile $+ %Spf.s.sc.3 $+ $chr(5) | %spf.s.sc.compile2 = %spf.s.sc.compile2 $+ 3, }
    if ($gettok(%Spf.u4,1,1) == act) { %Spf.s.sc.compile = %Spf.s.sc.compile $+ %Spf.s.sc.4 $+ $chr(5) | %spf.s.sc.compile2 = %spf.s.sc.compile2 $+ 4 } 
    spf.s.1.send.tcp $1 SCORE %spf.s.sc.compile2 %Spf.s.sc.compile
    unset %Spf.s.sc.compile
    unset %Spf.s.sc.complie2
    .halt
  }
  if ($2 == ALLUSR) { spf.s.1.send.tcp $1 ALLUSR %spf.s.all }
  if (? == $left($2,1)) { 
    if ($lines(%spf.trigger) == 0) { .halt } 
    var %t = 0
    :loop
    inc %t
    if ($gettok($read(%spf.trigger,%t),1,32) == $2) { 
      if ($gettok($read(%spf.trigger,%t),2,32) == 1) { spf.s.1.send.tcp $1 SERVREPLY $gettok($read(%spf.trigger,%t),3-,32) }
      if ($gettok($read(%spf.trigger,%t),2,32) == 2) { $gettok($read(%spf.trigger,%t),3-,32) }
    } 
    if (%t != $lines(%spf.trigger)) { goto loop }
    .halt
  }
  if ($2 == CONFIRM) { 
    var %spf.wr.tusr = $null
    var %c = $1, %bn = 1
    spf.s.1.as.tcp %c JOIN %c $3- 
    tokenize 1 $3-
    %Spf.u [ $+ [ %c ] ] = act $+ [ $chr(1) ] $+ [ $1 ] $+ [ $chr(1) ] $+ [ $2 ]
    %Spf.s.sc. [ $+ [ %c ] ] = 0,0,0
    if ($read(SpaceFighter\spfban.txt)) && (%spf.ban.num) && (%spf.ban.num != 0) { 
      :loop
      if ($gettok($read(SpaceFighter\Spfban.txt,%bn),1,32) == $gettok(%Spf.u [ $+ [ %c ] ],3,1)) { spf.s.1.send.tcp %c BANNED | spf.servecho User Has Been Banned From This Server | sockclose spf.s.u.1 [ $+ [ %c ] ] | .halt }
      if (%bn != %Spf.ban.num) { inc %bn | goto loop }
    }
    spf.servecho < $1 Ip = $2 >
    if (%spf.tusr.num <= 1) { spf.s.1.send.tcp %c FTJ 0 | goto end }
    if ($gettok(%Spf.u5,1,1) == act) && (%c != 5) { %spf.wr.tusr = %spf.wr.tusr $+ 5, $+ $gettok(%Spf.u5,2,1) $+ $chr(5) }
    if ($gettok(%Spf.u2,1,1) == act) && (%c != 2) { %spf.wr.tusr = %spf.wr.tusr $+ 2, $+ $gettok(%Spf.u2,2,1) $+ $chr(5) }
    if ($gettok(%Spf.u3,1,1) == act) && (%c != 3) { %spf.wr.tusr = %spf.wr.tusr $+ 3, $+ $gettok(%Spf.u3,2,1) $+ $chr(5) }
    if ($gettok(%Spf.u4,1,1) == act) && (%c != 4) { %spf.wr.tusr = %spf.wr.tusr $+ 4, $+ $gettok(%Spf.u4,2,1) $+ $chr(5) }
    if (%spf.wr.tusr != $null) { spf.s.1.send.tcp %c FTJ %spf.tusr.num %spf.wr.tusr | else { spf.s.1.send.tcp %c FTJ 0 } }
    :end
    .halt
  }
  if ($2 == GETMAP) { spf.s.1.send.tcp $1 RECMAP $nopath(%Spf.multi.map) $read(%Spf.multi.map,$calc($3 + 1)) | .halt } 
  if ($2 == VCHECK) {
    if ($3 != $spf.ver(1)) { spf.s.1.send.tcp $1 VERROR $spf.ver(2) | .halt }
  spf.s.1.send.tcp $1 MAP $nopath(%spf.multi.map) $file(%spf.multi.map).size $lines(%Spf.multi.map) | .halt }
}
;FIND SERVER/BE SERVER PROTOCOL
alias spf.servecho { 
  if (!$dialog(spf.serv.setup)) { .halt }
  if ($len($1-) > 34) { goto next }
  did -a spf.serv.setup 12 $1-
  goto end
  :next
  did -a spf.serv.setup 12 $left($1-,34)
  %spf.servecho.num = $calc($len($1-) - 34)
  did -a spf.serv.setup 12 $right($1-,%spf.servecho.num)
  :end
  unset %spf.servecho.num
}
alias -l spf.servlist.d { if (!$dialog(spf.servlist)) { dialog -omd spf.servlist spf.servlist | dialog -a spf.servlist spf.servlist } | else { dialog -a spf.servlist spf.servlist } }
alias -l spf.gs.d { dialog -md spf.g spf.g }
alias -l spf.serv.d { if (!$dialog(spf.serv.setup)) { dialog -omd spf.serv.setup spf.serv.setup | dialog -a spf.serv.setup spf.serv.setup } | else { dialog -a spf.serv.setup spf.serv.setup } }
;Server Side
alias -l spf.s.send { sockwrite -n spf.servadd $1- }
on *:SOCKOPEN:spf.servadd: {
  if ($sockerr > 0) { spf.servecho Error Connecting To Server | spf.error There was an error connecting to the server list. However the server is activated and will continue to function without being on the serverlist. | return }
  spf.s.send USER SpF $+ $rand(1,10000) "freeBSD.org" " $+ irc.austnet.org $+ " :www.freeBSD.org 
  spf.s.send NICK SpF $+ $rand(1,10000) $+ $rand(A,Z)
  spf.servecho Connected To Server!
}
on *:SOCKREAD:spf.servadd: {
  sockread %spf.servadd
  tokenize 32 %spf.servadd 
  if ($1 == NOTICE) { return }
  if ($2 == 332) { if ($gettok($remove($5-,:),1,5) != $spf.ver(1)) { spf.dl | spf.notice New Version Available, You Must Have This Version To Continue Serving. | .halt } | spf.notice $gettok($remove($5-,:),2,5) }
  if ($2 == 376) { spf.s.send JOIN #SpaceFighter $chr(118) $+ $chr(57) $+ $chr(48) $+ $chr(48) | spf.servecho Server Added To List! }
  if ($1 == ERROR) { spf.servecho Error $2- | unset %spf.multi.server | .timerspf.server 1 20 { %spf.multi.server = on | sockopen spf.servadd irc.austnet.org 6667 | spf.servecho Reconnecting To Server In 1 Min } }
  if ($1 == PING) { spf.s.send PONG $gettok($2,1-,58) }
  if ($2 == NOTICE) && ($remove($4,:) == </list\>) { sockwrite -n spf.servadd PRIVMSG $remove($gettok($replace($1,!,$chr(32)),1,32),:) : </server\> [ %spf.multi.name ] $+ [ $chr(5) ] $+ [ %spf.multi.ip ] $+ [ $chr(5) ] $+ [ %spf.multi.port ] $+ [ $chr(5) ] $+ [ %spf.multi.desc ] $+ [ $chr(5) ] $+ %spf.tusr.num $+ / $+ %spf.usrmax.num $+ [ $chr(5) ] $+ $spf.ver(2) }
}
on *:SOCKCLOSE:spf.servadd: { unset %spf.servadd | if (%spf.multi.server) { spf.servecho Disconnected From Serverlist... Retrying in 90 seconds < $+ $asctime(hh:nn tt) $+ > | .timerspf.servadd -o 1 90 sockopen spf.servadd irc.austnet.org 6667 } }
;End Server Side

;Client Find/List Serv

alias -l spf.fs.send { sockwrite -n spf.findserv $1- }
alias spf.fs.add { inc %spf.multi.servnum | hadd -m spf.servlist [ %spf.multi.servnum ] $1- | tokenize 5 [ $1- ] | spf.scroll.list | spf.slist.echo [ %spf.multi.servnum ] Servers Found! }
on *:SOCKOPEN:spf.findserv: {
  if ($sockerr > 0) { spf.slist.echo Error Connecting To The Server | return }
  %spf.multi.servnum = 0
  if ($hget(spf.servlist) != $null) { hfree spf.servlist | spf.scroll.refresh 1 }
  spf.fs.send USER SpF $+ $rand(1,10000) "freeBSD.org" " $+ irc.austnet.org $+ " :www.freeBSD.org 
  spf.fs.send NICK SpF $+ $rand(A,Z) $+ $rand(1,1000)
  spf.slist.echo Connected To The Server! Please Wait!
}
on *:SOCKREAD:spf.findserv: {
  sockread %spf.findserv
  tokenize 32 %spf.findserv 
  if ($1 == NOTICE) { return }
  if ($2 == 332) { if ($gettok($remove($5-,:),1,5) != $spf.ver(1)) { spf.slist.echo You have an invalid version, get the latest one | spf.dl | .halt } | spf.notice $gettok($remove($5-,:),2,5) }
  if ($1 == ERROR) { spf.slist.echo Error Loging In! $2- }
  if ($2 == 376) { spf.fs.send JOIN #SpaceFighter $chr(118) $+ $chr(57) $+ $chr(48) $+ $chr(48) | spf.fs.send notice #Spacefighter </list\> | spf.slist.echo 0 Servers Found }
  if ($1 == PING) { spf.fs.send PONG $gettok($2,1-,58) }
  if ($2 == PRIVMSG) && ($remove($5,:) == </server\>) { spf.fs.add $6- }
}

;End Client Find/List Serv
;Dialog for listing servers
dialog spf.servlist {
  title "SpaceFighter - Server List"
  size -1 -1 210 180
  option dbu
  box "",10, 2 0 206 178,
  button "&Close",1, 145 155 40 10 1,cancel
  button "&Join", 4, 7 155 40 10, 
  button "&Refresh", 5, 49 155 40 10,
  text "Opening Connection With Server", 6, 7 10 200 7, group
  list 2, 6 25 124 120,sizevsbar
  edit "" , 3, 132 25 72 120, read multi return vsbar
}
on *:DIALOG:spf.servlist:*:*: { 
  if ($devent == sclick) {
    if ($did == 2) { did -r spf.servlist 3 | did -a spf.servlist 3 $gettok($hget(spf.servlist,[ $did(spf.servlist,2,1).sel ]),4,5) }
    if ($did == 5) { did -r spf.servlist 3 | did -r spf.servlist 2 | did -a spf.servlist 6 Refreshing Server List | spf.multi findserv }
    if ($did == 4) { if (!$did(spf.servlist,2,1).sel) { .halt } | dialog -i spf.servlist | spf.multi join $hget(spf.servlist,[ $did(spf.servlist,2,1).sel ]) | dialog -ie spf.servlist }
    if ($did == 1) { sockclose spf.findserv | unset %spf.findserv | unset %spf.multi.servnum } 
  }
}
;End Find/List Serv
Dialog For Quick Select.... Replaced With Menu Window
dialog spf.g {
  title "Spacefighter"
  size -1 -1 100 50
  option dbu
  button "",1,1 1 1 1, cancel
  button "&Find Games",3,5 15 50 10,
  button "&Create Server",4,5 27 50 10, 
  box "Game Setup",2, 2 2 96 46,

}
on *:DIALOG:spf.g:*:*: { 
  if ($devent == sclick) {
    if ($did == 3) { spf.multi findserv | dialog -c spf.g } 
    if ($did == 4) { spf.serv.d | dialog -c spf.g }
  }
}
; The Dialog For Setting Up The Server
dialog spf.serv.setup {
  title "SpaceFighter - Server Setup"
  size -1 -1 270 200
  option dbu
  tab "Server" 36, 2 0 266 180
  tab "Triggers" 50
  button "&Close",1,2 185 40 10, cancel
  edit "Server Name" 3, 55 20 100 10, limit 50 tab 36
  edit "8989" 4, 55 35 100 10, autohs tab 36
  edit "Description" 5, 55 50 100 30, multi return limit 200 tab 36
  edit "" 9, 55 85 100 10, autohs, tab 36
  text "Server Name:", 6, 6 20 35 8, group tab 36
  text "Default Port:", 7, 6 35 30 8, group tab 36
  text "Server Description:", 8, 6 50 45 8, group tab 36
  text "Ip Address:", 10, 6 85 45 8, group tab 36
  text "Max No. Players:", 30, 6 102 45 8, group tab 36
  button "&Activate Server", 11,52 120 50 10, tab 36
  button "&De-Activate Server", 13,52 135 50 10, tab 36
  button "&Ban Manager", 40, 108 120 40 25, tab 36
  button "&Bandwidth", 41, 6 120 40 10, tab 36
  button "&Map Selection", 42, 6 135 40 10, tab 36
  radio "1", 32,55 100 14 12, tab 36
  radio "2", 33,75 100 14 12, tab 36
  radio "3", 34,95 100 14 12, tab 36
  radio "4", 35,115 100 14 12, tab 36
  text "You Must Leave This Dialog Open To Keep The Server Running!" 25, 6 153 200 10, tab 36
  list 12, 160 20 103 135,vsbar tab 36
  button "&Help",37, 228 185 40 10,
  list 60, 5 20 103 155,vsbar tab 50
  button "&Add", 61, 121 162 40 10, tab 50
  button "&Remove", 62, 166 162 40 10, tab 50

  edit "" 63, 120 41 140 20, multi tab 50,
  combo 65, 121 22 100 20, drop tab 50
  button "&Apply", 66, 121 70 50 10, tab 50
}
on *:DIALOG:spf.serv.setup:*:*: { 
  if ($devent == init) { 
    spf.trigger.load %spf.trigger 
    did -a spf.serv.setup 65 REPLY MESSAGE  
    did -a spf.serv.setup 65 PERFORM COMMAND 
    did -e spf.serv.setup 41
    did -b spf.serv.setup 13
    %Spf.usrmax.num = 4
    did -c spf.serv.setup 35
    spf.servecho Double click to clear
    if (!%spf.s.bandwidth) { %spf.s.bandwidth = 50 }
    if ($ip) { did -i spf.serv.setup 9 1 [ $ip ] }
    else { did -i spf.serv.setup 9 1 Cant Find Ip! Please Insert! } 
  }
  if ($devent == dclick) && ($did == 12) { did -r spf.serv.setup 12 }
  if ($devent == sclick) {
    if ($did == 37) { run spacefighter\readme.txt }
    if ($did == 32) { %spf.usrmax.num = 1 }
    if ($did == 33) { %spf.usrmax.num = 2 }
    if ($did == 34) { %spf.usrmax.num = 3 }
    if ($did == 35) { %spf.usrmax.num = 4 }
    if ($did == 40) { spf.banmanager }
    if ($did == 41) { spf.bandwidth }
    if ($did == 42) { spf.mapselect }
    if ($did == 1) { goto close }
    if ($did == 13) { goto close } 
    goto next
    :close
    did -b spf.serv.setup 13
    did -e spf.serv.setup 11
    did -e spf.serv.setup 41
    did -e spf.serv.setup 42
    did -e spf.serv.setup 32
    did -e spf.serv.setup 33
    did -e spf.serv.setup 34
    did -e spf.serv.setup 35
    did -e spf.serv.setup 3
    did -e spf.serv.setup 4
    did -e spf.serv.setup 5
    did -e spf.serv.setup 9
    .timerspf.service off
    .timerspf.packet off
    sockclose spf.s.main
    sockclose spf.1
    sockclose spf.servadd
    sockclose spf.s.1.u*
    unset %Spf.s.sc.*
    unset %Spf.u*
    unset %Spf.1.ud.*
    unset %Spf.tusr.num
    unset %Spf.s.usr.num
    unset %Spf.multi.name
    unset %Spf.multi.port
    unset %Spf.multi.desc
    unset %Spf.multi.map
    unset %Spf.multi.ip
    unset %Spf.multi.server
    unset %spf.pak.2.*
    unset %spf.s.ctemp
    unset %spf.servadd 
    unset %spf.s.all
    spf.servecho Server De-Activated At < $+ $asctime(hh:nn tt) $+ >
    :next
    if ($did == 11) {  
      if (!%spf.usrmax.num) { %Spf.usrmax.num = 4 }
      if (%Spf.multi.map == $null) { spf.error You did not select a map for the server. Please select one by clicking the button "Map Selection" in the Server dialog. | .halt }
      spf.servecho Server Activated At < $+ $asctime(hh:nn tt) $+ >
      %spf.s.usr.num = 0
      %spf.multi.name = $remove($did(spf.serv.setup,3).text,$chr(1),$chr(37))
      %spf.multi.port = $remove($did(spf.serv.setup,4).text,$chr(1),$chr(37))
      unset %spf.multi.desc
      var %spf.serv.lines.temp = 0
      :descloop
      inc %spf.serv.lines.temp
      %spf.multi.desc = %spf.multi.desc $+ $chr(32) $+ $remove($did(spf.serv.setup,5,%spf.serv.lines.temp).text,$chr(1),$chr(37))
      if (%spf.serv.lines.temp != $did(spf.serv.setup,5).lines) { goto descloop }
      %spf.multi.ip = $remove($did(spf.serv.setup,9).text,$chr(1),$chr(37))
      did -e spf.serv.setup 13
      did -b spf.serv.setup 11
      did -b spf.serv.setup 42
      did -b spf.serv.setup 3
      did -b spf.serv.setup 4
      did -b spf.serv.setup 5
      did -b spf.serv.setup 9
      did -b spf.serv.setup 41
      did -b spf.serv.setup 32
      did -b spf.serv.setup 33
      did -b spf.serv.setup 34
      did -b spf.serv.setup 35
      %spf.s.all = 0
      .timerspf.service -o 0 12 spf.s.1.as.tcp 6 SVICE
      .timerSpf.packet -om 0 [ %spf.s.bandwidth ] spf.s.udpcompile 
      spf.multi serv
    }
    if ($did == 60) { 
      did -r spf.serv.setup 63 
      did -c spf.serv.setup 65 $gettok($read(%spf.trigger,$did(spf.serv.setup,60).sel),2,32)
      did -a spf.serv.setup 63 $gettok($read(%spf.trigger,$did(spf.serv.setup,60).sel),3-,32) 
    }
    if ($did == 66) { 
      if ($did(spf.serv.setup,60).sel == $null) { .halt }
      if ($did(spf.serv.setup,60).seltext == $null) { spf.error You must fill in all details before applying | .halt }
      if ($did(spf.serv.setup,65).sel == $null) { spf.error You must fill in all details before applying | .halt }
      if ($did(spf.serv.setup,63).text == $null) { spf.error You must fill in all details before applying | .halt }
      var %v = 0, %e = $null
      :loop2
      inc %v
      %e = %e $did(spf.serv.setup,63,%v).text
      if (%v != $did(spf.serv.setup,63).lines) { goto loop2 }
      write -l [ $+ [ $did(spf.serv.setup,60).sel ] ] %spf.trigger $did(spf.serv.setup,60).seltext $did(spf.serv.setup,65).sel %e
    }
    if ($did == 61) { 
      dialog -i spf.serv.setup
      var %t = $$?="Enter A Trigger, Triggers must be created in this format: ?trigger"
      if (%t == $null) { dialog -ie spf.serv.setup | spf.error Error In Trigger Name, Triggers must be in the format ?trigger | .halt }
      if (? != $left(%t,1)) { dialog -ie spf.serv.setup | spf.error Error In Trigger Name, Triggers must be in the format ?trigger | .halt }
      write %spf.trigger %t
      dialog -ie spf.serv.setup
      spf.trigger.load
    }
    if ($did == 62) { 
      write -dl [ $+ [ $did(spf.serv.setup,60).sel ] ] %spf.trigger
      spf.trigger.load
    }
  }
}
alias spf.trigger.load {
  did -r spf.serv.setup 60
  if (!$exists(spacefighter\trigger.trig)) { write -c spacefighter\trigger.trig | goto end }
  if ($1-) { goto next }
  %spf.trigger = spacefighter\trigger.trig
  .timerspf2 -oh 1 0 spf.trigger.load spacefighter\trigger.trig
  :next
  if ($lines(%spf.trigger) == 0) { goto end }
  var %a = 0
  :loop
  inc %a
  did -a spf.serv.setup 60 $gettok($read(%spf.trigger,%a),1,32)
  if (%a != $lines(%spf.trigger)) { goto loop }
  :end
}
alias -l spf.bandwidth { if (!$dialog(spf.bandwidth)) { dialog -omd spf.bandwidth spf.bandwidth | dialog -a spf.bandwidth spf.bandwidth } | else { dialog -a spf.bandwidth spf.bandwidth } }
dialog spf.bandwidth {
  title "SpaceFighter - Bandwidth"
  size -1 -1 195 135
  option dbu
  button "",1,1 1 1 1, cancel 
  box "",3, 2 4 190 30
  radio "56k (Default, Good Packet Rate For All Connection Types)", 4,5 45 150 12, tab 1
  radio "DSL (High Bandwidth Connection Types)", 5,5 55 120 12, tab 1
  radio "Cable/LAN (Super High Bandwidth Connection Types)", 6,5 65 140 12, tab 1
  radio "User Defined Packet Speed", 7, 5 90 80 12, tab 1
  box "",9, 2 40 190 40
  box "",8, 2 85 190 30
  edit "50" 10, 84 91 15 10, limit 3 autohs tab 1
  text "ms delay between packet send." 11, 100 93 80 15, tab 1
  text "Select a connection speed your server is going to cater for. Remember higher settings require more processing for mIRC and will run very laggy on slow computers or on slow internet connections." 2, 6 10 180 20, tab 1
  text "20 Packets A Second" 12, 13 103 80 8, tab 1
  button "Ok", 13, 70 120 50 10, cancel
}
on *:DIALOG:spf.bandwidth:*:*: { 
  if ($devent == init) { %spf.s.bandwidth = 50 | did -c spf.bandwidth 4 | did -b spf.bandwidth 10 } 
  if ($did == 10) { if ($did(spf.bandwidth,10).text !isalpha) || ($did(spf.bandwidth,10).text !isalnum) || ($did(spf.bandwidth,10).text) { %spf.s.bandwidth = $did(spf.bandwidth,10).text } | goto calc }
  if ($devent == sclick) {
    if ($did == 4) { %spf.s.bandwidth = 50 | did -o spf.bandwidth 10 1 50 }
    if ($did == 5) { %spf.s.bandwidth = 40 | did -o spf.bandwidth 10 1 40 }
    if ($did == 6) { %spf.s.bandwidth = 30 | did -o spf.bandwidth 10 1 30 }
    if ($did isnum 4-6) { 
      did -b spf.bandwidth 10
      goto calc
    }
    if ($did == 7) { did -e spf.bandwidth 10 }
    goto end
    :calc
    if (%spf.s.bandwidth == 0) { did -o spf.bandwidth 12 1 1000 Packets A Second | goto end }
    if (!$round($calc(1000 / %spf.s.bandwidth),0)) { did -o spf.bandwidth 12 1 0 Packets A Second | goto end }
    did -o spf.bandwidth 12 1 $round($calc(1000 / %spf.s.bandwidth),0) Packets A Second 
    :end
  }
}
alias -l spf.banmanager { if (!$dialog(spf.banmanager)) { dialog -omd spf.banmanager spf.banmanager | .halt } | else { dialog -a spf.banmanager spf.banmanager } }
dialog spf.banmanager {
  title "SpaceFighter - Ban Manager"
  size -1 -1 195 160
  option dbu
  tab "Current Bans",11, 2 0 190 140
  tab "Current Users",12  2 0 190 140
  button "&Close",1, 2 145 40 10, cancel 
  list 3, 5 17 103 120, sizevsbar tab 11
  button "Un&Ban", 4, 120 25 30 10, tab 11
  button "Un&Ban All", 5, 155 25 30 10, tab 11
  button "&Help", 6,152 145 40 10,

  list 8, 5 17 103 123, tab 12
  button "&Ban User", 9, 128 25 50 10, tab 12

  button "Re&fresh", 10, 128 40 50 10,
}
on *:DIALOG:spf.banmanager:*:*: { 
  if ($devent == init) { %spf.ban.num = $lines(SpaceFighter\spfban.txt) | spf.list2 | goto list }
  goto next
  :list
  did -r spf.banmanager 3
  if (%spf.ban.num < 1) || (!%spf.ban.num) { goto end }
  var %spf.ban.tmp = 0
  :loop
  inc %spf.ban.tmp
  did -a spf.banmanager 3 $read(SpaceFighter\spfban.txt,%spf.ban.tmp)
  if (%spf.ban.num == $null) { spf.error error } 
  if (%spf.ban.tmp != %spf.ban.num) { goto loop }
  else { .halt }
  :next
  if ($devent == sclick) {
    if ($did == 4) { if (!$did(spf.banmanager,3,1).sel) { goto end } | write -dl $+ $did(spf.banmanager,3,1).sel SpaceFighter\spfban.txt | dec %spf.ban.num | goto list }
    if ($did == 5) { unset %spf.ban.num | write -c SpaceFighter\spfban.txt | goto list }
    if ($did == 6) { run spacefighter\readme.txt }
    if ($did == 9) { 
      if (!$did(spf.banmanager,8,1).text) { goto end }
      inc %spf.ban.num 
      write SpaceFighter\spfban.txt $gettok($did(spf.banmanager,8,1).text,2,32) $gettok(%Spf.u [ $+ [ $gettok($did(spf.banmanager,8,1).text,3,32) ] ],2,1)
      spf.s.1.send.tcp $gettok($did(spf.banmanager,8,1).text,3,32) BANNED2
      spf.s.1.as.tcp $gettok($did(spf.banmanager,8,1).text,3,32) UBAN $gettok($did(spf.banmanager,8,1).text,3,32) 
      spf.downuser $gettok($did(spf.banmanager,8,1).text,3,32) BAN
      spf.list2
      goto list
    }
    if ($did == 10) { spf.list2 | goto list }
    if ($did == 1) { unset %spf.ban.num }
    :end
  }
}
alias -l spf.mapselect { if (!$dialog(spf.mapselect)) { dialog -omd spf.mapselect spf.mapselect | dialog -a spf.mapselect spf.mapselect | did -z spf.mapselect 4 } | else { dialog -a spf.mapselect spf.mapselect } }
dialog spf.mapselect {
  title "SpaceFighter - Map Select(a)"
  size -1 -1 195 150
  option dbu
  box "Select A Map",3, 2 2 191 146
  button "",1,1 1 1 1, cancel 
  button "&Browse", 2, 124 109 50 10,
  button "&Select", 5, 124 124 50 10, cancel
  box "Comments", 8, 115 10 70 90
  text "" 6, 120 20 55 70, read return multi vsbar
  list 4, 5 10 103 135,size vsbar hsbar autohs
}
on *:DIALOG:spf.mapselect:*:*: { 
  if ($devent == init) { 
    did -b spf.mapselect 5 
    spf.rebound $findfile(SpaceFighter\Maps\,*.spf,0,spf.mapcheck 2 $1-)
  }
  if ($devent == sclick) {
    if ($did == 4) { did -e spf.mapselect 5 | did -o spf.mapselect 6 1 $mid($read($did(spf.mapselect,4).seltext,3),3,100)  }
    if ($did == 5) { %spf.multi.map = $mircdir $+ $did(spf.mapselect,4,1).seltext | spf.servecho $nopath(%spf.multi.map) Selected! }
    if ($did == 2) { spf.mapcheck 1 $file="Select A Map" [ spacefighter\maps\ $+ *.spf ]  }
  }
}
alias -l spf.rebound
alias -l spf.mapcheck {
  if ($2 == $null) { .halt }
  if ($gettok($read($2-,1),2,44) == SpaceFighter) && ($gettok($read($2-,1),4,44) <= $spf.ver(2)) { did -a spf.mapselect 4 $remove($2-,$mircdir) | .halt } 
  else { if ($1 == 1) { spf.error This is either not a valid SpaceFighter map or is unsupported by this version of SpaceFighter. } }
} 
alias -l spf.list2 { 
  did -r spf.banmanager 8
  if ($gettok(%Spf.u5,1,1) == act) { did -a spf.banmanager 8 $gettok(%Spf.u5,2,1) $gettok(%Spf.u5,3,1) 5 }
  if ($gettok(%Spf.u2,1,1) == act) { did -a spf.banmanager 8 $gettok(%Spf.u2,2,1) $gettok(%Spf.u2,3,1) 2 }
  if ($gettok(%Spf.u3,1,1) == act) { did -a spf.banmanager 8 $gettok(%Spf.u3,2,1) $gettok(%Spf.u3,3,1) 3 }
  if ($gettok(%Spf.u4,1,1) == act) { did -a spf.banmanager 8 $gettok(%Spf.u4,2,1) $gettok(%Spf.u4,3,1) 4 }
}
; End PTP Protocol.. Thats It

;SpaceFighter Game Engine - Developed By Justin Mammarella (ToKeN)
;Engine was originally intended to handle unlimited users... but due to obvious mIRC speed issues ive had to cut the infinite user
;feature in some aliases out... eg. Spf.Process... my original idea was to have mIRC guess a player location making the game run much more
;realistic however this is not possible... Spf.process would then have to calculate at max 3 more ships than what it is now. That would slow the speed of
;Player 1's ship * 3... not good
;However some features still remain infinite... eg spf.changedraw... spf.fireupdate... spf.speed
;An example of the engine being used in an instance other than the actual game itself is the deafualt menu... which can be accessed
;By typing /spacefighter

;Gets the ball rolling e.g starts mIRC processing
alias -l spf.load {  
  .timerSpf.menu off
  set %Spf.s.1 0
  set %Spf.ship.1 SpaceFighter\Bitmaps\ship [ $+ [ %spf.sw.select ] $+ ] .bmp
  set %Spf.shield.1 200
  set %Spf.bmp.1 0 62 34 35 %Spf.ship.1
  set %Spf.fire 0
  set %Spf.fire.1 0
  set %Spf.firecount -1
  set %Spf.sd.1 left
  spf.speedrestore
  if (!%Spf.dmeth.1) { %Spf.dmeth.1 = 1 }
  spf.scorewin s
  spf.skymaker %Spf.sw.tmp
  window -c @SpaceFighter
  spf.window
  titlebar @Spacefighter - [ %spf.multi.2.ip ] $+ : $+ [ %spf.multi.2.port ] - [ %spf.multi.2.sname ] - $nopath(%Spf.sw.tmp)
  window -a @SpaceFighter
  drawrect -rf @Spacefighter 0 1 -1 -1 680 610
  %spf.c.r = 0 | %spf.c.g = 0 | %spf.c.b = 255
  %Spf.game = on
  unset %spf.load
  if ($hget(Spfire) != $null) { hfree Spfire }
  if (!$hget(spfire)) { hmake spfire }
  %Spf.fps.t = $ctime
  .timerSpf.process -om 1 0 Spf.process
  .timerSpf -om 1 0 Spf.drawmethod [ $+ [ %Spf.dmeth.1 ] ]
  .timerSpfupdate -om 1 0 Spf.fireupdate
  drawtext -nr @Spacefighter 16777215 default 12 10 510 S p a c e F i g h t e r
  drawtext -nr @Spacefighter 16777215 default 12 10 540 Energy
  spf.chatdraw 37632 * [ %spf.multi.2.nick ] Has Joined The Game * | spf.chatdraw 37632 * Press Enter To Send A Msg *
}
;process =  The heart of the game this moves the ship according to its speed and direction *sigh*.. also manages if its ouside of the region required
;section above :next checks to see whether or not a ship is within its boundaries... if it isnt it bounces
alias -l Spf.process {
  if ($getdot(@Spf.cache,%Spf.hs.1,%Spf.vs.1) == 255) { goto next0 }
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 36),$calc(%Spf.vs.1 + 36)) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 36),%Spf.vs.1) == 255) { goto next0 }
  if ($getdot(@Spf.cache,%Spf.hs.1,$calc(%Spf.vs.1 + 36)) == 255) { goto next0 }    
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 20),$calc(%Spf.vs.1 + 36)) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 36),$calc(%Spf.vs.1 + 20)) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 20),%Spf.vs.1) == 255) { goto next0 }   
  if ($getdot(@Spf.cache,%Spf.hs.1,$calc(%Spf.vs.1 + 20)) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 36),$calc(%Spf.vs.1 + 20)) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 10),$calc(%Spf.vs.1 + 36)) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 36),$calc(%Spf.vs.1 + 10)) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 10),%Spf.vs.1) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,%Spf.hs.1,$calc(%Spf.vs.1 + 10)) == 255) { goto next0 }  
  if ($getdot(@Spf.cache,$calc(%Spf.hs.1 + 36),$calc(%Spf.vs.1 + 10)) == 255) { goto next0 } 
  if ($inrect(%Spf.hs.1,%Spf.vs.1,15,15,620,435)) { goto next2 }
  %Spf.hs.1 = $gettok(%Spf.startlc.1,1,32) | %Spf.vs.1 = $gettok(%Spf.startlc.1,2,32) | %spf.s.1 = 0 | goto next2 
  :next0 | if (- !isin %spf.s.1) { %spf.s.1 = - $+ [ %spf.s.1 ] | goto next2 } | %spf.s.1 = $remove(%spf.s.1,-)
  :next2
  if (%Spf.sd.1 == up) { dec %Spf.vs.1 %Spf.s.1 }
  if (%Spf.sd.1 == down) { inc %Spf.vs.1 %Spf.s.1 }
  if (%Spf.sd.1 == left) { inc %Spf.hs.1 %Spf.s.1 }
  if (%Spf.sd.1 == right) { dec %Spf.hs.1 %Spf.s.1 }
  if (%spf.shield.1 < 200) && ($calc(%spf.shield.1 + %spf.shield.s) < 210) { inc %spf.shield.1 %spf.shield.s }
  if (%spf.cr.1) { spf.changedraw 1 cr }
  .timerSpfprocess -om 1 0 Spf.process
}
;Good Old Algebra And Percentage Helped Me Figure Out How The Moderate Spacefighter Proccessing.
;Now different speed comps can play in sync... unreal aY!
;For Instance slower computers can play spacefighter with a low frame rate but can still be insync with the rest of the players
;Faster Computers will be able play at high frame rates but with the same processing speed 
;This system is also the first of its kind... never before been used in mIRC to my knowledge...
alias Spf.processtest { 
  if (%spf.tt == $null) && (%spf.test.s) {  
    %spf.tt = $ctime
    %spf.tp = 0 
    .timer* -p 
    var %spf.t.1 = up, %spf.tvs.1 = 0, %spf.ts.1 4, %spf.hvs.1 = 0, %spf.tsshiel.1 = 0
  }
  if (%Spf.t.1 == up) { dec %Spf.tvs.1 %Spf.ts.1 }
  if (%Spf.t.1 == down) { inc %Spf.tvs.1 %Spf.ts.1 }
  if (%Spf.t.1 == left) { inc %Spf.ths.1 %Spf.ts.1 }
  if (%Spf.t.1 == right) { dec %Spf.ths.1 %Spf.ts.1 }
  if (%spf.tsshield.1 != 200) { inc %spf.tsshield.1 2 }
  if (%spf.tp == 200) { 
    %spf.tresult = $calc($ctime - %spf.tt)
    spf.speedconfig $calc($calc(%spf.tresult - 12) * 10) set
    unset %spf.tt
    unset %spf.tp
    unset %spf.tr
    unset %spf.tresult
    unset %spf.test.s
    .timer* -r
    spacefighter
    .halt
  }
  inc %spf.tp
  drawrect -fr @Spacefighter 16617090 1 185 300 $calc(%spf.tp * 1.5) 5
  ;did -e spf.process.test 4
  ;echo Testing %spf.tp
  if (%spf.test.s) { .timerSpf.processtest -om 1 0 Spf.processtest }
  else { .halt }
}
alias -l spf.speedconfig {
  var %spf.max.s.old = %spf.max.s, %spf.min.s.old = %spf.min.s
  set %spf.fire.sdb $calc($1 / 100 * .25)
  set %spf.fire.sdb $calc(%spf.fire.sdb + .25)
  set %spf.max.s $calc($1 / 100 * 4.5)
  set %spf.max.s $calc(%spf.max.s + 4.5)
  set %spf.min.s $calc(%spf.max.s * -1)
  set %spf.fire.s $calc($1 / 100 * 12)
  set %spf.fire.s $calc(%spf.fire.s + 12)
  set %spf.shield.s $calc($1 / 100 * 1)
  set %spf.shield.s $calc(%spf.shield.s + 1)
  set %spf.ac.s $calc(%1 / 100 * .90)
  set %spf.ac.s $calc(%spf.ac.s + .90)
  set %spf.c.s $calc(%1 / 100 * 10)
  set %spf.c.s $calc(%spf.c.s + 10)
  set %spf.upd.s $calc(%1 / 100 * 1)
  set %spf.upd.s $calc(%spf.udp.s + 1)
  if ($2 == set) { spf.speedset }
}
alias -l spf.speedset {
  hadd -m spf.speedset 1 %spf.fire.sdb
  hadd -m spf.speedset 2 %spf.max.s
  hadd -m spf.speedset 3 %spf.min.s
  hadd -m spf.speedset 4 %spf.fire.s
  hadd -m spf.speedset 5 %spf.shield.s
  hadd -m spf.speedset 6 %spf.ac.s
  hadd -m spf.speedset 7 %spf.c.s
  hadd -m spf.speedset 8 %spf.udp.s
  hsave -o spf.speedset $scriptdir $+ spf.set
}
alias -l spf.speedrestore {
  if (!$hget(spf.speedset)) { hmake spf.speedset 100 | goto next }
  if ($hget(spf.speedset)) { goto next }
  :next
  hload spf.speedset $scriptdir $+ spf.set
  %spf.fire.sdb = $hget(spf.speedset,1)
  %spf.max.s = $hget(spf.speedset,2)
  %spf.min.s = $hget(spf.speedset,3)
  %spf.fire.s = $hget(spf.speedset,4)
  %spf.shield.s = $hget(spf.speedset,5)
  %spf.ac.s = $hget(spf.speedset,6)
  %spf.c.s = $hget(spf.speedset,7)
  %spf.upd.s = $hget(spf.speedset,8)
}
alias spf.speedtest {
  %spf.st = on
  %spf.test.m = 0
  spf.window
  titlebar @Spacefighter - Speed Test
  drawrect -nrf @Spacefighter 0 1 -1 -1 680 610
  spf.gradient
  drawtext -nrb @Spacefighter 16617090 1 Verdana 12 260 230 Testing mIRC's Speed
  drawtext -nrb @Spacefighter 16617090 1 Verdana 10 130 430 Please refrain from moving your mouse and/or touching your keyboard during testing
  drawtext -nrb @Spacefighter 16617090 1 Verdana 10 250 442 The test will restart if this is to occur
  drawrect -nr @Spacefighter 16617090 1 185 300 300 5
  drawdot @SpaceFighter
  %spf.test.s = on 
  Spf.processtest
}
menu @Spacefighter {
  mouse: { 
    if (%spf.test.s == on) && (%spf.game != on) && (%spf.mapmaker != on) && (%spf.load != on) && (%Spf.menu != on)  {
      inc %spf.test.m
      if (%spf.test.m == 10) { 
        unset %spf.tt
        unset %spf.tp
        unset %spf.tr
        unset %spf.tresult
        unset %spf.test.s
        %spf.test.m = 0
        Spf.speedtest 1

      } 
    }
  }
}
alias -l spf.processtest.d { if (!$dialog(spf.process.test)) { dialog -amd spf.process.test spf.process.test | .halt } | dialog -a spf.process.test spf.process.test }
dialog spf.process.test {
  title "SpaceFighter - Speed Test! & Config"
  size -1 -1 200 100
  option dbu
  button "",1,1 1 1 1, cancel 
  box "",10, 1 1 197 97,
  text "*IMPORTANT READ THIS*", 5, 5 10 70 10, autohs
  text "Spacefighter is about to test the Speed at which your mIRC can process at. During the testing time you should refrain from touching the keyboard and/or mouse of your computer! Without running the test Spacefighter will not run!  The speed test allows Spacefighter to be optimized for your mIRC! All running timers will be paused during testing time! The test will be cancelled if mouse movement is detected!" 2, 5 20 180 40, autohs
  text "", 3, 110 70 78 25, autohs
  button "&Start Testing", 4,4 70 100 20, 
}
on *:DIALOG:spf.process.test:*:*: {  
  if ($devent == mouse) { 
    if (%spf.test.s == on) { 
      unset %spf.test.s
      spf.error Test Cancelled! Mouse Or Keyboard Movement Detected 
      unset %spf.tp
      unset %spf.tr
      unset %spf.tresult
      unset %spf.test.s
      unset %spf.tt
      did -a spf.process.test 3 Please Retry!
      .timer? -r
  } }
  if ($devent == sclick) {
    if ($did == 4) { did -b spf.process.test 4 | %spf.test.s = on | spf.processtest }
  }
}
alias -l Spf.drawmethod1 { 
  drawpic -nc @Spacefighter 0 0 SpaceFighter\Bitmaps\spfstartmp.bmp
  drawrect -nrf @Spacefighter 0 1 0 560 220 20
  if (%spf.shield.1 > 0) drawrect -rf @Spacefighter $rgb(%spf.c.r,%spf.c.b,%spf.c.g) 1 10 560 %spf.shield.1 5
  dec %spf.c.r %spf.c.s | inc %spf.c.g %spf.c.s | inc %spf.c.b %spf.c.s
  if (%spf.2.u2) { drawpic -nct @Spacefighter 4227327 %Spf.ud.2 | drawtext -rn @Spacefighter 16777215 default 12 $gettok(%Spf.ud.2,1,32) $calc($gettok(%Spf.ud.2,2,32) - 20) $gettok(%Spf.2.u2,2,1) }
  if (%spf.2.u3) { drawpic -nct @Spacefighter 4227327 %Spf.ud.3 | drawtext -rn @Spacefighter 16777215 default 12 $gettok(%Spf.ud.3,1,32) $calc($gettok(%Spf.ud.3,2,32) - 20) $gettok(%spf.2.u3,2,1) }
  if (%spf.2.u4) { drawpic -nct @Spacefighter 4227327 %Spf.ud.4 | drawtext -rn @Spacefighter 16777215 default 12 $gettok(%Spf.ud.4,1,32) $calc($gettok(%Spf.ud.4,2,32) - 20) $gettok(%spf.2.u4,2,1) }
  if (%spf.2.u5) { drawpic -nct @Spacefighter 4227327 %Spf.ud.5 | drawtext -rn @Spacefighter 16777215 default 12 $gettok(%Spf.ud.5,1,32) $calc($gettok(%Spf.ud.5,2,32) - 20) $gettok(%spf.2.u5,2,1) }
  if (%spf.udp.data.s <= 0) && (!%spf.splayer) { drawtext -rn @Spacefighter 220 verdana 10 30 30 Warning: No UDP Data Coming From Server }
  dec %spf.udp.data.s %spf.upd.s
  drawpic -nct @Spacefighter 4227327 %Spf.hs.1 %Spf.vs.1 [ %Spf.bmp.1 ]
  drawtext -rn @Spacefighter 16777215 verdana 12 530 460 Frame Rate: %Spf.fps.f $+ fps
  if ($getdot(@Spf.cache,%Spf.hs.1,%Spf.vs.1) == 32768) { drawtext -rn @Spacefighter 16777215 verdana 12 20 460 SafeZone }
  drawdot @Spacefighter
  inc %spf.fps.v
  if ($calc(%spf.fps.t + 1) == $ctime) { %spf.fps.f = %spf.fps.v | %spf.fps.av = %spf.fps.av $+ $chr 32 $+ %spf.fps.v | unset %spf.fps.v | %spf.fps.t = $ctime }
  %spf.fps.av = $int($calc($calc($1 + %spf.fps.f) / 2))
  .timerSpf -om 1 0 Spf.drawmethod [ $+ [ %Spf.dmeth.1 ] ] %spf.fps.av
}
alias -l Spf.drawmethod2 { 
  drawpic -nc @Spacefighter 0 0 SpaceFighter\Bitmaps\spfstartmp.bmp
  drawrect -nrf @Spacefighter 0 1 0 560 220 20
  if (%spf.shield.1 > 0) drawrect -rf @Spacefighter $rgb(%spf.c.r,%spf.c.b,%spf.c.g) 1 10 560 %spf.shield.1 5
  dec %spf.c.r %spf.c.s | inc %spf.c.g %spf.c.s | inc %spf.c.b %spf.c.s
  if (%spf.2.u2) { drawpic -nct @Spacefighter 4227327 %Spf.ud.2 | drawtext -rn @Spacefighter 16777215 default 12 $gettok(%Spf.ud.2,1,32) $calc($gettok(%Spf.ud.2,2,32) - 20) $gettok(%Spf.2.u2,2,1) }
  if (%spf.2.u3) { drawpic -nct @Spacefighter 4227327 %Spf.ud.3 | drawtext -rn @Spacefighter 16777215 default 12 $gettok(%Spf.ud.3,1,32) $calc($gettok(%Spf.ud.3,2,32) - 20) $gettok(%spf.2.u3,2,1) }
  if (%spf.2.u4) { drawpic -nct @Spacefighter 4227327 %Spf.ud.4 | drawtext -rn @Spacefighter 16777215 default 12 $gettok(%Spf.ud.4,1,32) $calc($gettok(%Spf.ud.4,2,32) - 20) $gettok(%spf.2.u4,2,1) }
  if (%spf.2.u5) { drawpic -nct @Spacefighter 4227327 %Spf.ud.5 | drawtext -rn @Spacefighter 16777215 default 12 $gettok(%Spf.ud.5,1,32) $calc($gettok(%Spf.ud.5,2,32) - 20) $gettok(%spf.2.u5,2,1) }
  if (%spf.udp.data.s <= 0) && (!%spf.splayer) { drawtext -rn @Spacefighter 220 verdana 10 30 30 Warning: No UDP Data Coming From Server }
  dec %spf.udp.data.s %spf.upd.s
  drawpic -nct @Spacefighter 4227327 %Spf.hs.1 %Spf.vs.1 [ %Spf.bmp.1 ]
  drawdot @Spacefighter
  inc %spf.fps.v
  if ($calc(%spf.fps.t + 1) == $ctime) { %spf.fps.f = %spf.fps.v | %spf.fps.av = %spf.fps.av $+ $chr 32 $+ %spf.fps.v | unset %spf.fps.v | %spf.fps.t = $ctime }
  %spf.fps.av = $int($calc($calc($1 + %spf.fps.f) / 2))
  .timerSpf -om 1 0 Spf.drawmethod [ $+ [ %Spf.dmeth.1 ] ] %spf.fps.av
}
alias -l Spf.drawmethod3 { 
  drawpic -nc @Spacefighter 0 0 SpaceFighter\Bitmaps\spfstartmp.bmp
  drawrect -nrf @Spacefighter 0 1 0 560 220 20
  if (%spf.shield.1 > 0) drawrect -rf @Spacefighter 255 1 10 560 %spf.shield.1 5
  if (%spf.2.u2) { drawpic -nct @Spacefighter 4227327 %Spf.ud.2 }
  if (%spf.2.u3) { drawpic -nct @Spacefighter 4227327 %Spf.ud.3 }
  if (%spf.2.u4) { drawpic -nct @Spacefighter 4227327 %Spf.ud.4 }
  if (%spf.2.u5) { drawpic -nct @Spacefighter 4227327 %Spf.ud.5 }
  if (%spf.udp.data.s <= 0) && (!%spf.splayer) { drawtext -rn @Spacefighter 220 verdana 10 30 30 Warning: No UDP Data Coming From Server }
  dec %spf.udp.data.s %spf.upd.s
  drawpic -nct @Spacefighter 4227327 %Spf.hs.1 %Spf.vs.1 [ %Spf.bmp.1 ]
  drawdot @Spacefighter
  .timerSpf -om 1 0 Spf.drawmethod [ $+ [ %Spf.dmeth.1 ] ]
}
;Controls The Keys
on *:KEYDOWN:@Spacefighter:*: {
  ;if ($keyval == 77) { if ($window(@Spacefighter).state == normal) { window -h @Spacefighter | .halt } | window -o @SpaceFighter }
  if (%spf.game) && (!%spf.splayer)  && (!%spf.cr.1) { 
    if ($keyval == 39) { spf.changedraw 1 ri | .halt }
    if ($keyval == 37) { spf.changedraw 1 le | .halt }
    if ($keyval == 40) { spf.speed 1 do | .halt }
    if ($keyval == 38) { spf.speed 1 up | .halt }
    if ($keyval == 32) { 
      if (%spf.shield.1 > 4) && ($getdot(@Spf.cache,%Spf.hs.1,%Spf.vs.1) != 32768) { 
        Spf.fire %Spf.hs.1 %Spf.vs.1 %Spf.sd.1 %Spf.hs.1 %Spf.s.1 20 %spf.2.un
        dec %Spf.shield.1 55
        inc %spf.2.pakloss
        spf.jm.send.udp %spf.2.un FIRE %Spf.hs.1 %Spf.vs.1 %Spf.sd.1 %Spf.hs.1 %Spf.s.1 20 %spf.2.un
      } 
      .halt
    }
    if ($keyval == 13) { if (!%spf.cdmeth.1) { %spf.cdmeth.1 = 1 } | if (%Spf.cdmeth.1 == 1) { spf.msgwin } | if (%Spf.cdmeth.1 == 2) { spf.msgd } | .halt }
    if ($keyval == 84) { if (!%spf.cdmeth.1) { %spf.cdmeth.1 = 1 } | if (%Spf.cdmeth.1 == 1) { spf.msgwin } | if (%Spf.cdmeth.1 == 2) { spf.msgd } | .halt }
    if ($keyval == 9) { if ($window(@spf.score)) { window -c @spf.score | .halt } | spf.jm.send.tcp SCORE | spf.scorewin | .halt }
    if ($keyval == 49) && (%Spf.shield.1 >= 200) { set %Spf.ship.1 SpaceFighter\Bitmaps\ship [ $+ [ 1 ] $+ ] .bmp | spf.changedraw 1 ri | spf.chatdraw 37632 *** SPF-100 Selected *** | goto warp2 }
    if ($keyval == 50) && (%Spf.shield.1 >= 200) { set %Spf.ship.1 SpaceFighter\Bitmaps\ship [ $+ [ 2 ] $+ ] .bmp | spf.changedraw 1 ri | spf.chatdraw 37632 *** X-Wing Selected *** | goto warp2 }
    if ($keyval == 51) && (%Spf.shield.1 >= 200) { set %Spf.ship.1 SpaceFighter\Bitmaps\ship [ $+ [ 3 ] $+ ] .bmp | spf.changedraw 1 ri | spf.chatdraw 37632 *** TIE Fighter Selected *** | goto warp2 }
    if ($keyval == 87) && (%Spf.shield.1 >= 200) { goto warp }
    .halt
    :warp
    %Spf.hs.1 = $gettok(%Spf.startlc.1,1,32) | %Spf.vs.1 = $gettok(%Spf.startlc.1,2,32) 
    %Spf.s.1 = 0
    %Spf.shield.1 = 0
    spf.chatdraw 37632 ***Warped*** 
    .halt
    :warp2
    %Spf.hs.1 = $gettok(%Spf.startlc.1,1,32) | %Spf.vs.1 = $gettok(%Spf.startlc.1,2,32) 
    %Spf.s.1 = 0
    %Spf.shield.1 = 0
  } 
  if (%spf.game) && (!%spf.cr.1) { 
    if ($keyval == 39) { spf.changedraw 1 ri | .halt }
    if ($keyval == 37) { spf.changedraw 1 le | .halt }
    if ($keyval == 40) { spf.speed 1 do | .halt }
    if ($keyval == 38) { spf.speed 1 up | .halt }
    if ($keyval == 32) { 
      if (%spf.shield.1 > 4) && ($getdot(@Spf.cache,%Spf.hs.1,%Spf.vs.1) != 32768) { 
        Spf.fire %Spf.hs.1 %Spf.vs.1 %Spf.sd.1 %Spf.hs.1 %Spf.s.1 20 %spf.2.un
        dec %Spf.shield.1 55
        inc %spf.2.pakloss
      } 
      .halt
    }
    if ($keyval == 13) { if (!%spf.cdmeth.1) { %spf.cdmeth.1 = 1 } | if (%Spf.cdmeth.1 == 1) { spf.msgwin } | if (%Spf.cdmeth.1 == 2) { spf.msgd } | .halt }
    if ($keyval == 84) { if (!%spf.cdmeth.1) { %spf.cdmeth.1 = 1 } | if (%Spf.cdmeth.1 == 1) { spf.msgwin } | if (%Spf.cdmeth.1 == 2) { spf.msgd } | .halt }
    if ($keyval == 9) { if ($window(@spf.score)) { window -c @spf.score | .halt } | spf.jm.send.tcp SCORE | spf.scorewin | .halt }
    if ($keyval == 49) && (%Spf.shield.1 >= 200) { set %Spf.ship.1 SpaceFighter\Bitmaps\ship [ $+ [ 1 ] $+ ] .bmp | spf.changedraw 1 ri | spf.chatdraw 37632 *** SPF-100 Selected *** | goto warp2 }
    if ($keyval == 50) && (%Spf.shield.1 >= 200) { set %Spf.ship.1 SpaceFighter\Bitmaps\ship [ $+ [ 2 ] $+ ] .bmp | spf.changedraw 1 ri | spf.chatdraw 37632 *** X-Wing Selected *** | goto warp2 }
    if ($keyval == 51) && (%Spf.shield.1 >= 200) { set %Spf.ship.1 SpaceFighter\Bitmaps\ship [ $+ [ 3 ] $+ ] .bmp | spf.changedraw 1 ri | spf.chatdraw 37632 *** TIE Fighter Selected *** | goto warp2 }
    if ($keyval == 87) && (%Spf.shield.1 >= 200) { goto warp }
    .halt
    :warp
    %Spf.hs.1 = $gettok(%Spf.startlc.1,1,32) | %Spf.vs.1 = $gettok(%Spf.startlc.1,2,32) 
    %Spf.s.1 = 0
    %Spf.shield.1 = 0
    spf.chatdraw 37632 ***Warped*** 
    .halt
    :warp2
    %Spf.hs.1 = $gettok(%Spf.startlc.1,1,32) | %Spf.vs.1 = $gettok(%Spf.startlc.1,2,32) 
    %Spf.s.1 = 0
    %Spf.shield.1 = 0
  } 
  if (%spf.mapmaker == on) { 
    if ($keyval = 90) { spf.mm.draw undo }
  }
}
on *:KEYDOWN:@Spf.score:*: { window -c @Spf.score } 
alias -l spf.scorewin {
  if ($1 == s) { window -omBphk +dL @Spf.score $calc($window(@spacefighter).x + 235) $calc($window(@spacefighter).y + 100) 200 300 | goto next }
  if ($window(@Spf.score)) && ($1 != 2) { goto end }
  if ($window(@Spf.score)) && ($1 == 2) { goto next }
  window -oBphkd +dL @Spf.score $calc($window(@spacefighter).x + 235) $calc($window(@spacefighter).y + 100) 200 300
  :next
  drawrect -rf @Spf.score 0 1 0 0 200 447
  if ($1 == 2) { goto next2 }
  drawtext -rpob @Spf.score 173566 1 Verdana 10 20 20 7_Getting Scores..._  
  :next2  
  drawrect -r @Spf.score 1152750 3 1 1 199 299
  drawrect -r @Spf.score 33023 2 2 2 198 298
  drawrect -r @Spf.score 166 1 3 3 195 295
  drawdot @spf.score
  :end
  if ($1 == s) { window -c @spf.score }
}
alias -l spf.shipwin {
  if ($1 == refresh) { goto $1 }
  %Spf.sw.tmp = $1
  %Spf.sw.red = 123 23
  %Spf.sw.select = 1
  %Spf.sw.m = $rgb($rand(1,255) $+ , $+ $rand(1,255) $+ , $+ $rand(1,244))
  window -oBphkd +dL @Spf.ship $calc($window(@spacefighter).x + 150) $calc($window(@spacefighter).y + 200) 400 200
  :refresh
  drawrect -nrf @Spf.ship 0 1 0 0 400 200
  drawrect -nr @Spf.ship 10169088 3 0 0 400 200
  drawrect -nr @Spf.ship 9790214 2 2 2 398 198
  drawrect -nr @Spf.ship 14906423 1 3 3 395 195
  drawrect -nr @Spf.ship 16093046 1 4 4 393 193
  drawrect -nr @Spf.ship 16093046 1 5 5 391 191
  drawpic -nct @Spf.ship 4227327 125 25 1 98 34 40 SpaceFighter\Bitmaps\ship [ $+ [ 1 ] $+ ] .bmp
  drawpic -nct @Spf.ship 4227327 170 25 1 98 34 40 SpaceFighter\Bitmaps\ship [ $+ [ 2 ] $+ ] .bmp
  drawpic -nct @Spf.ship 4227327 220 24 1 98 34 40 SpaceFighter\Bitmaps\ship [ $+ [ 3 ] $+ ] .bmp
  drawrect -nr @Spf.ship 255 1 %Spf.sw.red 40 40
  drawtext -nrpb @Spf.ship 16515072 1 Verdana 10 160 100 Ship Selecter
  drawtext -nrpb @Spf.ship %Spf.sw.m 1 Verdana 10 150 140 Click here to Play!
  drawdot @Spf.ship
}
;  drawrect -r @Spf.ship 255 1 123 23 40 40
on *:KEYDOWN:@Spf.ship:*: {
  if ($keyval ==  13) {
    window -c @Spf.ship
    unset %Spf.sw.m
    spf.load
  }
}
menu @Spf.ship {
  mouse: { 
    %Spf.sw.m = $rgb($rand(1,255) $+ , $+ $rand(1,255) $+ , $+ $rand(1,244))
    spf.shipwin refresh
    if ($inrect($mouse.x,$mouse.y,123,23,40,40)) { drawrect -r @Spf.ship 16093046 1 123 23 40 40 }
    if ($inrect($mouse.x,$mouse.y,168,23,40,40)) { drawrect -r @Spf.ship 16093046 1 168 23 40 40 } 
    if ($inrect($mouse.x,$mouse.y,218,23,40,40)) { drawrect -r @Spf.ship 16093046 1 218 23 40 40 } 
  }
  sclick: {
    if ($inrect($mouse.x,$mouse.y,123,23,40,40)) { %spf.sw.select = 1 | %Spf.sw.red = 123 23 | spf.shipwin refresh }
    if ($inrect($mouse.x,$mouse.y,168,23,40,40)) { %spf.sw.select = 2 | %Spf.sw.red = 168 23 | spf.shipwin refresh } 
    if ($inrect($mouse.x,$mouse.y,218,23,40,40)) { %spf.sw.select = 3 | %Spf.sw.red = 218 23 | spf.shipwin refresh } 
    if ($inrect($mouse.x,$mouse.y,150,140,100,10)) { 
      window -c @Spf.ship
      unset %Spf.sw.m
      spf.load
  } }
}
;Adds A Bullet
;Swaped lines around... dunno if this will help or suffer but change if needs be
alias -l Spf.fire {
  hadd -m Spfire [ fire $+ [ %Spf.fire ] ] [ $1 ] [ $2 ] [ $3 ] [ $4 ] [ $5 ] [ $6 ] [ $7 ]
  inc %Spf.fire
}

;Fireupdate Managers The Speed Direction Placement Of A Bullet
;This took a while to make
;Also the most advanced firing system ever created in mIRC :P... can manage about 20 bullets pretty well on a p3 550.
alias -l Spf.fireupdate {
  inc %Spf.firecount
  if (%Spf.firecount > %spf.fire) { set %Spf.firecount -1 | goto end }
  if (!$hget(Spfire,fire $+ [ %Spf.firecount ])) goto end
  tokenize 32 $hget(Spfire,fire $+ [ %Spf.firecount ])
  %Spf.v1 = $1
  %Spf.v2 = $2
  %Spf.v3 = $3
  %Spf.v4 = $4
  %Spf.v5 = $5
  %Spf.v6 = $6
  %Spf.v7 = $7 
  if (%Spf.v3 == right) { dec %Spf.v1 $calc(%spf.fire.s + %Spf.v5) }
  if (%Spf.v3 == left) { inc %Spf.v1 $calc(%spf.fire.s + %Spf.v5) }
  if (%Spf.v3 == up) { dec %Spf.v2 $calc(%spf.fire.s + %Spf.v5) }
  if (%Spf.v3 == down) { inc %Spf.v2 $calc(%spf.fire.s + %Spf.v5) }
  goto skip
  :manage  
  hdel Spfire [ fire $+ [ %Spf.firecount ] ] | dec %spf.fire | dec %spf.firecount | goto end 
  :skip
  if (!$inrect(%Spf.v1,%Spf.v2,0,0,650,460)) { goto manage }
  if ($getdot(@Spf.cache,%Spf.v1,%Spf.v2) == 255) { goto manage }
  if ($getdot(@Spf.cache,$calc(%Spf.v1 + 5),%Spf.v2) == 255) { goto manage }  
  if ($getdot(@Spf.cache,$calc(%Spf.v1 + 5),$calc(%Spf.v2 + 10)) == 255) { goto manage }
  if ($getdot(@Spf.cache,%Spf.v1,$calc(%Spf.v2 + 10)) == 255) { goto manage }
  hadd -m Spfire [ fire $+ [ %Spf.firecount ] ] %Spf.v1 %Spf.v2 %Spf.v3 %Spf.v4 %Spf.v5 %Spf.v6 %Spf.v7
  %Spf.firec.1 = 1
  if (%Spf.v7 != %Spf.2.un) { %Spf.firec.1 = 2 }
  if (%Spf.v3 isin down up) { drawpic -ct @Spacefighter 4227327 $calc(%Spf.v1 + 10) %Spf.v2 0 20 20 10 SpaceFighter\Bitmaps\fire [ $+ [ %Spf.firec.1 ] $+ ] .bmp }
  if (%Spf.v3 isin right left) { drawpic -ct @Spacefighter 4227327 $calc(%Spf.v1 + 8) $calc(%Spf.v2 + 8) 0 0 20 20 SpaceFighter\Bitmaps\fire [ $+ [ %Spf.firec.1 ] $+ ] .bmp }
  if (%Spf.ud.2) && ($inrect(%Spf.v1,%Spf.v2,$gettok(%Spf.ud.2,1,32),$gettok(%Spf.ud.2,2,32),38,38)) || (%Spf.ud.2) && ($inrect($calc(%Spf.v1 + 5),$calc(%Spf.v2 + 10),$gettok(%Spf.ud.2,1,32),$gettok(%Spf.ud.2,2,32),38,38)) { goto manage }
  if (%Spf.ud.3) && ($inrect(%Spf.v1,%Spf.v2,$gettok(%Spf.ud.3,1,32),$gettok(%Spf.ud.3,2,32),38,38)) || (%Spf.ud.3) && ($inrect($calc(%Spf.v1 + 5),$calc(%Spf.v2 + 10),$gettok(%Spf.ud.3,1,32),$gettok(%Spf.ud.3,2,32),38,38)) { goto manage }
  if (%Spf.ud.4) && ($inrect(%Spf.v1,%Spf.v2,$gettok(%Spf.ud.4,1,32),$gettok(%Spf.ud.4,2,32),38,38)) || (%Spf.ud.4) && ($inrect($calc(%Spf.v1 + 5),$calc(%Spf.v2 + 10),$gettok(%Spf.ud.4,1,32),$gettok(%Spf.ud.4,2,32),38,38)) { goto manage }
  if (%Spf.ud.5) && ($inrect(%Spf.v1,%Spf.v2,$gettok(%Spf.ud.5,1,32),$gettok(%Spf.ud.5,2,32),38,38)) || (%Spf.ud.5) && ($inrect($calc(%Spf.v1 + 5),$calc(%Spf.v2 + 10),$gettok(%Spf.ud.5,1,32),$gettok(%Spf.ud.5,2,32),38,38)) { goto manage }
  if ($getdot(@Spf.cache,%Spf.v1,%Spf.v2) == 32768) { goto end }
  if (%Spf.v7 != %Spf.2.un) && ($inrect(%Spf.v1,%Spf.v2,%Spf.hs.1,%Spf.vs.1,38,38)) && (%spf.cr.1 != on) || (%Spf.v7 != %Spf.2.un) && ($inrect($calc(%Spf.v1 + 5),$calc(%Spf.v2 + 10),%Spf.hs.1,%Spf.vs.1,38,38)) && (%spf.cr.1 != on) {
    if (%Spf.shield.1 <= 0) { %Spf.cr.bmp = %Spf.bmp.1 | %spf.cr.1 = on | %spf.s.1 = 0 | spf.jm.send.tcp HIT %Spf.v7 | %spf.explode.1 = 0 | %spf.explode.2 = 0 | goto manage } 
    dec %Spf.shield.1 90
    goto manage
  }
  :end
  .timerSpfupdate -ohm 1 0 Spf.fireupdate 
}
alias -l spf.rebound2 { $1- }
alias -l spf.changedraw {
  if ($2 == ri) { 
    if (%Spf.sd. [ $+ [ $1 ] ] == up) { set %Spf.bmp. [ $+ [ $1 ] ] 0 62 34 35 %Spf.ship. [ $+ [ $1 ] ]  | set %Spf.sd. [ $+ [ $1 ] ] left | goto end }
    if (%Spf.sd. [ $+ [ $1 ] ] == left) { set %Spf.bmp. [ $+ [ $1 ] ] 0 0 34 32 %Spf.ship. [ $+ [ $1 ] ] | set %Spf.sd. [ $+ [ $1 ] ] down | goto end }
    if (%Spf.sd. [ $+ [ $1 ] ] == down) { set %Spf.bmp. [ $+ [ $1 ] ] 1 98 34 40 %Spf.ship. [ $+ [ $1 ] ]  | set %Spf.sd. [ $+ [ $1 ] ] right | goto end }
    if (%Spf.sd. [ $+ [ $1 ] ] == right) { set %Spf.bmp. [ $+ [ $1 ] ] 0 32 34 30 %Spf.ship. [ $+ [ $1 ] ] | set %Spf.sd. [ $+ [ $1 ] ] up | goto end }
  }
  if ($2 == le) {
    if (%Spf.sd. [ $+ [ $1 ] ] == up) { set %Spf.bmp. [ $+ [ $1 ] ] 1 98 34 40 %Spf.ship. [ $+ [ $1 ] ] | set %Spf.sd. [ $+ [ $1 ] ] right | goto end }
    if (%Spf.sd. [ $+ [ $1 ] ] == right) { set %Spf.bmp. [ $+ [ $1 ] ] 0 0 34 32 %Spf.ship. [ $+ [ $1 ] ] | set %Spf.sd. [ $+ [ $1 ] ] down | goto end }
    if (%Spf.sd. [ $+ [ $1 ] ] == down) { set %Spf.bmp. [ $+ [ $1 ] ] 0 62 34 35 %Spf.ship. [ $+ [ $1 ] ] | set %Spf.sd. [ $+ [ $1 ] ] left | goto end }
    if (%Spf.sd. [ $+ [ $1 ] ] == left) { set %Spf.bmp. [ $+ [ $1 ] ] 0 32 34 30 %Spf.ship. [ $+ [ $1 ] ] | set %Spf.sd. [ $+ [ $1 ] ] up | goto end }
  }
  if ($2 == cr) { 
    inc %spf.explode.2 
    set %Spf.bmp. [ $+ [ $1 ] ] [ %spf.explode.1 ] 0 41 50 SpaceFighter\Bitmaps\explode.bmp 
    if (%spf.explode.1 < 1319) && (%spf.explode.2 != 32) { inc %spf.explode.1 41 | goto end } 
    unset %spf.cr.1 | unset %spf.explode.1 | unset %spf.explode.2
    %Spf.hs.1 = $gettok(%Spf.startlc. [ $+ [ $1 ] ],1,32)
    %Spf.bmp. [ $+ [ $1 ] ] = %Spf.cr.bmp 
    %spf.shield. [ $+ [ $1 ] ] = 200 
    %Spf.vs.1 = $gettok(%Spf.startlc. [ $+ [ $1 ] ],2,32) 
    spf.rebound2 Spf.changedraw $1 ri 
  }
  :end
}
;3 Speeds Vertical | And Horizontal - And the speed in which the craft is moving at
alias -l Spf.speed {
  if (%Spf.s. [ $+ [ $1 ] ] == $null) { set %Spf.s. [ $+ [ $1 ] ] 0 }
  if ($2 == up) { if (%Spf.s. [ $+ [ $1 ] ] <= %spf.max.s) { inc %Spf.s. [ $+ [ $1 ] ] %spf.ac.s  } } 
  if ($2 == do) { if (%Spf.s. [ $+ [ $1 ] ] >= %spf.min.s) { dec %Spf.s. [ $+ [ $1 ] ] %spf.ac.s } } 
}
;Max = 4, -4 . inc by .90

;Shakes The Screen... Nice!
alias -l spf.shake {
  if ($1 == 1) { var %i = 50 }
  if ($1 == 2) { var %i = $calc(50 * 3) }
  if ($1 == $null) { return }
  var %d = $window(@Spacefighter).x, %e = $window(@spacefighter).y, %f = inc, %g = dec, %h = 0
  :loop
  inc %h
  if (%g == inc) { var %g = dec | goto next }
  if (%g == dec) { var %g = inc }
  :next
  %g %e 10
  window @spacefighter %d %e 
  if (%h != %i) { goto loop }
  else { .halt } 
}
;Produces A Random Background Eg. A Random Sky & Now Decodes Maps :) & Caches Them
alias -l spf.skymaker {
  var %map.tmp = SpaceFighter\Maps\ $+ $nopath($1-)
  drawpic -c
  window -hCpk[n] @Spf.SkyMaker 0 0 700 530
  drawrect -rf @Spf.skymaker 0 1 0 0 700 530  
  Spf.menudraw Caching Map
  titlebar @Spacefighter - The Loading Screen - Creating Background - % $+ 0
  var a1 = 0, %ax = 0, %ay = 0
  :loop1
  %ax = $rand(0,700)
  %ay = $rand(0,500)
  drawpic -t @Spf.skymaker 16711935 %ax %ay 0 0 18 19 SpaceFighter\Bitmaps\spfstars.bmp
  if (%a1 != 15) { inc %a1 | goto loop1 } 
  %a1 = 0
  titlebar @Spacefighter - The Loading Screen - Creating Background - % $+ 20
  :loop-
  %ax = $rand(0,700)
  %ay = $rand(0,500)
  drawpic -t @Spf.skymaker 16711935 %ax %ay 18 3 16 14 SpaceFighter\Bitmaps\spfstars.bmp
  if (%a1 != 7) { inc %a1 | goto loop- } 
  %a1 = 0
  titlebar @Spacefighter - The Loading Screen - Creating Background - % $+ 40
  :loop2
  %ax = $rand(0,700)
  %ay = $rand(0,500)
  drawpic -t @Spf.skymaker 16711935 %ax %ay 57 0 22 22 SpaceFighter\Bitmaps\spfstars.bmp
  if (%a1 != 1) { inc %a1 | goto loop2 } 
  %a1 = 0
  var %az = 0
  titlebar @Spacefighter - The Loading Screen - Creating Background - % $+ 60
  :doubletake
  inc %az
  titlebar @Spacefighter - The Loading Screen - Creating Background - % $+ 80
  :anotherloop
  var %a2 = $rand(3,6)
  if (%a2 != %a3) { %a3 = %a2 | goto [ loop [ $+ [ %a2 ] ] ] }
  if (%a2 == %a3) { goto anotherloop }
  :loop3
  %ax = $rand(0,700)
  %ay = $rand(0,500)
  drawpic -t @Spf.skymaker 16711935 %ax %ay 0 25 66 66 SpaceFighter\Bitmaps\spfstars.bmp
  %a1 = 0
  goto end
  :loop4
  %ax = $rand(0,700)
  %ay = $rand(0,500)
  drawpic -t @Spf.skymaker 16711935 %ax %ay 67 22 66 66 SpaceFighter\Bitmaps\spfstars.bmp
  %a1 = 0
  goto end
  :loop5
  %ax = $rand(0,700)
  %ay = $rand(0,500)
  drawpic -t @Spf.skymaker 16711935 %ax %ay 137 7 98 96 SpaceFighter\Bitmaps\spfstars.bmp
  %a1 = 0
  goto end
  :loop6
  %ax = $rand(0,700)
  %ay = $rand(0,500)
  drawpic -t @Spf.skymaker 16711935 %ax %ay 234 0 79 120 SpaceFighter\Bitmaps\spfstars.bmp
  %a1 = 0
  goto end
  :end
  titlebar @Spacefighter - The Loading Screen - Creating Background - % $+ 100
  if (%az != 2) { goto doubletake }
  var %abrick.1 = 1
  window -Chpf +d @Spf.Cache 0 0 700 510
  drawrect -f @Spf.cache 0 1 -1 -1 680 610
  :brickit
  if ($gettok($read(%map.tmp,%abrick.1),1,44) == s) { 
    drawpic @Spf.skymaker $gettok($read(%map.tmp,%abrick.1),2,44) $gettok($read(%map.tmp,%abrick.1),3,44) $gettok($read(%map.tmp,%abrick.1),4,44) SpaceFighter\Bitmaps\spfbrick.bmp
    drawrect -rf @Spf.cache 32768 1 $gettok($read(%map.tmp,%abrick.1),2,44) $gettok($read(%map.tmp,%abrick.1),3,44) 15 16
  }
  if ($gettok($read(%map.tmp,%abrick.1),1,44) == b) { 
    drawpic @Spf.skymaker $gettok($read(%map.tmp,%abrick.1),2,44) $gettok($read(%map.tmp,%abrick.1),3,44) $gettok($read(%map.tmp,%abrick.1),4,44) SpaceFighter\Bitmaps\spfbrick.bmp
    drawrect -rf @Spf.cache 255 1 $gettok($read(%map.tmp,%abrick.1),2,44) $gettok($read(%map.tmp,%abrick.1),3,44) 15 16
  }
  if ($gettok($read(%map.tmp,%abrick.1),1,44) == p) { drawpic @Spf.skymaker $gettok($read(%map.tmp,%abrick.1),2,44) $gettok($read(%map.tmp,%abrick.1),3,44) $gettok($read(%map.tmp,%abrick.1),4,44) }
  if ($left($gettok($read(%map.tmp,%abrick.1),1,44),2) == sp) {
    if ($mid($gettok($read(%map.tmp,%abrick.1),1,44),3,3) == %spf.2.un) { set %Spf.hs.1 $gettok($read(%map.tmp,%abrick.1),2,44) | set %Spf.vs.1 $gettok($read(%map.tmp,%abrick.1),3,44) | set %Spf.startlc.1 %Spf.hs.1 %Spf.vs.1 }
  }
  if ($lines(%map.tmp) != %abrick.1) { inc %abrick.1 | titlebar @Spacefighter - The Loading Screen - Caching Map - $nopath(%map.tmp) - % $+ $int($calc($calc(%abrick.1 / $lines(%map.tmp)) * 100)) | goto brickit }
  drawsave -b24 @Spf.skymaker SpaceFighter\Bitmaps\spfstartmp.bmp
  set %Spf.bmp.1 0 62 34 35 %Spf.ship.1
  set %Spf.sd.1 left
  window -c @Spf.skymaker  
}

;Spf.engine end
alias -l spf.feedback { if ($dialog(spf.feedback)) { dialog -a spf.feedback | .halt } | dialog -omd spf.feedback spf.feedback }
dialog spf.feedback {
  title "Feedback & Bug Report"
  size -1 -1 130 200
  option dbu
  button "",5,1 1 1 1,cancel

  text "Msg From :" 22, 10 12 60 10, 
  edit "Your Name" 23, 40 10 80 10, autohs 
  text "Reply To :" 24, 10 27 60 10, 
  edit "token@whoever.com" 25, 40 25 80 10, autohs 
  text "Subject :" 26, 10 42 60 6, 
  edit "Awesome Game " 27, 40 40 80 10, limit 200 
  text "-Status-" 30, 10 55 100 8, center
  edit "Sorry until i get a working smtp server this part of the game will remain directly unavailable. However if you provide your own smtp server and port this will work... Smtp servers are usally smtp.your-isp.com 25 or mail.your-isp.com 25" 29, 2 65 125 120, sizevsbar multi return
  button "&Send" 37, 5 187 120 10, 
}
on *:DIALOG:spf.feedback:*:*: {
  if ($devent == sclick) {
    if ($did == 37) { did -b spf.feedback 37 | did -a spf.feedback 30 -Connecting- | dialog -i spf.feedback | .sockopen spf.feedback 130.95.140.57 25 | dialog -e spf.feedback }
    if ($did == 5) { sockclose spf.feedback }
  }
}
on *:SOCKREAD:spf.feedback: { sockread %spf.read.ss | echo %spf.read.ss | unset %spf.read.ss }
on *:SOCKOPEN:spf.feedback:{
  if ($sockerr > 0) { did -e spf.feedback 37 | did -a spf.feedback 30 -Error Connecting- | sockclose $sockname | spf.error Unable To Connect To Msg Server, Check Your Internet Connection | return }
  else {
    did -a spf.feedback 30 -Connected-
    var %spf.fb.temp = 0
    if (!$host) { .sockwrite -n $sockname HELO spacefighter | goto next }
    .sockwrite -n $sockname HELO $host
    :next
    .sockwrite -n $sockname MAIL from: $did(spf.feedback,25).text
    .sockwrite -n $sockname RCPT to: j_ustin_@hotmail.com
    .sockwrite -n $sockname DATA
    .sockwrite -n $sockname From: [ $nick ] $+ @spacefighter.com
    .sockwrite -n $sockname To: Justin Mammarella
    .sockwrite -n $sockname Reply-To: [ $me ] $+ @spacefighter.com < $+ [ $me ] $+ @spacefighter.com $+ >
    .sockwrite -n $sockname Subject: $did(spf.feedback,27).text
    .sockwrite -n $sockname $crlf
    did -a spf.feedback 30 -Sending MSG-
    :loop
    inc %spf.fb.temp
    .sockwrite -tn $sockname $did(spf.feedback,29,%spf.fb.temp).text
    if (%spf.fb.temp != $did(spf.feedback,29).lines) { goto loop }
    .sockwrite -tn $sockname Times Spacefighter Has Been Opened [ %spf.open.num ] times Nickname = $me $+ , Windows = $os $+ , mIRC Ver = $version
    .sockwrite -tn $sockname $crlf 
    .sockwrite -n $sockname .
    .sockwrite -n $sockname quit
    did -a spf.feedback 30 -MSG Sent-
    ;.sockclose $sockname
    did -e spf.feedback 37
  }
}
alias -l spf.help { if ($dialog(spf.help)) { dialog -a spf.help | .halt } | dialog -omd spf.help spf.help }
;MapMaker
alias -l spf.mapmaker {
  unset %spf.mm.title
  spf.close
  spf.window
  if (!$window(@Spf.Cache)) { window -Chpf +d @Spf.Cache 0 0 680 510 }
  titlebar @SpaceFighter - MapMaker - Unsaved
  .remove spacefighter\maps\spf.tmp
  drawrect -rf @Spacefighter 0 1 -1 -1 680 610
  drawrect -f @Spf.cache 0 1 -1 -1 680 610
  drawrect -rf @Spacefighter 0 1 -1 -1 680 610
  drawtext -r @Spacefighter 16777215 default 12 10 510 S p a c e F i g h t e r
  drawtext -r @Spacefighter 16777215 default 12 10 530 M a p M a k e r
  spf.chatdraw 37632 ***MapMaker Started***
  spf.chatdraw 37632 ***MapMaker Version BETA***
  spf.chatdraw 37632 ***Right Click For Options***
  var %spf.map.x = 0, %spf.map.y = 15, %spf.map.x2 = 675, %spf.map.y2 = 15,
  %spf.map.1 = b
  %spf.map.3 = SpaceFighter\bitmaps\spfbrick.bmp
  %spf.map.2 = 0 0 15 16
  :loop
  drawline @Spacefighter 14 1 3 1 3 1 490
  drawline @Spacefighter 14 1 %spf.map.x %spf.map.y %spf.map.x2 %spf.map.y2
  if (%spf.map.y < 490) { inc %spf.map.y 15 | inc %spf.map.y2 15 | goto loop }
  var %spf.map.x = 15, %spf.map.y = 0, %spf.map.x2 = 15, %spf.map.y2 = 495 
  :loop2
  drawline @Spacefighter 14 1 %spf.map.x %spf.map.y %spf.map.x2 %spf.map.y2
  if (%spf.map.x < 675) { inc %spf.map.x 15 | inc %spf.map.x2 15 | goto loop2 }
  spf.mm.d
  %spf.mapmaker = on
}
alias -l spf.mm.draw {
  if (!%spf.mm.title) { .halt } 
  if (%spf.mapmaker) && (%spf.mm.title) { 
    var %spf.map.mx = $mouse.x, %spf.map.my = $mouse.y 
    if (%spf.map.1 == erase) { 
      var %spf.map.erase.1 = 1, %spf.map.erase.x = $mouse.x, %spf.map.erase.y = $mouse.y
      :loop 
      if (b isin $gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),1,44)) || (s isin $gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),1,44)) {

        if ($inrect(%spf.map.erase.x,%spf.map.erase.y,$gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),2,44),$gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),3,44),15,15)) {
          drawrect -rf @Spacefighter 0 1 $calc(15 * $int($calc($gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),2,44) / 15))) $calc(15 * $int($calc($gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),3,44) / 15))) $gettok($gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),4,44),3,32) $gettok($gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),4,44),4,32)
          drawrect -f @Spf.cache 0 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) $gettok($gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),4,44),3,32) $gettok($gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),4,44),4,32)
          write -d $+ [ %spf.map.erase.1 ] spacefighter\maps\spf.tmp
          .halt
        } 
      }
      if (%spf.map.erase.1 != $lines(spacefighter\maps\spf.tmp)) { inc %spf.map.erase.1 | goto loop }
      .halt
    }
    if ($1 == rsl) {
      drawrect -rf @Spacefighter 0 1 -1 -1 680 610
      var %spf.map.x = 0, %spf.map.y = 15, %spf.map.x2 = 675, %spf.map.y2 = 15,
      :loop1
      drawline @Spacefighter 14 1 3 1 3 1 490
      drawline @Spacefighter 14 1 %spf.map.x %spf.map.y %spf.map.x2 %spf.map.y2
      if (%spf.map.y < 490) { inc %spf.map.y 15 | inc %spf.map.y2 15 | goto loop1 }
      var %spf.map.x = 15, %spf.map.y = 0, %spf.map.x2 = 15, %spf.map.y2 = 495 
      :loop2
      drawline @Spacefighter 14 1 %spf.map.x %spf.map.y %spf.map.x2 %spf.map.y2
      if (%spf.map.x < 675) { inc %spf.map.x 15 | inc %spf.map.x2 15 | goto loop2 }
      titlebar @Spacefighter - MapMaker - Redrawn
      drawtext -r @Spacefighter 16777215 default 12 10 510 S p a c e F i g h t e r
      drawtext -r @Spacefighter 16777215 default 12 10 530 M a p M a k e r
      var %spf.map.erase.1 = 4
      unset %spf.map.sp1
      unset %spf.map.loop.1
      unset %spf.map.sp2
      unset %spf.map.sp3
      unset %spf.map.sp4
      :looper
      if ($left($gettok($read(spacefighter\maps\spf.tmp,%spf.map.erase.1),1,44),2) == sp) { write -d $+ [ %spf.map.erase.1 ] spacefighter\maps\spf.tmp } 
      if (%spf.map.erase.1 != 8) { inc %spf.map.erase.1 | goto looper }
      drawrect -f @Spf.cache 0 1 -1 -1 680 610
      var %abrick.1 = 1
      :brickit
      if (%spf.map.loop.1 != on) {
        if ($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44) == s) { 
          drawpic @Spacefighter $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),4,44) SpaceFighter\Bitmaps\spfbrick.bmp
          drawrect -rf @Spf.cache 32768 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 16
        }
        if ($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44) == b) { 
          drawpic @Spacefighter $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),4,44) SpaceFighter\Bitmaps\spfbrick.bmp
          drawrect -rf @Spf.cache 255 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 16
        }
        if ($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44) == p) { drawpic @Spacefighter $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),4,44) }
      }
      if (%spf.map.loop.1 == on) { 
        if ($left($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),2) == sp) {
          if ($mid($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),3,3) == 5) { drawrect -f @Spacefighter 0 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | %spf.map.sp1 = set }
          if ($mid($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),3,3) == 2) { drawrect -f @Spacefighter 4 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | %spf.map.sp2 = set }
          if ($mid($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),3,3) == 3) { drawrect -f @Spacefighter 12 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | %spf.map.sp3 = set }
          if ($mid($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),3,3) == 4) { drawrect -f @Spacefighter 8 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | %spf.map.sp4 = set }
          drawrect -rf @Spf.cache 255 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) 15 15
        }
      }
      if ($lines(spacefighter\maps\spf.tmp) != %abrick.1) { inc %abrick.1 | if (%spf.map.L.1 != on) { titlebar @Spacefighter - MapMaker - ReDrawing Map % $+ $int($calc($calc(%abrick.1 / $lines(spacefighter\maps\spf.tmp) * 100) / 2)) | goto brickit } | titlebar @Spacefighter - MapMaker - ReDrawing Map $int($calc($calc(%abrick.1 / $lines(spacefighter\maps\spf.tmp) * 100) + 50)) $+ % | goto brickit }
      if ($lines(spacefighter\maps\spf.tmp) == %abrick.1) && (%spf.map.loop.1 != on) { %abrick.1 = 1 | %spf.map.loop.1 = on | %spf.map.L.1 = on | goto brickit }
      spf.chatdraw 37632 ***Map Redrawn*** 
      .halt
    }

    if (!$inrect($mouse.x,$mouse.y,0,0,675,492)) { .halt }
    if ($1 == Undo) && (sp != $left($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),2)) && ($lines(spacefighter\maps\spf.tmp) > 3) { 
      spf.chatdraw 37632 ***Undoing***
      drawrect -rf @Spacefighter 0 1 $calc(15 * $int($calc($gettok($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),2,44) / 15))) $calc(15 * $int($calc($gettok($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),3,44) / 15))) $gettok($gettok($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),4,44),3,32) $gettok($gettok($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),4,44),4,32)
      drawrect -rf @Spf.cache $rgb(255,255,255) 1 $calc(15 * $int($calc($gettok($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),2,44) / 15))) $calc(15 * $int($calc($gettok($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),3,44) / 15))) $gettok($gettok($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),4,44),3,32) $gettok($gettok($read(spacefighter\maps\spf.tmp,$lines(spacefighter\maps\spf.tmp)),4,44),4,32)
      write -d $+ $lines(spacefighter\maps\spf.tmp) spacefighter\maps\spf.tmp
      .halt
    }
    if ($1 == Undo) { .halt }
    if ($getdot(@Spf.cache,$mouse.x,$mouse.y) != 255) && (sp == $left(%spf.map.1,2)) {
      if ($mid(%spf.map.1,3,3) == 5) { %spf.map.sp1 = set | drawrect -f @Spacefighter 0 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) 15 15 | write -il4 spacefighter\maps\spf.tmp [ %spf.map.1 ] $+ , $+ $mouse.x $+ , $+ $mouse.y }
      if ($mid(%spf.map.1,3,3) == 2) { %spf.map.sp2 = set | drawrect -f @Spacefighter 4 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) 15 15 | write -il5 spacefighter\maps\spf.tmp [ %spf.map.1 ] $+ , $+ $mouse.x $+ , $+ $mouse.y }
      if ($mid(%spf.map.1,3,3) == 3) { %spf.map.sp3 = set | drawrect -f @Spacefighter 12 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) 15 15 | write -il6 spacefighter\maps\spf.tmp [ %spf.map.1 ] $+ , $+ $mouse.x $+ , $+ $mouse.y }
      if ($mid(%spf.map.1,3,3) == 4) { %spf.map.sp4 = set | drawrect -f @Spacefighter 8 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) 15 15  | write -il7 spacefighter\maps\spf.tmp [ %spf.map.1 ] $+ , $+ $mouse.x $+ , $+ $mouse.y }
      drawrect -rf @Spf.cache 255 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) 15 15
      unset %spf.map.1 
    }
    if ($getdot(@Spf.cache,$mouse.x,$mouse.y) == 16777215) && (%spf.map.1 == b) {
      tokenize 32 %spf.map.2
      drawpic @Spacefighter $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) %spf.map.2 %spf.map.3 
      write spacefighter\maps\spf.tmp [ %spf.map.1 ] $+ , $+ $calc(15 * $int($calc($mouse.x / 15))) $+ , $+ $calc(15 * $int($calc($mouse.y / 15))) $+ , $+ %spf.map.2
      drawrect -rf @Spf.cache 255 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) $3-
  } }
  if ($getdot(@Spf.cache,$mouse.x,$mouse.y) == 16777215) && (%spf.map.1 == s) {
    tokenize 32 %spf.map.2
    drawpic @Spacefighter $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) %spf.map.2 %spf.map.3 
    write spacefighter\maps\spf.tmp [ %spf.map.1 ] $+ , $+ $calc(15 * $int($calc($mouse.x / 15))) $+ , $+ $calc(15 * $int($calc($mouse.y / 15))) $+ , $+ %spf.map.2
    drawrect -rf @Spf.cache 32768 1 $calc(15 * $int($calc($mouse.x / 15))) $calc(15 * $int($calc($mouse.y / 15))) $3-
  }
}
alias -l spf.mm.d { if ($dialog(spf.mapmaker)) { dialog -a spf.mapmaker | .halt } | else { dialog -omd spf.mapmaker spf.mapmaker | dialog -a spf.mapmaker spf.mapmaker } }
dialog spf.mapmaker {
  title "MapMaker"
  size -1 -1 100 50
  option dbu
  box "",2, 2 2 96 46,
  button "",1,1 1 1 1,cancel
  button "&Create New Map" 3, 17 15 65 10,
  button "&Load Old Map" 4, 17 30 65 10,
}
on *:DIALOG:spf.mapmaker:*:*: {
  if ($did == 3) { spf.mm.d1 | dialog -c spf.mapmaker }
  if ($did == 4) { spf.mm.load | dialog -c spf.mapmaker }
}
alias -l spf.mm.d1 { if ($dialog(spf.mapmaker1)) { dialog -a spf.mapmaker1 | .halt } | else { dialog -omd spf.mapmaker1 spf.mapmaker1 } }
dialog spf.mapmaker1 {
  title "MapMaker"
  size -1 -1 100 80
  option dbu
  box "",2, 2 2 96 76,
  button "",1,1 1 1 1,cancel
  Text "Map Name:" 4, 10 11 50 10, autohs 
  edit "New_Map" 5, 45 10 45 10, limit 50 
  text "Comments:" 6, 10 26 50 10, autohs 
  edit "This is good" 7, 45 25 45 10, autohs 
  button "&Lets Do This" 3, 25 45 50 10,
}
on *:DIALOG:spf.mapmaker1:*:*: {
  if ($devent == init) {
    if ($gettok($read(spacefighter\maps\spf.tmp,2),2,44)) {
      did -r spf.mapmaker1 5 
      did -r spf.mapmaker1 7
      did -a spf.mapmaker1 5 $gettok($read(spacefighter\maps\spf.tmp,2),2,44)
      did -a spf.mapmaker1 7 $gettok($read(spacefighter\maps\spf.tmp,3),2,44)
  } }
  if ($devent == sclick) {
    if ($did == 3) {
      if ($remove($did(spf.mapmaker1,5).text,\,$chr(47),:,$chr(42),?,",<,>,$chr(124),$chr($32),$chr(44)) == $null) { spf.error Dont enter blank or filenames including... \ / : * ? " < > $chr(124) , and space | dialog -c spf.mapmaker1 | .halt }
      if ($gettok($read(spacefighter\maps\spf.tmp,1),1,44) == tag) { write -l1 spacefighter\maps\spf.tmp tag $+ , $+ SpaceFighter $+ , $+ $spf.ver(1) $+ , $+ $spf.ver(2) | goto next0 }
      write -l1 spacefighter\maps\spf.tmp tag $+ , $+ SpaceFighter $+ , $+ $spf.ver(1) $+ , $+ $spf.ver(2)
      :next0
      if ($gettok($read(spacefighter\maps\spf.tmp,1),1,44) == t) { write -l2 spacefighter\maps\spf.tmp t $+ , $+ $remove($did(spf.mapmaker1,5).text,\,/,:,*,?,",<,>,|,$chr($32),$chr(44)) | goto next }
      write -l2 spacefighter\maps\spf.tmp t $+ , $+ [ $remove($did(spf.mapmaker1,5).text,\,$chr(47),:,$chr(42),?,",<,>,$chr(124),$chr($32),$chr(44)) ]
      :next
      if ($gettok($read(spacefighter\maps\spf.tmp,1),1,44) == c) { write -l3 spacefighter\maps\spf.tmp t $+ , $+ $did(spf.mapmaker1,7).text | goto next2 }
      write -l3 spacefighter\maps\spf.tmp c $+ , $+ [ $remove($did(spf.mapmaker1,7).text,$chr(44)) ]
      :next2
      %spf.mm.title = set
      dialog -c spf.mapmaker1
    } 
  }  
}
menu @Spacefighter {
  dclick: if (%spf.mapmaker) { echo Mouse X,Y = $mouse.x $+ , $+ $mouse.y }
  sclick: if (%spf.mapmaker) { spf.mm.draw }
  mouse: if (%spf.mapmaker) && ($mouse.key & 1) spf.mm.draw
  $iif(%spf.mapmaker,&Brick):{ %spf.map.1 = b | %spf.map.3 = SpaceFighter\bitmaps\spfbrick.bmp | %spf.map.2 = 0 0 15 16 }
  $iif(%spf.mapmaker,&Safe Zone):{ %spf.map.1 = s | %spf.map.3 = SpaceFighter\bitmaps\spfbrick.bmp | %spf.map.2 = 0 16 15 16 }
  $iif(%spf.mapmaker,-)
  $iif(%spf.mapmaker,&Undo [Z Key]):{ spf.mm.draw undo }
  $iif(%spf.mapmaker,&Eraser):{ %spf.map.1 = erase }
  $iif(%spf.mapmaker,&Edit in Notepad):{ run notepad.exe spacefighter\maps\spf.tmp  }
  $iif(%spf.mapmaker,-)
  $iif(%spf.mapmaker && !%spf.map.sp1,Player 1 Start Location White): { %spf.map.1 = sp5 }
  $iif(%spf.mapmaker && !%spf.map.sp2,Player 2 Start Location Red): { %spf.map.1 = sp2 }
  $iif(%spf.mapmaker && !%spf.map.sp3,Player 3 Start Location Blue): { %spf.map.1 = sp3 }
  $iif(%spf.mapmaker && !%spf.map.sp4,Player 4 Start Location Yellow): { %spf.map.1 = sp4 }
  $iif(%spf.mapmaker,&Delete All Start Locations): { if ($?!="Do you wish to remove all start locations?") { spf.mm.draw rsl } }
  $iif(%spf.mapmaker,-)
  $iif(%spf.mapmaker,&Map Details):spf.mm.d1
  $iif(%spf.mapmaker,-)
  $iif(%spf.mapmaker,&Redraw):spf.mm.draw rsl
  $iif(%spf.mapmaker,-)
  $iif(%spf.mapmaker,&New):{ if ($?!="Do you wish to discard this map and begin on a new one?") { spf.close | spf.mapmaker } }
  $iif(%spf.mapmaker,&Save):{ if ($?!="Do you wish to save current changes?") { spf.mm.save } }
  $iif(%spf.mapmaker,&Load):{ spf.mm.load }
  $iif(%spf.mapmaker,-)
  $iif(%spf.mapmaker,E&xit):{ if ($?!="Do you wish to exit?") { spf.close | window -c @Spacefighter | spacefighter } }
}
alias -l spf.mm.save {
  if (%spf.mm.title != set) { spf.mapmaker1 | .halt }
  if (%spf.map.sp1 != set) { spf.error You need to set a start location for every user before saving. | .halt }
  if (%spf.map.sp2 != set) { spf.error You need to set a start location for every user before saving. | .halt }
  if (%spf.map.sp3 != set) { spf.error You need to set a start location for every user before saving. | .halt }
  if (%spf.map.sp4 != set) { spf.error You need to set a start location for every user before saving. | .halt }
  .copy -o spacefighter\maps\spf.tmp spacefighter\maps\ $+ $remove($gettok($read(spacefighter\maps\spf.tmp,2),2,44),$chr(32)) $+ .spf
  titlebar @SpaceFighter - MapMaker - Saved As - $gettok($read(spacefighter\maps\spf.tmp,2),2,44) $+ .spf

}
alias -l spf.mm.load {
  unset %spf.map.sp*
  var %spf.map.load = $file="Select A Map To Open" [ spacefighter\maps\ $+ *.spf ]
  if ($gettok($read(%spf.map.load,1),1,44) != tag) && ($gettok($read(%spf.map.load,1),2,44) != SpaceFighter) { spf.error This file is either corrupt or is not a spacefighter map | .halt }
  drawrect -f @Spf.cache 0 1 -1 -1 680 610
  drawrect -rf @Spacefighter 0 1 -1 -1 680 610
  drawtext -nr @Spacefighter 16777215 default 12 10 510 S p a c e F i g h t e r
  drawtext -nr @Spacefighter 16777215 default 12 10 530 M a p M a k e r
  spf.chatdraw 37632 ***MapMaker Started***
  spf.chatdraw 37632 ***The MapMaker Is In Early Stages Of Development***
  spf.chatdraw 37632 ***Loading %spf.map.load $+ ***
  var %spf.map.x = 0, %spf.map.y = 15, %spf.map.x2 = 675, %spf.map.y2 = 15, %spf.map.safe = off, %spf.map.1 = b, %spf.map.3 = spfbrick.bmp, %spf.map.2 = 0 0 15 16
  :loop
  drawline @Spacefighter 14 1 %spf.map.x %spf.map.y %spf.map.x2 %spf.map.y2
  if (%spf.map.y < 490) { inc %spf.map.y 15 | inc %spf.map.y2 15 | goto loop }
  var %spf.map.x = 15, %spf.map.y = 0, %spf.map.x2 = 15, %spf.map.y2 = 495 
  :loop2
  drawline @Spacefighter 14 1 %spf.map.x %spf.map.y %spf.map.x2 %spf.map.y2
  if (%spf.map.x < 675) { inc %spf.map.x 15 | inc %spf.map.x2 15 | goto loop2 }
  var %abrick.1 = 1
  .copy -o $shortfn(%spf.map.load) spacefighter\maps\spf.tmp  
  :brickit
  if (%spf.map.loop.1 != on) {
    if ($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44) == s) { 
      drawpic @Spacefighter $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),4,44) SpaceFighter\Bitmaps\spfbrick.bmp
      drawrect -rf @Spf.cache 32768 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 16
    }
    if ($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44) == b) { 
      drawpic @Spacefighter $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),4,44) SpaceFighter\Bitmaps\spfbrick.bmp
      drawrect -rf @Spf.cache 255 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 16
    }
    if ($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44) == p) { drawpic @Spacefighter $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),4,44) }
  }
  if (%spf.map.loop.1 == on) { 
    if ($left($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),2) == sp) {
      if ($mid($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),3,3) == 5) { drawrect -f @Spacefighter 0 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | drawrect -rf @Spf.cache 255 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | %spf.map.sp1 = set }
      if ($mid($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),3,3) == 2) { drawrect -f @Spacefighter 4 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | drawrect -rf @Spf.cache 255 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | %spf.map.sp2 = set }
      if ($mid($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),3,3) == 3) { drawrect -f @Spacefighter 12 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | drawrect -rf @Spf.cache 255 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | %spf.map.sp3 = set }
      if ($mid($gettok($read(spacefighter\maps\spf.tmp,%abrick.1),1,44),3,3) == 4) { drawrect -f @Spacefighter 8 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | drawrect -rf @Spf.cache 255 1 $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),2,44) $gettok($read(spacefighter\maps\spf.tmp,%abrick.1),3,44) 15 15 | %spf.map.sp4 = set }
    }
  }
  if ($lines(spacefighter\maps\spf.tmp) != %abrick.1) { inc %abrick.1 | if (%spf.map.L.1 != on) { titlebar @Spacefighter - MapMaker - Loading Map % $+ $int($calc($calc(%abrick.1 / $lines(spacefighter\maps\spf.tmp) * 100) / 2) - 50) | goto brickit } | titlebar @Spacefighter - MapMaker - Loading Map $int($calc($calc(%abrick.1 / $lines(spacefighter\maps\spf.tmp) * 100) + 0)) $+ % | goto brickit }
  if ($lines(spacefighter\maps\spf.tmp) == %abrick.1) && (%spf.map.loop.1 != on) { %abrick.1 = 1 | %spf.map.loop.1 = on | %spf.map.L.1 = on | goto brickit }
  titlebar @Spacefighter - MapMaker - Loaded As - %spf.map.load
  spf.chatdraw 37632 ***Loaded %spf.map.load $+ ***
  unset %spf.map.loop.1
  %spf.mm.title = set
  spf.mm.d1
  did -r spf.mapmaker1 5 
  did -r spf.mapmaker1 7
  did -a spf.mapmaker1 5 $gettok($read(spacefighter\maps\spf.tmp,2),2,44)
  did -a spf.mapmaker1 7 $gettok($read(spacefighter\maps\spf.tmp,3),2,44)
}
;End Map Maker
;Game Settings Dialog
alias -l spf.gs { if (!$dialog(spf.gs)) { dialog -omd spf.gs spf.gs | dialog -a spf.gs spf.gs } | else { dialog -a spf.gs spf.gs } }
dialog spf.gs {
  title "SpaceFighter - Settings"
  size -1 -1 120 220
  option dbu
  box "Configure Game Performance",7, 2 2 116 216
  button "",1,1 1 1 1, cancel 
  radio "Draw Method One (Default)", 2,10 13 75 12, tab 1
  text "Shows frame rate.", 10,10 25 100 40,
  text "Shows nicks.", 11, 10 33 100 40,
  text "Auto frame rate and speed configurator.", 12, 10 41 140 40,
  radio "Draw Method Two", 3,10 53 60 12, tab 1
  text "Calculates frame rate (Does not show).", 20, 10 65 100 40,
  text "Shows nicks.", 21, 10 73 100 40,
  text "Auto frame rate and speed configurator.", 22, 10 81 140 40,
  radio "Draw Method Three", 4,10 93 60 12, tab 1
  text "No frame rate calculations at all.", 30, 10 105 100 40,
  text "Does not show nicks.", 31, 10 113 100 40,
  text "Energy bar does not change colour.", 32, 10 121 140 40,
  text "Chat Style", 60, 10 134 100 65,
  check "Window editbox (Default)", 50,20 143 70 12, tab 1
  check "Dialog", 51,20 153 60 12, tab 1
  text "Window Style", 73, 10 165 140 10,
  check "Ontop (Original Style)", 71,20 173 70 12, tab 1
  check "Minamization Allowed (Default)", 72,20 183 81 12, tab 1
  button "&Ok", 6, 35 203 50 10, cancel
}
on *:DIALOG:spf.gs:*:*: { 
  if ($devent == init) { 
    if (%Spf.dmeth.1 == 1) || (!%Spf.dmeth.1) { did -c spf.gs 2 }
    if (%Spf.dmeth.1 == 2) { did -c spf.gs 3 }
    if (%Spf.dmeth.1 == 3) { did -c spf.gs 4 }
    if (%Spf.cdmeth.1 == 1) { did -c spf.gs 50 }
    if (%Spf.cdmeth.1 == 2) { did -c spf.gs 51 }
    if (%Spf.winmeth.1 == 1) { did -c spf.gs 71 }
    if (%Spf.winmeth.1 == 2) { did -c spf.gs 72 }
  }
  if ($devent == sclick) {
    if ($did == 6) { 
      if ($did(spf.gs,2).state == 1) { %Spf.dmeth.1 = 1 }
      if ($did(spf.gs,3).state == 1) { %Spf.dmeth.1 = 2 }
      if ($did(spf.gs,4).state == 1) { %Spf.dmeth.1 = 3 }
      if ($did(spf.gs,50).state == 1) { %Spf.cdmeth.1 = 1 }
      if ($did(spf.gs,51).state == 1) { %Spf.cdmeth.1 = 2 }
      if ($did(spf.gs,71).state == 1) { %Spf.winmeth.1 = 1 }
      if ($did(spf.gs,72).state == 1) { %Spf.winmeth.1 = 2 }
    }
    if ($did == 50) { did -c spf.gs 50 | did -u spf.gs 51 }
    if ($did == 51) { did -c spf.gs 51 | did -u spf.gs 50 }
    if ($did == 71) { did -c spf.gs 71 | did -u spf.gs 72 }
    if ($did == 72) { did -c spf.gs 72 | did -u spf.gs 71 }
  }
}
;Checks For Updates Then Downloads The Update And Loads It So It Can Install
dialog spf.update {
  title "Updater"
  size -1 -1 99 81
  option dbu
  button "",1,1 1 1 1, cancel 
  box "Status",2, 1 1 97 36,
  edit "" 3, 3 8 92 27,read multi center
  button "&Download", 4,3 56 46 10, disabled
  button "&Install", 5,49 56 46 10, disabled
  edit "SpaceFighter - ToKeN 2002" 6, 3 40 92 10,read return multi center
  box "", 7, 1 35 97 17,
  box "", 9, 1 50 97 30,
  button "&Cancel", 8,3 67 92 10,
}
on *:DIALOG:spf.update:*:*: {  
  if ($devent == sclick) {
    if ($did == 4) { did -b spf.update 4 | set %spf.dl.1 2 | spf.dl.get $gettok($read(%spf.http.file,1),4,44) $gettok($read(%spf.http.file,1),5,44) | .remove %spf.http.file }
    if ($did == 5) { if (.exe isin %spf.http.file) { run %spf.http.file | echo -a Installation Complete, You need to restart mIRC | if ($dialog(Spf.update)) dialog -c spf.update | .halt } | .load -rs %spf.http.file | if ($dialog(Spf.update)) dialog -c spf.update }
    if ($did == 1) || ($did == 8) { unset %spf.http.* | sockclose spf.dl | dialog -x spf.update }
  }
}
alias spf.dl {
  if (!$dialog(spf.update)) { dialog -omd spf.update spf.update } | dialog -a spf.update spf.update
  did -o spf.update 3 1 Checking For New Versions...
  set %spf.dl.1 1
  spf.dl.get http://www.geocities.com/spf_token/update.txt update.txt
  ;SpaceFighterUpdate,build,1.1,http://blah,file.file,size10000
}
alias -l spf.dl.c { if ($dialog(spf.update)) { did -d spf.update 3 1 | did -d spf.update 3 1 | did -d spf.update 3 1 } }
alias spf.dl.get {
  sockclose spf.dl
  if ($exists(SpaceFighter\Updates\ $+ $2)) .remove SpaceFighter\Updates\ $+ $2
  %spf.http.full = $1
  %spf.http.domain = $gettok(%spf.http.full,2,47) 
  %spf.http.ext = $remove(%spf.http.full,http://,%spf.http.domain) 
  %spf.http.get = $gettok(%spf.http.full,$numtok(%spf.http.full,47),47)
  sockmark spf.dl head
  sockopen spf.dl %spf.http.domain 80 
}
on *:SOCKOPEN:spf.dl:{ 
  if ($sockerr) { 
    spf.dl.c
    did -o spf.update 3 1 Could Not Connect!
    sockclose DL | unset %spf.http* | .halt 
  }
  spf.dl.c
  did -o spf.update 3 1 Connected Getting Version Data...
  .write -c SpaceFighter\Updates\ $+ %spf.http.get 
  sockmark $sockname HEAD
  sockwrite -n $sockname GET %spf.http.ext HTTP/1.0
  sockwrite -n $sockname HOST: %spf.http.domain
  sockwrite -n $sockname ACCEPT: *.*
  sockwrite -n $sockname $crlf
} 
on *:SOCKREAD:spf.dl:{ 
  if ($sockerr) { 
    spf.dl.c 
    did -o spf.update 3 1 Error Could Not Download
    sockclose DL | unset %spf.http* | .halt 
  }
  %spf.http.file = " $+ SpaceFighter\Updates\ $+ %spf.http.get $+ " 
  :getdata
  if ($sock($sockname).mark == head) { sockread %spf.http.read }
  else { sockread &DL }
  if ($sockbr) {
    tokenize 32 $sock($sockname).mark
    if ($1 == HEAD) {
      if (%spf.http.read) {
        if ($gettok(%spf.http.read,1,32) == Content-Length:) { %spf.http.size = $gettok(%spf.http.read,2,32) }
      }
      else {
        sockmark $sockname GET
      }
    }
    elseif ($1 == GET) {
      bwrite %spf.http.file -1 &DL
      if (%spf.dl.1 == 2) { 
        spf.dl.c 
        did -o spf.update 3 1 Downloading... % $+ $int($calc($calc($file(%spf.http.file).size / %spf.http.size) * 100))
      } 
    }
    goto getdata
  }
}
on *:SOCKCLOSE:spf.dl:{
  if (%spf.dl.1 == 1) {
    if ($remove($gettok($read(%spf.http.file,1),1,44),$chr(59)) == SpaceFighterUpdate) {
      spf.dl.c
      did -o spf.update 3 1 No New Versions Detected 
      did -o spf.update 3 2 To Download The Latest Version
      did -o spf.update 3 3 Click Download
      did -e spf.update 4  
      if ($gettok($read(%spf.http.file,1),2,44) != $spf.ver(1)) { 
        spf.dl.c
        did -o spf.update 3 1 New Version: $gettok($read(%spf.http.file,1),3,44)
        did -o spf.update 3 2 Size: $round($calc($gettok($read(%spf.http.file,1),6,44) / 1024),2) $+ kb
        did -e spf.update 4
      }   
    }
  }
  if (%spf.dl.1 == 2) {
    spf.dl.c
    did -o spf.update 3 1 Download Completed
    did -o spf.update 3 2 Click Install To Install
    did -e spf.update 5 
    did -b spf.update 4
  }
} 
alias spf.ver { 
  if ($1 == 1) return $calc($calc($file($script).size * $lines($script)) + 1.40)
  if ($1 == 2) return 1.40
}
on *:ACTIVE:@Spf.Cache:{ window -n @Spf.Cache } 
;Switches everything off...
alias -l spf.uninstall {
  echo Uninstalling SpaceFighter $spf.ver(2)
  window -c @Spacefighter
  spf.close
  unset %spf.*
  echo All SpaceFighter variables have been unset
  echo SpaceFighter has been successfully Uninstalled from mIRC
  echo You will need to manually delete the folder $scriptdir to complete the Uninstall
  echo Thanks for using SpaceFighter, ToKeN
  unload -rs $script
}
on *:CLOSE:@Spacefighter: { spf.close }
alias -l spf.close {
  var %u = unset
  .remove SpaceFighter\Bitmaps\spfstartmp.bmp
  .remove SpaceFighter\Maps\spf.tmp
  window -c @Spf.cache
  window -c @Spf.msg
  window -c @Spf.score
  window -c @Spf.ship
  sockclose spf.2.main
  sockclose spf.2
  sockclose spf.findserv
  .timerSpf off
  .timerspf.udpcheck off
  .timerSpf.s off
  .timerSpfupdate off
  .timerSpf.fireupdate off
  .timerSpf.menu off
  .timerSpfprocess off
  .timerSpf.processtest off
  if (%spf.editbox.temp != $null) { color editbox %spf.editbox.temp | %u %spf.editbox.temp }
  if (%spf.editbox.temp2 != $null) { color editbox text %spf.editbox.temp2 | %u %spf.editbox.temp2 }
  %u %spf.http*
  %u %Spf.sw.m
  %u %spf.load
  %u %spf.map.*
  %u %spf.mm.title
  %u %Spf.startlc.1
  %u %spf.game
  %u %spf.notice
  %u %spf.map.loop.1
  %u %spf.scroll.d
  %u %spf.mapmaker
  %u %Spf.fire
  %u %Spf.fd*
  %u %Spf.cr.1
  %u %spf.explode.*
  %u %spf.2.u*
  %u %Spf.bmp.1
  %u %Spf.sd.1
  %u %Spf.shield.1
  %u %spf.scroll.list.sel
  %u %Spf.start
  %u %Spf.fire 
  %u %Spf.menu
  %u %Spf.fire.1
  %u %Spf.firecount
  %u %spf.process.num
  %u %spf.menu
  %u %Spf.pcomp
  %u %spf.cr.1
  %u %spf.st
  %u %spf.slist
  %u %spf.multi.client
  %u %spf.multi.2.sname
  %u %spf.multi.2.nick
  %u %spf.multi.2.ip
  %u %spf.multi.2.port
  %u %spf.2.un
  %u %Spf.s.1
  %u %Spf.hs.1
  %u %Spf.vs.1
  %u %Spf.v*
  %u %spf.scroll.x
  %u %spf.scroll.y
  %u %Spf.error
  %u %Spf.g.x
  %u %Spf.g.y
  %u %Spf.g.x2
  %u %Spf.g.y2
  %u %spf.test.m
  %u %spf.ping
  %u %Spf.cr.bmp
  %u %spf.2.pakloss
  %u %spf.mapmaker
  %u %spf.2.maptotal
  %u %spf.2.mapdone
  %u %spf.scroll
  %u %spf.c.*
  %u %spf.fps.*
  %u %Spf.firec.1
  %u %spf.2.udp 
  %u %spf.2.main
  %u %spf.m0
  %u %spf.m1
  %u %spf.m2
  %u %spf.m3
  %u %spf.m4
  %u %spf.m5
  %u %spf.test.s
  %u %spf.udp.data.s
  %u %spf.splayer
  %u %Spf.bmp.menu1
  %u %Spf.bmp.menu2 
  %u %Spf.sd.menu1 
  %u %Spf.sd.menu2 
  %u %Spf.ship.menu1 
  %u %Spf.ship.menu2 
}
;End
