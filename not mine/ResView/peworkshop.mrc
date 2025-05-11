; PE Workshop v1.1.2
;
menu status,menubar,channel {
  PE Workshop
  .Launch { peworkshop }
}

; tab, this is the only alias that I didn't write... (took it from DixrouE's mdx tutorial (www.scriptsdb.org))
alias -l tab { if (!$1) return $chr(9) | var %t,%w = 1 | while ($eval($+($,%w),2)) { %t = $instok(%t,$($+($,%w),2),0,9) | inc %w } | return %t }

alias -l High_Byte return $mid($1-,1,2)
alias -l High_Word return $mid($1-,1,4)
alias -l High_DWord return $mid($1-,1,8)
alias -l Low_Byte return $mid($1-,$calc($len($1-) - 1))
alias -l Low_Word return $mid($1-,$calc($len($1-) - 3))
alias -l Low_DWord return $mid($1-,$calc($len($1-) - 7))
alias -l mdx.dll return $shortfn($+($scriptdirdll\,mdx.dll))
alias -l views.dll return $shortfn($+($scriptdirdll\,views.mdx))
alias -l icons return $+(",$scriptdiricons\,$1-,")
alias -l g return $hget(dbpe,$1-)
alias -l s hadd dbpe $1 $2-
alias -l const return $hget(const,$1-)

alias -l backupdir return $+(",$scriptdir\project\,$1-,")
alias -l noext return $remove($1-,$+(.,$gettok($1-,-1,46)))
alias -l ppath return $+(",$scriptdir\project\,$nopath($g(file)),\,$1-,")

; ################################################################################
; $section(addresse de départ).name
; $section(addresse de départ).vsize
; $section(addresse de départ).voffset
; $section(addresse de départ).rawsize
; $section(addresse de départ).rawoffset
; $section(addresse de départ).char
alias -l section {
  ; les positions (relatif a $1) et size 
  var %name = 0 8, %vsize = 8 4, %voffset = 12 4, %rawsize = 16 4, %rawoffset = 20 4, %char = 36 4
  var %coor = $eval($+(%,$prop),2), %address = $gettok(%coor,1,32), %size = $gettok(%coor,2,32), %r, %realname, %add
  %realname = $binread($g(file),$1,8).text
  if (ERROR_ isin %realname) return
  %add = $calc($1 + %address)
  var %toaddd = $binread($g(file),%add,%size).text
  var %toaddd2 = $binread($g(file),%add,%size).endianhex
  if (ERROR_ isin %toaddd) return
  if (ERROR_ isin %toaddd2) return
  %r = $iif($prop == name,%toaddd, %toaddd2)
  var %prop = $iif($prop != name,$prop)
  ; save ça, sous forme .section.prop (.rsrc.rawoffset mettons)
  s $+(%realname,.,%prop) $_dec(%r)
  return %r
}

; ################################################################################
; trouve laddresse de départ d'la section de départ
alias -l findsection {
  var %i = $g(coff), %t = $lof($g(file)), %r, %ascii
  s compressed $false

  var %ascii = $binread($g(file),$calc(%i - 16),6).text
  if (ERROR_ isin %ascii) return -1
  if (%ascii == Richa6) s compressed cexe (sxe6b)

  while (%i < %t) {
    %ascii = $binread($g(file),%i,4).text
    if (ERROR_ isin %ascii) return -1
    if (%ascii == .tex || %ascii == CODE || %ascii = DGRO || %ASCII == .BSS || %ascii == .rsr || %ascii == .rel) {
      %r = %i
      %i = %t
    }

    if (%ascii == UPX0) s compressed UPX

    inc %i
  }

  return %r
}

; ################################################################################
alias -l loadconfig {
  var %i = 1, %t = $findfile($+(",$scriptdir\data\,"),*.const,0), %name
  db2hash dbpe $shortfn($scriptdir\data\config)
  db2hash const $shortfn($scriptdir\data\const)
}

; ################################################################################
alias peworkshop {
  if ($dialog(dpeworkshop)) { 
    if ($?!="Another instance of PE Workshop is already running, shut it down?") {
      die 
      loadconfig
      dialog -m dpeworkshop dpeworkshop 
    }
  } 
  else { 
    loadconfig
    dialog -m dpeworkshop dpeworkshop
  }
}

; ################################################################################
alias -l pe.about {
  if ($dialog(dabout)) dialog -x dabout
  dialog -m dabout dabout
}

; ################################################################################
dialog dabout {
  title "About"
  size -1 -1 271 178
  option pixels
  icon 1, 7 9 257 42, $icons(logo.bmp)
  text "Scripted by visionz (g_baril@sympatico.ca)", 2, 6 62 259 19
  text "Many thanx to everyone on #scriptsdb.org, on undernet. www.scriptsdb.org, supports us! With this script, you can fuck off your executables files if you don't know what you are doing, so please be carefull!", 3, 6 85 259 59
  button "Okay", 4, 190 148 75 25,ok cancel
}

; ################################################################################
dialog dpeworkshop {
  title "PE Workshop"
  size -1 -1 630 319
  option pixels

  tab "Exe header", 1, 4 12 621 303
  tab "Coff header", 2
  tab "Optional header", 3
  tab "Section header", 4
  ;  tab "Import/export table", 6
  tab "Resources",5
  ; exe header
  list 7, 10 40 609 261, tab 1 size extsel
  ; coff
  list 8, 10 40 609 261, tab 2 size extsel
  ; optional
  list 9, 10 40 609 261, tab 3 size extsel
  ; section 
  list 10,10 40 609 261, tab 4 size extsel
  list 11, 10 40 150 261, tab 5 size
  edit "",12, 160 40 459 261, tab 5 multi hsbar vsbar hide

  icon 666,160 40 459 261,$shortfn($scriptdir\icons\logo.bmp),tab 5 hide

  button "",999,340 150 80 30,tab 5 hide

  menu "&File", 100
  item "&Open file",101,100
  item break,103,100
  item "&Save",103,100
  ; item "S&ave as...",104,100
  item break,105,100
  item "Save log",110,100
  item break,107,100
  item "&Quit",108,100

  menu "&Config",600
  item "&Edit config file",601,600

  ; menu "&Resources",700
  ; item "Save resource binary data",701
  ; item "Save resource in .res format",702
  ; item "Save decompiled resource",703

  menu "&Help",800
  item "&About",801,800
}

; ################################################################################
; ouvre un fichier a explorer/modifier
alias -l OpenFile {
  s file $1-
  s coff $getcoffaddress
  if ($g(coff) < 1) {
    errorbox This is not a valid PE file
    s file 0
  }
  else {
    if ($window(@peloading)) window -c @peloading
    window -BCdp +d @peloading 0 0 300 150
    drawrect -rf @peloading $rgb(face) 1 0 0 300 150
    drawrect -r @peloading $rgb(0) 1 0 0 300 150
    drawrect -r @peloading $rgb(0) 1 10 135 280 10
    drawtext -r @peloading $rgb(0) tahoma 10 10 5 $g(file) is a valid PE file
    mkdir $+(",$scriptdir\project\ $+ $nopath($g(file)),")
    drawtext -r @peloading $rgb(0) tahoma 10 10 17 Loading PE Header...
    pe.header 7 exe
    drawtext -r @peloading $rgb(0) tahoma 10 190 17 done!
    drawtext -r @peloading $rgb(0) tahoma 10 10 29 Loading coff header...
    pe.header 8 coff
    drawtext -r @peloading $rgb(0) tahoma 10 190 29 done!
    drawtext -r @peloading $rgb(0) tahoma 10 10 41 Loading optional header...
    pe.header 9 optional
    drawtext -r @peloading $rgb(0) tahoma 10 190 41 done!
    drawtext -r @peloading $rgb(0) tahoma 10 10 53 Loading sections...
    var %i = 1, %t = $g(nbrsection), %s = $findsection, %cur
    if (%s < 0) return
    drawrect -rf @peloading $rgb(face) 1 10 135 280 10
    drawrect -r @peloading $rgb(0) 1 10 135 280 10
    var %lastline = 10, %poss
    while (%i <= %t) {
      %poss = $calc((%i / %t) * 280)
      drawrect -rf @peloading $rgb(face) 1 190 53 50 20
      drawtext -r @peloading $rgb(0) tahoma 10 190 53 $round($calc((%poss / 280) * 100),1) $+ %
      drawrect -rf @peloading $rgb(0) 1 %lastline 135 $abs($calc(%poss - %lastline)) 10
      %cur = $calc(%s + ((%i - 1) * 40))
      did -a dpeworkshop 10 0 0 $tab(0 0 $section(%cur).name,0 0 0 $section(%cur).vsize,0 0 0 $section(%cur).voffset, 0 0 0 $section(%cur).rawsize, 0 0 0 $section(%cur).rawoffset, 0 0 0 $section(%cur).char)
      inc %i
    }
    drawrect -rf @peloading $rgb(face) 1 190 53 50 20

    drawrect -rf @peloading $rgb(0) 1 10 135 280 10

    drawtext -r @peloading $rgb(0) tahoma 10 190 53 done!
    drawtext -r @peloading $rgb(0) tahoma 10 10 65 Loading ressources...
    pe.ressource
    drawtext -r @peloading $rgb(0) tahoma 10 190 65 done!
    window -c @peloading
  }
}

; ###########################################################
; affiche une messagebox d'erreur
alias -l errorbox {
  var %a = $input($1-,ow,error,a,b)

}

; ###########################################################
on *:dialog:dpeworkshop:sclick:*:{
  if ($did > 6 && $did < 10) {
    var %comm = $did($dname,$did,1)
    if ($gettok(%comm,1,32) == beginlabeledit) {
      set %pe.labeledit $gettok(%comm,3,32)
      set %pe.t $did($dname,$did,%pe.labeledit)
    }
    if ($gettok(%comm,1,32) == cancellabeledit) {
      unset %pe.labeledit
    }
    if ($gettok(%comm,1,32) == endlabeledit) {
      var %col2 = $gettok($gettok(%pe.t,2,9),4-,32), %col3 = $gettok($gettok(%pe.t,3,9),4-,32), %new = $gettok(%comm,3-,32)
      did -d $dname $did %pe.labeledit
      did -i $dname $did %pe.labeledit 0 0 $tab(0 0 %new,0 0 %col2,0 0 %col3)
      unset %pe.*
    }
  }
  if ($did == 11) {
    var %com = $did(dpeworkshop,11,1)
    var %info = $g($+(id:,$gettok(%com,4,32),.,$gettok(%com,5,32)))
    AfficherRessource %info $gettok(%com,4,32) $gettok(%com,5,32)
  }
  if ($did == 999) {
    var %type = $did(dpeworkshop,999)
    if (%type == Play Wave) { splay $g(FileToPlay) }
    if (%type == Play AVI) { run $g(FileToPlay) }
  }
}

; ################################################################################
; icon visible
alias -l showpic { did -h dpeworkshop 12 | did -h dpeworkshop 999 | did -v dpeworkshop 666 }
alias -l showedit { did -h dpeworkshop 666 | did -h dpeworkshop 999 | did -v dpeworkshop 12 | did -r dpeworkshop 12 }
alias -l showbutton { did -h dpeworkshop 12 | did -h dpeworkshop 666 | did -v dpeworkshop 999 | did -ra dpeworkshop 999 $1- }

; ################################################################################
; offset, size, type (bitmap,cursor,dialog...),root,sub
alias -l AfficherRessource {
  var %file = $+($3,$4,.,$5), %size = $2, %offset = $1
  if (!$4) return -1
  if ($g(compressed)) {
    errorbox This file is compressed using $g(compressed) $crlf $+ Uncompress it and try again
    if ($g(compressed) == cexe (sxe6b)) goto con
    return -1
    :con
  }
  if ($3 == bitmap) {
    var %file = $+(%file,.bmp)
    var %header = 66 77 $bigendian($base($calc(%size + 14),10,16,8)) 00 00 00 00 $bigendian($base($calc((%size + 14) - $_dec($binread($g(file),$calc(%offset + 20),4).endianhex)),10,16,8))
    write -c $ppath(%file)
    bset &header 1 %header
    bwrite $ppath(%file) 0 14 &header
    SaveRessource $1 $2 $ppath(%file)
    showpic 
    did -g dpeworkshop 666 $ppath(%file)
  }
  elseif ($3 == dialog) {
    var %file = $+(%file,.txt)
    write -c $ppath(%file)
    showedit
    did -ra dpeworkshop 12 Please wait...
    MakeDialogTable %offset %size $ppath(%file)
    loadbuf -o $+ $lines($ppath(%file)) dpeworkshop 12 $ppath(%file)

  }
  elseif ($3 == string_table) {
    var %file = $+(%file,.txt)
    write -c $ppath(%file)
    showedit
    showedit
    did -ra dpeworkshop 12 Please wait...
    did -r dpeworkshop 12
    var %j = $1, %i = $1 , %str

    if ($5 == 2) inc %j 8

    while (%j < $calc($1 + $2)) {
      if ($binread($g(file),%j,1) == 0) {
        inc %j 1
      }
      else {
        %i = %j
        %j = $calc($1 + $2 + 10)
      }

    }
    while (%i < $calc($1 + $2)) {
      var %size = $_dec($binread($g(file),%i,2).endianhex)
      inc %i 2
      %str = $+(",$readunicodeasciiz(%i,$g(file)).fp,")
      if (%size == 0) {
        %i = $calc($1 + $2 + 10)
      }
      else {
        write $ppath(%file) $replace(%str,$chr(13),\l,$chr(10),\n)
        %i = $fp

      }
    }
    loadbuf -o $+ $lines($ppath(%file)) dpeworkshop 12 $ppath(%file)
  }
  elseif ($3 == icon) {
    var %w = $_Dec($binread($g(file),$calc($1 + 4),4).endianhex), %h = $_Dec($binread($g(file),$calc($1 + 8),4).endianhex), %size = $bigendian($endian($2).hex)
    var %header = 0 0 1 0 1 0 %w %h 0 0 1 0 4 0 %size 0 0 22 0 0 0
    var %file = $+(%file,.ico)
    write -c $ppath(%file)
    bset &header 1 %header
    bwrite $ppath(%file) 0 22 &header
    showpic
    saveressource $1 $2 $ppath(%file)
    did -g dpeworkshop 666 $ppath(%file)
  }
  elseif ($3 == cursor) {
    var %header = 0 0 2 0 1 0 32 32 0 0 5 0 0 0 $bigendian($base($calc($2 - 4),10,16)) 0 0 22 0 0 0 
    var %file = $+(%file,.ico)
    write -c $ppath(%file)
    bset &header 1 %header
    bwrite $ppath(%file) 0 22 &header
    showpic
    saveressource $calc($1 + 4) $calc($2 - 4) $ppath(%file)
    did -g dpeworkshop 666 $ppath(%file)
  }
  elseif ($4) {
    var %riff = $binread($g(file),$1,4).text, %file
    var %type = $binread($g(file),$calc($1 + 8),3).text

    if (%riff == RIFF) {
      if (%type == WAV) showbutton Play Wave
      if (%type == AVI) showbutton Play AVI
      %file = $ppath($+(%file,.,%type))
      s FileToPlay %file
      write -c %file
      saveressource $1 $2 %file
      return
    }

    %file = $ppath($+(%file,.txt))
    write -c %file
    showedit
    showedit
    did -ra dpeworkshop 12 Please wait...

    saveressource $1 $2 %file

    did -r dpeworkshop 12

    ; si cest un fichier texte on le montre en texte...
    if ($IsFileAlphaNum(%file)) {
      loadbuf -o $+ $lines(%file) dpeworkshop 12 %file
    }
    else {
      ; si cest un fichier binaire, on montre un dump hexadécimal
      var %old.fp = $fp
      fp.set 0
      var %ww = 12, %t = $lof(%file)
      if ($lof(%file) > 7000) { %t = 7000 }
      while ($fp <= %t) {
        var %hex = $binread(%file,$fp,%ww,%ww).hex
        if (ERROR_ isin %hex) return
        var %i = 1, %ascii
        while (%i <= %ww) {
          var %cur = $base($gettok(%hex,%i,32),16,10)
          if ((%cur < 20) || (%cur == 32)) %cur = 46
          %ascii = $+(%ascii,$chr(%cur))
          inc %i
        }
        did -a dpeworkshop 12 %hex $str($chr(160),$calc(((%ww - $numtok(%hex,32)) * 3) - 1)) %ascii $crlf 

      }
      if (%t != $lof(%file)) {
        did -a dpeworkshop 12 $crlf Hex dump stopped at %t bytes ( $+ $round($calc((%t / $lof(%file)) * 100),1) $+ % dumped $+ )
      }
      fp.set %old.fp
    }
  }
}

; ################################################################################
; file
alias -l IsFileAlphaNum {
  if ($isfile($1-)) {
    var %lof = $lof($1-), %r, %i = 0, %t = $iif(128 > %lof,%lof,127), %str = $binread($1-,0,%t).text
    while (%i < %t) {
      if ($mid(%str,%i,1) isalnum) inc %r
      inc %i
    }
  }
  else {
    errorbox File doesn't exists!
  }
  return $iif($calc(%r / %t) > 0.35,$true,$false)
}

; ################################################################################

on *:dialog:dpeworkshop:menu:*:{
  if ($did == 601) { run notepad $scriptdir\data\config }
  if ($did == 101) { 
    die
    peworkshop
    if (!%peworkshop.oldrep) set %peworkshop.oldrep c:\
    var %file = $sfile(%peworkshop.oldrep,Choose a file) | if (%file) OpenFile $+(",%file,") 
    set %peworkshop.oldrep %file
  }
  if ($did == 102) { did -c $dname 7 8 9 }
  if ($did == 103) { savepe }
  if ($did == 108) { die }
  if ($did == 110) { var %file = $$?="Choose a filename" | if (%file) { if ($exists(%file)) { if ($?!="File already exists, overwrite it?") { CreateLog $+(",%file,") } } | else { CreateLog $+(",%file,") } } }
  if ($did == 801) { pe.about }
}

; ################################################################################

alias -l SavePE {

  if ($g(backup)) {
    var %dir = $backupdir($+($noext($nopath($g(file))),\))
    if (!$exists(%dir)) mkdir %dir
    .copy -o $g(file) %dir
  }

  var %id = 7
  while (%id <= 9) {
    var %i = 2, %t = $did(dpeworkshop,%id).lines, %address, %size, %val, %cur, %add
    while (%i <= %t) {
      %add = 0
      %cur = $did(dpeworkshop,%id,%i)
      %val = $gettok($gettok(%cur,6-,32),1,9)
      %val = $+($iif($calc($len(%val) % 2),0),%val)
      %address = $base($gettok($gettok(%cur,2,9),5,32),16,10)
      %size = $base($gettok($gettok(%cur,2,9),-1,32),16,10)
      var %zz = -2 , %ascii
      while ($mid(%val,%zz,2)) {
        bset &pe 1 $base($ifmatch,16,10)
        bwrite $g(file) $calc(%address + %add) 1 &pe
        %ascii = $ifmatch %ascii
        dec %zz 2
        inc %add
      }
      inc %i
    }
    inc %id
  }
}

; ################################################################################

alias -l CreateLog {
  write -c $1-
  write $1- Log file of $g(file)
  write $1- Generated with PE Workshop v1.0.0
  write $1- #################################
  write $1- Address $chr(160) Value $str($chr(160),5) $+ Description
  write $1- #################################
  var %x = 7
  while (%x <= 9) {
    var %i = 2, %t = $did(dpeworkshop,%x).lines
    while (%i <= %t) {
      var %cur = $did(dpeworkshop,%x,%i)
      var %1 = $gettok($gettok(%cur,1,9),6-,32), %2 = $mid($remove($gettok($gettok(%cur,2,9),5-,32),$chr(32)),2), %3 = $gettok($gettok(%cur,3,9),5-,32)
      write $1- %2 %1 $str($chr(160),$calc(25 - ($len(%1) + $len(%2)))) %3
      inc %i
    }
    write $1- $crlf
    inc %x
  }

}

; ################################################################################

on *:dialog:dpeworkshop:init:0:{
  dll $mdx.dll SetMircVersion $version
  dll $mdx.dll MarkDialog $dname

  dll $mdx.dll SetFont $dname 12 8 400 fixedsys

  createlistview 7 8 9 10
  createtreeview
  ;  openfile $mircexe
}

; ################################################################################

alias -l GetCoffAddress {
  bread $g(file) 1 8192 &t
  var %i = 1, %offset = -1, %temp
  while (%i < 4) {
    %temp = $bfind(&t,%i,PE).text
    if ($calc(%temp % 4) == 0) {
      %offset = %temp
      %i = 4
    }
    inc %i
  }
  return %offset
}

; ################################################################################
; lit une chaine asciiz spécifier a une address
; pas besoin de spécifier la longueur d'la chaine vu qu'elle est zero terminated
; var %blah = $ReadUnicodeAsciiz(address,file)
; $readUnicodeAsciiz(address,file).fp (set le filepointer a la fin d'la chaine)
; $readUnicodeAsciiz(address,file).size (retourne la taille de la chaine)
alias -l ReadUnicodeAsciiz {

  var %ok = $true, %r, %ascii, %oldfp = $fp.get

  fp.set $1

  while (%ok) {
    %ascii = $binread($2-,$fp,1,2)
    ; si ya une erreur, on return l'erreur
    if (ERROR isin %ascii) { %ok = $false | %r = %ascii }
    ; esti d'mirc... on met un chr(160) a place d'un vrai espace..
    if (%ascii == 32) %ascii = 160
    %r = $+(%r,$chr(%ascii))

    if (%ascii == 0) %ok = $false
  }

  if ($prop == size) %r = $calc(($fp - $1 - 2) / 2)

  ;  if ($prop != fp) fp.set %oldfp

  return %r
}

; ################################################################################
; id1 id2 id3 idN
alias -l createlistview {
  var %i = 1, %n = $0, %parm
  while (%i <= %n) {
    %parm = $eval($+($,%i),2)
    dll $mdx.dll SetControlMDX %parm listview rowselect editlabels $g(showgrid) report > $views.dll
    if (%parm < 10) {
      did -i $dname %parm 1 headerdims 100 80 300
      did -i $dname %parm 1 headertext $tab(Value, Address & size, Info)
      did -i $dname %parm 1 headerdims 80:2 100:1 300:3
    }
    if (%parm == 10) {
      did -i $dname %parm 1 headerdims 80 80 80 80 80 85
      did -i $dname %parm 1 headertext $tab(Name, Virtual size, Virtual offset, Raw size, Raw offset, Characteristics)
    }
    inc %i
  }
}

; ################################################################################

alias -l createtreeview {
  dll $mdx.dll SetControlMDX 11 treeview fullrowselect haslines linesatroot hasbuttons > $views.dll
}

; ################################################################################
; kan kkchose ou kelkun ferme le dialog
on *:dialog:dpeworkshop:close:0:{
  die
}

; ################################################################################

alias -l die {
  if ($hget(dbpe)) hfree dbpe
  fp.die
  dialog -x dpeworkshop
}

; ################################################################################
; return les 31 bits de poids faible d'un dword
; retourne le dword en hex ou dec? (.hex ou .dec)
alias -l GetBits {
  var %n = $base($1,16,16,8), %b = $iif($prop == hex,16,10), %i = 1, %r
  %r = $+($base($mid($base($mid(%n,1,2),16,2,8),2),2,16,2),$mid(%n,3))
  return $base(%r,16,%b)
}

; ################################################################################
alias -l _dec { return $base($1,16,10) }

; ################################################################################
;
alias -l pe.ressource {
  var %file = $g(file), %root = 1, %sub = 2, %x = 0
  fp.set $calc($g(.rsrc.rawoffset) + 12)

  drawrect -rf @peloading $rgb(face) 1 10 135 280 10
  drawrect -r @peloading $rgb(0) 1 10 135 280 10
  var %lastline = 10, %poss, %ww 

  var %NamedEntry = $_dec($binread(%file,$fp.get,2,2).Endianhex)
  var %IdEntry = $_dec($binread(%file,$fp.get,2,2).Endianhex)
  var %NbrEntry = $calc(%NamedEntry + %IdEntry)
  %ww = $calc(280 / %NbrEntry)
  while (%x < %NbrEntry) {
    %poss = $calc((%x / %NbrEntry) * 280)
    drawrect -rf @peloading $rgb(0) 1 %lastline 135 $abs($calc(%poss - %lastline)) 10

    if (%oldfp) fp.set %oldfp
    var %t = $binread(%file,$fp.get,8,8).EndianHex
    var %oldfp = $fp.get

    ; vérifie si cé un subdirectory
    if ($High_Byte(%t) == 80) {

      ; trouve laddresse en otant le high bit qui est setter...
      fp.set $calc($g(.rsrc.rawoffset) + $getbits($high_dword(%t)).dec)

      ; isole le low byte qui est le type... et trouve le type correspondant
      var %type = $find_Type($low_byte(%t))

      ; on skip 12 byte (les infos k'ya là, on sen fou)
      fp.inc 12

      ; le nombre d'entré avec des string comme id
      var %NamedEntry = $_dec($binread(%file,$fp.get,2,2).endianhex)

      ; le nombre d'entré avec des dword comme id
      var %IdEntry = $_dec($binread(%file,$fp.get,2,2).endianhex)

      ; le nombre entré total
      var %TotalEntry = $calc(%IdEntry + %NamedEntry)

      did -i dpeworkshop 11 1 cb root
      did -a dpeworkshop 11 1 1 %type

      inc %root

      var %ee = 1
      %sub = 2
      while (%ee <= %TotalEntry) {
        drawrect -rf @peloading $rgb(0) 1 %lastline 135 $calc((%poss - %lastline) + ((%ee / %TotalEntry) * %ww)) 10
        drawrect -rf @peloading $rgb(face) 1 190 65 50 20
        drawtext -r @peloading $rgb(0) tahoma 10 190 65 $round($calc(((%poss - %lastline + ((%ee / %TotalEntry) * %ww)) / 280) * 100),2) $+ %

        ; les info d'la ressources
        var %bleh = $binread(%file,$fp.get,8).endianhex
        var %oldfp2 = $fp.get

        ; low et high word d'la ressource
        var %low = $low_dword(%bleh)
        var %high = $high_dword(%bleh)

        ; si le high byte yé setter, l'id est une string, faut aller la chercher!
        if ($high_byte(%low) == 80) {

          ; on isole l'address (pour enlever le high bit setter), on ajoute au rawoffset pour completer le RVA
          var %address = $calc($base($mid(%low,3),16,10) + $g(.rsrc.rawoffset))
          ; on trouve la longueur d'la string (* 2 vu que cé en unicode)
          var %strLen = $calc($_dec($binread(%file,%address,2).endianhex) * 2)
          inc %address
          ; on va chercher la string
          var %id = $unicodetoansi($binread(%file,%address,%strLen).hex)
        }
        else {
          ; l'id cé un nombre ben normale, ben le fun ;)
          var %id = $base($low_dword(%bleh),16,10)
        }

        ; navigue dans les subdirectory juska temps qu'on trouve le dernier
        ; le dernier va etre celui qui n'aura pas son high bit de setter
        while ($high_byte(%high) == 80) {
          ; trouve la prochaine addresse
          fp.set $calc($getbits(%high).dec + $g(.rsrc.rawoffset) + 20)
          %high = $binread(%file,$fp.get,4).endianhex
        }

        fp.set $calc($base(%high,16,10) + $g(.rsrc.rawoffset))

        var %image_ressource_data_entry = $binread(%file,$fp.get,16)

        ; trouve laddresse du raw binary de la ressource
        var %raw = $calc($base($Endian($gettok(%image_ressource_data_entry,1-4,32)).hex,16,10) - $g(.rsrc.voffset) + $g(.rsrc.rawoffset))

        ; la grosseur du raw binary de la ressource
        var %rawsize = $base($Endian($gettok(%image_ressource_data_entry,5-8,32)).hex,16,10)

        ; sauvegarde en fichier .res sur le hdd
        ;  SaveRessource %raw %rawsize %root %sub %type

        did -i dpeworkshop 11 1 cb root
        did -i dpeworkshop 11 1 cb last
        did -a dpeworkshop 11 1 1 $+(id=,%id)

        ; save en mem... 
        s $+(id:,%root,.,%sub) %raw %rawsize %type

        inc %sub

        fp.set %oldfp2
        fp.inc 8
        inc %ee
      }
    }
    else {
      ; aucune resource!
      return no_resources
    }
    inc %x
  }
  drawrect -rf @peloading $rgb(face) 1 190 65 50 20
  drawrect -rf @peloading $rgb(0) 1 10 135 280 10
}

; ##############################################################################
; creer une table dialog avec un fichier ressource dialog et ensuite, load
; la table dans le ID d'un dialog donné
; syntaxe: offset, size, file-to-save
alias -l MakeDialogTable {

  ; le fichier
  var %file = $g(file)

  ; la structure dlgtemplateex
  var %helpID, %exStyle, %style, %cDlgItems, %x, %y, %w, %h, %menu, %windowclass, %caption
  var %PointSize, %Weight, %bItalic, %font

  ; affiche l'edit et cache l'icon
  showedit

  fp.set $calc($1 + 2)

  var %DlgVer = $binread(%file,$fp,2).endianhex


  ; est-ce que c'est un dlgtemplateEX?
  if (%dlgver == FFFF) {
    fp.inc 2
    %helpID = $binread(%file,$fp,4,4).endianhex
    %exStyle = $_dec($binread(%file,$fp,4,4).endianhex)
    %style = $_dec($binread(%file,$fp,4,4).endianhex)
  }
  else {
    fp.dec 2
    %style = $_dec($binread(%file,$fp,4,4).endianhex)
    %exstyle = $_dec($binread(%file,$fp,4,4).endianhex)
  }

  ; le nombre de control sur le dialog
  %cDlgItems = $_dec($binread(%file,$fp,2,2).endianhex)
  %x = $_dec($binread(%file,$fp,2,2).EndianHex)
  %y = $_dec($binread(%file,$fp,2,2).EndianHex)
  %w = $_dec($binread(%file,$fp,2,2).EndianHex)
  %h = $_dec($binread(%file,$fp,2,2).EndianHex)

  %menu = $_dec($binread(%file,$fp,2,2).endianhex)
  if (%menu == 65535) %menu = $_dec($binread(%file,$fp,2,2).EndianHex)
  elseif (%menu != 0) %menu = $ReadUnicodeAsciiz($fp,%file)

  %windowclass = $_dec($binread(%file,$fp,2,2).endianhex)
  if (%windowclass == 65535) %windowclass = $_dec($binread(%file,$fp,2,2).endianhex)
  elseif (%windowclass != 0) %windowclass = $readunicodeasciiz($fp,%file)

  if ($binread(%file,$fp,1) == 0) fp.inc 2
  else %caption = $ReadUnicodeAsciiz($fp,%file)

  ; bâti la liste des constantes associer au dialog
  var %const = $getstyle(dialog,%style)
  var %constex = $getstyle(dialogex,%exstyle)

  write $3- $+(DIALOG,$iif(%dlgver == FFFF,EX)) %x %y %w %h
  if (%const) write $3- 12 STYLE %const
  if (%constex) write $3- EXSTYLE %constex
  write $3- CAPTION $+(",%caption,")

  if (DS_SETFONT isin %const) {
    %pointsize = $_dec($binread(%file,$fp,2,2).endianhex)
    %weight = $_dec($binread(%file,$fp,2,2))
    %bItalic = $iif($binread(%file,$fp,2,2) == 0 1,TRUE,FALSE)
    %font = $readunicodeasciiz($fp,%file)
    write $3- FONT %pointsize $+ , $+(",%font,")
  }

  write $3- $chr(123)

  %i = 1
  while (%i <= %cDlgItems) {
    var %cStyle, %cExStyle, %cX, %cY, %cW, %cH, %cID, %cHelpID, %cWindowClass, %cTitle, %cExtraCount

    fp.align 4

    ; tout les controles sont aligné sur 4 bytes

    if (%DlgVer == FFFF) {
      %cHelpID = $binread(%file,$fp,4,4).endianhex
      %exStyle = $_dec($binread(%file,$fp,4,4).endianhex)
      %style = $_dec($binread(%file,$fp,4,4).endianhex)       
    }
    else {
      %style = $_dec($binread(%file,$fp,4,4).endianhex)
      %exstyle = $_dec($binread(%file,$fp,4,4).endianhex)
    }

    %cX = $_dec($binread(%file,$fp,2,2).endianhex)
    %cY = $_dec($binread(%file,$fp,2,2).endianhex)
    %cW = $_dec($binread(%file,$fp,2,2).endianhex)
    %cH = $_dec($binread(%file,$fp,2,2).endianhex)

    if (%DlgVer == FFFF) {
      %cID = $_dec($binread(%file,$fp,4,4).endianhex)
      if ($IsSigned(%cID,32)) %cID = $signed(%cID,32)
    }
    else {
      %cID = $_dec($binread(%file,$fp,2,2).endianhex)
      if ($IsSigned(%cID,16)) %cID = $signed(%cID,16)
    }

    %cWindowClass = $_dec($binread(%file,$fp,2).endianhex)

    fp.align 2

    if (%cWindowClass == 65535) { 
      fp.inc 2
      %cWindowClass = $getctrltype($binread(%file,$fp,2,2).endianhex)
    }
    elseif (%cWindowClass != 0) {
      %cWindowClass = $+(",$readunicodeasciiz($fp,%file),")
    }

    fp.align 2

    var %capinfo = $binread(%file,$fp,2)

    if (%capinfo == 0 0) { fp.inc 2 }
    else {
      if (%capinfo == 255 255) { 
        fp.inc 2
        %cTitle = $_dec($binread(%file,$fp,2,2).endianhex)
      }
      else {
        %cTitle = $ReadUnicodeAsciiz($fp,%file)
      }
    }

    ;    if (%dlgVer == FFFF) { fp.inc 2 }
    ;    else { fp.inc 2 }
    fp.inc 2
    ;    write $3- CONTROL $+(",%cTitle,",$chr(44),%cID,$chr(44),%cWindowClass,$chr(44),%cx %cy %cw %ch,$chr(44),%const %constex)
    write $3- CONTROL $+(",%cTitle,",$chr(44),%cID,$chr(44),%cWindowClass,$chr(44),%cx %cy %cw %ch)

    inc %i

  }

  write $3- $chr(125)

}


; ###################################################################
; retourne le nombre en 'format' signé
; nombre, bit
alias -l signed {
  return $calc($1 - (2 ^ $2))
}

; ###################################################################
; retourne true si le nombre est signé ou non
; nombre, bit
alias -l IsSigned {
  %n = $base($1,10,2,$2)
  return $iif($left(%n,1) == 1,$true,$false)
}

; ###################################################################
; type, style
alias -l getstyle {
  var %i = 1, %t = $hget(const,0).data, %const
  while (%i <= %t) {
    var %data = $base($hget(const,%i).data,16,10), %item = $hget(const,%i).item, %sub = $gettok(%item,1,95), %ex = $gettok(%item,2,95)
    if ($1 == dialog) { if (%sub == DS || %sub == WS && %ex != EX) { if ($and($2,%data) == %data) %const = %const %item $chr(124) } }
    if ($1 == dialogex) { if (%sub == WS && %ex == EX) { var %and = $and($2,%data) | if ((%and == %data) && (%and > 0)) %const = %const %item $chr(124) } }
    inc %i
  }

  %const = $left(%const,-1)
  return %const
}

; ##############################################################################

alias -l GetCtrlType {
  if ($1 == 0080) return BUTTON
  if ($1 == 0081) return EDIT
  if ($1 == 0082) return TEXT
  if ($1 == 0083) return LISTBOX
  if ($1 == 0084) return SCROLLBAR
  if ($1 == 0085) return COMBOBOX
  return unknown
}

; ##############################################################################
; SaveRessource offset, size, path
; save la ressource en binary sur le diske dur
alias -l SaveRessource {
  var %size = $2, %offset = $1, %toread = 8192
  while (%size) {
    if (%toread > %size) %toread = %size
    bread $g(file) %offset %toread &bin
    bwrite $3- -1 %toread &bin
    inc %offset %toread
    dec %size %toread
  }
}


; ################################################################################
; prend la section daddresse choisi dans le fichier addresse et rempli le listview choisis avec les résultat
; $1 = id a remplir
; $2 = kel section dans le fichier addresse a lire [exe,coff,optional]
; pe.header [id] [exe,coff,optional]
alias -l pe.header {
  var %f = $+($scriptdir,$g(address)), %i = 1, %t = $lines(%f), %inbloc = $false, %cur, %relative = 0

  drawrect -rf @peloading $rgb(face) 1 10 135 280 10
  drawrect -r @peloading $rgb(0) 1 10 135 280 10
  var %lastline = 10, %poss
  ; trouve la ligne de départ et de fin du bloc $1 [exe,coff,optional]
  while (%i <= %t) {
    %poss = $calc((%i / %t) * 280)
    drawrect -rf @peloading $rgb(0) 1 %lastline 135 $abs($calc(%poss - %lastline)) 10
    var %xpos = 17
    if ($2 == coff) %xpos = 29
    if ($2 == optional) %xpos = 41
    drawrect -rf @peloading $rgb(face) 1 190 %xpos 60 20

    drawtext -r @peloading $rgb(0) tahoma 10 190 %xpos $round($calc((%poss / 280) * 100),1) $+ %

    %cur = $remove($read(%f,%i),$chr(9))
    if (%cur) {
      ; on a attein la fin du bloc $2
      if ($gettok(%cur,1,32) == !end) { if ($2 isin %cur) %inbloc = $false }

      ; on est rendu dans les addresses du bloc choisi
      if (%inbloc) {
        ; on a trouver un bloc du genre [$XXXXXX]
        if (($left(%cur,1) == $chr(91)) && ($right(%cur,1) == $chr(93))) {
          ; on prend la valeur du bloc et on le set comme étant l'addresse de base (relative)
          %relative = $eval($mid(%cur,2,$calc($len(%cur) - 2)),2)
        }
        else {
          ; prend laddresse --------------- la grosseur ---------------- description
          var %address = $calc($gettok(%cur,1,32) + %relative), %size = $gettok(%cur,2,32), %desc = $gettok(%cur,3-,32)

          ; pogne la valeur        
          var %val = $binread($g(file),%address,%size)

          ; 
          if ($right(%desc,1) == :) { 
            var %tag = $gettok(%desc,-1,32)
            if (%tag == [ascii]:) %desc = $+($remove(%desc,%tag),:) $getascii(%val)
            if ([save- isin %tag) { 
              %desc = $+($remove(%desc,%tag),:)
              s $left($gettok(%tag,2,$asc(-)),-2) $_dec($endian(%val).hex)
            }
          }

          ; ---------------------------- addresse sur 64bits ---------------- transforme la valeur -------------------- description
          did -a dpeworkshop $1 0 0 $tab(0 0 $Endian(%val).hex,0 0 0 $base(%address,10,16,8) %size,%desc)
        }
      }
      ; on a attein le début du bloc $2
      if ($left(%cur,8) == !section) { if ($2 isin %cur) %inbloc = $true }
    }
    inc %i
  }
  drawrect -rf @peloading $rgb(face) 1 190 %xpos 60 20
  drawrect -rf @peloading $rgb(0) 1 10 135 280 10
}

; ################################################################################
; transforme la bd en hash table
; $1 = nom a donner a la hash table
; $2- = fichier 
alias -l db2hash {
  if ($exists($2-)) {
    if ($hget($1)) hfree $1
    hmake $1 1000
    var %i = 1, %t = $lines($2-), %l, %n, %c
    while (%i <= %t) {
      %l = $gettok($remove($read($2-,%i),$chr(9)),1-,32)
      if (%l) {
        if ($left(%l,1) != $chr(35)) {
          %l = $gettok(%l,1,35)
          %n = $gettok(%l,1,61)
          %c = $gettok(%l,2,61)
          hadd $1 %n %c
        }
      }
      inc %i
    }
  }
}

; ################################################################################
; trouve le type d'la ressource
alias -l Find_Type {
  if ($1 == 01) return Cursor
  elseif ($1 == 02) return Bitmap
  elseif ($1 == 03) return Icon
  elseif ($1 == 04) return Menu
  elseif ($1 == 05) return Dialog
  elseif ($1 == 06) return String_Table
  elseif ($1 == 07) return Font_directory
  elseif ($1 == 08) return Font
  elseif ($1 == 09) return Accelerators
  elseif ($1 == 0A) return RCData
  elseif ($1 == 0B) return Message_Table
  elseif ($1 == 0C) return Cursor_Group
  elseif ($1 == 0D) return Group_Icon
  elseif ($1 == 0E) return Icon_Group
  elseif ($1 == 10) return Version
  elseif ($1 == 14) return VxD
  elseif ($1 == 15) return Animated_Cursor
  elseif ($1 == 18) return Manifest
  elseif ($1 == 48) return AVI
  elseif ($1 == 78) return Registry
  elseif ($1 == 8A) return TypeLib
  elseif ($1 == E0) return AVI
  elseif ($1 == E8) return REGINST
  else return Unknown ( $+ $chr(35) $+ $1 $+ )
}

; ################################################################################
;$1- = hex string
;returns (45 46 47 48 49), return EFGHI
alias -l UnicodeToAnsi { 
  var %x = 1, %y = $numtok($1-,32) 
  while (%x <= %y) {
    if ($gettok($1-,%x,32) != 00) {
      var %f = %f $+ $chr($base($gettok($1-,%x,32),16,10)) 
    } 
    inc %x 
  } 
  return %f 
}

; #####################################################################
; transforme une chaine de tok decimal en chaine de tok hexa
; ex.: echo -a $hexstring(7 8 9 10 11 12) retourne 07 08 09 0A 0B 0C
alias -l hexstring {
  var %i = 1, %t = $numtok($1-,32), %r
  while (%i <= %t) {
    %r = %r $base($gettok($1-,%i,32),10,16,2)
    inc %i
  }
  return %r
}

; ################################################################################
; endian(text).hex/dec
; retourne le text en ordre inversé, en hex ou en decimal
; echo -a $endian(8 9 10 11).hex retourne 0B 0A 09 08
alias -l endian {
  var %x = 1, %t, %z = $numtok($1-,32) 
  while (%x <= %z) {
    if ($prop == dec) var %t = %t $gettok($1-,$calc(%z - (%x - 1)),32)
    if ($prop == hex) var %t = %t $+ $base($gettok($1-,$calc(%z - (%x - 1)),32),10,16,2) 
    inc %x
  } 
  return %t
}

; ################################################################################
; transforme un nombre hex en decimal, pret a etre écris en big endian
; ex. : echo -a $bigendian(29A) retourne 154 2
alias -l BigEndian {
  var %n = $1, %t, %i = 1, %r
  if ($calc($len(%n) % 2) > 0) %n = $+(0,%n)
  %t = $len(%n)
  while (%i <= %t) {
    %r = $base($mid(%n,%i,2),16,10) %r
    inc %i 2
  }
  return %r
}

; ################################################################################
; transforme une chaine de valeur ascii en string
; $1- = 12 34 56 67 89
alias -l getascii {
  var %i = 1, %t = $numtok($1-,32), %r
  while (%i <= %t) {
    %r = $+(%r,$chr($gettok($1-,%i,32)))
    inc %i
  }
  return %r
}

; ###################################################################
; lit <size> byte a partir de <pos> dans <fichier>
; $binread(fichier,pos,size,inc filepointer).[EndianHex,EndianDec,text,dec,hex]
; EndianHex retourne les bytes inversé et en hexadécimal
; EndianDec retourne les bytes inversé et en décimal
; text retourne sa en plain text
; dec (valeur par défault) retourne les bytes  en décimal
; hex retourne les bytes en hexadécimal
alias -l binread {
  var %file = $shortfn($1), %r

  if (!$isfile(%file)) {
    errorbox File $1 doesn't exists!
    return ERROR_FILE_DOESNT_EXISTS
  }
  if ($3 !isnum || $2 !isnum) {
    errorbox Binread error: missing or wrong arguments
    return ERROR_WRONG_ARGUMENTS
  }

  if ($2 >= $lof(%file)) {
    errorbox Binread: input past end of file
    return ERROR_EOF
  }

  bread %file $2 $3 &br

  if ($4) fp.inc $4

  %r = $bvar(&br,1,$3)
  if ($prop == EndianHex) { %r = $Endian($bvar(&br,1,$3)).hex }
  if ($prop == EndianDec) { %r = $Endian($bvar(&br,1,$3)).dec }
  if ($prop == text) { %r = $bvar(&br,1,$3).text }
  if ($prop == hex) { %r = $hexstring($bvar(&br,1,$3)) }

  return %r
}

; #####################################################################
; retourne la position du filepointer
alias -l fp {
  if (!$hget(filepointer)) fp.reset
  var %ret = $hget(filepointer,pos)
  return %ret
}

; retourne la position du filepointer
alias -l fp.get {
  if (!$hget(filepointer)) fp.reset
  var %ret = $hget(filepointer,pos)
  return $hget(filepointer,pos)
}

; set la position du filepointer
alias -l fp.set {
  if (!$hget(filepointer)) fp.reset
  var %arg = $1
  hadd filepointer pos %arg
}

; reset le file pointer a 0
alias -l fp.reset {
  if (!$hget(filepointer)) hmake filepointer 10
  hadd filepointer pos 0
}

; tue le filepointer, libérant ainsi la mémoire
alias -l fp.die {
  if ($hget(filepointer)) hfree filepointer 
}

; incrémente le filepointer de $1 ou 1
alias -l fp.inc {
  if (!$hget(filepointer)) fp.reset
  %arg = $iif($1,$1,1)
  hadd filepointer pos $calc($fp.get + %arg)
}

; décrémente le filepointer de $1 ou 1
alias -l fp.dec {
  if (!$hget(filepointer)) fp.reset
  %arg = $iif($1,$1,1)
  if ($calc($fp.get - %arg) >= 0) hadd filepointer pos $calc($fp.get - %arg)
}

; align le filepointer a N byte
alias -l fp.align {
  if (!$hget(filepointer)) fp.reset
  while ($calc($fp % $1)) fp.inc 1 
}
