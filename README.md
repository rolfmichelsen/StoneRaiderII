Stone Raider II
===============

*Stone Raider II* is a game released for the Dragon microcomputer.  It was licensed to Microdeal and sold for a period of time from 1986.  The game is heavily inspired by *Boulder Dash*, which I played on the C64 at the time and wanted something similar for the Dragon.  The objective of the game is to guide your man to the exit in a series of caves, collecting diamonds along the way.  Diamonds must also be collected to open the exit from each cave.  Watch out for the many hazards that can kill your man.  There are falling boulders and monsters than can mean instant death.  It is also possible to be trapped behind a rock slide or the dreaded slime without any way of getting out before the timer runs out.

There is a total of 25 caves in the game.  Each cave requires a different approach to escape.  Some caves are relatively straight forward, while others require significantly more planning and coordinated movement.

Only joystick control is supported.

See the [Stone Raider II page](http://www.rolfmichelsen.com/stoneraider.html) for more information, including binary downloads that can be used on a real Dragon computer or in one of the many emulators that exist.


Content of the repository
-------------------------

The repository contains the following files and directories.

Location            | Description
:-------------------|:--------------------
Caves               | Directory containing data for the game caves.  There is one file for each cave.
Original            | Original source code exactly as copied from my Dragon diskettes.
StoneRaiderII.txt   | Complete source code in one file.
License.txt         | Licensing conditions.

Note that this source code is not for the version that was actually released and distributed by Microdeal.  The original name of the game was *Dig-It*, but Microdeal requested that the name be changed to *Stone Raider II* when licensing the game to be able to re-use artwork for another game and shorten the time to market.  This version is using the original name.  The source code for the Microdeal version has been lost, but who knows, maybe it will be recovered some day...


Building
--------

The source code was originally written for the *Dskdream* assembler.  Thanks to KanSpain, the source code has been modified to build with a Windows or Linux hosted development environment.  You will need the following tools for building:

* [lwtools](http://lwtools.projects.l-w.ca/)
* [bin2cas.pl](http://www.6809.org.uk/dragon/)

Compile the game into a CAS file with the following commands:

```bash
lwasm -9 -b --pragma=m80ext -o StoneRaiderII.bin StoneRaiderII.asm
bin2cas.pl -o StoneRaiderII.cas -n STONRAID --autorun -C StoneRaiderII.bin
```



Representation of caves
-----------------------

Each file in the Caves directory contains the definition of a single *Stone Raider II* cave.  A cave is always 40 elements wide and 25 elements high.  It is encoded in memory using exactly 509 bytes.  The first 9 bytes constitutes a header with some cave meta-data.  The remaining 500 bytes contain the actual cave data.  Each cave element is represented by 4 bits.  The most significant nibble of the first data byte represents the top left cave element.  The least significant nibble of the first data byte represents the second element in the top row of the cave, and so on...

The cave header contains the following information:

Offset  | Description
:-------|:--------------------
0       | The starting bonus for this cave (0 - 255).
1-3     | Number of points scored for each diamond collected, encoded as three BCD digits.
4       | Number of diamonds to collect before the cave exit appears.
5       | Vertical offset of game window (0 means that top cave row is shown).
6       | Horizontal offset of game window (0 means that left cave edge is shown).
7       | Vertical offset of player character in game window (0 means man is in top visible row).
8       | Horizontal offset of player character in game window (0 means man is in leftmost visible column).

In the cave data itself, 4 bits encode each cave element.  The table below lists the possible cave elements.

Value   | Description
:-------|:-------------------------
0       | Skull monster, prefers making right turns, turns into diamonds when killed.
1       | Alien monster, prefers making left turns, explodes when killed.
2       | Explosion stage 1.
3       | Explosion stage 2.
4       | Explosion stage 3.
5       | Explosion stage 4.
6       | Player.
7       | Slime.
8       | Dug out tunnel.
9       | Dirt.
10      | Exit.
11      | Diamond.
12      | Stone.
13      | Wall.
14      | Cave border.
15      | Hidden exit.

Note that some elements behave differently in certain caves.  This is hardcoded in the program code itself and cannot be changed by altering the cave representation described in this section.


Licensing
---------

*Stone Raider II* is released under an open source license.  See the file License.txt in this repository for details.

---
Copyright 1986, 2009-2024 Rolf Michelsen
