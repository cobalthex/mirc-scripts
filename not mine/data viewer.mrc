alias iso return $calc(($1 - $3)*0.866) $calc(($1 + $3)*0.5- $2)
alias isoWin window -pkodCfB +nt @PicWin -1 -1 400 400 | drawline -r @PicWin 0 1 $iso(10, -10, 0) $iso(100, -100, 1)


dialog file {
  title "Variable/Txt/Ini/Hash Table Viewer"
  size -1 -1 179 204
  option dbu
  tab "Variables", 15, 1 -1 177 203
  box "", 14, 91 43 54 34, tab 15
  box "Edit Variable", 11, 79 88 77 75, tab 15
  box "Variables", 7, 4 43 58 104, tab 15
  button "Add Variable", 3, 94 62 48 12, tab 15
  button "Remove Variable", 4, 9 149 48 12, disable tab 15
  edit "", 5, 90 111 53 10, tab 15 read autohs center
  text "Variable Name:", 8, 95 101 42 8, tab 15 center
  text "Variable Data:", 10, 98 128 40 8, tab 15
  edit "", 9, 83 139 69 10, disable tab 15 autohs center
  combo 2, 6 52 54 92, tab 15 sort size
  button "Set", 12, 108 150 19 9, disable tab 15
  button "Clear All Variables", 13, 94 49 48 12, tab 15
  tab "Txt Files", 16
  list 45, 6 52 54 92, tab 16 sort size
  box "Txt Files", 46, 4 43 58 104, tab 16
  box "Contents", 47, 68 43 106 129, tab 16
  list 48, 72 52 99 116, tab 16 size hsbar
  button "Remove", 58, 8 147 24 9, disable tab 16
  button "Add", 59, 32 147 24 9, tab 16
  button "Rename", 61, 32 156 24 9, disable tab 16
  button "Open", 60, 8 156 24 9, disable tab 16
  tab "Ini Files", 17
  list 19, 63 43 50 92, tab 17 sort size
  box "Topics", 21, 61 35 54 102, tab 17
  box "Items", 23, 119 35 54 102, tab 17
  list 20, 121 43 50 92, tab 17 sort size
  edit "", 24, 24 176 146 10, tab 17 read autohs
  list 22, 4 43 50 92, tab 17 sort size
  box "Ini File", 39, 3 35 54 102, tab 17
  text "File:", 30, 7 150 12 8, tab 17
  text "Topic:", 38, 7 159 16 8, tab 17
  text "Item:", 40, 7 168 15 8, tab 17
  text "Data:", 41, 7 177 15 8, tab 17
  edit "", 44, 24 149 146 10, tab 17 read autohs
  edit "", 43, 24 158 146 10, tab 17 read autohs
  edit "", 42, 24 167 146 10, tab 17 read autohs
  button "Remove", 49, 6 138 24 8, disable tab 17
  button "Remove", 51, 63 138 24 8, disable tab 17
  button "Add", 53, 147 138 24 8, disable tab 17
  button "Remove", 54, 122 138 24 8, disable tab 17
  button "Add", 50, 31 138 24 8, tab 17
  button "Add", 65, 88 138 24 8, disable tab 17
  tab "Hash Tables", 18
  list 25, 63 43 50 92, tab 18 sort size
  box "Items", 26, 61 35 54 102, tab 18
  box "Data", 27, 119 35 54 102, tab 18
  list 28, 121 43 50 92, tab 18 sort size
  text "Table:", 29, 7 150 18 8, tab 18
  text "Item:", 33, 7 159 16 8, tab 18
  text "Data:", 34, 7 168 16 8, tab 18
  edit "", 35, 24 149 146 10, tab 18 read autohs
  edit "", 36, 24 158 146 10, tab 18 read autohs
  edit "", 37, 24 167 146 10, tab 18 read autohs
  list 31, 4 43 50 92, tab 18 sort size
  box "Hash Table", 32, 3 35 54 102, tab 18
  button "Remove", 52, 6 138 24 8, disable tab 18
  button "Add", 55, 31 138 24 8, tab 18
  button "Remove", 57, 63 138 24 8, disable tab 18
  button "Add", 56, 88 138 24 8, disable tab 18
  button "Edit", 62, 132 138 24 8, disable tab 18
  text "Size:", 64, 7 177 16 8, tab 18
  edit "", 63, 24 176 146 10, tab 18 read autohs
  text "Variable Viewer/Editor", 1, 28 21 123 8, center
  button "OK", 6, 73 189 33 10, ok cancel
}
menu * {
  Variable/Txt/Ini/Hash Table Viewer+Editor: file
}
alias file {
  if ($dialog(file)) dialog -x file file
  dialog -m file file
}
on *:dialog:file:*:*:{
  if ($devent == init) {
    var %x = 1
    while ($var(%*,%x)) {
      did -a file 2 $var(%*,%x)
      inc %x
    }
    var %y = 1
    while ($findfile($mircdir,*.txt,%y)) {
      did -a file 45 $nopath($findfile($mircdir,*.txt,%y))
      inc %y
    }
    var %z = 1
    while ($findfile($mircdir,*.ini,%z)) {
      did -a file 22 $nopath($findfile($mircdir,*.ini,%z))
      inc %z
    }
    var %z = 1
    while ($hget(%z)) {
      did -a file 31 $hget(%z)
      inc %z
    }
  }
  if ($devent == sclick) {
    if ($did == 45 && $did(file,45).seltext != $null) {
      did -e file 58-61
      did -r file 48,42-44
      var %x = 1
      while (%x <= $lines($did(file,45).seltext)) {
        did -a file 48 $read($did(file,45).seltext,n,%x)
        inc %x
      }
      did -z file 48
    }
    if ($did == 2 && $did(file,2).seltext != $null) {
      did -e file 4,9
      did -ra file 5 $did(file,2).seltext
      did -ra file 9 $var($did(file,2).seltext,1).value
    }
    if ($did == 22 && $did(file,22).seltext != $null) {
      var %x = 1
      did -b file 53,54,51
      did -e file 49,65
      did -r file 19,20,24,42-44
      did -a file 44 $did(file,22).seltext
      while ($ini($did(file,22).seltext,%x)) {
        did -a file 19 $ini($did(file,22).seltext,%x)
        inc %x
      }
    }
    if ($did == 19 && $did(file,19).seltext != $null) {
      did -r file 20,24,43,42
      did -e file 51,53
      did -b file 54
      did -a file 43 $did(file,19).seltext
      var %x = 1
      while ($ini($did(file,22).seltext,$did(file,19).seltext,%x)) {
        did -a file 20 $ini($did(file,22).seltext,$did(file,19).seltext,%x)
        inc %x
      }
    }
    if ($did == 20 && $did(file,20).seltext != $null) {
      did -ra file 24 $readini($did(file,22).seltext,$did(file,19).seltext,$did(file,20).seltext)
      did -ra file 42 $did(file,20).seltext
      did -e file 54
    }
    if ($did == 31 && $did(file,31).seltext != $null) {
      did -e file 52,56
      did -b file 62,57
      did -r file 25,28,35-37,63
      did -a file 63 $hget($did(file,31).seltext).size
      did -a file 35 $did(file,31).seltext
      var %x = 1
      while ($hget($did(file,31).seltext,%x).item) {
        did -a file 25 $hget($did(file,31).seltext,%x).item
        inc %x
      }
    }
    if ($did == 25 && $did(file,25).seltext != $null) {
      did -r file 28,36,37
      did -e file 57,62
      did -a file 36 $did(file,25).seltext
      did -a file 37,28 $hget($did(file,31).seltext,$did(file,25).seltext)
    }
    if ($did == 60) run $did(file,45).seltext
    if ($did == 58) {
      var %a = $input(Are you sure you would like to remove $did(file,45).seltext $+ ?,cy,Removal of $did(file,45).seltext)
      if (%a == $true) {
        did -b file 58,60,61
        remove -b $did(file,45).seltext
        did -r file 45
        var %y = 1
        while ($findfile($mircdir,*.txt,%y)) {
          did -a file 45 $nopath($findfile($mircdir,*.txt,%y))
          inc %y
        }
      }
    }
    if ($did == 61) {
      var %x = $input(What would you like to rename $did(file,45).seltext as?,qe,Rename,$did(file,45).seltext)
      if (%x != $null) {
        if ($right(%x,4) != .txt) echo $input(You must rename $did(file,45).seltext as "something".txt!,ho,Error)
        else {
          did -b file 58,60,61
          rename $did(file,45).seltext %x
          did -r file 45
          var %y = 1
          while ($findfile($mircdir,*.txt,%y)) {
            did -a file 45 $nopath($findfile($mircdir,*.txt,%y))
            inc %y
          }
        }
      }
    }
    if ($did == 59) {
      var %x = $input(What txt file would you like to make?,qe,Add txt File)
      if (%x != $null) {
        if ($right(%x,4) != .txt) echo $input(You must make an txt file called "something".txt!,ho,Error)
        else {
          did -b file 58,61,60
          write %x
          did -r file 45
          var %y = 1
          while ($findfile($mircdir,*.txt,%y)) {
            did -a file 45 $nopath($findfile($mircdir,*.txt,%y))
            inc %y
          }
        }
      }
    }
    if ($did == 4) {
      var %y = $input(Are you sure you would like to remove $did(file,2).seltext $+ ?,cy,Removal of $did(file,2).seltext)
      if (%y == $true) {
        unset $did(file,2).seltext
        did -r file 2
        did -b file 9
        var %x = 1
        while ($var(%*,%x)) {
          did -a file 2 $var(%*,%x)
          inc %x
        }
      }
    }
    if ($did == 13) {
      echo $input(Are you sure you would like to clear all variables?,cy,Clear Variables)
      if ($! == $true) {
        did -r file 2,5,9
        did -b file 9,12.4
        while ($var(%*,1)) {
          unset $var(%*,1)
        }
      }
    }
    if ($did == 52) {
      var %x = $input(Are you sure you would like to delete the $did(file,31).seltext Hash Table?,cy,Removal of $did(file,31).seltext)
      if (%x == $true) {
        did -b file 52,56,57,62
        hfree $did(file,31).seltext
        did -r file 31,25,28,35-37,63
        var %z = 1
        while ($hget(%z)) {
          did -a file 31 $hget(%z)
          inc %z
        }
      }
    }
    if ($did == 57) { 
      var %a = $input(Are you sure you would like to remove $did(file,25).seltext from $did(file,31).seltext $+ ?,cy,Removal of $did(file,25).seltext)
      if (%a == $true) {
        did -b file 57,62
        hdel $did(file,31).seltext $did(file,25).seltext
        did -r file 25,28
        var %x = 1
        while ($hget($did(file,31).seltext,%x).item) {
          did -a file 25 $hget($did(file,31).seltext,%x).item
          inc %x
        }
      }
    }
    if ($did == 51) {
      var %a = $input(Are you sure you would like to remove $did(file,19).seltext from $did(file,22).seltext $+ ?,cy,Removal of $did(file,19).seltext)
      if (%a == $true) {
        remini $did(file,22).seltext $did(file,19).seltext
        did -b file 51,54,53
        did -r file 19,20,43,42,24
        var %x = 1
        while ($ini($did(file,22).seltext,%x)) {
          did -a file 19 $ini($did(file,22).seltext,%x)
          inc %x
        }
      }
    }
    if ($did == 50) {
      var %a = $input(What ini file would you like to add the directory?,qe,Add Ini File,file.ini)
      if (%a != $null) {
        if ($right(%a,4) == .ini) {
          write %a
          did -r file 22,19,20,42-44,24
          did -b file 49,61,65,54,53,51
          var %z = 1
          while ($findfile($mircdir,*.ini,%z)) {
            did -a file 22 $nopath($findfile($mircdir,*.ini,%z))
            inc %z
          }
        }
        else echo $input(You must add the ini file as "something".ini,ho,Error)
      }
    }
    if ($did == 49) {
      if ($did(file,22).seltext == $nopath($script)) echo $input(Why would you delete this script's file?,ho,Access Denied!)
      else {
        var %a = $input(Are you sure you would like to remove $did(file,22).seltext $+ ?,cy,Removal of $did(file,22).seltext)
        if (%a == $true) {
          remove -b $did(file,22).seltext
          did -r file 22,19,20,42-44,24
          did -b file 49,61,65,54,53,51
          var %z = 1
          while ($findfile($mircdir,*.ini,%z)) {
            did -a file 22 $nopath($findfile($mircdir,*.ini,%z))
            inc %z
          }
        }
      }
    }
    if ($did == 3) {
      echo $input(What variable would you like to add?,qe,Adding Variable,%)
      if ($! != $null) {
        if ($left($!,1) == %) {
          set $!
          did -r file 5,9,2
          did -b file 12,9,4
          var %x = 1
          while ($var(%*,%x)) {
            did -a file 2 $var(%*,%x)
            inc %x
          }
        }
        else echo $input(You must name the variable as $+($chr(37),something!),ho,Error)
      }
    }
    if ($did == 15) did -ra file 1 Variable Viewer/Editor
    if ($did == 16) did -ra file 1 Txt Viewer/Editor
    if ($did == 17) did -ra file 1 Ini Viewer/Editor
    if ($did == 18) did -ra file 1 Hash Table Viewer/Editor
    if ($did == 54) {
      var %a = $input(Are you sure you would like to remove $did(file,20).seltext $+ ?,cy,Removal of $did(file,20).seltext)
      if (%a == $true) {
        remini $did(file,22).seltext $diD(file,19).seltext $did(file,20).seltext
        did -r file 42,24,20
        did -b file 54
        var %x = 1
        while ($ini($did(file,22).seltext,$did(file,19).seltext,%x)) {
          did -a file 20 $ini($did(file,22).seltext,$did(file,19).seltext,%x)
          inc %x
        }
      }
    }
    if ($did == 65) {
      var %a = $input(What topic would you like to add to $did(file,22).seltext $+ ?,qe,Adding a Topic to $did(file,22).seltext)
      if (%a != $null) {
        writeini $did(file,22).seltext %a item temp
        remini $did(file,22).seltext %a item
        did -r file 20,19,43,42,24
        did -b file 51,54,53
        var %x = 1
        while ($ini($did(file,22).seltext,%x)) {
          did -a file 19 $ini($did(file,22).seltext,%x)
          inc %x
        }
      }
    }
    if ($did == 53) {
      var %a = $input(What item would you like to add to $did(file,22).seltext ? $did(file,19).seltext,qe,Adding Item to $did(file,19).seltext $+ ?)
      if (%a != $null) {
        var %b = $input(What data would you like to associate with %a $+ ?,qe,Data for %a)
        if (%b != $null) {
          writeini $did(file,22).seltext $did(file,19).seltext %a %b
          did -r file 20,24,42
          did -b file 54
          var %x = 1
          while ($ini($did(file,22).seltext,$did(file,19).seltext,%x)) {
            did -a file 20 $ini($did(file,22).seltext,$did(file,19).seltext,%x)
            inc %x
          }
        }
      }
    }
    if ($did == 55) {
      var %a = $input(What hash table would you like to add?,qe,Adding Hash Table)
      if (%a != $null) {
        var %b = $input(What do you want the size of %a to be?,qe,Size of %a)
        if (%b isnum 1-) hmake %a %b
        if (%b !isnum 1-) hmake %a
        did -r file 31,25,28,35,36,37,63
        did -b file 52,57,56,62
        var %z = 1
        while ($hget(%z)) {
          did -a file 31 $hget(%z)
          inc %z
        }
      }
    }
    if ($did == 56) {
      var %a = $input(What item would you like to add to $did(file,31).seltext $+ ?,qe,Adding Item To $did(file,31).seltext)
      if (%a != $null) {
        hadd $did(file,31).seltext %a
        did -r file 25,28,36,37
        did -b file 57,62
        var %x = 1
        while ($hget($did(file,31).seltext,%x).item) {
          did -a file 25 $hget($did(file,31).seltext,%x).item
          inc %x
        }
      }
    }
    if ($did == 62) {
      var %a = $input(What would you like the data for $did(file,31).seltext ? $did(file,25).seltext to be?,qeo,Data for $did(file,31).seltext ? $did(file,25).seltext,$did(file,28,1))
      did -r file 28,37
      if (%a != $null) {
        hadd $did(file,31).seltext $did(file,25).seltext %a
        did -a file 37,28 $hget($did(file,31).seltext,$did(file,25).seltext)
      }
      else hdel $did(file,31).seltext $did(file,25).seltext 
    }
    if ($did == 12) { set $did(file,2).seltext $did(file,9).text | did -b file 12 }
  }
  if ($devent == edit) {
    if ($did == 9) {
      if ($did(file,9).text == $null) did -b file 12
      else did -e file 12
    }
  }
}

