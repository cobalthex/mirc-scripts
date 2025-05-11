;SERVER

;$1 = tcpport ; $2 = server's name, must be different from N/A and less than 21 character
alias cave_server_start {
  if ($2- === N/A) || ($len($2-) > 20) return
  sockclose cave_server
  socklisten cave_server $$1
  hadd -m cave_s servname $$2-
  hadd cave_s version 0.1
  cave_client_start 127.0.0.1 $1
  hadd cave_c server 1
}

dialog cave_server_conf {
  title "Create A New Server"
  size -1 -1 150 150
  option dbu
  text "Tcp port:", 1, 16 17 24 8
  text "Server name:", 2, 5 6 35 8
  edit "", 3, 40 5 105 10, autohs
  edit "", 4, 40 16 105 10
  button "Create!", 5, 40 134 50 12, ok disable
  box "Dungeons available:", 8, 5 30 140 100
  list 6, 10 38 130 87, size disable
  button "Cancel", 7, 95 134 50 12, cancel
}

on *:dialog:cave_server_conf:edit:*:did $iif($portfree($did(4)) && $did(3) && $did(4) isnum,-e,-b) $dname 5
on *:dialog:cave_server_conf:sclick:5:if ($did(4) isnum) cave_server_start $v1 $did(3)

alias cave_server_start_dialog noop $dialog(cave_server_conf,cave_server_conf,-3)

alias cave_server_stop {
  sockclose cave_server
  sockclose cave_client?*
  hfree -w cave_s
}

alias -l cave_send if ($sock(cave_client_p*,0)) sockwrite -n cave_client_p* $1-

on *:socklisten:cave_server:{
  hinc cave_s connection
  sockaccept cave_client_c $+ $hget(cave_s,connection)
}

on *:sockread:cave_client_*:{
  if ($sockerr) { echo -m server sockread error - $!sockerr is $v1 | cave_server_stop | return }
  var %s $sock($sockname).mark
  sockread -fn &a
  tokenize 32 $bvar(&a,1-4096).text
  if ($1 == login) && (!%s) cave_s_login $2-
  elseif ($2 == pready) && (%s) && (!$istok($hget(cave_s,ready),%s,32)) { hadd cave_s ready $hget(cave_s, ready) %s | cave_send ready $hget(cave_s,ready) }
  elseif ($2 == pnready) && (%s) && ($istok($hget(cave_s,ready),%s,32)) { hadd cave_s ready $remtok($hget(cave_s,ready),%s,32) | cave_send ready $hget(cave_s,ready) }
}

on *:sockclose:cave_client_p*:hadd cave_s nicks $remtok($hget(cave_s,nicks),$sock($sockname).mark,32) | hadd cave_s ready $remtok($hget(cave_s,ready),$sock($sockname).mark,32) | cave_send nicks $hget(cave_s,nicks)

;$1 = nick
alias -l cave_s_login {
  if ($regsubex($1,/\d+/g,) == $null) || ($regex($1,/[^-_a-zA-Z0-9]/)) sockwrite -n $sockname INVALID_NICK
  elseif ($istok($hget(cave_s,nicks),$2,32)) sockwrite -n $sockname INUSE_NICK
  elseif ($len($2) > 12) sockwrite -n $sockname TOOLONG_NICK
  elseif ($2 < $hget(cave_s,version)) { sockwrite -n $sockname VERSION_ERROR | .timer 1 2 sockclose $sockname }
  else {
    var %n $remove($sockname,cave_client_c)
    sockwrite -n $sockname hello $1
    sockwrite -n $sockname servname $hget(cave_s,servname)
    sockmark $sockname $1
    hadd cave_s nicks $hget(cave_s,nicks) $1
    sockwrite -n $sockname nicks $hget(cave_s,nicks) 
    cave_send connection $1
    sockrename $sockname cave_client_p $+ %n
  }
}


;;;;;;;;;;;;;;;;;;;;;;;;;

;CLIENT

;;;;;;;;;;;;;;;;;;;;;;;;;

;$1 = ip ; $2 = tcp port
alias cave_client_start {
  sockclose cave_client
  sockopen cave_client $1-
}

alias cave_client_stop {
  sockclose cave_client
  if ($hget(cave_c)) {
    hdel cave_c nicks
    hdel cave_c me
    hdel cave_c server
    hadd cave_c svr_name N/A
  }
}

on *:sockopen:cave_client:{
  if ($sockerr) { echo -s unable to connect to $sock(cave_client).ip on port $sock(cave_client).port) - $!sockerr is $v1 | cave_client_stop | return }
  else .timer -h 1 0 cave_c_login
}

alias -l cave_c_login {
  if ($input($iif($show,Enter your nickname,Nickname is $1-),eu,Cave dwellers)) sockwrite -n cave_client login $!
  else cave_client_stop
}

on *:sockread:cave_client:{
  if ($sockerr) { echo -s client on sockread error - $!sockerr is $v1 | cave_client_stop | return }
  sockread -fn &a
  tokenize 32 $bvar(&a,1-4096).text
  if ($1 == hello) { hadd cave_c me $1 }
  elseif ($1 == nicks) { hadd cave_c nicks $2- | cvlob_draw }
  elseif ($1 == connection) { hadd cave_c nicks $hget(cave_c,nicks) $2 | cvlob_draw }
  elseif ($1 == servname) { hadd cave_c svr_name $2- | cvlob_draw }
  elseif ($1 == ready) { hadd cave_c pready $2- | cvlob_draw }
  elseif ($1 == INVALID_NICK) .cave_c_login invalid $+ $crlf $+ Characters allowed are letters, numbers, '-' and '_' $+ $crlf $+ Your nickname must not consist of number only.
  elseif ($1 == INUSE_NICK) .cave_c_login already in use, please choose another nickname
  elseif ($1 == TOOLONG_NICK) .cave_c_login too long, maximum length is 12
  elseif ($1 == VERSION_ERROR) { cave_client_stop | cvlob_draw }
}

on *:sockclose:cave_client:cave_client_stop | cvlob_draw
