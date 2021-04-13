--------------------------------------------------------------------------
       SSSSSSSSSSSSSSSSSSS                                                                                                  
     SSSSSSSSSSSSSSSSSSS                                                   
    SSSSSS                                                                                            
   SSSSSS                                                                                                               
  SSSSSS                                                                                                              
  SSSSSSSSSSSSSSSSSSSS  PPPPPPP  AAAAAAA  CCCCCCC  EEEEEEE                                                           
  SSSSSSSSSSSSSSSSSSS  PP    PP AA   AA  CC       EE                                                               
              SSSSSS  PP    PP AA   AA  CC       EE                                                               
             SSSSSS  PPPPPPP  AAAAAAA  CC       EEEEEEE                                                          
            SSSSSS  PP       AA   AA  CC       EE                                                               
           SSSSSS  PP       AA   AA  CC       EE                                                               
SSSSSSSSSSSSSSSS  PP       AA   AA  CC       EE                                                                
SSSSSSSSSSSSSSS  PP       AA   AA  CCCCCCC  EEEEEEE                                                              
 
              FFFFFFFFFFFFFFFFFFF                                                                                      
             FFFFFFFFFFFFFFFFFF                                                                                          
            FFFFFF                                                                                                       
           FFFFFF                                                                                    
          FFFFFF                                                                                                       
         FFFFFFFFFFFFFFF   II  GGGGGG   HH    HH TTTTTTTT  EEEEEEE  RRRRRR                                            
        FFFFFFFFFFFFFF    II  GG       HH    HH    TT     EE       RR  RR                                                
       FFFFFFFFFFFFF     II  GG       HH    HH    TT     EE       RR  RR                                                   
      FFFFFF            II  GG       HHHHHHHH    TT     EEEEEE   RRRRRR                                                     
     FFFFFF            II  GG  GGG  HH    HH    TT     EE       RR  RR                                                      
    FFFFFF            II  GG    G  HH    HH    TT     EE       RR   RR                                                     
   FFFFFF            II  GG    G  HH    HH    TT     EE       RR    RR                                                   
  FFFFFF            II  GGGGGGG  HH    HH    TT     EEEEEEE  RR     RR
--------------------------------------------------------------------------

--------------------------------------------------------------------------
SpaceFighter V1.40 - A Game 4 mIRC
--------------------------------------------------------------------------

Web: http://www.spacefighter.cjb.net/
Email: j_ustin_@hotmail.com

*NOTE* 
Unfortunately I ran into a bug between mIRC and Windows during the
creation of SpaceFighter in which i cannot directly fix.
Unless you like seeing orange borders around your ships and various other images
in the game it is advised to run your windows operating system in a 32Bit Colour Depth. 
(For More Information Check Trouble Shooting)

Contents:
         -
         1)  Introduction
         2)  Features
         3)  Requirements
	 4)  Installing
	 5)  G.U.I
	 6)  How To Play
	 7)  Starting A Game
	 8)  Playing
	 9)  Game Controls
	 10) Tactics
	 11) Chatting & Server Commands
	 12) Game Settings
	 13) FAQ & Known Bugs
	 14) Triggers
         15) Making Maps
         16) Support
	 17) Reconizing
         18) A Big SHOUT OUT
	 19) Non SpaceFighter
	 20) Final Thoughts
         -

--------------------
Introduction:
--------------------

Thankyou for downloading SpaceFighter.

For those of you that dont know SpaceFighter is a Multiplayer SpaceShootem up game
scripted in mIRC. The originally idea for SpaceFighter game was brought upon by
the wicked multiplayer game SubSpace (Now called Continuum). 

The script SpaceFighter began almost 8 months ago when I was stuck for ideas on what to 
script. The bulk of the code was written when I was inspired by the new version of Tanks 
being released. Tanks inspired me to continue scripting on what seemed to be an almost 
impossible task.

Considering that my original intentions for SpaceFighter to be just a game I am very 
surprised now at how far things have come. It may not seem like much but Spacefighter 
has involved tiresome hours of scripting and debugging. Almost three quarters of the
multiplayer protocol was scripted blindfolded, what I mean by that is that I had no
internet connection or test partner to confirm that my scripting was bug free.

99.9% Of the code in SpaceFighter was written by myself... even the dialogs were hand
made, no programs or scripts used to create them. Check the SHOUT OUT section in this
document to see the great people helped me out or created some code.

--------------------
Features
--------------------

SpaceFighter has many features some of which haven't been in any other mIRC scripts.

Below are some of the features used in SpaceFighter:

SpaceFighter Is A Real Time Action Game
Both TCP & UDP connections are used to convey data between the server and users.
UDP Flood & Fake Packet Protection
UDP data compiling and decompiling to reduce number of packets being sent.
Map Support
Auto GameSpeed Configuration System
MultiFire System
Game Master Server List
Random Background Creation
MapMaker/Editor
A Cool Chat Edit Box
Pic Window ServerList - Looks Sweet
Game Settings [ Performance Settings ]

--------------------
Requirements:
--------------------

Anything above the below specs should run great.

PII/III/Celeron/AMD 400 Mhz 
64/128mb ram
Windows 9X, ME, 
(SpaceFighter has not been tested by myself on Windows 2000 & XP. 
If you are having display problems this could be the cause)
mIRC 6.01
32-bit Window Colour Depth
1024 * 768 Or Higher Screen Resolution ( You need this )

If SpaceFighter in run a screen resolution any lower than this it will not display correctly

Most importantly SpaceFighter needs a good internet connection that can support both
TCP & UDP sockets. A Fast internet connection would be great.

SpaceFighter will not run through a firewall or a socks 5/proxy connection
However it may be possible to forward SpaceFighter ports on a firewall

There are no plans to add socks5/proxy support for SpaceFighter.

The game was constructed on 2 computers. 
It runs quite well on them both

( ))------------------( )) (( )------------------(( )
 | Computer 1) Desktop |     | Computer 2) Laptop  |
 | PIII                |     | PIII                |
 | 550 Mhz             |     | 900 Mhz             | 
 | 128mb sdram         |     | 128mb sdram         |
 | Windows 98          |     | Window ME           |
( ))------------------( )) (( )------------------(( )

Both computers had a resolution higher than or equal to 1024 * 768

It is highly recommended that SpaceFighter is not used simultaneously with other
highly demanding scripts.

------------------
Installation:
------------------

Step By Step Instructions:

After downloading the SpaceFighter zip file and reading my above words of wisdom please
follow the below instructions to carefully to install the SpaceFighter.

Step 1) 
Open the spacefighter.zip file and extract all the files into your mIRC dir (directory).
I repeat the word extract because a new folder will be created in your mIRC dir from
the extraction.

Your default mIRC dir is usally: c:\mIRC

Step 2) Run mIRC

Step 3) Load SpaceFighter by typing /load -rs spacefighter\spacefighter.mrc

Step 4) Complete the speed test ( You will know what I am talking about when you come to it.
The speed test optimises your game speed to suit your mIRC processing speed. )

Step 5) Installation Complete!, Now read the rest of this document.

Step 6) To bring up the default menu screen for SpaceFighter type /spacefighter

------------------
G.U.I:
------------------

I believe that the G.U.I of SpaceFighter is fairly easy to navigate through.
(That's why I made it that way)
-

The first G.U.I of mine that you should encounter is the "Menu" Screen.
(Using the command /spacefighter will get you there)
To Navigate through it all you need do is use you mouse to hover over the selection
text. And then click on the text that refers to the area of the game you wish to visit.

-
The "Loading" Screen

This is the screen you are presented before entering a game. It shows you everything
that your computer is doing when it is connecting to the server.

Unlike the mIRC Chat GUI. The first line of data you see being displayed on the 
loading screen is the last line of data displayed by SpaceFighter. I know its confusing
but it looks much better and makes sense when comparing it to the graphics in the game.

On the top of the Loading Screen you will notice the SpaceFighter titlebar.
The titlebar will give you a real time account of the stage in which the game
has downloaded and cached maps.

------------------
Starting A Game:
------------------

I think the hardest part in the whole SpaceFighter project is explaining to you guys
on how to use SpaceFighter. I have tried to make it as simple as user friendly as possible
but you still may be a little confused.

To start SpaceFighter type /spacefighter in mIRC or use the popup menu's I have written.

Technical Commands: 

(Some of these commands should only be used by advanced users  who are 
experienced in sockets and raw connections. However there pretty simple to use)

To start SpaceFighter and get into the default menu type:
/spacefighter
(You may also enter SpaceFighter from the popup menus)

To Run A User defined connection type: 
/spacefighter -c [ ip/addy ] [ port ] [ server name (optional) ] 

To Run A Speed Test type:
/spacefighter -st

To Run A Test Connection type: 
/spacefighter -ct
(Test connections can only be used in conjunction with a local server local as in running on the same computer)

To Manually Set A Default Ip Address For Client Connections type:
/spacefighter -ip [ ip address ]
(This will stop SpaceFighter from using the default mIRC Ip. This gives people with external ips the chance
to play.)

To Open The Help File type:
/spacefighter -h
(This is the helpfile)

-

Joining/Finding Games:
Currently I have had no plans to add a one player game of SpaceFighter.
So the way we play is online and against each other.
Listed below are instructions on how to join someone else's server and play against
them and other people.

Step 1) Run SpaceFighter by typing /spacefighter
Step 2) Click the text labelled "Find Games" in the SpaceFighter Menu.
Step 3) The "Server List Window" will appear and SpaceFighter will connect to the master server and download current game data.
Step 4) Select a server you wish to join and click the button labelled "Join". 
Step 5) SpaceFighter will try and establish a connection with the server and sync data. If you do not have the
map that server is playing on it will download it.
Step 6) 
The server will perform a UDP Test, if this fails don't stress. 
Try and rejoin otherwise check that
mIRC has detected your ip.
If mIRC hasnt detected your ip you can specify one by typing /spacefighter -ip [ ip addy ]
Otherwise type /localinfo -uh in mIRC (Usally fixes any UDP problems)
Step 7) Select a ship. Once a ship is selected SpaceFighter will cache and load the map.
Step 8) You will enter the game, there may be a brief pause before you see the other players
due to connection lag but all should be fine.
Step 9) That's it

By the way: If there are no servers... Please create one!

-

Creating A Server:

It is important to remember that SpaceFighter servers use allot of mIRC resources.
They have to packet and compile data for up to 4 users and do other misc things.
It is advised that you don't run a server and a game of SpaceFighter on the one mIRC.
Instead devote 2 mIRCs to SpaceFighter, one to run as a dedicated server and the other one
to play on.

Step 1) Get into SpaceFighter by typing /spacefighter
Step 2) Click the text labelled "Create Server" in the SpaceFighter Menu.
Step 3) Enter the following details into the dialog:
* A Server Name
* A Default Port ( If you don't know what this is then leave it as its default 8989. )
* An Ip Address ( SpaceFighter will try and retrieve this automatically, if it cant retrieve it then either try
and enter one manually. )
[ Note SpaceFighter does not currently support domains... please dns them before using them as your ip* ]
* Select The Max number of players on your server 
( It is advised that if you have a 56k connection or lower to only have 2 players at a time. )
Step 4) Select the button "Map Selection" and select a map you wish your server to play on.
Step 5) Select the button "Bandwidth" and configure a bandwidth setting in which you wish to use.
Step 6) Select Activate
Step 7) Remember closing the server dialog will cause the server to be shutdown.

*Note* 3 Ports Are Reserved For The Server: 
Port1(Default Port) [UDP]
Port2(Default Port - 1) [UDP]
Port3(Default Port + 1) [TCP]

E.g If Port 8989 is selected the following ports will be used:

Port: 8989 [UDP]
Port: 8988 [UDP]
Port: 8990 [TCP]

-

Server Commands

/spacefighter -smgs This is a server message

The above command will send a msg to all active users on your server.
--------------------------
Playing SpaceFighter:
--------------------------

Once you have successfully joined a game you should be ready to learn how to play it.

How the game is played: 
Once in a server you have the opportunity to play against up to 3 other players in an arena.

The arena is your playing field and will vary on each server you play on according
to the map the server uses.

SpaceFighter has map support ability which means a server can create/edit their own
maps.

The aim of the game:
The aim in SpaceFighter is to frag your opponents as many times as possible. 
Each frag will increase your score.

You achieve frags by flying around and shooting your opponents until they explode. Your opponents will be trying to do the
same thing and in some instances you may be outnumbered.

-------------------------
Game Controls
-------------------------

Controls: 

Up Key: Increase Speed

Down Key: Decrease Speed

Left Key: Turn Left ( Spin Left )

Right Key: Turn Right ( Spin Right )

Space Bar: Fire ( Shoot A Bullet, Note shooting will decrease your energy. You must learn to moderate your shooting and
allow your energy to recharge. If you are shot by another player with a 0 or below energy level you will crash n burn. )

T/Enter: Pressing the "T" or "Enter" key will bring up the msg box. 
[ You can send players msgs here and perform other commands. ( See Below ) ]

Tab Key: Pressing this once will display the score window. Pressing it again will close 
the score window.

1,2,3: These keys will change your ship and warp you to your start location so long as your energy is full

W Key: This key will warp you back to your start location.

-------------------------
Tactics:
-------------------------

Try and vary your shooting. Shooting will decrease your energy and may subsequently lead to your ship exploding. 
Remember just because your firing like threes no tomorrow at your opponent doesn't mean your going to win. 
Your opponent may wait until your energy is low and get one shot in at you and kill you.

Game lag may leave your shooting off target... try and anticipate an opponents position.

Bounce Off Walls, bouncing off walls will allow you to change direction quickly and subsequently
confuse your opponent. 

Green Areas, Green areas are considered safe zones. You can not attack nor be attack in safe zones. They are there
for your and others protection.

-----------------------------
Chatting & Server Commands:
-----------------------------

Chatting can be accomplished by pressing the "Enter" or "T" key on your keyboard.
You can enter a msg here to other players.

Commands you can use in the SpaceFighter chat box.:

/msg ToKeN Hi ToKeN, you rock.
//ToKeN Hi ToKeN, you rock.
[ The above two commands can be used to msg a player privately. ]

/me Ses Hi [ Action, This Will Print: *ToKeN Ses Hi* ]

?ping [ This command will ping the server and tell you the lag in ms between you and the server ]
?packet [ This command will tell you the packet loss between you and the server. ]
?data [ This command will tell you the amount of data the server has sent and received during its lifespan ]
?users [ This command will tell you the total number of users that have joined the server during its lifespan ]

*Note* mIRC Commands are not supported in the chat edit box.

-----------------------------
Game Settings
-----------------------------

For pure performance I have added the Game Settings Dialog which enables
a user to configure the type of display you wish SpaceFighter to use.

There is also an option for uses who are experience problems with the chat edit box.
They can change this to a dialog and vice versa.

There is also an option to change window modes for uses who prefer windows that minamize

-----------------------------
F.A.Q & Known Bugs
-----------------------------

Q. Why do my ships and various other graphics in the game appear fuzzy or have orange
borders? Or why do my in game graphics in general look stuffed?

A. During beta testing I ran into a bug that was either caused by mIRC or windows. I
could not fix the properly directly or create a scripted patch. The bug is caused when
switching colour depth in windows. If you switch your colour depth to 32-bit the game
should run without any problems however 16bit causes orange borders and various other 
display bugs.

The game requires a screen resolution of no lower than 1024 * 768
-

Q. Why can't my server connect to the server list?/Why can't I connect to other servers?

A.  
There is a problem with your internet connection. If you are running a firewall disable it.

SpaceFighter will not run through a proxy/socks 5 connections

-

Q. Why does SpaceFighter hang at " You Do Not Need To Download The Map "?

A. For some reason when another user is downloading a map off the server someone else cannot join.
   I am yet to fix this bug but it shouldn't really cause to many problems
-

Q. 
Why does SpaceFighter hang at " Testing UDP and Joining Game "?
Why Does SpaceFighter say that the "UDP Test Failed"?

A. Your internet connection is not supporting UDP sockets properly or the ip that mIRC has detected
has not matched your real ip.

Reasons for this are:
1) mIRC hasnt detected your ip... just type /localinfo -uh usally solves the problem
1) You have a firewall running or your connecting through a socks 4,5/proxy connection
2) mIRC is having problems retrieving your ip address. You can enter one manually by typing
/spacefighter -ip [ address ] 
Use /run winipcfg in mIRC to see what Ip Windows has detected as yours.
If you are using a Linux router then use /spacefighter -ip [ routers ip address ]

-

Q. Why does mIRC need such powerful computers to run games that could run better on my mobile
phone?
 
A. If you haven't noticed already mIRC has some slight speed issues which in fact causes
processing to function so much slower then your actual cpu speed.

The speed in which mIRC process at is determined by many of factors. These factors include processor speed and the amount of
ram in ones computer.

-

Q. Why can't I see any servers on the server list?

A. If the server states that it could not connect then there is a problem with your internet
connection. This problem could either be because you are connecting to the internet through
a firewall or a proxy/socks 4,5 connection.

The other reason could be that there are just no servers running, in that case set one up yourself.
Or the server list is down.

-

Q. Why am I getting a frame rate of under 10fps?

A. Your mIRC is having trouble processing to SpaceFighters need. 
If you are running a SpaceFighter server then it is advised that you play SpaceFighter on 
a different mIRC.

-

Q) Why is my Chat/Edit Box is not appearing in the correct position or is covering chat text?
R) This is a fault with mIRC/Windows where the position of the windows taskbar
effects the position of windows in mIRC. You can correct this by switching
to dialog mode in "Game Settings".

-

Q. Why am I having various problems with the mapmaker?

A. The mapmaker was first only intended for my use. I decided to improve on it so that all users could
create their own maps to play on.
The mapmaker is only in early stages and should be fixed by version 2.0

Known Bug/Problems:
P = Problem
R = Reason

P) Chat/Edit Box not appearing in the correct position
R) This is a fault with mIRC/Windows where the position of the windows taskbar
effects the position of windows in mIRC. You can correct this by switching
to dialog more in "Game Settings".

P) Sometimes SpaceFighter is laggy as hell and sometimes it's fast. 
R) This is a problem caused by the demand by scripts on mIRC. The only way to correct
laggy speeds is to quit a game and rejoin it or really reboot your comp. You can also
adjust game performance by using the "Game Settings" dialog.

P) Ships Get Caught In Walls
R) When turning mIRC devotes processing to turns, and as a results mIRC slows SpaceFighter
ship position processing. This therefore creates a minute gap from where a ship can spin into a wall
and get caught. Also slower computers will have higher speeds to compensate for their laggyness.
It's these high speeds which may throw a ship into a wall because error checking wasn't available
until the ship has moved into the wall

-------------------------------
Triggers
-------------------------------
SpaceFighter in version 1.30 now supports custom triggers. Custom triggers can be created and edited
in the server dialog ( /spacefighter -cs ).

Triggers must be in the format ?trigger

Examples:
?Trigger
?help
?hello

Each trigger must begin with a question mark

Once triggered a trigger can do one of two things, either instantly reply a message to the triggering user
or execute a local command.

-------------------------------
Making Maps
-------------------------------

All default SpaceFighter maps were made using the SpaceFighter MapMaker, they were however
edited manually to correct a few minor problems the MapMaker was creating.

-

The MapMaker allows users to create SpaceFighter maps easily without having to deal with
raw code. The first release of the MapMaker is in beta mode. I know there are some bugs
but it still allows you to create maps fairly easily, you can most likely correct these bugs
by editing the raw code.

-

Using the MapMaker:

To get into the MapMaker you only have to type /spacefighter then select MapMaker from the
menu.

Once in you will be able to select to "Load an old map" or "Create A New Map".

If you have been working on a map and wish to resume it you just need to reload it.

If you wish to create a new map you select "Create A New Map".

Once you have done that you will be asked to enter the map details. The details for the map can be 
later changed.

The file name of the map will be [ the name of the map ].spf .

All SpaceFighter Maps End In [ .spf ]

-
How to construct a good map:

Make sure that if you are making walls/tunnels etc.. that they are spaced by the width
of 4 blocks... This gives players plenty of room to move and helps preventing turning
problems.

Also create small well positioned safezones ( they are however not necessary )
-

Constructing a map without the use of the mapmaker or using raw code to edit a map.

Maps are not hexed or in binary they are plain ASCII text, this makes it easy for them
to be edited.

Maps can be made and edited in NotePad.

The first 3 lines of the Map must be as followed:

tag,SpaceFighter,build,version

The above line is a tag in which use to define a few things.
The first thing that we define to the map reader is that we are using SpaceFighter 
The next thing being the build number of SpaceFighter which can be retrieved by typing /spacefighter -build
The final thing being the version of SpaceFighter we are using this can be retrieved
by typing /spacefighter -version

-

t,The title of this map is this sentence.

The next line (Line 2) is the title we define this by using the line

-

c,This is the a comment.

The 3rd line is the comment we attach to the map... this is optional but the comment
line must be inserted otherwise the map will create errors.

-

sp[User Number],x,y

The fourth thing we must attach is the starting location of each player.

Note user number 1 does not exists in SpaceFighter, we instead call it user number
5. Player number 1 exists however and is defined by the term user 5.

-

Below is an example of the first 7 lines in a SpaceFighter Map. The below code works:

tag,SpaceFighter,231658196,1.00
t,Dual Zone(2)
c,Original SpaceFighter Map Made By ToKeN
sp5,21,221
sp2,102,217
sp3,607,219
sp4,529,218

-

After the necessary tag information is attached to the map we can then define where we want
blocks & safe zones to be placed... Unlike in the map maker blocks can be placed where ever
you want... for instance the mapmaker automatically grids the blocks/safezones so they do 
not overlap. Raw code however gives you the freedom of unlimited blocks/safezones and endless
positions.

b,x,y,0 0 15 16
s,x,y,0 16 15 16

b stands for block
s stands for safezone

These can be placed anywhere in the map file along as they are not in the first 7 lines

The 0 0 15 16 and 0 16 15 16 are needed for the MapMaker and are considered mandatory.. they should be left as they are
any bigger/smaller and the perimeter of the blocks/safezones will be larger/smaller than they actually
are. The blocks/safezones will however look the same on the map.

An example below of how it should look:

b,630,0,0 0 15 16
b,645,0,0 0 15 16
s,15,30,0 16 15 16
s,30,15,0 16 15 16

------------------------------
Support
------------------------------
Currently I have no need for any other scripters to join the SpaceFighter project, hell i got this far alone. 
If you want to make ships and maps feel free to send them too me. 

If you wish to support the SpaceFighter cause, send me some email, run a server and play the game whenever you
can!

Currently I need servers up and people playing the game... i need suggestions and anything else you can throw at
me.

------------------------------
Reconizing
------------------------------

SubSpace fans would have no doubtedly noticed that SpaceFighter has a close relation with SubSpace.
As I stated earlyier my original idea was to create a game that would be like SubSpace.

Unfortuanetlly my lacking computer drawing skill forced me to borrow some images from the game SubSpace to make
SpaceFighter what it is. 

I borrowed some of the background images from SubSpace and applied them for use in SpaceFighter.
Those images now create random backgrounds which look quite impressive in SpaceFighter. 

I also used 2 ships from the Subspace Starwars Shipsets (Im unsure if this is an official Subspace file and im
unsure of the authur), that is the X-Wing and the TIE Fighter this is because i can't draw an X-Wing or
TIE Fighter for #$%# and so many people were wanting me to put them in.

And yes the explosion was taken from the Subspace game as well.

All the other graphics in the game were created by myself.

So i give full credit for the images I took to the Subspace Creators.

htpp://www.subspacehq.com/

The game is now called Continuum btw.

-------------------------------
A BIG SHOUT OUT
-------------------------------

SpaceFighter has been a massive project and without the following people it wouldn't have
been possible.

BETA TESTERS:

Goku_Jnr A.K.A Goku_Jnr[Away]
Snow_Death
Heretic`
PCHD
Helmet
Br4nd0n
ProXieS
Helmet
Memo
Fubar
YoshinO
Macheath A.K.A Ed

Robin_R_R A.K.A Winkie: Helped me in a big way by beta testing... also the first person
to see a SpaceFighter ship move over udp connection!

Br4nd0n: Helped alot, he found almost all of my spelling errors, silly mistakes and he ran
a server for a good while.

Also SHOUTING out in a big way to:

DukeNukemBR for his ingenious map standard from which without SpaceFighter would most
probably not have map support... Thanks man and keep up the wicked mIRC game scripting

Xiao-wen-zi for the wicked energy bar idea... also keep up the wicked scripting.

SHOUTING OUT in the biggest way to:

All the people that are reading this and that have downloaded SpaceFighter, setup servers
and are playing it as I speak.

All the people that have Found bugs/submitted problems and have given me new ideas.

All the scripters that have helped me to learn the skill... got to give a SHOUT OUT the
#scripting and #helpdesk channels on DalNet.

All the scripting websites that have and still do house my scripts!

Michael Franti - You are keeping the peace and making some pretty funky tunes @ the same time.

Subspace Creaters.

And the biggest SHOUT OUT too:

Khaled Mardam-Bey... need i say more?

-------------------------------
Non SpaceFighter Stuff:
-------------------------------

Name: Justin Mammarella
Age: 15
Birth date: 30/10/1986
Location: Melbourne, Australia
Net Alias: ToKeN 
Email: j_ustin_@hotmail.com

Other Scripts I Have Made:

The Old Skool Collection:
(You wont be able to find these scripts anymore
only a few people have them after mirmod.net closed down)

ToKeN ScRiPt 1 & 2
ToKeN ScRiPt Bot Style Ver 1 & 2
Superpong
Remote Connector
The Lobby ( Matrix Game )
MirCraft ( War Strategy Game For mIRC ) [ good luck ]
Pic2mIRC ASCII
Snaker
Heaps of other stuff

Nu Skool:
MSN Messenger Client
User List ( Creates a list of all users on an iRc server )
WickedWindows ( Creates non rectangled shape windows )
SpaceFighter

-

A bit about myself.
Well as I wrote above im a 15 year old male living in 
Melbourne Australia. 

I've been scripting for nearly 2 to 3 years now but it's been
on and off. Most times ive gotten bored and stopped because of lack
of knowledge and various other things.

I started SpaceFighter and scripting as a hobby, Ever since i can remember ive always wanted
to learn how to program.  

I used my first computer at the age of six and I don't think ive gotten off one since
then.

Oh yeh, If your wondering cos i know alot of people ask me this if i have a life, then the answer is yes.

-

What I Like Doing:

Listening to Music (It's my life)
Playing Guitar
Making Music
Breakdancing 
Going To Parties
Going To Clubs
Going out.. 

-

What I was hoping to get out of this:

A good paying job that will make me heaps of money, a sexy girlfriend, world peace and
more freetime. If anyone can make these things possible please email me @ j_ustin_@hotmail.com

------------------------------
Final Thoughts:
------------------------------

This is probably the last full script you will ever get out of me. Hopefully i can learn a real programming language.
SpaceFighter's development has been stretched over 6 to 8 months and I can't really be f#%#$ spending the time on another
script like this, well not yet anyway. I will make updates whenever I can because there's been just too much 
work done on this script so far not to not make updates. Besides, this is just the beginning of a great game
well I hope anyway.

I hope you enjoy SpaceFighter and get a kick out of it.
Feel free to ask me questions at the email addy of j_ustin_@hotmail.com

Peace out!