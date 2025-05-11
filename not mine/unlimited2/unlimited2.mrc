alias -l end .timer.U* off | var %a 13,%b window -c | while %a { %b @u $+ %a | dec %a } | %b @U | unset %~ %| %@ %a %i %f %g %q %v %ñ %² %Ì %' %_ %+ %° %¤ | splay -m skip
on *:close:@u*:end
menu @u* {
  rclick:%° -p
  sclick:%° -r
}
on *:keydown:@u*:*:var %h $keychar | if %h < 10 && %h > 0 { %° off | var %a $r(1,9) | %| = $calc(600-50*%a) | %@ = $r(0,16777216) | %i = 0 | %v = %h | ø } | if (%h = -69) end
alias -l Ø inc %+ 2 | inc %' 2 | if %' = 40 { if (%_  > %¤) set %_ 0 | set %' 0 | inc %_ | $mid(%Ì,%_,1) } | drawscroll -n @u13 -2 0 20 0 670 40 | %v | inc %g | if (%g > 11) set %g 1 | drawcopy -n @u $+ %g 0 0 640 575 @U 0 0 | drawcopy -tn @u13 0 20 0 670 40 @U 0 $calc(240+220*$sin(%+).deg) 1340 80 | set %f $int(%f) | Ö | drawdot @U
alias -l 1 inc %i | var %n -.03 * %i,%a 130 * $sin(%n).deg,%b 130 * $cos(%n).deg,%x $calc(%a +300+160*$sin(%i).deg),%y $calc(%b +260+120*$cos(%i).deg) | %~ $+ %g %x %y | set %f .1 * %i | %q
alias -l 2 inc %i 4 | var %n -.01 * %i,%a 120 * $sin(%n).deg,%b $calc(80*$cos(%n).deg -4*%x),%x $calc((-20*$cos(%i).deg -5*$sin(%i).deg)+%a +240-20*$sin($calc(%a +%i)).deg +.2*%a),%y $calc((55*$sin(%i).deg) -2.5*%b +.1*%x +130+(.5*%x)+$cos(%i).deg *$sin($calc(4*%i)).deg) | %~ $+ %g %x %y | %~ $+ %g %y %x | set %f $calc(-1+.05*%i) | %q
alias -l 3 dec %i 1.23 | var %n -.012 * %i,%a -100 * $sin(%n).deg,%b $calc(-120*$cos(%x).deg +%a),%x $calc(-%b +340-200*$sin(%i).deg),%y $calc(%a -.02*%x +220-100*$cos($calc(-.005*%x)).deg *$cos(%i).deg) | %~ $+ %g %x %y | %~ $+ %g %y %x | set %f $calc(-1+(-.2/1.23)*%i) | %q
alias -l 4 inc %i .8 | var %n -.03 * %i,%a 80 * $sin(%n).deg,%b %a * $cos($calc(.1*%n)).deg,%x $calc(%b +300-150*$cos(%i).deg),%y $calc(%a +.1*%x +220+(.5*%x)*$sin(%i).deg *$cos($calc(.05*%n)).deg) | %~ $+ %g %x %y | set %f $calc((.1/.8)*%i) | %q
alias -l 5 inc %i .2 | var %n 5 * %i,%a 120 * $sin(%n).deg,%b -130 * $cos(%n).deg,%x $calc(-%b +320-120*$sin($calc(1.07*%i)).deg),%y $calc(%a +260-120*$cos($calc(2*%i)).deg) | %~ $+ %g %x %y | %~ $+ %g %y %x | set %f $calc(1+.8*%i) | %q
alias -l 6 inc %i | var %n -.1 * %i,%a 120 * $sin(%n).deg,%b $calc(80*$cos(%n).deg -4*%x),%x $calc((-20*$cos(%i).deg -5*$sin(%i).deg)+%a +240-20*$sin($calc(%a +%i)).deg +.2*%a),%y $calc((55*$sin(%i).deg)-2.5*%b +.1*%x +120+(.5*%x)+$cos(%i).deg *$sin($calc(4*%i)).deg) | %~ $+ %g %x %y | %~ $+ %g %y %x | set %f $calc(-2+.2*%i) | %q
alias -l 7 dec %i .009 | var %n -.18 * %i,%a -130 * $sin($calc(.01*%n)).deg,%x $calc(330-180*$cos($calc((-5*%a)+%i))),%y $calc(240-100*$sin($calc(2*%a +%i))) | %~ $+ %g %x %y | %~ $+ %g %y %x | set %f $calc(-2-(2/.09)*%i) | %q
alias -l 8 dec %i .7 | var %n 5 * %i,%a 100 * $cos(%i).deg,%b $calc(20*$cos(%a)-100*$sin($calc(.04*%i)).deg),%x $calc(300-200*$sin(%i).deg),%y $calc(.2*%b +250-180*$cos($calc(.05*%n)).deg) | %~ $+ %g %x %y | set %f $calc(-.12*%i) | %q
alias -l 9 inc %i | var %n -.1 * %i,%a -120 * $sin(%n).deg,%b $calc(80*$cos(%n).deg -2*%x),%x $calc((-20*$cos(%i).deg -5*$sin(%i).deg)+%b +240-20*$sin($calc(%a -%i)).deg +.2*%a),%y $calc((-55*$sin(%i).deg)-2.5*%a +.1*%x +130+(.5*%x)+$cos(%i).deg *$sin($calc(4*%i)).deg) | %~ $+ %g %x %y | %~ $+ %g %y %x | set %f .1 * %i | %q
alias -l « {
  var %t -1 -1,%6 write -c,%i $scriptdir,%j $+(",[ %i ],b.mid,"),%z $+(",[ %i ],p.png,"),%k bset -t &« 1,%3 bwrite,%l %3 %j %t,%4 %3 %z %t,%m %l &«,%2 %4 &«
  %6 %j
  %6 %z
  %k eJydW3tsW9d5P87Tid3EUijJkmzxyjTpS5pvkdKlTYpXEvWKZFt+LX4kgWRLttRYkifLsRw3UWU2VuYAtRAgK7YAewFZsAFdtaIJNqDYCgTNBqwolv6xRwIEAVKgA5b1nw5DgmHgvvP9zrm8l2bsbECRw/M753uc73W+c10dOjE7LYR4RGwRj2359NCJpReEaEmJyoPR44sLU8tTxuHFeCpjzC0Y5+euxA4tXroUNY5cjhvpnkTaiBmpuHF8avkl2p87tLgwfeX87MzcwhVJOXPQmJ5ZMoaXfnmBiIfnrl6am1kmfsNX586fn1qanjMuzlybm56fWRaVB5IDi9cvL81dnF02+meWFqaNsaWrMxeJfHZ5+fKBROLatWvxy3NTC4ux+bnpufj0jKhs8Y1fnb42d9F4cWqBiGaWZxdfnFkgvH1oZml57uLFmSvLM5cuLRtT80Y6G08l47mex2m5Y2JqYd8VY+rqBeP48tTCNKkit6SseCqes+SO9hMz85cXf7lA6l9duDizIJe7Us5y48nL03Q8JuqJW/FcTqINVVRySiYl+FQVTPdIFZIpCftKU1dnlg4Y3QeSaePQ3MLV5ZkFwk899NADO7eKyukHHhKicvTBxtWfi8ojO/qmpy7OLRrHF+k8tHWxPCnX+udW5NC4IIeGz+Z5ePd5Hl7L3TLk4m9urMmx4X9uMU3DD/Jrl+V4eRTjb76H9aH9N205fvClnvP41I33eWy8csGHYaWe5GlIZha+cz/VJHqcAM0EaCZAM+GieepZP/a+fWmd582fsbq+T17m0VHj41XeTzyBl/bw2PzZJONt/3GO9/n8rXm5/Ktdphw2j/PspR/xbKibh8Z/lGDjp9flrPEH
  %i = $Ü
  %m
  %k EZ698q88O/JtHjpbYIzXcpDauABpT34P0u5Mw0ilPVjvn8P+z+Yxnv1Cnwpa7XtM78f4xN9iXfGlddbz83d4+OEreRw9D5o8SPKwQx6MTZdz+ufgACWmyf8Lnjf99YcQf+6nWoz2LYyv1Xj7EscMyQfdn+L4NIex9b7+Od7XfOIa72v9+z59rAlsm4CKE2A6US8IbrkNoA3a+vgPaw3lCSnaj/knL2PfJy/7YKmbUanwvzdrGAZQByBDaLY+xUVu9/3hv9WDiZs+tkcZrYQk214V3vKXb3mEOjrqNFAhS2zYik3nPuD5ztNTvN4ytUP6sKVhr+TW/EGOh5ee5SH1oQ/n8uE4Jhj4cChfVQtSygehPteJPn/HxIF8cLcPNlWn9UE7H7zk8wSSJ+71kbQddeDI+faqKsR5+mv7H6ZW/qcE1ZGl5E+7aBQHaEppq5KYZyqlN4/zDOlOyc9GOHWSZ298zLOf886mbb9m4z39JgukgDPdvlOJSWXAW/1IX9sVEjqhm7614sm05rdU5p37APSO5VUKm54UNsEqj7OarhR2FNE1tHHBE5M60nWqEk+k5Ee/500gHYw1lWfnAz/WiiO1dcwPdXtLwpULnspGSiNhO35f84Pc1IdaL9MTqSaEKCObiFQTkWpCMdMTqSbsZbrspc7oFAdVxmizLme8rhNR67Jz8x943PU373nmlGKe6qDPrs9aG+0tsddR7aP9HO2kz0Tl65Zn5ds8bKjLKHzib/UWP11Gn/Uz/8gxpvrvdY7+n/0xz/7gj3j22+A/FOSh9SdQXGfRx6sQpAynK41TRfV1pYKLrivMVVRrZ7vKJhScrXiCi/Z75Orgooqmg2EFDr856445Zfdaf9G+
  %i = $Ü
  %m
  %k PLTMewLDexeargO4Sq4+cO1FBQWrHoYGt9/VB5wAmzzkT3jkT9STj9DQ+V0bChOeUJioFwrQ6KUfefJJ552OCR0jTv7pfbWVWJ2YbIoY/fINxLpyua4T2rW6ojfM/5hjuWHk+9zBBS7KYUflDg8fvcfDX/1CXSJgte3XcNeJa55S5LozRipcqbh2d7ZMI7TksRt2/TPEvfu8D4N7kVrN7ZVq8e9sURfGNBSfrjjFUt/YWjZF5ErFfbnkoUHexf3d5/M4OA9nv+Ah+SYPD/NlSwNz25E5iPE/h7WxEE7K67tGvr22s8I99FaXT3SX55D/DpR78nPYfscraKl3PPkv2E/GcONOC65wHQN0Y2HfR+95+Dvqnh6sz49ae56//Zw+BuY/u8oe0i8EMvuzsBN8M7R/BdQrsLsurq+qjtgTsI4QYsrzt7rVw4Bz3QkO1dmSTATPS8/ChP+0bWulWjHoiAhL5SXlM3hQ+VN7F+FG7RKMpDtBp4dDjf7VLm/JqzaamKt1fdFr/fQxZUdpu+hq718nD1VS6Ln2JXUpPNelUJdQynPtY0/Np3zOV9yVyFsJ7/UqgH7qpUJydS31nE/Ldd5JdJfxvjc+5pp36mS+4n41cR1zXk15cMhDgGobcd63wJeeT5irsHDuNHVluIoF9qkrp8l+UfsJ9ql552l/OZVepaK+onRll3HF+8JHQKcbsflHeL6z64Y3HhQf0oPjU98UurDX1lOS79VP92Wkx/bKV7/BeTj7hc+VzrVvHd0W6CM3ZTu0CVB9/uvPoZLCW5vy9U2iMlOOlytOg09eVNdQebzieswoan0p3/Xiokvbdq07zVY130D/d1t51Pnouhmhjb541JPYuYprGl3n
  %i = $Ü
  %m
  %k JaDonAtM8XP1Lh4HOHx1omorqAChAK89H/TVrzadmIq+4YMvtTdgfWUPHVC1AaR7IP3dxLFfVS7s+E3hDSRlB/0BxOm19A2nCpB+eeimtfZF4iSU+l5DBQz8qwUYctQloP3n1PFav2i+n173+kk1LHc1INpun82/Klz20efWialfvbrgaf/qczkPCG0HVRB0HDo95e13eb67G4VDFzLXg8gbBypOXP5nv5JcJLiip/NPVOp083VbOHUd+SrVAqJbUDov89WPjvs89syKu18xK+5+hWdnv+Ah+SZz1x2Jtm77xQ6P9aqPbfeNee9+SPHX0cj8ddmubdFlB+TOIueroYouEsxRoL2u9+moc/iqauFkT/UaAV91jThzlV06CogP03W8v+bh57xMGhfwGfHG+3weve5Exyc3vNH/+TvfOSXx6x1cO0mvFVey6WDdM43nPpXu78r1wELhdRPBKCoJgQ/nzYui0rlFiMqDjROjUwuLBj5pX5k5v7gwLX4ixOaj0+JxW5xdFRtW55phCVFoWzMKQtg02ELUB416YOD+5C0AO+qBdXcadcBcbM3IERgCGAIYAGgANACGGewl1r1C9FOX1U9gyAN2MGiFWFDev2bkCfQDVCfqAM8OzzHbGSxSd1wUopvAbiLvYPJiB4MZUiJDBG3uM9Q3nR9gK8DWemCzGyy2sYT+FujpBVvvD7bWIdcqeaV7Le+HkaGS4plrrwMqbx4kuoO1Lj7YBhBnz3Uy+cF2BpVmuQ6A2FlsZ7AuudV+f7Dlq8EeckcPga0esB1g2z1AuKOnzUPe5OGJnX009FVBHLOvFaC/Htjh5tnXDLCTwXw7B5jdDkEmdnZCeifAEIOFCByXYLA7zPFZ
  %i = $Ü
  %m
  %k CAAEeXeIwYMGk/e2cz50dwJsd4M9AbeeKvQzAQ5vDbYwqAQdDIDcAE8lyA9wF0A/gwfIPAeq5PVAr4IqwLSCbQDbAIYRLyGEd6geGHCDdpgtMUAVZYDABMAsQAtgAWDeA2YAxgH6AQYhKOARZNYDlUpBgJ31wKBHzxgEZSCoB6AFMAcwfw891TEDAMMelZR0eEyVLlUVtRth+b52DsWDHQBbAba6QRUaJQJLVRA1pNTGoEptBSrH6ertB4jy2xNG1IUgL4RQrAeqqFOVXXla1WRVs1QdTJH0FK21Yw2l655gG4OqiCswS7Msgc0Mdhuga3MfrO4x1U2iZoM0DBIYBtjpAYOwmcE2G6Zh2NlZCgAM/P9AlRaDIY/0CMAYg/k4rkEFhrEz4dkZYbCYQbykGSwlWV4x6wHTAC2AGYAZgDmAFkCLQbvA0VrK8WyUgn2UwAxASBhNMliMgTzs0dN09wVDZNYhIUYy2zbtV9aaNkbodBnc0pm1tk1bPLJBHEp9uU375Ysbeim7QismrxDfQ1sl7c6NKmETLW+TyySvvy++ad9YqtJCJ2qtbHpluYj4DqMHRz7r3kgBlBuvBSlyuimRNW0cAU01N8M1VxsDRhwlnhpJABFinHjafQD7GBxXO1HdlFdGSUXF1Mrgxi/chZDAMQKSAJMMEosCcctkAab1zi4Cu+gAGQ7/7gz6IhxOgcoU6nAqIBQ4mGEfKnCEBnJYpo+FFDLooKCVneRzKFCZQh1uNMPhocBxAsdrQak80Q30cEm0exAsFgeLKp6jvUww1MvgeAlcBhg8MrxmHHHAYzQcI63HofUIaz04xEcZO7xmjBE4zuDhY2vGYQInGDx6fM04SuBRBk+cWjNO
  %i = $Ü
  %m
  %k OOAz9Gh5hsApBg+f4S1Hj/Ha2BkmP3ycwZEzzHrsGIODZ1jsyDEG+88gNY4hW08hNo8xmH8G0XUUIXeSnZM/xGD3SdS0CQa7iKB7jBHybeq4M8sNo1YKkaSdSaIbQrkcYh/lhnjZGkCdHAAHMkh3CeQlsCcOEuwD2OfwPASewGXqSJ5F8OwFz15eS0vyIbdKaeIwXo/nYfCEAlYJPPvBExK6i7yWKnGtzxQRfL0cLxrsdYNd44h5CJEJ5EqEHEALYJ5BFcIqA7oSDHbHkCsmg5kwEgvvEnUdWGHMPC+fe4KgU62hAr0dhmUC9PRMemfIs9MLBtygLrpmPZWC7seY2qkEaRA7+/e6eap+SpErPb1gzsQ7IeDuaGpAA2W2HrlqztSsFETX8jVAww3qm9vPOaZBA6Bxf1CRd7pBOwBBAY90D6gCpT/uvmULPTA5usBSHrdsvt7VW++SVkW1ZOJyMHH1wqmlToCdDPaaaLwRGoNBVr4uqPUEqOxZA+JEOogQraWOeqDfDfZ1cvOpNNOgH6CHXHctJlqEOMAEwATALMAegFmASOb+PEDcToUYBAUhaK9HegBg4P56KnBXPT3jnpYrCbAHYA6g5QELHuWD7mP2hSAo5JGulIc71GvR6zitkgdUb6R+021PHckhz857gKpKKYOohPVmnALrF6t6oK514NJt4sWLg+kOKg4QZi2mURmyIIf7dQOWR12CrYs97hqiBQXcdamu9HwAN6wf0jsAtgHEgyQTRJ1Xn4Xw+coKumfqY5YG8Uay/R7Q+4kKYLHT/cDToOeB938G1aFVaJRi7qoxmkaDlfR0XXkGJ+imnCCwD+AwgyNjaFzG0LiMoXEZQuPSh7AponEpQJcc
  %i = $Ü
  %m
  %k Lg15b6ZxZSdwZSdgWrJnRPs841Qula9KMd0jQrFSAdoWoVgftB2AtqrlG/JoW4K2fdC2AG3z7qKhAkulbU4+pnDNKSPqr4WkY1oU0lpb3UQD0P1tEhHB56RQSSBccGwVyFacZ5m4XKP+JLa2PRPzpQQNwmdFsBhhwlSY+5coDdHqzOSZSYNJsxBmQZ4FQ+t2kMj9wvJTkK/bBX6yZKrQHeFAzmfnh/9Cf3Z+fEL+n6SNSzMXlms+NwcDIhW4I3sy4h8IiARNEvRLiM6wiIXX7Rj9EqIjJCKkQ4R+CWGESfV1m9Qz6H8BEQ3oSVBONMMo89wborOIZOiOSDK0l3eliAQyOwwRMTTnQFgkiDMU8EzMgMgQWzoemcMMiUxIT0IBkaYVajVDxN0USbM8mWQ5gbhIxMuTYLAnK+LZdTtOv2geEYmIwzpcniQ++4luvxCROJQJiEjAUUva5Q3FyMyKTLY8CeH786InX57soV80T4pMUq+wCIcmTUHm0PSInh6HJkxNpkMTFImgVstj2N0BEaZJmH6RRmERCdc12d6YSMbW7aQyMweNGuhAQXmmOyICuwsR7hSpTpHtvCOy3JUT94hJVXPdprygXfvioovsR13xPiKJixRN4LS9aRFNi2T6dcNx6t6kiCZFMsnGV37uEdEekephVyMaOuJk4PIkVPfHxP4YG92vguqOUEGVFdGsM4mLaNyZZEQ0U3/FM4mJaExPonFa/D7/orklopazLSGiCT1JRoQREdGItnmyNgfcIcHSnLCXulMeu8Nerotk3B320oJO2MedSFOB6oS9e2LGRCamI31fQHSR/+APM0i31rqtVoKiK+h4yhQp0/GUNIQOCqUHZ2Qq5HaLO6I8
  %i = $Ü
  %m
  %k 6R2UO99QzCIJqvHlSURHzBI5qzxJBZXME0mL7rReCUpbODRJ0Z10aHL0FHNo3CustGOciIhEtDr7YqIr9rqBs2XCOl0zNSG5zxRdpjbBXml6XQY89uiMi1hce9SQYVyexEk7ciKS06Hpca/X11RqpV1p2OvMDBqMu2e/S4lHSJuItomU32VvDbkCxqnaW9t01W5A1cY/Fl6YW7riKt5P2KvfXbLFeRp228K0V9c7bBGj4Ru26LJXyw9juMBrZQvDPlsM26u3T8vCX7Juzpbkk2OlxB/JCElbm7Q6uyFhtZqtrmaHafXWdbk6aKUIS9P0uY1BvW5V1/uzj26yqHLjBt29w2TjYbXNThDpatm0xaMbtrClwElW9fb8xkD85uyA/HeAlQG1eyDWtYklgtNYTVdXc6bklbZFhoYjOGO73NtvPbLJ5ijHNvrV7v4+yWv9GxIYsHYTtofWO+V2m4La1tuycbmNFe9P7AabWy8qNtLQAVsEpNiNYat6rpGi1OX2ivy0ycCQJcWR/CEFDFvKvESiKJlI8rw9KL9kjshvX7sl1YCLqijV2cJUiYcJ207TxIaWO8z2XH/SAQYzUsz6VscxA5bUbH0n2yUjOYT1+Xi9kMjJ9Uc3CrKVqdpNTsPy/M16Sr8tPsEoRQf1YqPWyqhiMlqIyMO9uMHwXat9e6SIDrk6UlBnLu+QBx4ttihP7NvQ28f6DktmxzaowxsbKU+OKXz8t5QtqB0c69tKmCFjW24btR6i6TdoetgWW4jTnQm2I0KjlyPs5gLkUrwcpiFvixwN1N7ZNGzjeJYz6dtv2qLbXv1OA4M3d9niDIEPMfk8eIWZeu20LSZolmCytWmAl20Rp8Fgc93aYYuI
  %i = $Ü
  %m
  %k vfraEwAf48OufYu5rM3YohfkRHfzKRZw81FseQwEbbYoErgFBCOQF7FFCYKK4KIIHrdXX32OZ+sLTL7+oC12EcFBW/hpoBrRCAtIi59FjWi2RQMNUSaQaSSHUdiql8ll/chhp6omkq6L6dZjtniKhgx7Y72JzXl70qkvVrWCyKqxenvRXV/cq7IYrIsNDQzqglKtMDIsbr0gS4csMjxVFcaViTbnWdncQEankB2Fm7OcdyvyvwVZvvaSLmOcVkX3WpFCVVrg1mW5NiIjlw/dzNE6Iqe7uW440TrGai3JMBy3AqowviCDlNeftlRBeZrYWYodFRRdKEaR4UOIq1lkUHlSs396WJrh9mmQlyerZDKnbr/i2v90SZ5rP6El1+5RTrg9sNw2bK+moyoyKuHYDPKfVXJsWaemsOfKCemKQSsC49H6oPTgE5vImQT82gQVyobjSDiKDCS/MQ3sgoGImv9RZ5fa3upys0xdMr9klzCVMjvUDeZwLYRlxSl3U2FSCpOEaPbmLF2n0exKVG2LZlXQMXz3qjq4azUvV6NFWU8ob28v8Vqva01RqoLnorSqq0WDVl8XvFqoL/UWc05lZcScpOnIRkqvpyXv9QZal8enfPqTY7arQxD9ukPIOn/gesDgv8udMQ4vxY1Uhv8qd/4r/yrX4RTXnDoHFi9fR6fxZ0Yql7OMc9e9f3Prokpoqj0z81Nzlw4Y5+TG+AvYaNf8Ra5DtkeTNak/33VtPL8479rZ4bRAg9Nzy3OLdDz9h7Jy1/8CgOQjTw==
  %i = $Ü
  %m
  %k eJxFVXk81M8b/yhqXVkki8i2krWSJVeuLDY2pZZF67bu7XRrkeS27kXuWEeOHOW+z0WukBIhV+4zIle//f71e17zPDPzPM/Ma57388xM6P17t9lZ+FkAAGDX0dbE0vtZOm+DTtNlyJj/LXp31lXnrtbZYWYeLnF25UGaO13F/Ez7oQsACLX+xwxPPrup0pWM9up31QGgLIr1yIoJABhC7+saaGEARTwYEwB3IYAwRBAWAyCJYDwUgNL9FUFICAAJgBNJUKILGKsIQLGAIhZA4QEMBAARwVgy3AUDxiABOAqAgwEgAEpEAVAkAIECEDwIQwBhoQAYBSBJUAIWQBLo/kgXPIAiQvAkCMEFjA+AEEhgPB5QdIEQyFAiBe5CQZJSkSQsBJuKClAE4AQoHg/BkhVJAUgXFyhBEQTAAbAiGECBASIIgwIUUzEBGADugiRgQCgk/XhgAAMGsFB8DpaMBwMEOOE9noICAQQw8J6YSgBjKIokIgRwgQAkCEDGkwlIAgqk6AInBkAAJEiRCAbI9MAAMAHAUKAAAUClQgEKKiAHCryHAnt7exVwoAIKNMABGhzYozciqp8uaRUbk5ML9AEe2QAFaAEADQXQCHT8FgDgKwDQAKCClkOf0plCBwkA6Imhm+mpRAEAEvgPajCd7gp1ZgEAl4SOprqB59haWihpGM1PG8FgzvhL/BWuTO1RvIigiNwZApicizLZU1AK7vC68u/OAaV36uoqX3iSHt/5ty04ASNKPtyO3ycJac957fYdKd+0K5InMDQ7DLZy+aHDOZvDy52ROCld1fhmpwu6NiNdGLttYVp3h4F6WnceV5HdMZp1uJx4tCZfKd5nqhv/fhbLXGSniPvg8p39
  %i = $Ü
  %2
  %k DtIomRxBKykqdWEvW16VTr573aHGuoAfXpD600Cd9k+rbceG3Z41+61T9rttfz0ta9d1xiL+2fyjPdXnkmrVBio2NvV7ZrZHV/jVI9YNWcSzzVQ+yVrPlQzy39lNKHvF5vTXIHprwYFRttZEM17F0qZgDBL3bVSar+Y+zhn9snAQQQtJzcRElA0Cp3v39W8UtSb45NbQXY0sobG4x+TzPPYRVooaWnblHA7m6IVVIVXamQ+yq2Q1dNsDqIluPKmIy4DuFa/fVYSUsH83ZH00WPMr9Qnt0hqp8630CZj9duCjGNwfhZQcJ0L2u1SU3X+7xVMGk3Z2YwdThIZdMguyyd5rmLgYtUTe6K2mwWeQmGtZn/JDbgeWF96uUYCsUTddZW5mFKdy0TaonF8Wn0zj1s9H6PEoU7Wje9jUHgNfvua1LKrQwWIaELvZH9jr67hhFEb2fa+iz8SSUBCxVefASF6/YDgPJ+WxnJcYCdkykPYViPAbnGgtULbdMHjln8N/ivbrlrRcCgC2hfJYFLvyNYWimxefWOHSh8TLORl0eLFb85crEWLCFaxto+2ai4rk+EIdlmGfy0yfVd6JN5ru23mx/PsL0+GxazdaoBzUJM89S569alO47xwzxWSgZxAIaVniSIlZflpmy45Jsliczw4bfy2SKzqtn0lm44iaiD1T1nV9JwpcoNCqDdaP28wH0yJ9NFpGeCesQ6hkZKr8k1iPe3F84gFlLlP3pyDqujRG1Td+nBOnXJ9TkL4R7xOqWnAj323nXBnZOWAdHdzDdac+P05YC4DmXnGsqI8wOFKcfOMYDTndbgBpQA6XyuQuyE9znu7vpYi8T/hHYjlJ5SRkQDg1n9B2jkSVrZuT
  %i = $Ü
  %2
  %k klKzR1i2n+Nk28kb/QAh1Tf7r8uRF3+ifvdTuajAQGjul5Ds2YKwXwPMfb8cNjT1+ATypZ1HRkPs1qVhB5Hb0rnzZuoQLwkJNiQVnRFDLeCczbfKrvF8s54V3dZB34J+MrsvizLbXkYOkkKVK/lPyRtYSzYsm+jsxoa1lKhzbEAqBpgIt1WyCuGTPTh+05XR1u1waVDF9hF06UXrovfy8B2a4VWywl7w4Re/NZHn4ixKaEhQ7Odbb8RErzpW+Hub3rsCzYS940a7Cv+4hv6SLyLiyujWDnl/2QedzQXNjGvPF1uFWEEwqF/cWW9is0e2Xy44V5MhZ2O3zM6SBUlOp2ilhAArMeYkvRBrDBdo6VH9rEv1M6QcqV+7ZJBwlBbH6bousByNFLuK/OBEHo9i9tZgIIz+bbtxxutUSVil5bdRpzJl7Xf63dvKm/tB1akY1VM9N4ZBvSgFpIxOz3haT74NyWg0Ulg1D/sGuP5kKtCv6yGsxiO6T2Zafeb3QblDQfTZ0OVdK4R/0dI8FwjBXENV/ydjg9d6dzbUnBraeMUVF1bD2CquJGr9CRlK3PJ82bhcZ33G+e4VLpjEzp0u8jmbZoU3RPGYY0W71/MiZVnzAtoO4pWInJSC7BXhJBjNYrbkGcVXst4jcEBn5q8m1mz6HWuN9snFBfuPOj228dtStR6Djfna5NzT6gNM0OAAzpUTqT4L37JI5tq4doF/H1Rkjw04jxUvAEqJSkp8WLSlnJczOzMsCmH7DgejqT9VkYd1HLeY94nKxivh7hSiESl5/OfRTz8kGka8k3e6DzmuzOkI8aQGBBR+z84JU9AfMrbtnOBHpvPTNCfjyw3W+inZslnpyf/VZZr9zSWp
  %i = $Ü
  %2
  %k VlOdBoRjvvceu4RrxpJIwSCi1JmdhRqqmgfApeRS5DLjiZaQu2clPXPjRgVskWMHmivCW/lHMWJ6kmqL/QLuxYbD/yoOyS3aN66gBaQjw/MOyerjQ9aalZ58XqZwMwvbs21d0xgGU8l0ztlbMkGvlsjKxZTiEpEAK5saLErgfHBPCFISpr1un6URtGJZzmq76imYHSLOpKYPil2V9G+DuNcp58XeMtMB/R338uegGUIPRXZlAoXL1pzemrjmxRJxXCGPUcTQaXWnWIq3b+59y/H50JT2ivR602seK7qe0Y8sc79dHZSn1mw4KfOM1A43bnOlxHSuxP1MGUStzRhxLgPaLrpPaAb1qqs8JG9evWTxezRKverr3lG3Kt3PxZLv0GQD2iavT1KXDwh2bt3sdY+2y5bn+z1fmLFxfQxqoAERCtlyCvJsH9VDhx3CPmnz7E3WSVsrm5DP792mxIivN3jYtntWQhzPJVbq8BNqkicPLWOl5VpdKoe76TfFHH1u7zagjqRIhdXNvJ4mBLStDQ+EvFZ2I1dHaR4POD3oBLXdjx19OvQqLIXz7PfKc0ObMlzU56KQ/xuc2hXKyXYIOdiuxkmkES104xlyInhfwijM8cCi5QIhVSNwlY9ah+Lu8SIkJxTC5Wb3ihbZZ/cMOZgOoyHvL4nQ3taN8TURmFgGvZDBbTkd7pMKauNGq1srHGqMK3Cqy4+PEI3Ddicjk2M7NcjanvyoNW6pWm3I5iiBR0zTvmPa9hVAvbf87dXgkeSk6utm7bObd2sDZtDGiSyw2HBSIIyLmhiOJW66WbJ7lx3epDGj7I6ChBwk13kiQYVcTDUhI0GTD7zLVlCnIOiiTB3hlzL8NIW2htYH
  %i = $Ü
  %2
  %k +0u2pZfuhuRH3v9Ruq3F6eOjRLjYDkFcnP41LgG9DI+5cUKKUGd0iBeDKRxzCsXBmKw22IbTZs9JGicHpaU4/mFO5lwhTYSQ2Y+KrRY4ggc+qTLrnsnq6dLmrQ1BMnqTHxyyggScdbf51dcOk0VxczLO2ads4BsBVBOywcvwgS7nluy+kJ7JE/HxjGFZdJCwHLXKY05LlFo3KyV1shyZNG7BOnUk0O7UEOgBmpbB4swsHxU21x5pLbPB5ELWlk8R2IjsoZwKREGmQefGM+TUGH/QGBs+5hnfUlYkn06Gmx9IBAGNjyHadHG59WrvF7UVb/M6W4L/Nkh2U2HEiFC+EqwwdSmIEsMW2i1XRAZvL2TAzWPuC/kW3hEnCxoTN8lHNdUQpXQPNk6Y40FLssemoFyaDNYMrs0vlOR4EsCewWnR+/DS38NmKfnRYVrXfhHsMe1S2bTMTHicNNdly7kC7qttX96IwjKetI8K0i6V/mep6+/Sv3ovsDBa4fjtgFIp2XsjECbar1TbMjpdD4PDvCZjVAkvWo47exx+h+zdLkAESixLWpPVzNFj8jbkrcloTthAlpxCxIZD811+614lrHV7pRI77YzjEDjJF7wg2P4a+lUmbY6s2X5GsqzPoVIR6Y1O0Didf4MmI/ir/rXjuRYdMAJTBfHSRTyRWhDM84sBH5HZNJUJKfA2exETjdpP2h45pT7wCWubCmI7JDzG8XqrtHO/0osOyJTZ+ZMhmYuwvfrXrV1VDljwFRaYj3fUtdsTWn3rbMvWfUoSrdjuA46BLsiUPKiDPT0sToqW5AGeoT8S5eG1CohVyDCge2EgI6NRqoQiu+sCTPbY53Xm/AZSEZCf8dxf9YCil38Q
  %i = $Ü
  %2
  %k f/5NNhm16PklVK0tBB3jye6NlTPz4f2QjUurG+Zm4ov4nKwE3gtzoTideAOcgWSUo//lT9a4h+Kexs2PS8cxFAZGtsztLl9A+HCro9sEcvXq1c7o7XfctAqUFcqCk6nC19O45FtGid4js4wpvGlqtbuP3d9W3YbGevNbD/0jnVM4on1FZPyl9Mm+3is0Ad7th49or/2Lv7FRxZe4ub8lFKuOjo5OTAWn1TU1lT3fXX6d09qu+Zj5McIz0N5yh9pk8YO+TqZRUVHV9/iyanZpSQkkLLbE6XuRGDxMuimLlyWahLOosRGLvaxj7c7Xts2iIoskry3AFle9jwbGqxzUxgS9dnbMlWlmDbnaWWKFsWLzEXdqzY1NAgMKEbVP5n7LWbtLrA/G4Ot9x2n7Q9befxQuZG8C7rB2sU+4B8o/Es63Sf3MJEK8ulG8hcm5BeGPv/UZxRCu4dd3RxDg1BK/ajX4fU3K1gMJmpvnrX67jylJujX1ZzVwsjxCVclFkl0kEitpfsY8V0hRdDyqobLt/EsV9n/8N58yPx+ajOi8MDP4MS9qxjX7bTgOl4CQn1s21Qq6bmos8ykYfc4Po2iUbPCreeYKTvOAIeAgsC/EVE+D1zbd11tQy/tv61JnsIe1VFhy9qeUpL2Ejh+Rsot/2aT7xZ41G33vnReFru732l5RV7v8bbjS1/VlXnR6/XOGf7u7TXo/EJGBkMSt0lz7puhwDsOqQC23vEaZpoJVQcknhu4FKR/cxXDLux0RI+f6bx+N+nmmdbjPdncLpGz3GVm85BFu1djdopI81ObtvySwWldethipCsdBPyY9/BK/TTbof2QYnpJSUP0wpsK//196Dl9J1NQtbcTJ1kBV
  %i = $Ü
  %2
  %k 57msjv2dJViXZ3jG818zsSKfttHqydj3BLfGyjSlq60EN3tuv+fPJY0KSlbUmyrS9DJ9oX/sV3vyO0Ec9z2FxoId/RzcZttI9Ki/Xi8OjZVQux6SxMfe+KwFLIhusZKIX77zwvPzDNPSC+bNKtKkxpdw3pKoKD1vFCOn+2xbnccTn/a+d96VIvM4N48+cESPiYkJd6znYaiCqqoqNSIqg1smLk4mEB+AXATbXGTd3Gu6Ry/6nm+d6sZGX65f08wTICD5vwnN8eAmLOR/Wj4x7F7IWZ2srBZutYqilOT7xxqJnmeDxZ6WEb2txKaWats52AMMXfbemk+UnKGS9tZ/1HQPGDdsKpcYzC+sEHj4JsUqHuukjOffu2s7N2NajE1L71kbJWeviEpb6dZcijKv9/479Os3s5lmnQBBqsBIjlJfu+dtdkqv3VTSCNLzS/Sjvr5+lpuq4bTlz9DiTbs7spGR5sYUubcaDmnhktbKNA4PnpzazXrh+PSQHNP1sTe/pA0BhX8MNsp5C4et+73+rvsXUZ7DIPCslO8zHw/b+Y3loYByxcJ8/9IbhYZ2uLv5EfnBJh9Z45MOnO8us84SUla6TpffHFQvj/xiTF7e9THjrSDWGl8onO/LZy6LHWR8+O6XbQUeF15Qb8x92ApKF2La6r3JfUmpYVF4cq4fZqCqaFzBV9WiyOPta7s35u2DDtzrfLFFi7jbV6vGb7ETvLU1bD/gfWs0+EJmMIQq8Epqt/tV8Z2x2A6x102TagqjxgLjpy/M/jBFpyFeCWqsccxOCWlIC2zkDwfLzaQpXeq0rT9ZODwoEDF/rxMn863kqOPE8yria4apqbmpqWn6VO2H3e8Hh8dWjBzQ74RL
  %i = $Ü
  %2
  %k ny+7SsobbsJOWa399FVPtCMGxSbSRI5vNWWLObu7G366E/b8u7GZmYmJxQb37ERw9OoWjL5mhw7WV7n1kmUsLuZcVVXh2Mzpiej2D0VOyaL4TLGgrB3HSQbohorrrHmIVH+MU0T9P9f7xvEGbrUGyUVz7ixBxrieJNP8GwSxKhncvvOVjDXe2TyP9UmXmXWzAClz+VPTf64eHuDNe34V2TNYOiMRiTJJ0vXFreMzO9UOEQySexGcP/wtPTZu+jFYKWt6buzPFpuPfi2IW+gfCVfaTeJP1Q1jjVsQXVjIyRKeaFRRIexEcf4oF5vO2Zk1EbOS0OzaP1lnUTb86C+G0eK8J6t5N4ERh1u4vrBnkA/S61P9AwMuTdR7Ic7Lz15u/b31KSjz6XUbGX39eOt8Skpi+49IucSeawKbxvHS+vJzf1UjXJ5RtpgF0Tmiks0P9iMwnI3AQleODru5ywXoarXrLC3VNGUNAcsul3qKH2SA2lCgVCwuR1cU1vb9fPVbMSPV1Kmxg2dLy0Nfg7/91P5ZOznl64pcW3SwUE8xjqVwhCUn8Hzkwemza9SYplgEyp/s7qoV6S1KUU7o/zSrldVznV6jHme7F3ixe/a5CcQwnwV5cvwYy8XfzV0cStRnZdHxBg8/bEQ9i1TORNg+TE9OT0/qsxPt6N0xtfVd5JsiTR2sPn90cXJ1/vdC51VJMb6RA/C2CjxFYMCE4Id6qbqife2Eo9+GnSXsDfQYoJOO1j3NYpSl//8ASZiWLw==
  %i = $Ü
  %2
  var %a $decompress(%j),%a $decompress(%z),%e splay %j
  .timer.Us 0 365 %e
  %e
  drawpic -n @u12 0 0 %z
}
alias -l Ü return $decode(&«,mb)
alias -l Ö {
  var %ç $len(%f),%t 1,%- 560 16 10,%} 217 8 5,%¶ drawcopy -tn @u12 0
  while %t <= %ç { %¶ $calc(37+8*$mid(%f,%t,1)) 217 8 5 @U $calc(508+17*%t) %- | inc %t }
  %¶ $calc(37+8*%v) %} @U 187 %-
}
alias -l a %ñ 0 0 %²
alias -l b %ñ 38 0 %²
alias -l c %ñ 76 0 %²
alias -l d %ñ 114 0 %²
alias -l e %ñ 152 0 %²
alias -l f %ñ 190 0 %²
alias -l g %ñ 0 41 %²
alias -l h %ñ 38 41 %²
alias -l i %ñ 76 41 %²
alias -l j %ñ 114 41 %²
alias -l k %ñ 152 41 %²
alias -l l %ñ 190 41 %²
alias -l m %ñ 0 82 %²
alias -l n %ñ 38 82 %²
alias -l o %ñ 76 82 %²
alias -l p %ñ 114 82 %²
alias -l q %ñ 152 82 %²
alias -l r %ñ 190 82 %²
alias -l s %ñ 0 123 %²
alias -l t %ñ 38 123 %²
alias -l u %ñ 76 123 %²
alias -l v %ñ 114 123 %²
alias -l w %ñ 152 123 %²
alias -l ¨ %ñ 190 123 %²
alias -l y %ñ 0 164 %²
alias -l z %ñ 38 164 %²
alias -l < %ñ 76 164 %²
alias -l > %ñ 114 164 %²
alias -l ? %ñ 152 164 %²
alias -l § %ñ 190 164 %²
on *:load:$iif($version < 6.1,.unload -rs $script,editbox -a /unlimited)
alias unlimited {
  if ($window(@U)) halt
  echo -a Get ready!
  %g = 1
  %v = 1
  %° = .timer.U
  %q = %° -mho 1 0 Ø
  %| = 550
  %@ = 14344356
  %² = 37 40 @u13 650 0
  ; craptext!
  %Ì = ahhyyyaaaa????? hawkee ok lets talk big haha? ego mode enable¨ da ultra leet <stanz> prazant with his huge modesty another intro§ <unlimited>¨¨¨¨ you can change the animations since your keyboard § use the numeric pad¨ esc quit the demo ¨¨¨ there is also a break mode since the fat buttons of your small mouse¨ you listening the mega classic <beethoven§ clair de lune> enjoy da muzak? greetings§ <kenji> i looooove you????? <bigbezus> ou que tu sois§ big up? <token> yo buritos hahaha?? <visionz> crack to beat this? <epsilon> arcade is life¨ <betel> at least bin to mrc is good for me¨ <bombstrike> ou es §§tu§§ gniarf? <saks> poor freak §p <zerg> kor ppt faker? hop scroll wrapp?? §cya all $str(¨,25) still here? lmah???? ¨ ¨ ¨ ¨ ¨ ¨ ¨
  %¤ = $len(%Ì)  
  var %a 13,%j window,%b %j -pCdoBhnk +tL,%p 0 0,%c %p 700 600,%f drawcopy
  %ñ = %f -n @u12
  %~ = %f -nt @u12 0 154 205 33 33 @u
  while %a { %b @u $+ %a %c | drawrect -nfr @u $+ %a $iif(%a = 13,0,1) 0 %c | %b @u $+ %a %p %p | dec %a }
  «
  %b @U %p 640 600
  ø
  titlebar @U N L I M I T E D
  %j -a @U
}
alias -l ø {
  var %a 11,%b 11,%m 308,%s drawcopy -nt @u12 0,%} drawdot -irn @u, %o, %i
  while %a { drawrect -nfr @u $+ %a 0 0 0 0 640 600 | drawtext -nr @u $+ %a 255 impact 33 -2 -7 YOU ARE ADDICTED TO HTTP://WWW.HAWKEE.COM | dec %a }
  while %m { inc %o | if (%o > 11) set %o 1 | dec %i 1.2 | var %x $calc(320-400*$sin(%i).deg),%y $calc(300-300*$cos($calc(.01*%i)).deg *$cos(%i).deg) | %} $+ %o %@ %| %x %y | %} $+ %o $calc(55500+%@) %| %y %x | dec %m }
  while %b { %s 38 205 90 5 @u $+ %b 10 560 180 10 | %s 38 211 110 5 @u $+ %b 320 560 220 10 | dec %b }
  %i = 0
  Ø
}
; no X bitmap fonte ;\ slap me
