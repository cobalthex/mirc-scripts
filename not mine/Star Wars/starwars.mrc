menu status,channel {
  -
  .= Star Wars =:starwars
  -
}
alias starwars {
  if $window(@starwars) { halt } | var %¢ 0 0,%q drawrect -frn,%w $scriptdir,%x window,%i 0 1 %¢ 320 220,%z hadd -m ƒ | %- = 7237230 | %× = $+(",%w,S.png,") | %• = $+(",%w,X.png,") | s.log | %a = 1 | %b = 1 | %c = @starwars | %cé = @starwars2 | %g = @star | %gé = @star2 | %ég = @stak | %l = 1 | %î = 1 | %¹ = .timerstarwars | %³ = .timerstarwar.shi | %y¤ = setlayer | %s.max = 1 | %s.9 = drawtext -onr %g | %s.p = drawline -nr | %s.k = drawtext -nr | %s.s = drawcopy
  %z 1 STANZ STRIKES BACK WITH | %z 2 ANOTHER EFFECT CALLED | %z 3 " STAR WARS SCROLLER " | %z 4 . | %z 5 YEAH, AGAIN A PART OF | %z 6 DEMO CULTURE. | %z 7 SUM SHOUT'S: | %z 8 THE MEGA MIGHTY KENJI | %z 9 AKA KNJ (; | %z 10 AND DA GR8 FEIGNASSE | %z 11 BIGBEZUS | %z 12 . | %z 13 MAY THE FORCE BE WITH U | %z 14 SKY SCRIPTER (: | %z 15 REMEMBER THAT KHALED | %z 16 IS YOUR FATHER, YOUNG | %z 17 $upper($me) *LOL* | %z 18 . | %z 19 . | %z 20 . | %z 21 . | %z 22 . | %z 23 . |  %z 24 . | %z 25 = V. 1.9 MARCH 2ØØ4 = | %z 26 . | %z 27 . | %z 28 ` | %z 29 . | %z 30 .
  %z = $chr(32) STAR WARS DEMO BY STANZ * MARCH 24 - OYEEEEEEEEE PICWIN TK! SAPAPAYA  AS TONNY MONTANA SAID, DRAWDOT IS LIFE: NEVER FORGET DIS! GREETINGS TO - PURPLE TENTACLES INC - MAD FREAX: BOMBSTRIKE & ZERG - HAPPY HELLO TO VISIONZ, TOKEN, SAX, BETEL & EPSILON  END OF THIS POOR CRAPTEXT, LET'S WRAP'N'WRAP :)) - | %z = $replace(%z,$chr(32),$chr(255)) | %j = $len(%z) | %o = %j | %É = $str(°,32) | %Ã = 16777215 | %ó = $str(%z,2) | %» = drawdot %c | %æ = PICWIN TK IS GOOD FOR YOU ! | %å = 0 318 186 %c %¢ | %x -phn +d %g %¢ 320 220 | %x -pBCdoh +dL %c %¢ 317 186 | %x -pBhn +d %gé %¢ 636 600 | %x -pBhn +d %ég %¢ 320 220 | %q %g %i | %q %c %i | %q %ég %i | %q %gé 0 1 %¢ 318 600 | %s.x = $window(-1).w | %s.y = $window(-1).h | %x -pdkBfChn +d %cé %¢ %s.x %s.y | var %b.l 3,%a.t 0,%c.l 0,%i 53
  while %b.l {
    var %÷ $calc((6-%b.l)*80*(4-%b.l)),%f.d 255 - %c.l,%h 102 | while %÷ { drawdot -nr %gé $rgb(%f.d,%f.d,%f.d) 1 $r(0,318) $r(%a.t,$calc(200+%a.t)) | dec %÷ } | %s.s -n %gé %¢ 318 $calc(200+%a.t) %gé 318 0 | dec %b.l | inc %c.l 90 | inc %a.t 200
  }
  while %h { set %| $+ %h %s.s -nm %g 0 $calc(190-%h ^2/55) 318 1 %ég %h $calc(200-%h) $calc(320-2*%h) 1 | dec %h }
  while %i { var %. $r(80,110) | drawrect -nrf %ég $rgb(0,%.,%.) 1 $calc(-4+6*%i) 2 5 11 | dec %i } | %y¤ 0 %c | .timerstarwar.gle -mho 25 10 s.flo | 1
}
alias -l 1 {
  var %øñ 318 185 %c 0 15,%Ä $calc(15*$sin(%?).deg),%ô $calc(55+15*$cos(%?).deg),%ö $calc(55+%Ä),%ù $calc(55-%Ä),%ÿ $calc(175+80*$cos($calc(.02*%?))),%ë $calc(255-%ÿ),%« $r(210,255),%h 102,%x $r(0,150) | inc %s.w1 | inc %s.w2 2 | inc %s.w3 3 | if (%s.w1 > 318) set %s.w1 1 | if (%s.w2 > 318) set %s.w2 1 | if (%s.w3 > 318) set %s.w3 1 | %s.s -n %gé %s.w3 0 %øñ | %s.s -tn %gé 0 %s.w2 200 %øñ | %s.s -tn %gé 0 %s.w1 400 %øñ | inc %? 16 | inc %' 8 | if (%' > 2500) set %' 0 | drawtext -nor %c $rgb(0,0,$calc(150+2*%Ä)) verdana 38 $calc(600-%') 34 %æ | %s.k %c %ë webdings 90 -9 7 ÿ
  %s.p %c $rgb(0,0,$calc(3*%ù)) 4 0 %ô 317 %ô | %s.p %c $rgb(0,0,$calc(3*%ô)) 4 0 %ö 317 %ö | %s.p %c $rgb(0,0,$calc(3*%ö)) 4 1 %ù 313 %ù | inc %z+ 4 | var %so $calc(130+55*$sin(%z+).deg) | drawpic -nct %c 0 %so 33 %× | drawreplace -nr %c %Ã $rgb(%ë,%ô,%ÿ) %so 33 110 44 | if %a > 10 { %s.k %g $rgb(25,%ë,25) wingdings $r(30,40) $r(15,285) $r(160,176) « | if $hget(ƒ,%b) != . { %s.9 %- verdana 20 2 182 $hget(ƒ,%b) | %s.9 %Ã verdana 20 2 179 $hget(ƒ,%b) } | if $hget(ƒ,%b) = ` { %s.9 38550 wingdings 120 100 102 µ | drawdot -nr %g 0 9 6 186 } | if (%b > 29) set %b 0 | set %a 1 | inc %b } | if (%l = %j) set %l 1 | inc %l | drawscroll -n %g 0 -3 2 2 318 210 | inc %a | %s.k %g 0 terminal 20 0 0 %É
  while %h { %| [ $+ [ %h ] ] | dec %h }
  %s.s -nt %ég 0 0 0 320 200 %c 0 0 | %s.k %c $rgb(70,%«,%«) terminal 10 1 4 $mid(%ó,%l,%o) | if ($timer(starwar.shi).com = s.shi) set %x 0 | if %x = 50 { set %s.sp 0 | set %s.yd 0 | var %y 0 | %³ -ho 80 0 s.shi } | if (%s.yd = 0) drawpic -cnmts %c 0 $calc(200-2.7*%y) $calc(98+%y) $calc(20+%s.sp) $calc(10+%s.sp) %• | if (%s.max = 1) %» | else { %s.s %s.f %c 2 2 300 180 %cé 0 0 %s.x %s.y | drawdot %cé } | %¹ -mh 1 0 1
}
alias -l s.flo inc %s.flo 10.2 | %y¤ %s.flo %c
alias -l s.shi inc %y | set %s.sp 2 * %y | if (%y > 79) unset %s.yd %s.sp %y
on *:keydown:@star*:*:{ var %k $keyval | if %k = 37 { 2 | set %s.f -nm } | if %k = 39 { 2 | set %s.f -n } | if %k = 38 || %k = 40 { s.gle %k } }
alias -l 2 set %s.max %s.max * -1 | var %w window | if %s.max = 1 { %w -hn %cé | %w -wa %c } | else { %w -hn %c | %w -wa %cé }
menu @starwars* {
  dclick s.end
  rclick s.pau
  sclick s.mov $calc($mouse.dx -$window(%c).x) $calc($mouse.dy -$window(%c).y)
}
on *:close:@sta*:s.end
alias -l s.end .timerstarwar* off | var %w window -c | %w %c | %w %cé | %w %g | %w %gé | %w %ég | hfree ƒ | .remove %× | .remove %• | unset %- %× %• %a %b %c %cé %g %gé %ég %l %î %¹ %³ %y¤ %s.* %j %o %É %Ã %ó %» %æ %å %? %' %z+ %|*
alias -l s.mov if $window(%c) { window %c $calc($mouse.dx -$1) $calc($mouse.dy -$2) | if ($mouse.key & 1) { drawrect -rd %c $calc(155+100*$sin(%s.w1)) 2 0 0 317 186 2 2 | .timers.move -mho 1 0 s.mov $1- } | else drawrect -nrd %c 0 2 0 0 317 186 2 2 }
alias -l s.pau if %î = 1 { %¹ -p | %³ -p | %î = -1 | drawtext -r %c 255 terminal 10 273 175 [SMILE] } | else { %¹ -r | %³ -r | %î = 1 }
alias -l s.gle var %ù§ %y¤ 255,%o§ %y¤ 190 | if $1 = 38 { if %s.max = 1 { %o§ %c | %ù§ %cé } | if %s.max = -1 { %ù§ %c | %o§ %cé } } | else { %ù§ %c | %ù§ %cé }
alias -l s.log {
  var %¹ write -c,%½ bwrite,%¼ -1 -1,%¡ bset -t,%Ü %¡ &S 1,%º %¡ &X 1,%³ | %¹ %× | %¹ %• | %Ü iVBORw0KGgoAAAANSUhEUgAAAG4AAAArAQMAAACjAC9nAAAAB3RJTUUH0gwTAwUdCEkkMQAAAAlwSFlzAAALEgAACxIB0t1+/AAAAARnQU1BAACxjwv8YQUAAAAGUExURQAAAP///6XZn90AAAGoSURBVHjaTZK/jtQwEMY/r1fZLSw2pYuTNqe7kmJoULoMAonXsI7T6Yot9gFWii2aK3iAfRuMtqDhISJR0FCE7orVmpkEBFZizS+ezL/PAIqs7yV25QxZNsp2h0xYqbXSbw+KGMSqFO8RBPdivVDcTSgPnCnj9mcdqBtadTbR07omovYfekGvaJG9WH/RxKCoxxpKMnqqX3oJpYkQvJzcrv+UAXKC947mcuErT81hSXO5cAtPAUsiE7W9Z6tYUYv+jCyZPTEW9FocFcU5F0uv4owS6kuy1AwzSqKUEjWtoAxq3I4F5fOwmaf1/+pO5+5U0JWMTXlG/+PSfy2xF0d99w9VeIfIsCZLKNpV/A2ZgaR56WDzpwnfalVta/MTmHt8AK7gW5OeKHAYbiChvDdJ+mVurrXCq9qkWpGuY9C/YeuWmENQ1RyCpcea+zwEr4qFRfPoGSaTUz1D1ewEVzJDVXtfhcOaxc1ZxXHJcMyViKeKjU5xb8pFJmvj0WUs+TCpB5uO63Sp+P18iUw6+vRxwW8= | %³ = $decode(&S,mb)
  %½ %× %¼ &S | %Ü 4nSJzMn5ZKxUNd0aUza/iil93hZp6DdfDZUrvtVvAwAAAABJRU5ErkJggg== | %³ = $decode(&S,mb) | %½ %× %¼ &S | %º iVBORw0KGgoAAAANSUhEUgAAADkAAAAvBAMAAACruX8wAAAAB3RJTUUH0gwVBzggGKvXngAAAAlwSFlzAAAK8AAACvABQqw0mAAAAARnQU1BAACxjwv8YQUAAAAYUExURQAAAIuGhUVAP11ZW1pGQHFaU3RxciIfJXfD9a8AAAJJSURBVHjafdO9d5swEABwAX14NLYb1jiImBVzVBnrIuyObYrNDBZc14TnVv9+EV+Wm7xoEOj9dJI4HYT0zVyTt20+PA3GPlCKY+zuHUUY1PZe3qiLEG8c9bbC4o0CHtM0FUW7fymK/5W1us8wIiu3FMna9HQ1KttPEQVULHcTjivhXNVoBzNeYi3YglUUVgzDq5rdTsxFWroQUcYw11Z2VfyiQUEXLsS82ohth4v7trNU6Bl8eGonxD5LnuNObfihMqHeuM8hkH9FQsUfF7IoWBMbv7agTiAghSiQlxrYeYsAHBLfde+JQdUqGwHb8yWQ8AU9FAIgi9PDak7M7vCbLSkXkdckIBp5qICJNM3ZnDx1BxDqEr7LpolEuzvkqHQ7ZHIpVD/zAumhlA2LBSSP8DBkkvaTZlJeMq9Vz398uoDT67KY1M8CucGGM9G8DrcwVk0gmzRvu8rjJYDTq93nnFhB87gXvxv5QNHNIOp1DLVUaEhmDVmWbgwM5mOeu9I=
  %³ = $decode(&X,mb) | %½ %• %¼ &X | %º S+IjDhPrimbdF8FYKJDV++exhHmNfqv2GGoiVnk4Tm0OGLZqOmPVIp7OU8W9Hs7qVJtpYbg70XFghQynalfjmFXJVK0mYY6uFDCd1iGBQW+UsTq9/iUB2e40tQUef13nFiqBV3XF3X53VWIRXRlWmYZdGU9qtx/7U0Pjm66I9UEPtR1da0xzXa2dplZ82oe6fiaafvpyvDkTedGVn1LQ0Sg0tTnAzcL9xY0Kp5vQoZgGtUAUN7rWlWeCvNMGpXH4gQInH+hy/b7+AxiAg5n7ENMqAAAAAElFTkSuQmCC | %³ = $decode(&X,mb) | %½ %• %¼ &X
}
