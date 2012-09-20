Stone Raider II
===============

&copy; Copyright 1986, 2009-2012 Rolf Michelsen  
All rights reserved  


*Stone Raider II* is a game released for the Dragon microcomputer.  It was licensed to Microdeal and sold for a period of time from 1986.  The game is heavily inspired by *Boulder Dash*, which I played on the C64 at the time and wanted something similar for the Dragon.  The objective of the game is to guide your man to the exit in a series of caves, collecting diamonds along the way.  Diamonds must also be collected to open the exit from each cave.  Watch out for the many hazards that can kill your man.  There are falling boulders and monsters than can mean instant death.  It is also possible to be trapped behind a rock slide or the dreaded slime without any way of getting out before the timer runs out.

There is a total of 25 caves in the game.  Each cave requires a different approach to escape.  Some caves are relatively straight forward, while others require significantly more planning and coordinated movement.

Only joystick control is supported.

See the [Stone Raider II page](http://www.rolfmichelsen.com/stoneraider.html) for more information, including binary downloads that can be used on a real Dragon computer or in one of the many emulators that exist.


Content of the repository
-------------------------

The repository contains the following files and directories.

<table>
<tr><td>Caves</td><td>Directory containing data for the game caves.  There is one file for each cave.</td></tr>
<tr><td>Original</td><td>Original source code exactly as copied from my Dragon diskettes.</td></tr>
<tr><td>StoneRaiderII.txt</td><td>Complete source code in one file.</td></tr>
<tr><td>License.txt</td><td>Licensing conditions.</td></tr>
</table>

Note that this source code is not for the version that was actually released and distributed by Microdeal.  The orignal name of the game was *Dig-It*, but Microdeal requested that the name be changed to *Stone Raider II* when licensing the game to be able to re-use artwork for another game and shorten the time to market.  This version is using the original name.  The source code for the Microdeal version has been lost, but who knows, maybe it will be recovered some day...


Building
--------

The source code was originally written for the *Dskdream* assembler.  It is possible to build the game by running the source code through a compatible assembler and then concatenating the data for the caves.  The source code defines a label, STAG1, which designates the beginning of the data for cave 1.  The data for cave 2 should follow immediately after the data for cave 1, and so on...  In the future, I'll look into a PC-hosted build environment.


Representation of caves
-----------------------

Each file in the Caves directory contains the definition of a single *Stone Raider II* cave.  A cave is always 40 elements wide and 25 elements high.  It is encoded in memory using exactly 509 bytes.  The first 9 bytes constitites a header with some cave meta-data.  The remaining 500 bytes contain the actual cave data.  Each cave element is represented by 4 bits.  The most significant nibble of the first data byte represents the top left cave element.  The least significant nibble of the first data byte represents the second element in the top row of the cave, and so on...

The cave header contains the following information:

<table>
<tr><th>Offset</th><th>Description</th></tr>
<tr><td>0</td><td>The starting bonus for this cave (0 - 255).</td></tr>
<tr><td>1-3</td><td>Number of points scored for each diamond collected, encoded as three BCD digits.</td></tr>
<tr><td>4</td><td>Number of diamonds to collect before the cave exit appears.</td></tr>
<tr><td>5</td><td>Vertical offset of game window (0 means that top cave row is shown).</td></tr>
<tr><td>6</td><td>Horizontal offset of game window (0 means that left cave edge is shown).</td></tr>
<tr><td>7</td><td>Vertical offset of player character in game window (0 means man is in top visible row).</td></tr>
<tr><td>8</td><td>Horizontal offset of player character in game window (0 means man is in leftmost visible column).</td></tr>
</table>

In the cave data itself, 4 bits encode each cave element.  The table below lists the possible cave elements.

<table>
<tr><th>Value</th><th>Description</th></tr>
<tr><td>0</td><td>Skull monster, prefers making right turns, turns into diamonds when killed.</td></tr>
<tr><td>1</td><td>Alien monster, prefers making left turns, explodes when killed.</td></tr>
<tr><td>2</td><td>Explosion stage 1.</td></tr>
<tr><td>3</td><td>Explosion stage 2.</td></tr>
<tr><td>4</td><td>Explosion stage 3.</td></tr>
<tr><td>5</td><td>Explosion stage 4.</td></tr>
<tr><td>6</td><td>Player.</td></tr>
<tr><td>7</td><td>Slime.</td></tr>
<tr><td>8</td><td>Dug out tunnel.</td></tr>
<tr><td>9</td><td>Dirt.</td></tr>
<tr><td>10</td><td>Exit.</td></tr>
<tr><td>11</td><td>Diamond.</td></tr>
<tr><td>12</td><td>Stone.</td></tr>
<tr><td>13</td><td>Wall.</td></tr>
<tr><td>14</td><td>Cave border.</td></tr>
<tr><td>15</td><td>Hidden exit.</td></tr>
</table>

Note that some elements behave differently in certain caves.  This is hardcoded in the program code itself and cannot be changed by altering the cave representation described in this section.




Licensing
---------

*Stone Raider II* is released under an open source license.  See the file License.txt in this repository for details.

