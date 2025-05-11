on *:CONNECT: if (*SwiftIRC* iswm $network) ns id mydizzle

Sphere
;Made by BlueThen on May 16, 2009
;To install, paste this script in your Remotes (Alt + R)
;Then type /sphere or right click the channel or status and click "Sphere".
menu channel,status {
  Sphere: sphere
}
alias sphere {
  window -paoCzdk0 +tnbL @Sphere -1 -1 400 400
  set %sphere.a 0
  set %sphere.a2 0
  %sphere.t = 1
  %sphere.x = 15
  while (%sphere.x) {
    %sphere.y = 15
    while (%sphere.y) {
      hadd -m X %sphere.t %sphere.x
      hadd -m Y %sphere.t %sphere.y
      inc %sphere.t
      dec %sphere.y 
    }
    dec %sphere.x
  }
  set %sphere.tok tokenize 32 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 $&
    31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46  47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 $&
    67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97  98 99 100  $&
    101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 $&
    128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 $&
    156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 $&
    183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 $&
    211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 
  sphere.frame
}

alias -l sphere.frame { var %ticks = $ticks
  if ($window(@sphere)) {
    clear -n @sphere
    drawfill -n @sphere 1 1 1 1
    %sphere.tok
    scon -r .!drawdot -nr @sphere $!rgb( $!calc( 143+( $* /2)), $!calc( 143+( $* /2)), $!calc(143+ ( $* /2))) 1 $!sphere.iso( $!calc( (7.5- $!hget(Y, $* ))*15* $!cos( $!calc( $!hget(X, $* )*24+ %sphere.a )).deg), $!calc( 75* $!sin( $!calc( $!hget(Y, $* )*24)).deg), $!calc( (7.5- $!hget(Y, $* ))*15* $!sin( $!calc( $!hget(X, $* )*24+ %sphere.a )).deg)) 
    set %sphere.a $calc(100 * $sin(%sphere.a2).deg)
    inc %sphere.a2 4
    drawtext -rn @sphere 16777215 tahoma 9 10 10 $calc(1000 / ($ticks - %ticks))
    drawline @sphere
    .timer 1 0 sphere.frame
  }
  else unset %sphere.*
}
alias -l sphere.iso return $calc(($1 - $3)*0.866+200) $calc(($1 + $3)*0.5- $2 +200)

;Fabric
;Made by BlueThen on May 9th, 2009.
;To install, paste the script in your Remotes (alt + r)
;Then type /fabric or right click the channel or status and click "Fabric"
menu channel,status {
  Fabric: Fabric
}
alias Fabric {
  window -paoCzdk0 +tnbL @Fabric -1 -1 400 400
  %fab.z = 1
  %fab.x = 12
  while (%fab.x) {
    %fab.y = 12
    while (%fab.y) {
      hadd -m X %fab.z $calc(16* %fab.x)
      hadd -m Z %fab.z $calc(16* %fab.y)
      hadd -m D %fab.z $fab.d($hget(x,%fab.z), $hget(z,%fab.z),96,96)
      inc %fab.z
      dec %fab.y
    }
    dec %fab.x
  }
  set %fab.a 1
  fab.frame $iif($1, $1, 4)
}
alias -l fab.frame {
  if ($window(@fabric)) { var %t = $ticks
    clear -n @fabric
    drawfill -n @fabric 1 1 1 1
    %fab.z = 144
    while (%fab.z) {
      %fab.y = $calc(150+15* $sin($calc(%fab.a + $hget(D, %fab.z)*3)).deg)
      %fab.r = $calc(127.52+127.52* $sin($calc(%fab.a + $hget(D, %fab.z)*3)).deg)
      drawdot -nr @fabric $rgb($calc(%fab.r / 2),%fab.r,0) $1 $fab.iso($hget(x,%fab.z),%fab.y,$hget(z,%fab.z)) 
      dec %fab.z
    }
    dec %fab.a 10
    drawline @fabric
    titlebar @fabric - $calc(1000 / ($ticks - %t))
    .timer 1 0 fab.frame $1
  }
  else {
    unset %fab.*
    hfree X
    hfree Z
    hfree D
  }
}
alias fab.iso return $calc(($1 - $3)*0.866+200) $calc(($1 + $3)*0.5- $2 +230)
alias fab.d return $calc((($3 - $1)^2+($4 - $2)^2)^0.5)
