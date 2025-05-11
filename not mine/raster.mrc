alias raster window -CdoBpk[0]hn +tL @r 0 0 600 410 | titlebar @r A S T E R * Reset demo style | %q = LOOK AT ME AND YOU'LL SEE A REALLY WEIRD EFFECT! DEMO SPIRIT RULES (: | %" = drawtext -rn @r | %' = terminal 8 | a
alias -l a {
  var %i 300,%r $sin(%f),%z $calc(-104+104*%r) | inc %u .002 | inc %f $calc($cos(%u)/4)
  while %i { var %s $sin(%i).deg,%t $calc(48-28*%s *%d),%k = $rgb($calc(126+126*%s *$cos(%f)),$calc(126-126*%r),$calc(126-126*%s *%r)) | drawdot -nr @r %k %t $calc(%z +%i) 380 | drawdot -nr @r %k %t $calc(%z +600-%i) 380 | drawdot -nr @r %k %t $calc(-%z +600+%i) 380 | dec %i 20 }
  drawscroll -n @r 0 -10 0 0 600 370 | if (%u > .07) drawdot @r | if (%u = .07) window -a @r -1 -1 600 340 | if %u > 3 { drawdot -nri @r 600 347 300 186 | set %d 1 } | else { set %d %r | if %u < .5 { %" 0 %' $calc(100+20*%r) $calc(291-8*%r) %q | %" 16777215 %' $calc(101+20*%r) $calc(290-8*%r) %q } } | .timer1 -mho 1 0 a
}
on *:close:@r:.timer1 off | unset %u %f %q %g %d %" %'

alias picwin {
  if ($1 == again) { .timerpicwin* off | hfree -w picwin | initgame | gamestart }
  elseif ($1 == clear) { .timerpicwin* off | hfree -w picwin | window -c @picwinbuf }
  else { initwin | initgame | gamestart }
}
alias -l initwin {
  window -fpdoCB @picwin -1 -1 200 300 
  window -fpdCBh @picwinbuf -1 -1 200 300
}
alias -l initgame {
  hadd -m picwin x 100
  hadd picwin y 10
  hadd picwin inair 1
  hadd picwin scroll 0
  hadd picwin maxscroll 40
  drawrect -fr @picwinbuf 16777215 0 0 0 200 300
}
alias -l gamestart {
  .timerpicwindec 0 7 hdec picwin maxscroll 1 $(|) var % $+ r $!r(0,100) $(|) hadd picwin bonus $!iif(%r isnum 0-24,1,$iif(%r isnum 25-49,4,$iif(%r isnum 50-69,2,$iif(%r isnum 70-89,3,5))))
  generate&scroll 3
  hadd picwin start $ticks
  mainloop
}
alias -l bonus {
  if ($hget(picwin,bonus)) {
    drawdot -r @picwinbuf $gettok(10223772 64512 16515072 13816530 32764,$v1,32)) 5 $calc($1 + $iif($hget(picwin,hole),7,12)) 295
    hdel picwin bonus
  }
}
alias -l generate&scroll {
  if (!$hget(picwin,noscroll)) {
    :start
    if (!$hget(picwin,scroll)) && ($r(0,$iif($hget(picwin,hole),190,180)) != $null) {
      var %v $v1,%r $r(0,$iif($hget(picwin,hole),190,180))
      drawline -r @picwinbuf 0 3 0 290 200 290
      drawline -r @picwinbuf 16777215 3 %v 290 $calc(%v + $iif($hget(picwin,hole),10,20)) 290
      if ($hget(picwin,double)) drawline -r @picwinbuf 16777215 3 %r 290 $calc(%r + $iif($hget(picwin,hole),10,20))) 290
      bonus %v
    }
    drawscroll @picwinbuf 0 $iif($1,-40,-1) 0 0 200 300
    if ($1) { tokenize 32 $calc($1 -1) | goto start }
    if (!$hget(picwin,inair)) && ($hget(picwin,y) > 0) hdec picwin y 1
    hadd picwin scroll $iif($hget(picwin,scroll) >= $hget(picwin,maxscroll),0,$calc($v1 +1))
  }
  .timerpicwingen -ho 1 10 generate&scroll
}
alias -l mainloop {
  if ($hget(picwin,y) == 0) {
    if ($input(Score: $calc(($ticks - $hget(picwin,start)) / 1000) $+ $crlf $+ Play again ?,ys,@picwin,Picwin)) picwin again
    else picwin clear    
    return
  }
  var %s $gettok($hget(picwin,stack),1,32),%y $hget(picwin,y) + $iif($hget(picwin,inair),2,0),%x $hget(picwin,x) $iif(%s,$iif($v1 == 37,-,+) $iif($hget(picwin,boost),5,3))
  var %x = $iif(%x < 5,5,$iif(%x > 198,198,%x))
  if ($getdot(@picwinbuf,$calc(%x - 3),%y)) || ($hget(picwin,nofloor)) hadd picwin inair 1
  else hdel picwin inair
  if ($hget(picwin,inair)) && ($getdot(@picwinbuf,$calc(%x - 3),$calc(%y - 3))) && ($v1 != 16777215) {
    var %v $v1
    drawreplace -r @picwinbuf %v 16777215 $calc(%x - 15) $calc(%y - 15) 50 50
    hinc picwin bonus $+ %v
    var %n $hget(picwin,bonus $+ %v)
    if (%v == 10223772) && (%n == 2) hadd -u6 picwin double 1 $iif(del,)
    elseif (%v == 16515072) && (%n == 3) hadd -u5 picwin noscroll 1 $iif(del,)
    elseif (%v == 64512) && (%n == 2) hadd -u5 picwin boost 1 $iif(del,)
    elseif (%v == 32764) && (%n == 3) hadd -u5 picwin nofloor 1 $iif(del,)
    elseif (%v == 13816530) && (%n == 1) hadd -u6 picwin hole 1 $iif(del,)
    if ($v1 == del) hdel picwin bonus $+ %v
  }
  hadd picwin x %x
  if (%y > 288) && (!$hget(picwin,pro)) { hadd -u3 picwin pro 1 | var %r $r(0,100) | hadd picwin bonus $iif(%r isnum 0-34,1,$iif(%r isnum 35-69,2,$iif(%r isnum 70-89,3,5)))) }
  hadd picwin y $iif(%y > 288,288,%y)
  drawcopy -n @picwinbuf 0 0 200 300 @picwin 0 0
  drawdot -nr @picwin 255 5 $hget(picwin,x) $hget(picwin,y)
  drawdot @picwin
  titlebar @picwin $round($calc(($ticks - $hget(picwin,start)) / 1000),1)
  .timerpicwinmain -ho 1 10 mainloop
}
on *:close:@picwin:picwin clear
on *:keydown:@picwin:37,39:tokenize 32 $hget(picwin,stack) | hadd picwin stack $keyval $iif($keyval != $1,$1,$2)
on *:keyup:@picwin:37,39:hadd picwin stack $remtok($hget(picwin,stack),$keyval,32)
