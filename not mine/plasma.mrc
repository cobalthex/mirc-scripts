; +---------------+
; |               |
; |==REAL PLASMA==|
; |   1k intro.   |
; |     2004.     |
; |               |
; +---------------+--- -- -
;                 |
;                 .
alias -l n {
  window -pdoBfCh +dL @p 0 0 360 387
  var %i -1000,%j hadd -m
  drawfill -nr @p 9848400 1 1 1 1
  drawtext -nr @p 16751540 arial 12 1 373 Real time Plasma by StanZ (Purple tentacles) - 2004 PPT DesiGn
  while %i < 1000 { %j 1 %i $o(%i,45,63) | %j 2 %i $o(%i,75,7) | %j 3 %i $o(%i,50,92) | inc %i }  
  %k = -400
  %g = 0
  p
}
alias -l p {
  inc %k 10 | var %x 0,%y 0 | if %k > 700 b
  while %y < 375 {
    while %x < 360 { drawrect -rnf @p $calc(%g +80*$calc($hget(1,$calc(%x +%k))+$hget(2,$calc(%x +%y -%k))+$hget(3,$calc(%x -%y +%k)))) 0 %x %y 14 14 | inc %x 15 }
    inc %y 15 | var %x 0
  }
  drawdot @p | .timerp -hm 1 0 p
}
menu @p {
  sclick:a
}
on *:close:@p:a
alias -l a .timerp off | window -c @p | unset %g %k
alias -l o return $calc($sin($calc($1 /$2)*$3))
menu status,channel,menubar {
  \\\ PLASMA:n
}
alias -l b set %k -400 | set %g $r(0,16777215)
