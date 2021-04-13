; changes:
; added weapons
; recoded damage system - strength extra damage adds on to AP - DP, if critical, damage is doubled intially before comparing AP and DP
; weapon deals extra damage (+50%)
; strength no longer affects defense
; life gained is proportionate to the lower the defense the higher the gain
; now only 1 card changes per turn
; multiplayer!


; should try to play fighting music during gamecard choosing screeen.. so it won't lag...


; NEXT
; CONTINUE .. start working on CLIENT connecting to SERVER procedures so to test!
alias grayscale {
  var %w = $regex($1-,("[^"]+"|[^\x20]+)),%file = $regml(1)
  tokenize 32 $mid($1-,$calc($len(%file) +1))
  var %w = $regex($1-,("([^"]+)"|[^\x20]+)),%out = $regml(1)
  
  if $iif(%file && %out,0,1) { echo -aq *** /resample: insulficient parameters | return }
  
  var %time = $ticks,%p = $editbox($active),%w = @i $+ $ticks,%tmp = t $+ $ticks $+ .bmp,%tmp_ = %tmp $+ _
  close -@ %w
  window -pkhB +d %w 0 0 $pic(%file).width $pic(%file).height
  drawpic %w 0 0 %file
  drawsave -ob24 %w %tmp
  close -@ @i
  var %f = $replace(%file,$chr(32),_)
  var %o = $replace(%out,$chr(32),_)
  .fopen %f %tmp
  var %n = $fread(%f,54,&h)
  write -c %tmp_
  .fopen %o %tmp_
  .fwrite -b %o &h
  var %y = $fread(%f,$lof(%tmp),&in)
  bset &o %y 0
  
  var %x = 1
  while (%x < %y) {
    tokenize 32 $bvar(&in,%x,3)
    var %a = $round($calc(($1 + $2 + $3)/3),0)
    bset &out %x %a %a %a
    if (500 // %x) editbox -a $round($calc(%x * 100 / %y),1) $+ %
    inc %x 3
  }
  .fwrite -b %o &out
  if (!$isid) echo -qa *** Resample time: $calc(($ticks - %time) / 1000) secs
  .fclose %f | .fclose %o
  .remove %out
  .copy %tmp_ %out
  .remove %tmp_ | .remove %tmp
  editbox -a %p
}

alias drawnoise {
  var %w = $4 + $6, %h = $5 + $7
  var %x = $str($+($!r($4,%w),$chr(32),$!r($5,%h),$chr(32)),38)
  var %i = 1
  while (%i <= $3) {
    drawdot -nir $1 $2 70 $eval(%x,2) $eval(%x,2) $eval(%x,2)
    inc %i
  }
  drawdot $1
}
alias -l debugf {
  var %d $sxcfget(debugf)
  if ((%d) && (%d != $1)) return
  echo -s 4DEBUG1  $1  $2-
}
alias -l title return sxCardFighters
alias -l story return Jeric Helsvin
alias -l chapter return Chapter 2 - The Found Swords
alias -l ver return v0.3
alias -l author return sprion(@lyniq.com)
alias sxcfman {
  var %w @sxcf_manual,%f $+(",$scriptdir,readme.txt,")
  window +l %w -1 -1 554 523 Terminal 13
  loadbuf $lines(%f) %w %f
}
alias sxcf {
  if ($hget(sxcf)) hfree sxcf
  hmake sxcf 10
  sockclose sxcf*
  var %wi @sxcf_CardFighters,%w = 496,%h 210
  drawpic -c
  sxcfset debugf 1
  sxcfset win %wi
  sxcfset w %w
  sxcfset h %h
  sxcfset ctime $ctime
  sxcfset msgno 0
  sxcfset msgtime 7
  sxcfset nick $me
  
  ; some of these settings should be encrypted into a dat file !
  
  ; game settings
  sxcfset totalcards 6
  sxcfset music 1
  sxcfset sounds 1
  sxcfset gameport 5190
  ; highest health
  sxcfset highestHP 1000
  ; 1 - 5
  sxcfset speed 3
  
  ; game rules
  ; (0 means always change ALL cards,1 means change LAST CHOSEN card)
  sxcfset randomize_style 1
  sxcfset normalhit 100
  sxcfset critical_multiplier 2
  sxcfset max_hpgain 150
  
  ;tile size
  sxcfset tile_w 50
  sxcfset tile_h 50
  
  ; INIT
  ;sxcfset folder D:\Workspace\sxCardFighters\
  sxcfset folder $scriptdir
  sxcfset files general
  sxcfset trans $rgb(255,51,255)
  ;  sxcfset bgcol $rgb(11,15,63)
  sxcfset bgcol $rgb(88,56,16)
  sxcfset hilite $rgb(216,136,64)
  sxcfset esccol $rgb(222,178,0)
  sxcfset hilite1 $rgb(224,224,224)
  sxcfset hilite2 $rgb(254,191,82)
  
  ; game init
  sxcfset myhp $sxcfget(highestHP)
  sxcfset opphp $sxcfget(highestHP)
  sxcfset shownmyhp $sxcfget(highestHP)
  sxcfset shownopphp $sxcfget(highestHP)
  sxcfset charset Helen,Jeric,Krishnan
  sxcfset Helen_story Helen Geisvalt, borned in 1734, was a lovely|young woman, who discovered her special|abilities to wield a sword at the age of 10.
  sxcfset Helen_stats 5,1,5
  sxcfset Helen_weapon Helen's Sting
  sxcfset Helen_specialty 3
  sxcfset Jeric_story Jeric Helsvin, borned in 1730, slayed Eliz|Dracula with his spectacular skill of swordplay.|He was butchered in 1758 by Gabrielle Dracula.
  sxcfset Jeric_stats 4,4,2
  sxcfset Jeric_weapon Scholar's Sword
  sxcfset Jeric_specialty 3
  sxcfset Krishnan_story Krishnan Ganesan, made the infamous Krishnan's|Scimitar that slade the last King of the 18th|Century, King Ramadan. Birthplace unknown.
  sxcfset Krishnan_stats 3,3,3
  sxcfset Krishnan_weapon K.'s Scimitar
  sxcfset Krishnan_specialty 1
  
  ; toggles
  sxcfset highquality 1
  sxcfset showfps 1
  
  ;config
  sxcfset stepsize 2
  ;-hop +f   -hnp +f
  window -Bdop +d %wi $int($calc(($window(-2).w - %w) /2)) $int($calc(($window(-2).h - %h) /2)) %w %h
  window -Bhp +d %wi $+ _bg $int($calc(($window(-2).w - %w) /2)) $int($calc(($window(-2).h - %h) /2)) %w $calc(%h *2)
  window -Bhp +d %wi $+ _fs $int($calc(($window(-2).w - %w) /2)) $int($calc(($window(-2).h - %h) /2)) %w $calc(%h *2)
  window -Bhp +d %wi $+ _filter $int($calc(($window(-2).w - %w) /2)) $int($calc(($window(-2).h - %h) /2)) %w $calc(%h)
  window -Bhp +d %wi $+ _copy $int($calc(($window(-2).w - %w) /2)) $int($calc(($window(-2).h - %h) /2)) %w $calc(%h *2)
  window -Bhp +d %wi $+ _temp $int($calc(($window(-2).w - %w) /2)) $int($calc(($window(-2).h - %h) /2)) %w %h
  window -Bhp +d %wi $+ _text $int($calc(($window(-2).w - %w) /2)) $int($calc(($window(-2).h - %h) /2)) %w $calc(%h *2)
  window -a %wi
  
  sxcf_cache $sxcfget(charset)
  sxcf_maincache
  
  sxcf_d_preparefilter -d $rgb(0,0,0)
  
  drawrect -frn %wi $+ _text $sxcfget(trans) 1 0 0 %w %h
  drawdot %wi
  
  %sxcf.fps = 0
  %sxcf.frame.counter = 0
  %sxcf.fps.tick = $ticks
  
  %sxcf.bg.x = 0
  %sxcf.bg.scale = 1
  %sxcf.bg.scaledx = 0
  %sxcf.bg.scaledy = 0
  %sxcf.bg.scaledw = %w
  %sxcf.bg.scaledh = %h
  %sxcf.bg.drawnx = 0
  %sxcf.bg.drawny = 0
  
  %sxcf.effect.defaps = 100
  %sxcf.effect.defpps = 400
  %sxcf.effect.pps = 400
  
  %sxcf.fillcards.defpps = 400
  %sxcf.fillcards.pps = 400
  
  ; intro
  %sxcf.bg.y = %h
  sxcf_d_emptystage %wi $+ _bg
  
  %sxcf.intro.pps = 100
  %sxcf.intro = 1
  %sxcf.intro.1 = 1
  
  if ($sxcfget(music)) splay $sxcf_db(intro.mid)
  
  sxcf_loop
}
alias -l gt var %z $+(",$scriptdir,game_tools.dll,") | if ($isid) return $dll(%z, $$1 ,$$2-) | else dll %z $$1 $$2-
alias sxcf_w_2plaunch {
  unset %sxcf.select*
  sxcf_d_prefight
  sxcf_w_queuepush sxcf_w_2psetup
}
alias sxcf_w_msg {
  var %m $sxcfget(msgtime),%n $numtok(%sxcf.msg.txt,124)
  .timersxcf $+ $ticks -o 1 %m set %sxcf.msg.txt $!deltok(%sxcf.msg.txt,$numtok(%sxcf.msg.txt,124),124)
  %sxcf.msg.txt = $instok(%sxcf.msg.txt,$1-,1,124)
  %sxcf.msg = 1
}
alias sxcf_w_showcards {
  var %si $1 $+ _copy,%ri $1 $+ _fs,%x 0,%y 0,%w $window($1 $+ _fs).w,%h $window($1 $+ _fs).h
  sxcfset mychar $2
  sxcfset myturn $3
  sxcfunset oppshow
  sxcfunset oppready
  sxcfunset cards2drawn
  sxcf_d_preparelayer cards 0 300 %w 100
  drawcopy -n %ri 0 0 %w %h $sxcf_layer(cards) %x %y
  sxcf_d_cards $sxcf_layer(cards) -7 300 100 100
  sxcf_d_cardtext $sxcf_layer(cards)
  %sxcf.fillcards = 1
  %sxcf.fillcards.pps = 50
}

alias sxcf_w_hidecards {
  sxcf_d_clearlayer cards
  sxcf_d_clearlayer cards2
  %sxcf.fillcards = 0
}
alias sxcf_w_hidemovingpics sxcf_d_clearlayer cards2 | %sxcf.fillcards = 0
alias sxcf_w_setright sxcfset myside left
alias sxcf_w_setleft sxcfset myside right
alias sxcf_w_oppselected {
  sxcfset oppready 1
  sxcf_w_selcard cards
  sxcfunset cards2drawn
}
alias sxcf_w_oppshowcard {
  sxcfset oppchar $1
  sxcfset oppcard $2
  sxcfset oppcard_value $3
  sxcfset oppshow 1
  sxcf_w_selcard cards
}
alias sxcf_w_selcard {
  if ((!$2) && (!$sxcfget(mycard))) return
  var %tu $sxcfget(myturn),%opp 200,%b $sxcfget(totalcards),%wi $sxcf_layer($1),%n 1,%card $sxcfget(cards),%val $sxcfget(cards_value)
  drawrect -frn %wi $sxcfget(bgcol) 1 0 300 $window(%wi).w 100
  var %cl $rgb(51,51,51),%cl2 $rgb(153,204,153),%cl3 $rgb(51,51,51),%cl4 $rgb(51,204,204)
  if (%tu = defend) { %cl3 = %cl2 | %cl2 = %cl4 | %cl4 = %cl3 | %cl3 = %cl }
  ;  if ($3 = -right) %n = 6
  if ($sxcfget(myside) = right) { %n = %b | %b = 1 | %opp = 300 }
  
  var %x -7,%y 300,%z 0,%oz 100
  if (%tu = defend) { %z = 100 | %oz = 0 }
  
  if ($sxcfget(oppshow)) {
    var %opcard $sxcfget(oppcard),%opval $sxcfget(oppcard_value),%ty 318,%tx 18
    drawcopy -t @sxcf_general $sxcfget(trans) %oz 200 100 100 %wi $int($calc(%x + (%b *82) -82)) %y
    drawtext -nr %wi %cl3 System 25 $int($calc(18 + %tx + (%b *82) -82)) $calc(%ty + 48) $sxcf_g_translate(%opcard)
    drawtext -nr %wi %cl4 System 25 $int($calc(16 + %tx + (%b *82) -82)) $calc(%ty + 46) $sxcf_g_translate(%opcard)
    drawtext -nr %wi %cl3 System 20 $int($calc(43 + %tx + (%b *82) -82)) $calc(%ty -8) %opval
  }
  elseif ($sxcfget(oppready)) drawcopy -t @sxcf_general $sxcfget(trans) %opp 200 100 100 %wi $int($calc(%x + (%b *82) -82)) %y
  if ($2) { %card = $gettok(%card,$2,44) | %val = $gettok(%val,$2,44) }
  
  drawcopy -t @sxcf_general $sxcfget(trans) %z 200 100 100 %wi $int($calc(%x + (%n *82) -82)) %y
  
  %x = 18
  %y = 318
  drawtext -nr %wi %cl System 25 $int($calc(18 + %x + (%n *82) -82)) $calc(%y + 48) $sxcf_g_translate(%card)
  drawtext -nr %wi %cl2 System 25 $int($calc(16 + %x + (%n *82) -82)) $calc(%y + 46) $sxcf_g_translate(%card)
  drawtext -nr %wi %cl System 20 $int($calc(43 + %x + (%n *82) -82)) $calc(%y -8) %val
  ;  sxcfset cards %card
  ;  sxcfset cards_value %val
  sxcfset mycard %card
  sxcfset mycard_value %val
  sxcfset mycard_pos_ $+ %tu $2
  sxcfunset cards2drawn
}
alias sxcf_w_randomizecards {
  var %r $sxcfget(randomize_style),%t $sxcfget(myturn),%p $sxcfget(prevcards_ $+ %t),%n $sxcfget(totalcards),%f,%s 1,%e 3,%u,%lp $gettok($sxcfget($+($sxcfget(mychar),_stats)),3,44)
  if (%t = defend) { %s = 4 | %e = 6 }
  if ((%r) && (%p)) {
    var %nn $sxcfget(mycard_pos_ $+ %t)
    
    debugf RANDOMCARD changing that 1 card .. just now was - %p
    ; let's change the 1 card he chose
    sxcfset cards $puttok(%p,$r(%s,%e),%nn,44)
    sxcfset cards_value $puttok($sxcfget(prevcards_ $+ %t $+ _value),$r(%lp,9),%nn,44)
    
    debugf RANDOMCARD it's become $sxcfget(cards)
    
    ; store after changing..
    sxcfset prevcards_ $+ %t $sxcfget(cards)
    sxcfset prevcards_ $+ %t $+ _value $sxcfget(cards_value)
    
    ; ok forget player selection!
    sxcfunset mycard_pos_ $+ %t
    sxcfunset mycard
    sxcfunset mycard_value
  }
  else {
    while %n > 0 {
      %f = $instok(%f,$r(%s,%e),1,44)
      %u = $instok(%u,$r(%lp,9),1,44)
      dec %n
    }
    /*    ; store these cards before showing new
    if (%c) {
      sxcfset prevcards_ $+ %t %c
      sxcfset prevcards_ $+ %t $+ _value %v
    }
    */
    sxcfset cards %f
    sxcfset cards_value %u
    
    if (%r) {
      sxcfset prevcards_ $+ %t %f
      sxcfset prevcards_ $+ %t $+ _value %u
    }
    
  }
}
alias sxcf_w_newrule {
  sxcfunset shifting
  sxcfunset critical
  sxcfunset hpchange
  sxcfunset winner
  sxcfunset updatehealth
  sxcfunset updatehealth2
}
alias sxcf_w_rules {
  
  var %op,%pp,%adds = 20,%movable,%critical = 0,%hpchange = $+(-,$sxcfget(normalhit)),%turn = $sxcfget(myturn),%att,%def,%ap,%dp,%hpp
  if (!$sxcfget(critical)) {
    if (%turn = attack) {
      
      %hpp = $gettok($sxcfget($+($sxcfget(mychar),_stats)),1,44)
      %pp = $gettok($sxcfget($+($sxcfget(mychar),_stats)),2,44)
      %sp = $sxcfget($+($sxcfget(mychar),_specialty))
      ;      %op = $gettok($sxcfget($+($sxcfget(oppchar),_stats)),2,44)
      
      %att = $1
      %ap = $2
      ;      %ap = $calc($2 + %pp)
      %def = $3
      %dp = $4
      
    }
    else {
      %hpp = $gettok($sxcfget($+($sxcfget(oppchar),_stats)),1,44)
      %pp = $gettok($sxcfget($+($sxcfget(oppchar),_stats)),2,44)
      %sp = $sxcfget($+($sxcfget(oppchar),_specialty))
      ;      %op = $gettok($sxcfget($+($sxcfget(mychar),_stats)),2,44)
      
      
      %att = $3
      %ap = $4
      ;      %ap =
      %def = $1
      %dp = $2
      
    }
    ; L is blocked by B, criticaled by D
    if (%att = 1) {
      if (%def != 4) %movable = 2
      else { %movable = 3 | %hpchange = 1 }
      if (%def = 5) %critical = 1
    }
    
    ; S is blocked by D, criticaled by P
    elseif (%att = 2) {
      if (%def != 5) %movable = 2
      else { %movable = 3 | %hpchange = 1 }
      if (%def = 6) %critical = 1
    }
    
    ; T is blocked by P, criticaled by B
    elseif (%att = 3) {
      if (%def != 6) %movable = 2
      else { %movable = 3 | %hpchange = 1 }
      if (%def = 4) %critical = 1
    }
    
    
    ;    if (%ap > %dp) %hpchange = $calc(%hpchange + ((%ap - %dp) * %adds))
    ;    elseif (%dp > %ap) %hpchange = $calc(%hpchange - ((%dp - %ap) * %adds))
    
    if ((%hpchange < 0) && (!$sxcfget(hpchange))) {
      if (%critical) { %hpchange = $calc(%hpchange * $sxcfget(critical_multiplier)) | %adds = 20 }
      
      debugf RULECHECK AP: %ap - DP: %dp  -- so .. damage from %hpchange became .. $calc(%hpchange - (((%ap - %dp) * %adds)))
      dec %hpchange $calc(((%ap - %dp) * %adds))
      ;      debugf character's Power point is %pp , opponent's %op
      debugf RULECHECK Attacker power: %pp .. so damage from %hpchange became $calc(%hpchange - %pp * %adds)
      dec %hpchange $calc(%pp * %adds)
      
      if (%sp = %att) { inc %hpchange $calc(%hpchange *0.5) | debugf RULECHECK Attacker's specialty is %sp .. attack is %att --- %damage is now %hpchange }
      /*
      var %before %hpchange
      dec %hpchange $calc(%pp /20 * %before * -1)
      inc %hpchange $calc(%op /20 * %before * -1)
      */
      ;      debugf increased $calc(%pp /20 * %before * -1) , decreased $calc(%op /20 * %before * -1)
      ;      debugf so DAMAGE became %hpchange
    }
    
    
    if ((%hpchange) && (!$sxcfget(hpchange))) {
      ; new life increase system; max is 150
      if (%hpchange > 0) {
        %hpchange = $calc((3 + %hpp + (%ap - %dp))/16 * $sxcfget(max_hpgain))
      }
      
      ; time to fluctuate a bit
      %hpchange = $calc((%hpchange + $sxcf_r(15)))
      
      ; round it up
      %hpchange = $ceil(%hpchange)
      
      ; reflect the changes in stored character's HP
      ; if adding life, make sure it doesn't exceed MAXHP of char
      if (%turn = attack) {
        if (%hpchange > 0) {
          var %opphp $sxcfget(opphp), %oppfull $sxcfget(oppfullhp)
          if ($calc(%opphp + %hpchange) > %oppfull) %hpchange = $calc(%oppfull - %opphp)
          elseif (%opphp = %oppfull) %hpchange = 0
        }
        if (%hpchange) {
          hinc sxcf var_opphp %hpchange
          if ($sxcfget(opphp) <= 0) { sxcfset winner me | sxcfset opphp 0 }
        }
      }
      else {
        if (%hpchange > 0) {
          var %myhp $sxcfget(myhp),%myfull $sxcfget(myfullhp)
          if ($calc(%myhp + %hpchange) > %myfull) %hpchange = $calc(%myfull - %myhp)
          elseif (%myhp = %myfull) %hpchange = 0
        }
        if (%hpchange) {
          hinc sxcf var_myhp %hpchange
          if ($sxcfget(myhp) <= 0) { sxcfset winner opp | sxcfset myhp 0 }
        }
      }
      sxcfset hpchange %hpchange
    }
    sxcfset critical %critical
    sxcfset shifting %movable
  }
  return $sxcfget(shifting)
}
alias sxcf_w_genranoppcard {
  if ($sxcfget(myturn) = attack) sxcfset oppcard $r(4,6)
  else sxcfset oppcard $r(1,3)
  ;  else sxcfset oppcard $r(1,1)
  ; difficulty
  sxcfset oppcard_value $r(6,9)
  ;  sxcfset oppcard_value $r(1,1)
}
;configs
alias sxcf_p_host sxcfset gameport $$input(Enter server port number: (Default: 5190),eq,Host configuration,$sxcfget(gameport))
;screens
alias sxcf_w_1p unset %sxcf.topmenu* | sxcfset myside left | %sxcf.w.1p = 1 | sxcf_d_presel
alias sxcf_w_host {
  var %p $sxcfget(gameport)
  socklisten sxcfserver %p
  sxcf_w_nodraw
  %sxcf.host = 1
  %sxcf.host.stp = 1
  %sxcf.host.cnt = 1
  %sxcf.bg.y = $sxcfget(h)
  return
  :error
  %p = $input(The port %p is in use! Please configure.,oh,Server Error)
}
alias sxcf_w_join {
  if (!%sxcf.join.port) %sxcf.join.port = $sxcfget(gameport)
  %sxcf.join.ip = $$input(Enter host IP:,eq,Join a Game (1/2),%sxcf.join.ip)
  %sxcf.join.port = $$input(Enter host port: (Default: 5190),eq,Join a Game (2/2),%sxcf.join.port)
  sockopen gamesv %sxcf.join.ip %sxcf.join.port
  sxcf_w_nodraw
  %sxcf.join = 1
  %sxcf.bg.y = $sxcfget(h)
  %sxcf.join.stp = 1
}
alias sxcf_w_help sxcf_w_nodraw | %sxcf.help = 1
alias sxcf_w_reset { if ($sxcfget(music)) splay -c $sxcf_db(intro.mid) | sxcf_w_nodraw | sxcf_d_emptystage $sxcfget(win) $+ _bg | %sxcf.bg.y = $window($sxcfget(win)).h | %sxcf.intro = 1 | %sxcf.intro.pps = 120 }
alias sxcf_w_menu { if ($sxcfget(music)) splay -cq $sxcf_db(intro.mid) | sxcf_w_nodraw | sxcf_d_emptystage $sxcfget(win) $+ _bg | %sxcf.menu = 1 | %sxcf.menu.pps = 200 | %sxcf.bg.y = 0 | sxcf_topmenu_main }
alias sxcf_w_select { if ($sxcfget(music)) splay -c $sxcf_db(select.mid) | sxcf_w_nodraw | sxcf_d_emptystage $sxcfget(win) $+ _bg | %sxcf.select = 1 | %sxcf.select.char = 1 | %sxcf.select.menuon = 1 }
alias sxcf_w_nodraw {
  unset %sxcf.host* %sxcf.join %sxcf.1p %sxcf.filter* %sxcf.charpic* %sxcf.note* %sxcf.menu* %sxcf.animate* %sxcf.topmenu* %sxcf.effect* %sxcf.intro* %sxcf.help* %sxcf.select* %sxcf.fillcards*
  clear $sxcfget(win) $+ _fs
}
alias sxcf_w_resetlife {
  var %f $sxcfget(highestHP), %mlp $gettok($sxcfget($+($sxcfget(mychar),_stats)),1,44), %olp $gettok($sxcfget($+($sxcfget(oppchar),_stats)),1,44),%mhp $calc(%mlp /5 * %f),%ohp $calc(%olp /5 * %f)
  sxcfset myhp %mhp
  sxcfset myfullhp %mhp
  sxcfset opphp %ohp
  sxcfset oppfullhp %ohp
  sxcfset shownmyhp %mhp
  sxcfset shownopphp %ohp
}
alias sxcf_w_queueignore %sxcf.queueignore = $1
alias sxcf_w_queuelisten %sxcf.queuelisten = $1
alias sxcf_w_queuepush {
  sxcfset queue_no $calc($sxcfget(queue_no) +1)
  sxcfset $sxcfget(queue_no) $1-
}
alias sxcf_w_queuepop {
  if (%sxcf.queueignore) {
    if ($istok(%sxcf.queueignore,$1,44)) return
    else unset %sxcf.queueignore
  }
  elseif (%sxcf.queuelisten) {
    if ($istok(%sxcf.queuelisten,$1,44)) unset %sxcf.queuelisten
    else return
  }
  var %q $sxcfget(queue_no)
  if (%q) {
    debugf QUEUE CALLER is $1 - $sxcfget(%q)
    .timer -oh 1 0 $sxcfget(%q)
    sxcfunset %q
    sxcfset queue_no $calc(%q -1)
  }
}
alias sxcf_w_1pstep { %sxcf.1p = $1 | unset %sxcf.1p.count }
alias sxcf_w_1psetup {
  if ($sxcfget(music)) splay $sxcf_db(fight.mid)
  %sxcf.fight = 1
  var %c $sxcfget(charset),%r = $gettok(%c,$r(1,$numtok(%c,44)),44)
  while (%r = $sxcfget(mychar)) {
    %r = $gettok(%c,$r(1,$numtok(%c,44)),44)
  }
  sxcfset oppchar %r
  sxcf_effect_boxin $sxcfget(win)
  ;%sxcf.effect.after = .timer -oh 1 0
  %sxcf.1p = 1
  
  ; random start attack or defend?
  if ($r(0,1)) sxcfset myturn attack
  else sxcfset myturn attack defend
  %sxcf.1p.pps = 200
  
  sxcf_w_resetlife
  sxcfunset winner
  hdel -w sxcf var_prevcards_*
}
alias sxcf_w_rr {
  %sxcf.fight = 1
  if ($sxcfget(music)) splay -cq $sxcf_db(fight.mid)
  sxcf_w_resetlife
  sxcf_w_nodraw
  sxcf_d_emptystage $sxcfget(win) $+ _bg
  sxcf_d_arena $sxcfget(win) $+ _bg
  if (%sxcf.w.1p) { %sxcf.1p = 1 | %sxcf.1p.pps = 200 }
  var %fs = $sxcfget(win) $+ _bg
  %sxcf.effect.boxin.cmd = drawrect -fr $sxcfget(win) $+ _fs $sxcfget(bgcol) 1 0 0 $window(%fs).w $window(%fs).h
  ;drawcopy %fs 0 0 $window(%fs).w $window(%fs).h $sxcfget(win) $+ _fs 0 0
  ;drawrect -fr $sxcfget(win) $+ _fs $sxcfget(bgcol) 1 0 0 $window(%fs).w $window(%fs).h
  drawcopy -n %fs 0 0 $window(%fs).w $window(%fs).h $sxcfget(win) $+ _copy 0 0
  sxcf_effect_boxin $sxcfget(win)
  %sxcf.effect = 1
  sxcfunset winner
  hdel -w sxcf var_prevcards_*
}
alias sxcf_w_newturn {
  sxcfunset mycard
  sxcfunset mycard_value
  sxcfset myturn $iif($sxcfget(myturn) = attack,defend,attack)
}
alias sxcfset hadd sxcf $+(var_,$1) $2-
alias sxcfget return $hget(sxcf,$+(var_,$1))
alias sxcfunset hdel sxcf $+(var_,$1)
alias sxcf_layer return $+($sxcfget(win),_layer,$1)
alias sxcf_db return $+(",$sxcfget(folder),$1-,")
alias sxcf_r {
  var %n $r(0,1), %p $r(1,$1)
  if (%n) return %p
  else return $+(-,%p)
}
alias sxcf_topmenu {
  var %fs $1 $+ _fs,%r $sxcfget(bgcol),%rr $sxcfget(hilite),%n 1,%h $calc($numtok(%sxcf.topmenu.items,44) *20)
  ;round end
  drawrect -dfrn $1 %r 1 $calc(%sxcf.topmenu.x +3) $calc(%sxcf.topmenu.y +3) 122 %h 10 10
  drawrect -dfrn $1 $rgb(255,255,255) 1 %sxcf.topmenu.x %sxcf.topmenu.y 122 %h 10 10
  while ($gettok(%sxcf.topmenu.items,%n,44)) {
    sxcf_d_text -b $iif(%sxcf.topmenu.sel = %n,%rr,%r) -f Terminal 13 $1 247 $calc(%sxcf.topmenu.y + 10 + (%n -1) *20) $gettok(%sxcf.topmenu.items,%n,44)
    inc %n
  }
  sxcf_w_queuepop topmenu
}
alias sxcf_msg {
  var %fs $1 $+ _fs,%r $sxcfget(bgcol),%rr $sxcfget(hilite),%n 1,%t $numtok(%sxcf.msg.txt,124)
  if (!%t) unset %sxcf.msg
  else {
    while (%n <= %t) {
      var %x = $gettok(%sxcf.msg.txt,%n,124),%y $calc(189 - (%n - 1) *17)
      drawtext -nri $1 $rgb(0,0,0) terminal 15 $calc(14 +1) $calc(%y +1) %x
      drawtext -nri $1 $rgb(255,255,255) terminal 15 14 %y %x
      inc %n
    }
  }
}
alias sxcf_cache {
  var %n = 1
  while ($gettok($1,%n,44)) {
    var %z $ifmatch,%z2 $sxcf_db(%z $+ .png),%w @sxcf_ $+ %z,%w2 $pic(%z2).width,%h2 $pic(%z2).height
    if ($exists(%z2)) {
      window -Bhp +d %w 1 1 $calc(2 + %w2 *2) %h2
      drawpic -c %w 0 0 %z2
      ;      drawpic -cs %w $calc((%w2 *2)) 0 $+(-,%w2) %h2 %z2
      drawcopy %w 0 0 %w2 %h2 %w $calc((%w2 *2) -1) 0 $+(-,%w2) %h2
      ;drawpic -cs @mirror 200 0 -200 200 C:\image.jpg
      ;      drawcopy %w 0 0 200 500 %w 200 0
      ;      drawrot %w 180 200 0 200 500
    }
    inc %n
  }
}
alias sxcf_maincache {
  var %f = $sxcfget(files)
  var %n = 1
  while ($gettok(%f,%n,44)) {
    var %z $ifmatch,%z2 $sxcf_db(%z $+ .png),%w @sxcf_ $+ %z,%w2 $pic(%z2).width,%h2 $calc($pic(%z2).height + 5)
    if ($exists(%z2)) {
      window -Bhp +d %w 1 1 $calc(%w2 *2) %h2
      drawpic %w 0 0 %z2
      drawcopy %w 0 0 %w2 %h2 %w $calc((%w2 *2) -1) 0 $+(-,%w2) %h2
    }
    inc %n
  }
}
alias -l shut {
  while ($window(@sxcf_*,1)) {
    window -c $ifmatch
  }
  .timersxcf* off
  unset %sxcf.*
  sockclose sxcf*
  splay -m stop
}
alias sxcf_g_translatepos {
  var %1 0,%2 0,%m
  if ($2 = 1) {
    if ($3) { %1 = 150 | %2 = 150 }
    else { %1 = 100 | %2 = 150 }
  }
  elseif ($2 = 2) {
    if ($3) { %1 = 150 | %2 = 100 }
    else { %1 = 100 | %2 = 100 }
  }
  elseif ($2 = 3) {
    if ($3) %1 = 150
    else %1 = 100
  }
  elseif ($2 = 4) {
    if ($3) { %1 = 100 | %2 = 50 }
    else %1 = 150
  }
  elseif ($2 = 5) {
    if ($3) { %1 = 150 | %2 = 50 }
    else { %1 = 100 | %2 = 150 }
  }
  elseif ($2 = 6) {
    if ($3) { %1 = 50 | %2 = 50 }
    else %1 = 100
  }
  elseif ($2 = fly) %2 = 200
  elseif ($2 = stand) { }
  elseif ($2 = walk) { %1 = 50 | if ($3) %1 = 0 }
  elseif ($2 = ready) %2 = 50
  elseif ($2 = stance) %1 = 100
  elseif ($2 = dead) { %1 = 50 | %2 = 150 }
  elseif ($2 = pose2) { %1 = 50 | %2 = 100 }
  if ($1 = right) %1 = 350 - %1
  return %1 %2
}
alias sxcf_g_translateweap {
  var %1 0,%2 0,%m,%4 $4,%5 $5,%y 0,%x 0,%e
  ; %x and %y are the displacement for the weapons
  if ($2 = 1) {
    if ($3) { %1 = 500 | %2 = 100 | %x = 21 | %y = -5 }
    else { %1 = 550 | %2 = 100 | %x = -2 | %y = 4 }
  }
  elseif ($2 = 2) {
    ;455 109 40 29
    if ($3) { %1 = 550 | %2 = 150 | %x = 30 | %y = 13 }
    ;557 158 38 30
    else { %1 = 450 | %2 = 100 | %x = -19 | %y = -22 }
  }
  elseif ($2 = 3) {
    ;455 158 34 27
    if ($3) { %1 = 450 | %2 = 150 | %x = 31 | %y = 5 }
    ;506 160 38 28
    else { %1 = 500 | %2 = 150 | %x = 27 | %y = 8 }
  }
  elseif ($2 = 4) {
    ;307 108 34 30
    if ($3) { %1 = 300 | %2 = 100 | %x = 8 | %y = 7 }
    ;404 105 40 41
    else { %1 = 400 | %2 = 100 | %x = 27 | %y = 1 }
  }
  elseif ($2 = 5) {
    if ($3) { %1 = 400 | %2 = 150 | %x = 19 | %y = -12 }
    else { %1 = 550 | %2 = 100 | %x = -2 | %y = 4 }
  }
  elseif ($2 = 6) {
    if ($3) { %1 = 350 | %2 = 100 | %x = 15 | %y = -4 }
    else { %1 = 450 | %2 = 150 | %x = 25 | %y = 7 }
  }
  elseif ($2 = fly) { %1 = 250 | %2 = 150 | %x = 19 | %y = -27 }
  elseif ($2 = stand) { }
  elseif ($2 = walk) { %1 = 50 | if ($3) %1 = 0 }
  elseif ($2 = ready) { %1 = 400 | %2 = 100 | %x = 20 | %y = 1 }
  elseif ($2 = stance) { %1 = 450 | %2 = 150 | %x = 30 | %y = 6 }
  elseif ($2 = dead) { %1 = 50 | %2 = 150 | %x = -50 | %y = 15 }
  elseif ($2 = pose2) { %1 = 250 | %2 = 150 | %x = -30 | %y = 15 }
  ;
  ;      drawcopy %w 0 0 %w2 %h2 %w $calc((%w2 *2) -1) 0 $+(-,%w2) %h2
  ;  if ($7) debugf drawcopy -tn @sxcf_ $+ $4 $sxcfget(trans) $5 $6 %t %t2 %w %x %y %e
  if ($1 = right) {
    ; inverse all the changes .. (negate)
    %1 = 550 - %1
    dec %4 %x
  }
  else inc %4 %x
  inc %5 %y
  ;  if ($2 = pose2) %5 = $
  ;  debugf RETURNING %1 + %2 for $sxcf_g_translate($2) with alt $3
  return %4 %5 general %1 %2 %e
}
alias sxcf_g_translate {
  if ($1 = 1) return S
  elseif ($1 = 2) return C
  elseif ($1 = 3) return P
  elseif ($1 = 4) return B
  elseif ($1 = 5) return D
  elseif ($1 = 6) return R
}
alias sxcf_1p {
  var %fs $1 $+ _fs,%r $sxcfget(bgcol),%r2 $sxcfget(hilite),%loop_time = $ticks - %sxcf.old_ticks, %new_delta_tmp = $round($calc(%sxcf.1p.pps /1000 * %loop_time),2) + %sxcf.1p.draw.olddecimal
  %new_delta_tmp = $calc($sxcfget(speed) /5 * %new_delta_tmp)
  
  %sxcf.1p.draw.delta = $int(%new_delta_tmp)
  %sxcf.1p.draw.olddecimal = $calc(%new_delta_tmp - %sxcf.1p.draw.delta)
  
  if (%sxcf.1p = 1) {
    if ($sxcfget(winner)) { %sxcf.1p = 3 | %sxcf.1p.pps = 200 | return }
    ;pause
    if (%sxcf.1p.count >= 100) {
      unset %sxcf.1p.count
      ;      sxcf_effect_flash $1
      ;      %sxcf.effect.after = sxcf_effect_scrolldown
      sxcf_animate_stop
      
      ; generate new turn
      sxcf_w_newturn
      
      ; choice of cards
      sxcf_w_randomizecards
      
      ; show
      sxcf_w_showcards $1 $sxcfget(mychar) $sxcfget(myturn)
      sxcf_w_genranoppcard
      sxcf_w_oppshowcard $sxcfget(oppchar) $sxcfget(oppcard) $sxcfget(oppcard_value)
      .timer -oh 1 110 sxcf_w_queuepush sxcf_minicards_off
      .timer -oh 1 110 sxcf_w_queuepush sxcf_charpic_hide
      ;      sxcf_w_queuepush sxcf_animate_stop
      .timer -oh 1 100 sxcf_effect_scrolldown
      unset %sxcf.1p
    }
    else inc %sxcf.1p.count %sxcf.1p.draw.delta
  }
  
  elseif (%sxcf.1p = 2) {
    ;scroll up and animate
    if (%sxcf.1p.count >= 0) {
      unset %sxcf.1p.count
      
      sxcf_effect_scrollup
      ;      .timer -oh 1 50 sxcf_effect_scrollup
      ;      %sxcf.effect.after = sxcf_animate_flyback
      ;      %sxcf.animate.after = sxcf_animate_meet
      ;      %sxcf.animate.after2 = sxcf_animate_fight
      
      ; queue PUSH events (last to PUSH first to POP)
      sxcf_w_queuepush sxcf_w_1pstep 1
      sxcf_w_queuepush sxcf_animate_fight
      sxcf_w_queuepush sxcf_charpic_show
      sxcf_w_queuepush sxcf_animate_meet
      sxcf_w_queuepush sxcf_animate_flyback
      unset %sxcf.1p
    }
    else inc %sxcf.1p.count %sxcf.1p.draw.delta
  }
  
  elseif (%sxcf.1p = 3) {
    ;winner
    ;    if (%sxcf.1p.count >= $calc(600 - ($sxcfget(speed) *100))) {
    if (%sxcf.1p.count >= $calc($sxcfget(speed) /5 *240)) {
;    if (%sxcf.1p.count >= 200) {
      unset %sxcf.1p.count
      sxcf_note_winner
      splay -c
      ;      sxcf_w_queueignore animate,charpic
      sxcf_w_queuelisten note
      sxcf_w_queuepush sxcf_topmenu_endround
      sxcf_w_queuepush sxcf_filter_on
      
      %sxcf.fight = 0
      unset %sxcf.1p
    }
    else inc %sxcf.1p.count %sxcf.1p.draw.delta
  }
}

alias sxcf_select {
  var %fs $1 $+ _fs,%r $sxcfget(bgcol), %rr $sxcfget(hilite),%c = $gettok($sxcfget(charset),%sxcf.select.char,44)
  sxcf_d_text -b %r -f Terminal 13 %fs 107 43 Select your fighter
  var %x 67,%y 65,%t $sxcfget(trans),%loc 60,%xx 260
  if ($sxcfget(myside) = right) %loc = %xx
  drawcopy -n @sxcf_ $+ %c %loc 202 80 96 %fs %x %y
  sxcf_d_text -f fixedsys 20 -s 1 %fs 107 151 %c
  drawline -nr %fs $iif(%sxcf.select.item1,%rr,$iif(%sxcf.select.alt,$sxcfget(hilite1),$sxcfget(hilite2))) 4 50 104 45 109 50 114 50 104
  drawline -nr %fs $iif(%sxcf.select.item2,%rr,$iif(%sxcf.select.alt,$sxcfget(hilite1),$sxcfget(hilite2))) 4 162 104 167 109 162 114 162 104
  drawcopy -n @sxcf_general 3 53 44 44 %fs 419 172 32 32
  if (%sxcf.select.item3) drawrect -ifrn %fs %rr 1 419 172 32 32
  drawcopy -n @sxcf_general 53 53 44 44 %fs 454 172 32 32
  if (%sxcf.select.item4) drawrect -ifrn %fs %rr 1 454 172 32 32
  
  if (%sxcf.select.alt) unset %sxcf.select.alt
  else inc %sxcf.select.alt
  drawrect -dnr %fs $iif(%sxcf.select.alt,$sxcfget(hilite1),$sxcfget(hilite2)) 4 64 62 86 102 10 10
  var %n 1
  while ($gettok($sxcfget($+(%c,_story)),%n,124)) {
    drawtext -nr %fs %r Terminal 13 180 $calc(%y -12 + %n *12) $ifmatch
    inc %n
  }
  ;  drawtext -nr %fs %r Terminal 13 180 $calc(%y +36) of 10.
  
  drawtext -nr %fs %r Terminal 13 328 $calc(%y +54) Weapon: $sxcfget($+(%c,_weapon))
  drawtext -nr %fs %r Terminal 13 180 $calc(%y +54) Life
  var %zz @sxcf $+ _general,%st $sxcfget($+(%c,_stats)),%ls $gettok(%st,1,44),%ps $gettok(%st,2,44),%lus $gettok(%st,3,44)
  %n = 0
  while %n < %ls {
    drawcopy -tnr %zz $sxcfget(trans) 218 178 12 13 %fs $calc(230 + %n *16) 120
    inc %n
  }
  drawtext -nr %fs %r Terminal 13 180 $calc(%y +69) Strength
  %n = 0
  while %n < %ps {
    drawcopy -tnr %zz $sxcfget(trans) 218 178 12 13 %fs $calc(230 + %n *16) 135
    inc %n
  }
  
  drawtext -nr %fs %r Terminal 13 180 $calc(%y +84) Luck
  %n = 0
  while %n < %lus {
    drawcopy -tnr %zz $sxcfget(trans) 218 178 12 13 %fs $calc(230 + %n *16) 150
    inc %n
  }
}
alias sxcf_help {
  var %fs $1 $+ _fs,%r $sxcfget(bgcol), %a 81, %b 247, %e 416
  
  sxcf_d_text -b %r -f Terminal 13 %fs 247 51 Defeat your love by choosing the right moves every turn.
  sxcf_d_text -b %r -f Terminal 13 %fs 247 66 Refer to the bottom legend for the various attack & defense techniques.
  
  ;  drawtext -nr %fs %r Terminal 13 34 40 Defeat your opponent by choosing the right moves every turn.
  ;  drawtext -nr %fs %r Terminal 13 34 60 Refer to the bottom legend for the various attack & defense techniques.
  
  sxcf_d_text -f fixedsys 20 -s 1 %fs %a 101 Attack
  sxcf_d_text -b %r -f fixedsys 20 %fs %a 121 Pierce (P)
  sxcf_d_text -b %r -f fixedsys 20 %fs %a 141 Slice (S)
  sxcf_d_text -b %r -f fixedsys 20 %fs %a 161 Chop (C)
  
  sxcf_d_text -f fixedsys 20 -s 1 %fs %b 101 Disabled by
  sxcf_d_text -b %r -f fixedsys 20 %fs %b 121 Repel (R)
  sxcf_d_text -b %r -f fixedsys 20 %fs %b 141 Block (B)
  sxcf_d_text -b %r -f fixedsys 20 %fs %b 161 Duck (D)
  
  sxcf_d_text -f fixedsys 20 -s 1 %fs %e 101 Worsened by
  sxcf_d_text -b %r -f fixedsys 20 %fs %e 121 Block (B)
  sxcf_d_text -b %r -f fixedsys 20 %fs %e 141 Duck (D)
  sxcf_d_text -b %r -f fixedsys 20 %fs %e 161 Repel (R)
}
alias -l s_ {
  var %t /,-,\,|
  inc %sxcf.slash .5
  if (%sxcf.slash > 4) %sxcf.slash = 1
  return $gettok(%t,$int(%sxcf.slash),44)
}
alias sxcf_join {
  var %fs $1 $+ _fs,%r $sxcfget(hilite), %m CONNECTED TO HOST...,REQUESTING ACCEPTANCE...,HANDSHAKING...,LAUNCHING...,DISCONNECTING...,VERSION CONFLICT FROM HOST...,FAILED!
  sxcf_d_text -f fixedsys 20 -s 2 %fs 240 313 $gettok(%m,%sxcf.join.stp,44) $s_
  sxcf_d_text -f Terminal 13 %fs 240 393 (hit 'Enter' to abort)
}
alias sxcf_host {
  var %fs $1 $+ _fs,%r $sxcfget(hilite), %m WAITING FOR CONNECTION...,ACCEPTING INCOMING CONNECTION...,HANDSHAKING...,LAUNCHING...,DISCONNECTING...,VERSION CONFLICT FROM CLIENT...,FAILED!
  sxcf_d_text -f fixedsys 20 -s 2 %fs 240 313 $gettok(%m,%sxcf.host.stp,44) $s_
  sxcf_d_text -f Terminal 13 %fs 240 393 (hit 'Enter' to close server)
}
alias sxcf_menu {
  var %fs $1 $+ _fs,%r $sxcfget(bgcol),%r2 $sxcfget(hilite),%loop_time = $ticks - %sxcf.old_ticks, %new_delta_tmp = $round($calc(%sxcf.menu.pps /1000 * %loop_time),2) + %sxcf.menu.draw.olddecimal
  %new_delta_tmp = $calc($sxcfget(speed) /5 * %new_delta_tmp)
  %sxcf.menu.draw.delta = $int(%new_delta_tmp)
  %sxcf.menu.draw.olddecimal = $calc(%new_delta_tmp - %sxcf.menu.draw.delta)
  
  ;  sxcf_d_text -f fixedsys 50 -s 3 %fs 248 60 $title
  sxcf_d_text -f fixedsys 50 -s 3 %fs 248 73 $story
  drawtext -nr %fs %r fixedsys 20 250 30 $chapter
  
  sxcf_d_drawtile %fs 66 110 helen $sxcf_g_translatepos(left,%sxcf.menu.action,%sxcf.menu.alt)
  sxcf_d_drawtile %fs 386 110 jeric $sxcf_g_translatepos(right,%sxcf.menu.action,%sxcf.menu.alt)
  
  if (%sxcf.menu.count >= 100) {
    %sxcf.menu.count = 0
    %sxcf.menu.action = $r(1,6)
    %sxcf.menu.alt = $r(0,1)
  }
  else inc %sxcf.menu.count %sxcf.menu.draw.delta
}
alias sxcf_intro {
  var %fs $1 $+ _fs,%loop_time = $ticks - %sxcf.old_ticks, %new_delta_tmp = $round($calc(%sxcf.intro.pps /1000 * %loop_time),2) + %sxcf.intro.draw.olddecimal
  %new_delta_tmp = $calc($sxcfget(speed) /5 * %new_delta_tmp)
  %sxcf.intro.draw.delta = $int(%new_delta_tmp)
  %sxcf.intro.draw.olddecimal = $calc(%new_delta_tmp - %sxcf.intro.draw.delta)
  if (%sxcf.intro = 1) {
    ;pause
    if (%sxcf.intro.count >= 100) {
      unset %sxcf.intro.count
      inc %sxcf.intro
    }
    else inc %sxcf.intro.count %sxcf.intro.draw.delta
  }
  elseif (%sxcf.intro = 2) {
    ;presenting
    sxcf_d_text -f System 30 -s 4 %fs 248 $calc(411 - %sxcf.intro.count) $author presents
    if (%sxcf.intro.count >= 100) {
      %sxcf.intro.count = 100
      inc %sxcf.intro.count2 %sxcf.intro.draw.delta
      if (%sxcf.intro.count2 >= 200) { sxcf_effect_flash $1 | inc %sxcf.intro | %sxcf.intro.pps = 200 | unset %sxcf.intro.count* }
    }
    else inc %sxcf.intro.count %sxcf.intro.draw.delta
  }
  
  elseif (%sxcf.intro = 3) {
    ;pic
    drawcopy -tn @sxcf_general $sxcfget(trans) 5 315 143 116 %fs 155 $calc(106 + %sxcf.intro.count)
    if (%sxcf.intro.count >= 150) {
      %sxcf.intro.count = 150
      inc %sxcf.intro.count2 %sxcf.intro.draw.delta
      if (%sxcf.intro.count2 >= 100) { inc %sxcf.intro | %sxcf.intro.pps = 400 | unset %sxcf.intro.count* }
    }
    else inc %sxcf.intro.count %sxcf.intro.draw.delta
  }
  
  elseif (%sxcf.intro = 4) {
    ;pic shift left
    sxcf_d_text -f System 30 -s 4 %fs 289 311 $title
    drawcopy -tn @sxcf_general $sxcfget(trans) 5 315 143 116 %fs $calc(155 - %sxcf.intro.count) 256
    if (%sxcf.intro.count >= 100) {
      %sxcf.intro.count = 100
      inc %sxcf.intro.count2 %sxcf.intro.draw.delta
      sxcf_d_text -f System 20 -s 2 %fs 355 331 $ver
      if (%sxcf.intro.count2 >= 400) {
        inc %sxcf.intro | unset %sxcf.intro.count*
        ;         sxcf_effect_flash $1
        ;         %sxcf.effect.after = .timer -oh 1 0 sxcf_effect_scrollup
        sxcf_effect_scrollup
        %sxcf.menu = 1
        %sxcf.menu.pps = 200
        sxcf_w_queuepush sxcf_topmenu_main
        unset %sxcf.intro*
      }
    }
    else inc %sxcf.intro.count %sxcf.intro.draw.delta
  }
}
alias sxcf_loop {
  ; we will always draw to _fs window..
  var %wi = $sxcfget(win)
  if (!$window(%wi)) return
  inc %sxcf.frame.counter
  
  
  ;character movements
  
  ;drawbg
  if (!%sxcf.effect) sxcf_bg_draw %wi
  
  ;drawlayers
  if (!%sxcf.effect) {
    var %n 1
    while ($window(%wi $+ _layer*,%n)) {
      var %nn $ifmatch,%wo $sxcfget(%nn)
      drawcopy -n %nn %wo %wi $+ _fs %wo
      inc %n
    }
  }
  /*
  if (%sxcf.fillcards.back) {
    var %nn $sxcf_layer(cards),%wo $sxcfget(%nn)
    drawcopy -n %nn %wo %wi $+ _fs %wo
  }
  */
  
  ;intro
  if ((%sxcf.intro) && (!%sxcf.effect)) sxcf_intro %wi
  
  ;menu
  if ((%sxcf.menu) && (!%sxcf.effect)) sxcf_menu %wi
  
  ;help
  if (%sxcf.help) sxcf_help %wi
  
  ;host
  if (%sxcf.host) sxcf_host %wi
  
  ;join
  if (%sxcf.join) sxcf_join %wi
  
  ;select
  if (%sxcf.select) sxcf_select %wi
  
  ;1p
  if ((%sxcf.1p) && (!%sxcf.effect)) sxcf_1p %wi
  
  ;drawcards
  if ((%sxcf.fillcards) && (!%sxcf.effect)) sxcf_d_fillcards %wi
  
  ;char pics
  if ((%sxcf.charpic) && (!%sxcf.effect)) sxcf_d_charpic %wi
  
  ;animations
  if ((%sxcf.animate) && (!%sxcf.effect)) sxcf_d_animate %wi
  
  ;notes
  if ((%sxcf.note) && (!%sxcf.effect)) sxcf_d_note %wi
  
  ; world effects
  if (%sxcf.effect) sxcf_d_effect %wi
  
  
  ;drawtext
  
  
  
  ; copy from FULL view to mini view
  if (%sxcf.bg.scale != 1) {
    ; if zoomed..
    %sxcf.bg.scaledw = $int($calc($window(%wi).w * %sxcf.bg.scale))
    %sxcf.bg.scaledh = $int($calc($window(%wi).h * %sxcf.bg.scale))
    %sxcf.bg.scaledx = $int($calc(($window(%wi).w /2) - (%sxcf.bg.scaledw /2) + %sxcf.bg.drawnx))
    %sxcf.bg.scaledy = $int($calc(($window(%wi).h /2) - (%sxcf.bg.scaledh /2) + %sxcf.bg.drawny))
    var %sw = -n
    if ((%sxcf.effect.finalscale = %sxcf.bg.scale) && ($sxcfget(highquality))) %sw = -mn
    drawcopy %sw %wi $+ _fs %sxcf.bg.x %sxcf.bg.y $window(%wi).w $window(%wi).h %wi %sxcf.bg.scaledx %sxcf.bg.scaledy %sxcf.bg.scaledw %sxcf.bg.scaledh
  }
  else drawcopy -n %wi $+ _fs %sxcf.bg.x %sxcf.bg.y $window(%wi).w $window(%wi).h %wi %sxcf.bg.drawnx %sxcf.bg.drawny
  
  ; world filters
  if ($active != %wi) { unset %sxcf.*.sel | sxcf_filter_world %wi }
  if (%sxcf.filter) sxcf_filter_world %wi
  
  ; top menu
  if ((%sxcf.topmenu)) sxcf_topmenu %wi
  
  ; fps display on top of everything
  if ($sxcfget(showfps)) sxcf_d_text %wi 464 9 %sxcf.fps fps
  
  ; status message on top
  if (%sxcf.msg) sxcf_msg %wi
  
  ; show
  drawdot %wi
  
  
  if ($calc($ticks - %sxcf.fps.tick) >= 1000) {
    %sxcf.fps = %sxcf.frame.counter
    %sxcf.frame.counter = 0
    %sxcf.fps.tick = $ticks
  }
  
  %sxcf.old_ticks = $ticks
  .timer -oh 1 0 sxcf_loop
}
alias sxcf_bg_draw {
  var %si $1 $+ _bg,%ri $1 $+ _fs,%x 0,%y 0,%w $window(%si).w,%h $window(%si).h
  drawcopy -n %si 0 0 %w %h %ri %x %y
}
alias sxcf_filter_world {
  drawcopy -tn $1 $+ _filter $sxcfget(trans) 0 0 $window($1).w $window($1).h $1 0 0
  if (%sxcf.filter) sxcf_w_queuepop filter
}
alias sxcf_d_presel sxcf_effect_flash $sxcfget(win) | sxcf_w_queuepush sxcf_w_select
alias sxcf_d_prefight {
  sxcf_d_arena $sxcfget(win) $+ _bg
  sxcf_effect_boxout $sxcfget(win)
  var %fs $sxcfget(win) $+ _fs
  %sxcf.effect.boxin.cmd = sxcf_bg_draw $sxcfget(win)
  %sxcf.effect.boxin.cmd2 = drawcopy -n %fs 0 0 $window(%fs).w $window(%fs).h $sxcfget(win) $+ _copy 0 0
  %sxcf.effect.boxin.cmd3 = drawrect -fr %fs $sxcfget(bgcol) 1 0 0 $window(%fs).w $window(%fs).h
}
alias sxcf_d_preparefilter {
  var %wi $sxcfget(win) $+ _filter,%w $window(%wi).w,%h $window(%wi).h,%n 1
  drawrect -frn %wi $sxcfget(trans) 1 0 0 %w %h
  if ((-*h* iswm $1) || (-*d* iswm $1)) {
    while %n <= %h {
      drawline -rn %wi $2 1 0 %n %w %n
      inc %n 2
    }
    if (-*d* iswm $1) {
      %n = 1
      while %n <= %w {
        drawline -rn %wi $sxcfget(trans) 1 %n 0 %n %h
        inc %n 2
      }
    }
    
  }
  elseif (-*v* iswm $1) {
    while %n <= %w {
      drawline -rn %wi $2 1 %n 0 %n %h
      inc %n 2
    }
  }
}
alias sxcf_d_emptystage {
  var %w $window($1).w,%h $window($1).h
  sxcf_d_clear $1
  sxcf_d_dialog $1 %w %h
  ;  sxcf_d_arena $1
  sxcf_d_clearlayer -a
}
alias sxcf_d_note {
  var %fs $1 $+ _fs,%loop_time = $ticks - %sxcf.old_ticks, %new_delta_tmp = $round($calc(%sxcf.note.pps /1000 * %loop_time),2) + %sxcf.note.draw.olddecimal
  %new_delta_tmp = $calc($sxcfget(speed) /5 * %new_delta_tmp)
  %sxcf.note.draw.delta = $int(%new_delta_tmp)
  %sxcf.note.draw.olddecimal = $calc(%new_delta_tmp - %sxcf.note.draw.delta)
  
  if (%sxcf.note.winner = 1) {
    if (%sxcf.note.count >= %sxcf.note.time) {
      ; quit
      unset %sxcf.note
      sxcf_w_queuepop note
      return
    }
    else inc %sxcf.note.count %sxcf.note.draw.delta
    sxcf_d_text -f fixedsys 40 -s 2 %fs 247 53 $iif($sxcfget(winner) = me,You win!,You lose!)
  }
  
}

alias sxcf_d_preparelayer {
  var %wi $sxcfget(win),%n $1
  sxcfset $+(%wi,_layer,%n) $2-
  if ($window($+(%wi,_layer,%n))) return
  window -Bhp +d $+(%wi,_layer,%n) 0 0 $window($+(%wi,_fs)).w $window($+(%wi,_fs)).h
  ;  sxcf_d_clearlayer $+(%wi,_layer,%n)
}
alias sxcf_d_clearlayer {
  if ($1 = -a) {
    while ($window($sxcfget(win) $+ _layer*,1)) {
      window -c $ifmatch
    }
    return
  }
  var %v $sxcf_layer($1)
  ;  sxcf_d_transwin %v
  window -c %v
  sxcfunset %v
}
alias sxcf_d_transwin drawrect -frn $1 $sxcfget(trans) 1 0 0 $window($1).w $window($1).h
alias sxcf_d_clear drawrect -frn $1 $sxcfget(bgcol) 1 0 0 $window($1).w $window($1).h
alias sxcf_d_dialog {
  drawpic -nt $1 $sxcfget(trans) 0 0 $sxcf_db(dialog.png)
}
alias sxcf_d_arena {
  drawpic -nt $1 $sxcfget(trans) 54 42 $sxcf_db(arena.png)
}
alias sxcf_d_text {
  var %i = 0, %t, %c = 16777215, %sh = 0, %f = Terminal, %s = 9,%disp
  if (-*h* iswm $1) { %i = 1 | %t = $2 | tokenize 32 $3- }
  if (-*b* iswm $1) { %c = $2 | tokenize 32 $3- }
  if (-*f* iswm $1) { %f = $2 | %s = $3 | tokenize 32 $4- }
  if (-*s* iswm $1) { %sh = 1 | %disp = $2 | tokenize 32 $3- }
  var %w = $width($4-,%f,%s),%h = $calc($height($4-,%f,%s) + %disp), %x $calc($2 - (%w /2)), %y $calc($3 - (%h /2))
  var %dis = drawrect -frn $sxcfget(win) $+ _text $sxcfget(trans) 1 %x %y %w %h
  %dis
  if (%sh) drawtext -ncr $sxcfget(win) $+ _text $rgb(51,51,51) %f %s $calc(%x + %disp) $calc(%y + %disp) %w %h $4-
  drawtext -ncr $sxcfget(win) $+ _text %c %f %s %x %y %w %h $4-
  drawcopy -ntr $sxcfget(win) $+ _text $sxcfget(trans) %x %y %w %h $1 %x %y
  if (%i) .timersxcf_d_text_ $+ $4 $+ $ctime -om 1 %t %dis
}
alias sxcf_d_effect {
  
  ; new delta, based on the time and the speed of 400px/sec + the decimal part of the previous delta
  var %si = $1 $+ _copy, %ri = $1 $+ _fs, %loop_time = $ticks - %sxcf.old_ticks, %new_delta_tmp = $round($calc(%sxcf.effect.pps /1000 * %loop_time),2) + %sxcf.effect.draw.olddecimal, %x 0, %y %sxcf.bg.y, %w $window($1).w, %h $window($1).h
  %new_delta_tmp = $calc($sxcfget(speed) /5 * %new_delta_tmp)
  
  ; the new delta is the integer part of the value
  %sxcf.effect.draw.delta = $int(%new_delta_tmp)
  ; store the decimal part for later use (in the next frame's delta calc) Its the (float value - int value). Ex: 10.9 - 10 = 0.9
  %sxcf.effect.draw.olddecimal = $calc(%new_delta_tmp - %sxcf.effect.draw.delta)
  
  if (%sxcf.effect.up = 1) {
    if (%sxcf.bg.y >= %sxcf.effect.endY) {
      %sxcf.bg.y = %sxcf.effect.endY | unset %sxcf.effect %sxcf.effect.up | %sxcf.effect.pps = %sxcf.effect.defpps
      ;      if (%sxcf.effect.after) $ifmatch | unset %sxcf.effect.after
      sxcf_w_queuepop effect
    }
    else inc %sxcf.bg.y %sxcf.effect.draw.delta
  }
  elseif (%sxcf.effect.down = 1) {
    if (%sxcf.bg.y <= %sxcf.effect.endY) {
      %sxcf.bg.y = %sxcf.effect.endY | unset %sxcf.effect %sxcf.effect.down | %sxcf.effect.pps = %sxcf.effect.defpps
      ;if (%sxcf.effect.after) $ifmatch | unset %sxcf.effect.after
      sxcf_w_queuepop effect
    }
    else dec %sxcf.bg.y %sxcf.effect.draw.delta
  }
  elseif (%sxcf.effect.jerk = 1) {
    inc %sxcf.effect.doer
    if (%sxcf.effect.doer >= $calc(1000 / %sxcf.effect.aps)) {
      if (%sxcf.effect.count <= 0) { unset %sxcf.effect %sxcf.effect.jerk | %sxcf.bg.drawnx = 0 | %sxcf.bg.drawny = 0 | %sxcf.effect.aps = %sxcf.effect.defaps }
      else {
        dec %sxcf.effect.count
        /*
        var %t = $1 $+ _temp
        ;        clear  %t
        drawrect -frn %t $rgb(11,15,63) 1 0 0 %w %h
        drawcopy -n %ri 0 0 %w %h %t $sxcf_r(%sxcf.effect.pixels) $sxcf_r(%sxcf.effect.pixels)
        drawcopy -n %t 0 0 %w %h %ri %x %y
        */
        drawrect -frn $1 $sxcfget(bgcol) 1 0 0 %w %h
        %sxcf.bg.drawnx = $sxcf_r(%sxcf.effect.pixels)
        %sxcf.bg.drawny = $sxcf_r(%sxcf.effect.pixels)
      }
      unset %sxcf.effect.doer
    }
    else return
  }
  elseif (%sxcf.effect.flash = 1) {
    inc %sxcf.effect.doer
    if (%sxcf.effect.doer >= $calc(1000 / %sxcf.effect.aps)) {
      if (%sxcf.effect.count <= 0) {
        ;if (%sxcf.effect.after) .timer -oh 1 0 $ifmatch
        unset %sxcf.effect.after %sxcf.effect %sxcf.effect.flash %sxcf.effect.flashcol %sxcf.effect.flashfilter | %sxcf.effect.aps = %sxcf.effect.defaps
        sxcf_d_preparefilter -d $sxcfget(esccol)
        sxcf_w_queuepop effect
      }
      else {
        dec %sxcf.effect.count
        ;        clear %ri
        if (%sxcf.effect.flashfilter = 1) drawcopy -tn $1 $+ _filter $sxcfget(trans) 0 0 %w %h %ri %x %y
        else drawrect -nfr %ri %sxcf.effect.flashcol 1 0 0 $calc(%w *2) $calc(%h *2)
      }
      unset %sxcf.effect.doer
      return
    }
    elseif (%sxcf.effect.doer >= $calc(1000 / %sxcf.effect.aps /2)) { drawcopy -n %si %x %y $calc(%w *2) $calc(%h *2) %ri %x %y }
    else return
  }
  
  elseif (%sxcf.effect.zoom = 1) {
    if (%sxcf.bg.scale >= %sxcf.effect.finalscale) { %sxcf.bg.scale = %sxcf.effect.finalscale | unset %sxcf.effect %sxcf.effect.zoom | %sxcf.effect.pps = %sxcf.effect.defpps }
    else inc %sxcf.bg.scale $+(0.,%sxcf.effect.draw.delta)
  }
  elseif (%sxcf.effect.zoomout = 1) {
    if (%sxcf.bg.scale <= %sxcf.effect.finalscale) { %sxcf.bg.scale = %sxcf.effect.finalscale | unset %sxcf.effect %sxcf.effect.zoomout | %sxcf.effect.pps = %sxcf.effect.defpps }
    else dec %sxcf.bg.scale $+(0.,%sxcf.effect.draw.delta)
  }
  
  elseif (%sxcf.effect.box = 1) {
    inc %sxcf.effect.doer
    if (%sxcf.effect.doer >= $calc(1000 / %sxcf.effect.aps)) {
      if ($calc(%sxcf.effect.count3 * %sxcf.effect.w) >= %w) {
        unset %sxcf.effect %sxcf.effect.box
        ;if (%sxcf.effect.after) $ifmatch | unset %sxcf.effect.after
        sxcf_w_queuepop effect
        return
      }
      else {
        ;        clear %ri
        var %work
        if (%sxcf.effect.count2 >= 1) { %work = $calc(%sxcf.effect.count3 * %sxcf.effect.w) %y %sxcf.effect.w $calc(%h /2) | unset %sxcf.effect.count2 | inc %sxcf.effect.count3 $+(0.,%sxcf.effect.draw.delta) }
        else { %work = $calc(%sxcf.effect.count3 * %sxcf.effect.w) $calc(%h /2 + %y) %sxcf.effect.w $calc(%h /2) | inc %sxcf.effect.count2 $+(0.,%sxcf.effect.draw.delta) }
        drawrect -fr %si $sxcfget(bgcol) 1 %work
      }
      unset %sxcf.effect.doer
      return
    }
    elseif (%sxcf.effect.doer >= $calc(1000 / %sxcf.effect.aps /2)) { drawcopy -n %si %x %y $calc(%w *2) $calc(%h *2) %ri %x %y }
    else return
  }
  
  elseif (%sxcf.effect.inbox = 1) {
    inc %sxcf.effect.doer
    if (%sxcf.effect.doer >= $calc(1000 / %sxcf.effect.aps)) {
      if ($calc(%sxcf.effect.count3 * %sxcf.effect.w) >= %w) {
        unset %sxcf.effect %sxcf.effect.inbox
        ;if (%sxcf.effect.after) $ifmatch | unset %sxcf.effect.after
        sxcf_w_queuepop effect
        return
      }
      else {
        ;        clear %ri
        var %work
        if (%sxcf.effect.count2) { %work = $calc(%sxcf.effect.count3 * %sxcf.effect.w) %y %sxcf.effect.w $calc(%h /2) | unset %sxcf.effect.count2 | inc %sxcf.effect.count3 $+(0.,%sxcf.effect.draw.delta) }
        else { %work = $calc(%sxcf.effect.count3 * %sxcf.effect.w) $calc(%h /2 + %y) %sxcf.effect.w $calc(%h /2) | %sxcf.effect.count2 = 1 }
        drawcopy -n %si %work %ri %work
      }
      unset %sxcf.effect.doer
      return
    }
    elseif (%sxcf.effect.doer >= $calc(1000 / %sxcf.effect.aps /2)) { return }
    else return
  }
}
alias sxcf_d_cards {
  var %x $2,%y $3,%n $sxcfget(totalcards),%z 0
  if ($sxcfget(myturn) = defend) %z = 100
  while (%n > 0) {
    drawcopy -t @sxcf_general $sxcfget(trans) %z 200 100 100 $1 $int($calc(%x + (%n *82) -82)) %y $4 $5
    dec %n
  }
}
alias sxcf_d_onecard {
  var %x -7,%y 300,%n 0,%z 0,%wi $1
  if ($3 = -right) %n = 6
  if ($2 > 4) %z = 100
  drawcopy -t @sxcf_general $sxcfget(trans) %z 200 100 100 %wi $int($calc(%x + (%n *82) -82)) %y
}
alias sxcf_d_drawtile {
  var %w $1,%x $2,%y $3,%s $4,%n $5,%n2 $6,%t $7,%t2 $8
  if (!$7) { %t = 50 | %t2 = 50 }
  drawcopy -tn @sxcf_ $+ $4 $sxcfget(trans) $5 $6 %t %t2 %w %x %y 50 50
}
alias sxcf_d_cardtext {
  var %x 18,%y 318,%n $sxcfget(totalcards),%c $sxcfget(cards),%u $sxcfget(cards_value),%mc $sxcfget(mycard),%mv $sxcfget(mycard_value)
  var %cl $rgb(51,51,51),%cl2 $rgb(167,209,167)
  ;$rgb(153,102,0)
  if ($sxcfget(myturn) = defend) { %cl = $rgb(51,51,51) | %cl2 = $rgb(51,204,204) }
  ;$rgb(51,102,204)
  
  ; if card is chosen
  if (%mc) { %c = %mc | %u = %mv }
  while (%n > 0) {
    drawtext -nr $1 %cl System 25 $int($calc(18 + %x + (%n *82) -82)) $calc(%y + 48) $sxcf_g_translate($gettok(%c,%n,44))
    drawtext -nr $1 %cl2 System 25 $int($calc(16 + %x + (%n *82) -82)) $calc(%y + 46) $sxcf_g_translate($gettok(%c,%n,44))
    
    ;    drawtext -nr $1 $+ _bg %cl System 20 $int($calc(28 + %x + (%n *82) -82)) $calc(%y -10) $gettok(%u,%n,44)
    drawtext -nr $1 %cl System 20 $int($calc(43 + %x + (%n *82) -82)) $calc(%y -8) $gettok(%u,%n,44)
    
    dec %n
  }
}
alias sxcf_d_charpic {
  if (($sxcfget(updatehealth)) && (!$sxcfget(updatehealth2))) { sxcfset shownmyhp $sxcfget(myhp) | sxcfset shownopphp $sxcfget(opphp) | sxcfset updatehealth2 1 }
  
  var %opphp $sxcfget(shownopphp),%mehp $sxcfget(shownmyhp),%x 0,%y 0,%x2 = $calc($window($1).w - 80),%y2 0,%t $sxcfget(trans),%loc 60,%loc2 260,%xx
  
  if ($sxcfget(myside) = right) { %x = %x2 | %x2 = 0 | %xx = %loc2 | %loc2 = %loc | %loc = %xx }
  
  drawcopy -tn @sxcf_ $+ $sxcfget(mychar) %t %loc 202 80 96 $1 $+ _fs %x %y
  drawcopy -tn @sxcf_ $+ $sxcfget(oppchar) %t %loc2 202 80 96 $1 $+ _fs %x2 %y
  
  if (%mehp <= 0) drawrect -ifrn $1 $+ _fs $rgb(200,200,130) 1 $calc(%x +2) $calc(%y +2) 76 92
  elseif (%opphp <= 0) drawrect -ifrn $1 $+ _fs $rgb(200,200,130) 1 $calc(%x2 +2) $calc(%y +2) 76 92
  
  
  ;  drawrect -dfrn $1 $+ _fs $rgb(255,255,0) 1 $calc(%x +80) $calc(%y + 2) 6 92 10 10
  ;  drawrect -dfrn $1 $+ _fs $rgb(255,255,0) 1 $calc(%x2 -6) $calc(%y + 2) 6 92 10 10
  
  drawrect -frn $1 $+ _fs 0 1 $calc(%x +2) $calc(%y +88) 76 2
  drawrect -frn $1 $+ _fs $rgb(50,0,200) 1 $calc(%x +2) $calc(%y +90) 76 4
  drawrect -frn $1 $+ _fs $rgb(255,$ceil($calc(%mehp / $sxcfget(myfullhp) *255)),50) 1 $calc(%x +2) $calc(%y +90) $ceil($calc(%mehp / $sxcfget(myfullhp) *76)) 4
  
  drawrect -frn $1 $+ _fs 0 1 $calc(%x2 +2) $calc(%y +88) 76 2
  drawrect -frn $1 $+ _fs $rgb(50,0,200) 1 $calc(%x2 +2) $calc(%y +90) 76 4
  drawrect -frn $1 $+ _fs $rgb(255,$ceil($calc(%opphp / $sxcfget(oppfullhp) *255)),50) 1 $calc(%x2 +2) $calc(%y +90) $ceil($calc(%opphp / $sxcfget(oppfullhp) *76)) 4
  sxcf_w_queuepop charpic
}
alias sxcf_d_minicards {
  ;  sxcf_d_preparelayer minicards 0 153 $window($sxcfget(win)).w 50
  ;  drawcopy -n $sxcfget(win) $+ _bg 0 153 $window($sxcfget(win)).w 50 $sxcf_layer(minicards) 0 153
  ;  drawcopy -mn $sxcf_layer(cards) 5 302 76 98 $sxcf_layer(minicards) 3 153 38 50
  ;  drawcopy -mn $sxcf_layer(cards) 415 302 76 98 $sxcf_layer(minicards) 455 153 38 49
  
  sxcf_d_preparelayer minicards 0 103 $window($sxcfget(win)).w 100
  drawcopy -n $sxcfget(win) $+ _bg 0 103 $window($sxcfget(win)).w 100 $sxcf_layer(minicards) 0 103
  drawcopy -n $sxcf_layer(cards) 5 302 76 98 $sxcf_layer(minicards) 3 103
  drawcopy -n $sxcf_layer(cards) 415 302 76 98 $sxcf_layer(minicards) 415 103
  
  sxcf_w_queuepop minicard
}
alias sxcf_d_animate {
  var %loop_time = $ticks - %sxcf.old_ticks, %new_delta_tmp = $round($calc(%sxcf.animate.pps /1000 * %loop_time),2) + %sxcf.animate.draw.olddecimal
  %new_delta_tmp = $calc($sxcfget(speed) /5 * %new_delta_tmp)
  ; the new delta is the integer part of the value
  %sxcf.animate.draw.delta = $int(%new_delta_tmp)
  ; store the decimal part for later use (in the next frame's delta calc) Its the (float value - int value). Ex: 10.9 - 10 = 0.9
  %sxcf.animate.draw.olddecimal = $calc(%new_delta_tmp - %sxcf.animate.draw.delta)
  
  var %lx,%rx,%act,%x,%y,%rightpos,%x2,%om = right,%m = $sxcfget(myside),%char $sxcfget(mychar),%cd $sxcf_layer(cards),%cd2 $sxcf_layer(cards2),%fs $1 $+ _fs
  
  ;  sxcf_d_preparelayer cards2 0 300 505 100
  ;  drawcopy -n %cd 0 300 505 100 %cd2 0 300
  
  if (%sxcf.animate.fly) {
    %act = fly
    %x = 18
    %y = 318
    %rightpos = $int($calc(%x + ($sxcfget(totalcards) *82) -82))
    %x2 = %rightpos
    
    if (%m = right) { %om = left | %x2 = %x | %x = %rightpos }
    
    inc %sxcf.animate.x %sxcf.animate.draw.delta
    inc %sxcf.animate.y %sxcf.animate.draw.delta
    
    if (%m = right) {
      %lx = $calc(%x + %sxcf.animate.x)
      %rx = $calc(%x2 - %sxcf.animate.x)
    }
    else {
      %lx = $calc(%x - %sxcf.animate.x)
      %rx = $calc(%x2 + %sxcf.animate.x)
    }
    
    
    sxcf_d_drawtile %fs %lx $calc(%y - %sxcf.animate.y) %char $sxcf_g_translatepos(%m,%act)
    sxcf_d_drawtile %fs %rx $calc(%y - %sxcf.animate.y) $sxcfget(oppchar) $sxcf_g_translatepos(%om,%act)
    if (%sxcf.animate.y >= 50) {
      unset %sxcf.animate %sxcf.animate.fly %sxcf.animate.pps %sxcf.animate.x %sxcf.animate.y
      ;if (%sxcf.animate.after) $ifmatch | unset %sxcf.animate.after
      sxcf_w_queuepop animate
    }
  }
  elseif (%sxcf.animate.flyback) {
    
    %x = -50
    %y = 160
    %rightpos = $window($1).w
    %x2 = %rightpos
    
    if (%m = right) { %om = left | %x2 = %x | %x = %rightpos }
    
    if (%sxcf.animate.y >= 70) {
      %act = ready
      %sxcf.animate.y = 70
      unset %sxcf.animate %sxcf.animate.flyback %sxcf.animate.pps %sxcf.animate.x %sxcf.animate.y
      /*
      if (%sxcf.animate.after) {
        $ifmatch | unset %sxcf.animate.after
        if (%sxcf.animate.after2) { %sxcf.animate.after = %sxcf.animate.after2 | unset %sxcf.animate.after2 }
      }
      */
      sxcf_w_queuepop animate
    }
    else {
      %act = fly
      inc %sxcf.animate.x $calc(%sxcf.animate.draw.delta *2)
      inc %sxcf.animate.y %sxcf.animate.draw.delta
    }
    
    if (%m = right) {
      %lx = $calc(%x - %sxcf.animate.x)
      %rx = $calc(%x2 + %sxcf.animate.x)
    }
    else {
      %lx = $calc(%x + %sxcf.animate.x)
      %rx = $calc(%x2 - %sxcf.animate.x)
    }
    
    ; char
    sxcf_d_drawtile %fs %lx $calc(%y - %sxcf.animate.y) %char $sxcf_g_translatepos(%m,%act)
    sxcf_d_drawtile %fs %rx $calc(%y - %sxcf.animate.y) $sxcfget(oppchar) $sxcf_g_translatepos(%om,%act)
    
    ; weap
    sxcf_d_drawtile %fs $sxcf_g_translateweap(%m,%act,0,%lx,$calc(%y - %sxcf.animate.y))
    sxcf_d_drawtile %fs $sxcf_g_translateweap(%om,%act,0,%rx,$calc(%y - %sxcf.animate.y))
    
  }
  elseif (%sxcf.animate.walk) {
    %x = 90
    %y = 90
    %rightpos = $window($1).w - 140
    %x2 = %rightpos
    
    if (%m = right) { %om = left | %x2 = %x | %x = %rightpos }
    
    if (%sxcf.animate.x >= 80) {
      %act = ready
      %sxcf.animate.x = 80
      ;      unset %sxcf.animate %sxcf.animate.flyback %sxcf.animate.pps %sxcf.animate.y
      sxcf_w_queuepop animate
    }
    else {
      %act = stance
      inc %sxcf.animate.x %sxcf.animate.draw.delta
      /*
      inc %sxcf.animate.count
      if (%sxcf.animate.count >= 5) {
        if (%sxcf.animate.alt) unset %sxcf.animate.alt
        else %sxcf.animate.alt = 1
        unset %sxcf.animate.count
      }
      */
    }
    if (%m = right) {
      %lx = $calc(%x - %sxcf.animate.x)
      %rx = $calc(%x2 + %sxcf.animate.x)
    }
    else {
      %lx = $calc(%x + %sxcf.animate.x)
      %rx = $calc(%x2 - %sxcf.animate.x)
    }
    ;char
    sxcf_d_drawtile %fs %lx %y %char $sxcf_g_translatepos(%m,%act,%sxcf.animate.alt)
    sxcf_d_drawtile %fs %rx %y $sxcfget(oppchar) $sxcf_g_translatepos(%om,%act,%sxcf.animate.alt)
    ; weap
    sxcf_d_drawtile %fs $sxcf_g_translateweap(%m,%act,%sxcf.animate.alt,%lx,%y)
    sxcf_d_drawtile %fs $sxcf_g_translateweap(%om,%act,%sxcf.animate.alt,%rx,%y)
    
  }
  
  
  elseif (%sxcf.animate.moves) {
    %x = 170
    %y = 90
    %y2 = 90
    %rightpos = $window($1).w - 220
    %x2 = %rightpos
    
    var %mcount = 40,%chn 30,%count 30,%specialwait 100
    ; how much to: move from ready position,which frame to change to hit move,slide + animate text..
    
    if (%m = right) { %om = left | %x2 = %x | %x = %rightpos }
    
    var %movable,%hpchange,%ex,%rhpchange
    
    %ex = $sxcf_w_rules($sxcfget(mycard),$sxcfget(mycard_value),$sxcfget(oppcard),$sxcfget(oppcard_value))
    
    
    if (%sxcf.animate.x >= %mcount) {
      ;      %act = ready
      ;      %act2 = ready
      %sxcf.animate.x = %mcount
      ;unset %sxcf.animate %sxcf.animate.flyback %sxcf.animate.pps %sxcf.animate.x %sxcf.animate.y
      if (!%sxcf.animate.moves2) %sxcf.animate.moves2 = 1
      
      %act = $sxcfget(mycard)
      %act2 = $sxcfget(oppcard)
      
      %movable = %ex
      
      ; sliding & critical after rules check
      if (%sxcf.animate.moves2) {
        
        if (%sxcf.animate.x2 >= %count) { %sxcf.animate.x2 = %count | if (!%sxcf.animate.done) inc %sxcf.animate.done }
        else inc %sxcf.animate.x2 %sxcf.animate.draw.delta
        
        ;        if ((%movable != 3) && (!%sxcf.animate.critical)) {
        if (!%sxcf.animate.critical) {
          ;              gt splay $scriptdir $+ BLOCK.wav
          ;LEFT arrow
          if (%sxcf.bg.scale = 1) {
            if ($sxcfget(critical)) {
              %sxcf.effect = 1 | %sxcf.effect.jerk = 1 | %sxcf.effect.count = 10 | %sxcf.effect.pixels = 10 | %sxcf.effect.aps = 200
              gt splay $scriptdir $+ HIT4.wav
            }
            ;H
            elseif (%movable = 3) {
              ;  .timer -oh 1 0 drawcopy -n %fs 0 0 $window(%fs).w $window(%fs).h $1 $+ _copy 0 0 | sxcf_d_preparefilter -h $rgb(255,255,0) | %sxcf.effect = 1 | %sxcf.effect.flash = 1 | %sxcf.effect.count = 1 | %sxcf.effect.aps = 200 | %sxcf.effect.flashfilter = 1
              gt splay $scriptdir $+ BLOCK.wav
            }
            ;H
            else {
              .timer -oh 1 0 drawcopy -n %fs 0 0 $window(%fs).w $window(%fs).h $1 $+ _copy 0 0 | sxcf_d_preparefilter -h $rgb(255,0,0) | %sxcf.effect = 1 | %sxcf.effect.flash = 1 | %sxcf.effect.count = 1 | %sxcf.effect.aps = 200 | %sxcf.effect.flashfilter = 1
              gt splay $scriptdir $+ HIT.wav
            }
          }
          else gt splay $scriptdir $+ HIT5.wav
          %sxcf.animate.critical = 1
        }
        %rhpchange = $sxcfget(hpchange)
        %hpchange = %rhpchange - %count
      }
      
    }
    else {
      %act = $sxcfget(mycard)
      %act2 = $sxcfget(oppcard)
      inc %sxcf.animate.x %sxcf.animate.draw.delta
      
      inc %sxcf.animate.count %sxcf.animate.draw.delta
      
      ; special effect!
      
      if (($sxcfget(winner) && !%sxcf.animate.special)) {
        ;        var %chn2 =
        if (%sxcf.animate.count >= $calc(%chn /2)) {
          ; blink twice then zoom
          gt splay $scriptdir $+ KILL3.wav
          sxcf_effect_flash $1
          sxcf_w_queuepush sxcf_effect_zoom
          %sxcf.animate.special = 1
        }
      }
      
      if (%sxcf.animate.count >= %chn) {
        if (%sxcf.animate.alt) unset %sxcf.animate.alt
        else { %sxcf.animate.alt = 1 }
        unset %sxcf.animate.count
      }
      
    }
    var %xm 0,%si, %rr $rgb(255,0,0), %gg $rgb(0,255,0), %sign -
    if (%movable = 3) { %xm = %sxcf.animate.x2 }
    if ($sxcfget(critical)) %si = System %sxcf.animate.x2
    else %si = System 20
    
    if ($sxcfget(myturn) = attack) {
      if (%m = right) {
        %lx = $calc(%x - %sxcf.animate.x + %xm)
        if (%sxcf.animate.alt) %x2 = %x2 + 10
        if (%movable >= 2) { %x2 = %x2 - %sxcf.animate.x2 }
      }
      else {
        %lx = $calc(%x + %sxcf.animate.x - %xm)
        if (%sxcf.animate.alt) %x2 = %x2 - 10
        if (%movable >= 2) { %x2 = %x2 + %sxcf.animate.x2 }
      }
      
      if ((%sxcf.animate.specialdone) && ($sxcfget(winner))) { %act = pose2 | %act2 = dead | %y2 = %y2 + 20 }
      ; draw char
      sxcf_d_drawtile %fs %lx %y %char $sxcf_g_translatepos(%m,%act,%sxcf.animate.alt)
      sxcf_d_drawtile %fs %x2 %y2 $sxcfget(oppchar) $sxcf_g_translatepos(%om,%act2,%sxcf.animate.alt)
      ; draw weap
      sxcf_d_drawtile %fs $sxcf_g_translateweap(%m,%act,%sxcf.animate.alt,%lx,%y)
      sxcf_d_drawtile %fs $sxcf_g_translateweap(%om,%act2,%sxcf.animate.alt,%x2,%y2)
      if ((%rhpchange) && (!%sxcf.animate.specialdone) && (%sxcf.animate.x2 >= 10)) {
        if (%rhpchange >= 0) { %sign = + | %rr = %gg }
        sxcf_d_text -b %rr -f %si -s 1 %fs $calc(%x2 +25) $calc(%y +45 - %sxcf.animate.x2 *2) %sign $+ $calc(%hpchange + %sxcf.animate.x2)
      }
    }
    else {
      ; if blocked, no text so dun bother setting font and size
      
      if (%m = right) {
        %rx = $calc(%x2 + %sxcf.animate.x - %xm)
        if (%movable >= 1) { %x = %x + %sxcf.animate.x2 }
        if (%sxcf.animate.alt) %x = %x - 10
      }
      else {
        %rx = $calc(%x2 - %sxcf.animate.x + %xm)
        if (%movable >= 1) { %x = %x - %sxcf.animate.x2 }
        if (%sxcf.animate.alt) %x = %x + 10
        
      }
      
      if ((%sxcf.animate.specialdone) && ($sxcfget(winner))) { %act2 = pose2 | %act = dead | %y2 = %y2 + 20 }
      ; draw char
      sxcf_d_drawtile %fs %x %y2 %char $sxcf_g_translatepos(%m,%act,%sxcf.animate.alt)
      sxcf_d_drawtile %fs %rx %y $sxcfget(oppchar) $sxcf_g_translatepos(%om,%act2,%sxcf.animate.alt)
      ; draw weapon
      sxcf_d_drawtile %fs $sxcf_g_translateweap(%m,%act,%sxcf.animate.alt,%x,%y2)
      sxcf_d_drawtile %fs $sxcf_g_translateweap(%om,%act2,%sxcf.animate.alt,%rx,%y)
      
      if ((%rhpchange) && (!%sxcf.animate.specialdone) && (%sxcf.animate.x2 >= 10)) {
        if (%rhpchange >= 0) { %sign = + | %rr = %gg }
        sxcf_d_text -b %rr -f %si -s 1 %fs $calc(%x +25) $calc(%y +45 - %sxcf.animate.x2 *2) %sign $+ $calc(%hpchange + %sxcf.animate.x2)
      }
    }
    
    if (%sxcf.animate.done) {
      sxcfset updatehealth 1
      if (!%sxcf.animate.specialdone) {
        if ($sxcfget(winner)) {
          inc %sxcf.animate.wait %sxcf.animate.draw.delta
          if (%sxcf.animate.wait >= %specialwait) {
            %sxcf.animate.specialdone = 1
            %sxcf.effect = 1 | %sxcf.effect.zoomout = 1 | %sxcf.effect.finalscale = 1 | %sxcf.effect.x = 248 | %sxcf.effect.y = 108 | %sxcf.effect.pps = 100
          }
          else return
        }
      }
      sxcf_w_queuepop animate
    }
  }
}
alias sxcf_d_fillcards {
  var %loop_time = $ticks - %sxcf.old_ticks, %new_delta_tmp = $round($calc(%sxcf.fillcards.pps /1000 * %loop_time),2) + %sxcf.fillcards.draw.olddecimal
  %new_delta_tmp = $calc($sxcfget(speed) /5 * %new_delta_tmp)
  %sxcf.fillcards.draw.delta = $int(%new_delta_tmp)
  %sxcf.fillcards.draw.olddecimal = $calc(%new_delta_tmp - %sxcf.fillcards.draw.delta)
  
  inc %sxcf.fillcards.alt $+(0.,%sxcf.fillcards.draw.delta)
  %alt = $int(%sxcf.fillcards.alt)
  if (%sxcf.fillcards.alt >= 2) { unset %sxcf.fillcards.alt | sxcfunset cards2drawn }
  
  sxcf_d_text -f Terminal 20 $1 $+ _fs 247 254 Pick a card: $sxcfget(myturn)
  ;  drawtext -nr $1 $+ _fs 16777215 Terminal 20 203 246 Pick a card
  
  if (!$sxcfget(cards2drawn)) {
    var %w $window($1).w,%om = right,%m = $sxcfget(myside),%char $sxcfget(mychar),%cd $sxcf_layer(cards),%cd2 $sxcf_layer(cards2),%x 18,%y 318,%alt 0
    if (%sxcf.fillcards.alt2) %sxcf.fillcards.alt2 = 0
    else %sxcf.fillcards.alt2 = 1
    
    sxcf_d_preparelayer cards2 0 300 %w 100
    drawcopy -n %cd 0 300 %w 100 %cd2 0 300
    
    if ($sxcfget(mycard)) {
      var %c $ifmatch,%rightpos $int($calc(%x + ($sxcfget(totalcards) *82) -82)),%x2 %rightpos
      if (%m = right) { %om = left | %x2 = %x | %x = %rightpos }
      sxcf_d_drawtile %cd2 %x %y %char $sxcf_g_translatepos(%m,%c,%sxcf.fillcards.alt2)
      if ($sxcfget(oppshow)) sxcf_d_drawtile %cd2 %x2 %y $sxcfget(oppchar) $sxcf_g_translatepos(%om,$sxcfget(oppcard),%sxcf.fillcards.alt2)
    }
    else {
      var %c $sxcfget(cards),%n $numtok(%c,44)
      while (%n > 0) {
        sxcf_d_drawtile %cd2 $int($calc(%x + (%n *82) -82)) %y %char $sxcf_g_translatepos(%m,$gettok(%c,%n,44),%sxcf.fillcards.alt2)
        ; debug
        ;        sxcf_d_drawtile %cd2 $sxcf_g_translateweap(%m,$gettok(%c,%n,44),%sxcf.fillcards.alt2,$int($calc(%x + (%n *82) -82)),%y)
        dec %n
      }
    }
    
    sxcfset cards2drawn 1
  }
  
  if (%sxcf.fillcards.alt2 >= 4) unset %sxcf.fillcards.alt2
  else inc %sxcf.fillcards.alt2
  
  if ((%sxcf.fillcards.sel) && !$sxcfget(mycard)) {
    ;    var %xxx $int($calc(38 + (%sxcf.fillcards.sel *82) -82))
    ;    drawline -nr $1 $+ _fs $iif(%sxcf.fillcards.alt2,$sxcfget(hilite1),$sxcfget(hilite2)) 5 %xxx 285 $calc(%xxx +5) 290 $calc(%xxx +10) 285 %xxx 285
    var %xxx $int($calc(1+(%sxcf.fillcards.sel *82) -82))
    drawrect -dnr $1 $+ _fs $iif(%sxcf.fillcards.alt2,$sxcfget(hilite1),$sxcfget(hilite2)) 4 %xxx 298 84 104
  }
  
}
menu @sxcf_general {
  uclick {
    var %c $click($active,$click($active,0))
    tokenize 32 %c
    debugf GENERALMENU clicked: %c - released: $mouse.x $mouse.y - rect: %c $calc($mouse.x - $1) $calc($mouse.y - $2)
  }
  
}
menu @sxcf_CardFighters {
  mouse:{
    /*
    ; menu
    if (%sxcf.menu) {
      if ($inrect($mouse.x,$mouse.y,212,98,70,25)) %sxcf.menu.item1 = 1
      else %sxcf.menu.item1 = 0
      if ($inrect($mouse.x,$mouse.y,198,146,96,25)) %sxcf.menu.item2 = 1
      else %sxcf.menu.item2 = 0
    }
    */
    ;player select
    if (%sxcf.select.menuon) {
      if ($inrect($mouse.x,$mouse.y,41,101,14,14)) %sxcf.select.item1 = 1
      else %sxcf.select.item1 = 0
      if ($inrect($mouse.x,$mouse.y,156,101,14,14)) %sxcf.select.item2 = 1
      else %sxcf.select.item2 = 0
      if ($inrect($mouse.x,$mouse.y,419,172,31,30)) %sxcf.select.item3 = 1
      else %sxcf.select.item3 = 0
      if ($inrect($mouse.x,$mouse.y,454,172,31,31)) %sxcf.select.item4 = 1
      else %sxcf.select.item4 = 0
    }
    
    ; choose cards
    elseif (%sxcf.fillcards) {
      if ($inrect($mouse.x,$mouse.y,14,100,60,75)) %sxcf.fillcards.sel = 1
      elseif ($inrect($mouse.x,$mouse.y,96,100,60,75)) %sxcf.fillcards.sel = 2
      elseif ($inrect($mouse.x,$mouse.y,178,100,60,75)) %sxcf.fillcards.sel = 3
      elseif ($inrect($mouse.x,$mouse.y,260,100,60,75)) %sxcf.fillcards.sel = 4
      elseif ($inrect($mouse.x,$mouse.y,342,100,60,75)) %sxcf.fillcards.sel = 5
      elseif ($inrect($mouse.x,$mouse.y,424,100,60,75)) %sxcf.fillcards.sel = 6
      else %sxcf.fillcards.sel = 0
    }
    
    ; top menu
    elseif (%sxcf.topmenu) {
      if ($inrect($mouse.x,$mouse.y,186,$calc(%sxcf.topmenu.y +2),122,17)) %sxcf.topmenu.sel = 1
      elseif ($inrect($mouse.x,$mouse.y,186,$calc(%sxcf.topmenu.y +23),122,17)) %sxcf.topmenu.sel = 2
      elseif ($inrect($mouse.x,$mouse.y,186,$calc(%sxcf.topmenu.y +41),122,17)) %sxcf.topmenu.sel = 3
      else %sxcf.topmenu.sel = 0
    }
    
  }
  sclick {
    ;    debugf $mouse.x $mouse.y
    if (%sxcf.help) { sxcf_w_menu }
    
    ; <
    if (%sxcf.select.item1) {
      var %n $numtok($sxcfget(charset),44)
      dec %sxcf.select.char
      if (%sxcf.select.char <= 0) %sxcf.select.char = %n
    }
    ; >
    elseif (%sxcf.select.item2) {
      var %n $numtok($sxcfget(charset),44)
      inc %sxcf.select.char
      if (%sxcf.select.char > %n) %sxcf.select.char = 1
    }
    ;ok
    elseif (%sxcf.select.item3) {
      sxcfset mychar $gettok($sxcfget(charset),%sxcf.select.char,44)
      unset %sxcf.select.menuon
      ; if 1 player game set it up
      if (%sxcf.w.1p) {
        unset %sxcf.select*
        
        sxcf_d_prefight
        ;%sxcf.effect.after = sxcf_w_1psetup
        sxcf_w_queuepush sxcf_w_1psetup
      }
      ; 2
      else {
        ;%sxcf.effect.after = sxcf_w_2psetup
        if ($sxcfget(oppchar)) {
          state gd2go
        }
        else {
          state seled
        }
      }
    }
    ;cancel
    elseif (%sxcf.select.item4) sxcf_w_menu
    
    ; picked a card
    if (%sxcf.fillcards) {
      if (%sxcf.fillcards.sel) {
        sxcf_w_selcard cards %sxcf.fillcards.sel
        sxcf_effect_flash $sxcfget(win) $iif($sxcfget(myturn) = attack,$rgb(180,0,0),$rgb(0,0,180))
        sxcf_animate_flyaway
        ;%sxcf.animate.after = sxcf_w_1pstep 2
        sxcf_w_queuepush sxcf_w_1pstep 2
        sxcf_w_queuepush sxcf_d_minicards
      }
    }
    
    
    ; top menu
    ; end round
    if (%sxcf.topmenu) {
      if (%sxcf.topmenu.sel) {
        $gettok(%sxcf.topmenu.cmds,$ifmatch,44)
      }
    }
    
    if ($mouse.key & 2) return
    else gui_dragdrop $calc($mouse.dx -$window($active).x) $calc($mouse.dy -$window($active).y)
    return
  }
  
  uclick {
    var %c $click($active,$click($active,0))
    tokenize 32 %c
    debugf clicked: %c - released: $mouse.x $mouse.y - rect: %c $calc($mouse.x - $1) $calc($mouse.y - $2)
  }
  
  $style(2) $title $ver:return
  $style(2) by $author:return
  -
  Manual:sxcfman
  -
  Close:shut
}
alias -l gui_dragdrop {
  if ($window($active)) {
    window $active $calc($mouse.dx -$1) $calc($mouse.dy -$2)
    if ($mouse.key & 1) {
      .timer$active -o 1 0 gui_dragdrop $1-
    }
  }
}
alias sxcf_effect_scrolldown {
  %sxcf.effect = 1
  %sxcf.effect.up = 1
  %sxcf.effect.endY = $window($sxcfget(win)).h
  %sxcf.effect.pps = 400
  sxcf_w_queuelisten effect
}
alias sxcf_effect_scrollup {
  %sxcf.effect = 1
  %sxcf.effect.down = 1
  %sxcf.effect.endY = 0
  %sxcf.effect.pps = 600
  sxcf_w_queuelisten effect
}
alias sxcf_effect_jerk {
  %sxcf.effect = 1
  %sxcf.effect.jerk = 1
  %sxcf.effect.count = 10
  %sxcf.effect.pixels = 10
  %sxcf.effect.aps = 200
  sxcf_w_queuelisten effect
}
alias sxcf_effect_flash {
  var %si $1 $+ _copy,%ri $1 $+ _fs,%x 0,%y 0,%w $window($1 $+ _fs).w,%h $window($1 $+ _fs).h
  .timer -oh 1 0 drawcopy -n %ri 0 0 %w %h %si %x %y
  %sxcf.effect = 1
  %sxcf.effect.flash = 1
  %sxcf.effect.count = 2
  %sxcf.effect.aps = 100
  %sxcf.effect.flashcol = $iif($2,$2,$rgb(255,255,255))
  sxcf_w_queuelisten effect
}
alias sxcf_effect_flashfilter {
  var %si $1 $+ _copy,%ri $1 $+ _fs,%x 0,%y 0,%w $window($1 $+ _fs).w,%h $window($1 $+ _fs).h
  drawcopy -n %ri 0 0 %w %h %si %x %y
  sxcf_d_preparefilter -h $rgb(255,0,0)
  %sxcf.effect = 1
  %sxcf.effect.flash = 1
  %sxcf.effect.count = 1
  %sxcf.effect.aps = 200
  %sxcf.effect.flashfilter = 1
  sxcf_w_queuelisten effect
}
alias sxcf_effect_zoom {
  %sxcf.effect = 1
  %sxcf.effect.zoom = 1
  %sxcf.effect.finalscale = 2
  %sxcf.effect.x = 248
  %sxcf.effect.y = 108
  %sxcf.effect.pps = 100
  sxcf_w_queuelisten effect
}
alias sxcf_effect_zoomout {
  %sxcf.effect = 1
  %sxcf.effect.zoomout = 1
  %sxcf.effect.finalscale = 1
  %sxcf.effect.x = 248
  %sxcf.effect.y = 108
  %sxcf.effect.pps = 100
  sxcf_w_queuelisten effect
}
alias sxcf_effect_boxout {
  var %si $1 $+ _copy,%ri $1 $+ _fs,%x 0,%y 0,%w $window($1 $+ _fs).w,%h $window($1 $+ _fs).h
  
  drawcopy -n %ri 0 0 %w %h %si %x %y
  %sxcf.effect = 1
  %sxcf.effect.count3 = 0
  %sxcf.effect.box = 1
  %sxcf.effect.w = 50
  %sxcf.effect.aps = 500
  %sxcf.effect.pps = 500
  sxcf_w_queuelisten effect
}
alias sxcf_effect_boxin {
  var %si $1 $+ _copy,%ri $1 $+ _fs,%x 0,%y 0,%w $window($1 $+ _fs).w,%h $window($1 $+ _fs).h
  
  if (%sxcf.effect.boxin.cmd) { $ifmatch | unset %sxcf.effect.boxin.cmd }
  if (%sxcf.effect.boxin.cmd2) { $ifmatch | unset %sxcf.effect.boxin.cmd2 }
  if (%sxcf.effect.boxin.cmd3) { $ifmatch | unset %sxcf.effect.boxin.cmd3 }
  %sxcf.effect = 1
  %sxcf.effect.box = 0
  %sxcf.effect.inbox = 1
  %sxcf.effect.count3 = 0
  %sxcf.effect.w = 50
  %sxcf.effect.aps = 500
  %sxcf.effect.pps = 500
  sxcf_w_queuelisten effect
}
alias sxcf_filter_on sxcf_d_preparefilter -d $sxcfget(esccol) | %sxcf.filter = 1
alias sxcf_filter_off unset %sxcf.filter | sxcf_w_queuelisten filter
alias sxcf_animate_stop unset %sxcf.animate* | sxcf_w_queuelisten animate
alias sxcf_animate_flyaway {
  sxcf_d_clearlayer cards2
  %sxcf.fillcards = 0
  %sxcf.animate = 1
  %sxcf.animate.fly = 1
  %sxcf.animate.pps = 400
  %sxcf.animate.x = 0
  %sxcf.animate.y = 0
  sxcf_w_queuelisten animate
}
alias sxcf_animate_flyback {
  sxcf_d_clearlayer cards2
  %sxcf.animate = 1
  %sxcf.animate.flyback = 1
  %sxcf.animate.pps = 500
  %sxcf.animate.x = 0
  %sxcf.animate.y = 0
  sxcf_w_queuelisten animate
}
alias sxcf_animate_meet {
  %sxcf.animate.flyback = 0
  %sxcf.animate = 1
  %sxcf.animate.walk = 1
;  %sxcf.animate.pps = $sxcfget(speed) / 5 * 700
  %sxcf.animate.pps = 700
  %sxcf.animate.x = 0
  sxcf_w_queuelisten animate
}
alias sxcf_animate_fight {
  sxcf_w_newrule
  unset %sxcf.animate.specialdone %sxcf.animate.wait %sxcf.animate.special %sxcf.animate.done %sxcf.animate.x %sxcf.animate.x2 %sxcf.animate.moves2 %sxcf.animate.alt %sxcf.animate.count %sxcf.animate.critical
  %sxcf.animate.moves = 1
  %sxcf.animate = 1
  %sxcf.animate.walk = 0
  %sxcf.animate.pps = 250
  sxcf_w_queuelisten animate
}
alias sxcf_charpic_show %sxcf.charpic = 1
alias sxcf_charpic_hide unset %sxcf.charpic | sxcf_w_queuepop charpic
alias sxcf_minicards_off sxcf_d_clearlayer minicards | sxcf_w_queuepop minicards
alias sxcf_note_winner {
  %sxcf.note.count = 0
  %sxcf.note.time = 300
  %sxcf.note = 1
  %sxcf.note.winner = 1
  %sxcf.note.pps = 100
  sxcf_w_queuelisten note
}
alias sxcf_topmenu_endround {
  %sxcf.topmenu = 1
  %sxcf.topmenu.items = Restart Round,Select New Players,Main Menu
  %sxcf.topmenu.cmds = sxcf_w_rr,sxcf_w_select,sxcf_w_menu
  %sxcf.topmenu.x = 186
  %sxcf.topmenu.y = 33
  sxcf_w_queuelisten topmenu
}
alias sxcf_topmenu_main {
  %sxcf.topmenu = 1
  %sxcf.topmenu.items = 1 vs com,1 vs 2,How to Play
  %sxcf.topmenu.cmds = sxcf_w_1p,sxcf_topmenu_main_1v2,sxcf_w_help
  %sxcf.topmenu.x = 186
  %sxcf.topmenu.y = 105
  sxcf_w_queuelisten topmenu
}
alias sxcf_topmenu_main_1v2 {
  %sxcf.topmenu = 1
  %sxcf.topmenu.items = Host a Game,Join a Game,Main Menu
;  %sxcf.topmenu.cmds = sxcf_topmenu_main_1v2_host,sxcf_w_join,sxcf_topmenu_main
  %sxcf.topmenu.cmds = return,return,sxcf_topmenu_main
  %sxcf.topmenu.x = 186
  %sxcf.topmenu.y = 105
  sxcf_w_queuelisten topmenu
}
alias sxcf_topmenu_main_1v2_host {
  %sxcf.topmenu = 1
  %sxcf.topmenu.items = Start,Configure,Back
  %sxcf.topmenu.cmds = sxcf_w_host,sxcf_p_host,sxcf_topmenu_main_1v2
  %sxcf.topmenu.x = 186
  %sxcf.topmenu.y = 105
  sxcf_w_queuelisten topmenu
}

; server client comms
alias -l sv {
  if ($1 = all) {
    var %r $sxcfget(connections),%n 1
    while ($gettok(%r,%n,44)) {
      sockwrite -n $+(sxcfclient_,$ifmatch) $2-
      inc %n
    }
  }
  else sockwrite -n $1 $2-
}
alias -l 2sv sockwrite -n gamesv $1-
alias -l svcl sv $1 D $2- | $2-
alias -l state {
  if ($sxcfget(iamhost)) $stateaction($1)
  else 2sv A $1
}
alias -l stateaction {
  if ($1 = gd2go) return svcl all sxcf_w_2plaunch
  elseif ($1 = seled) svcl all sxcf_w_msg $sxcfget(nick) selected a character.
  
}

on *:MIDIEND:{
  if (!$sxcfget(music)) return
  var %f
  if (%sxcf.fight) { %f = $remove($sxcf_db(fight.mid),") }
  if (%sxcf.select) { %f = $remove($sxcf_db(select.mid),") }
  if ($filename = %f) splay -cq %f
}
on *:load:{
  var %z echo $colour(info)
  %z $title $ver loaded.
  %z $story - $chapter
  %z to begin: /sxcf - (tab) resets - (enter) skips intro
}
on *:close:@sxcf_CardFighters:shut

; the client codes
on *:sockopen:gamesv:{
  %sxcf.join.stp = 2
  .timersxcfgamesv.fail -o 1 8 set %sxcf.join.stp 7
  2sv N $me
  2sv V $ver
}
on *:sockread:gamesv:{
  if ($sockerr > 0) return
  :nextread
  sockread %r
  tokenize 32 %r
  debugf CLIENTREAD $sockname sent: %r
  if ($sockbr == 0) return
  if (D* iswm $1-) $2-
  goto nextread
}

; the server codes
on *:socklisten:sxcfserver:{
  %sxcf.host.stp = 2
  var %r $r(1111,9999)
  sockaccept sxcfclient_ $+ %r
  .timersxcfdc. $+ %r -o 1 10 sockclose sxcfclient_ $+ %r
  .timersxcfdc. $+ %r $+ .ms -o 1 8 set %sxcf.host.stp 7
  .timersxcfservershow -o 1 10 set %sxcf.host.stp 1
  sxcfset connections $instok($sxcfget(connections),%r,1,44)
}
on *:sockread:sxcfclient_*:{
  if ($sockerr > 0) return
  :nextread
  sockread %r
  if ($sockbr == 0) return
  tokenize 32 %r
  debugf SERVERREAD $sockname sent: %r
  var %i $gettok($sockname,2,95)
  if (N* iswm %r) sxcfset $sockname $2-
  elseif (V* iswm %r) {
    .timersxcfdc. $+ %i $+ * off
    .timersxcfservershow off
    if ($sxcfget($sockname)) sxcf_w_msg $ifmatch connected.
    else goto h
    
    ; correct key version received
    if ($gettok(%r,2,32) = $ver) {
      %sxcf.host.stp = 3
      unset %sxcf.host
      sxcfset iamhost 1
      
      var %r $r(0,1),%m = right,%o = left
      if (%r) %m = left | %o = right
      
      sxcfset myside %m | sv $sockname D sxcfset myside %o
      svcl $sockname sxcf_d_presel
      
      return
    }
    
    :h
    %sxcf.host.stp = 6
    .timersxcfservershow -o 1 5 set %sxcf.host.stp 1
    sockclose $sockname
  }
  elseif (A* iswm %r) {
    if ($2 = gd2go) $stateaction($2)
  }
  goto nextread
}

on *:sockclose:sxcfclient_*:{
  if ($sxcfget($sockname)) { sxcf_w_msg $ifmatch disconnected. | sxcfunset $sockname }
  sxcfset connections $remtok($sxcfget(connections),$gettok($sockname,2,95),1,44)
}
menu Status,Menubar {
  $title $ver
  .Start:sxcf
  .Manual:sxcfman
  .Unload
  ..I am sure
  ...Get rid of me!:unload -rs $script
}

on *:KEYDOWN:@sxcf_CardFighters:*:{
  ;  debugf $keyval $keychar $keyrpt r
  var %si $active $+ _copy,%ri $active $+ _fs,%x 0,%y 0,%w $window($active $+ _fs).w,%h $window($active $+ _fs).h
  /*
  if ($keyval = 38) { sxcf_effect_scrolldown }
  elseif ($keyval = 40) { sxcf_effect_scrollup }
  elseif ($keyval = 37) { sxcf_effect_jerk }
  elseif ($keyval = 39) { sxcf_effect_flash $active }
  elseif ($keyval = 72) { sxcf_effect_flashfilter $active }
  ;  elseif ($keyval = 13) { sxcf_effect_zoom }
  elseif ($keyval = 32) { sxcf_effect_zoomout }
  elseif ($keyval = 70) { sxcf_filter_on }
  elseif ($keyval = 71) { sxcf_filter_off }
  elseif ($keyval = 83) { sxcf_effect_boxout $active }
  elseif ($keyval = 68) { sxcf_effect_boxin $active }
  elseif ($keyval = 90) { sxcf_w_showcards $active helen attack }
  elseif ($keyval = 88) { sxcf_w_showcards $active jeric defend }
  elseif ($keyval = 67) { sxcf_w_hidecards }
  elseif ($keyval = 49) { sxcf_w_selcard cards 1 }
  elseif ($keyval = 50) { sxcf_w_selcard cards 2 }
  elseif ($keyval = 51) { sxcf_w_selcard cards 3 | sxcf_effect_flash $active $rgb(0,0,180) }
  elseif ($keyval = 52) { sxcf_w_selcard cards 4 }
  elseif ($keyval = 53) { sxcf_w_selcard cards 5 }
  elseif ($keyval = 54) { sxcf_w_selcard cards 6 }
  elseif ($keyval = 75) { sxcf_w_setright }
  elseif ($keyval = 76) { sxcf_w_setleft }
  elseif ($keyval = 81) { sxcf_w_hidemovingpics }
  elseif ($keyval = 16) { sxcf_w_oppselected | sxcf_effect_flash $active $rgb(180,0,0) }
  elseif ($keyval = 87) { sxcf_w_oppshowcard jeric 5 8 }
  elseif ($keyval = 8) { sxcf_animate_flyaway }
  elseif ($keyval = 187) { sxcf_animate_flyback }
  elseif ($keyval = 189) { sxcf_animate_meet }
  elseif ($keyval = 48) { sxcf_animate_fight }
  elseif ($keyval = 86) { sxcf_charpic_show }
  elseif ($keyval = 66) { sxcf_charpic_hide }
  elseif ($keyval = 192) { sxcf_w_resetlife }
  */
  if ($keyval = 13) {
    if (%sxcf.intro) sxcf_w_menu
    if (%sxcf.host) sockclose sxcfserver | sxcf_w_menu
  }
  elseif ($keyval = 9) { sxcf_w_reset }
}
