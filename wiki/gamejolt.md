# Visual Engine Gamejolt Integration
Wanna add your own achievements? You can learn how to do so here.

**NOTE: If you are doing this just so your game can run, no need to make a gamejolt game and everything.. Just add GJKeys.hx and you should be fine, also make sure to remove the GameJoltAPI.getTrophy(); too, and you should be set.**

## Getting Started
Alright, time to get started.
Well.. Because most of this tutorial is on Tenta's Repo, click here to follow it. --> [Link](https://github.com/TentaRJ/GameJolt-FNF-Integration).

Are you SURE you followed it? You must follow it before starting.
Alright.. Great.

Here are some things you may want to change before you get to your achieve adding:

**`In GJKeys.hx` (Add this file)**
```haxe
package;
class GJKeys
{
    public static var id:Int = 	0; // Put your game's ID here
    public static var key:String = ""; // Put your game's private API key here
}
```
Change the `id` variable, to your game id.. you can find it on your gamejolt API page. *(Or get it from the website url itself)* `EX: games/(GAME_NAME)/(GAME_ID)`
Also.. Make sure you add your game's private API key. Should be in the game's API section.
`EX: games/(GAME_ID)/api`
***DO NOT SHARE YOUR API KEY AT ALL! THIS IS VERY DANGEROUS AND USERS CAN USE IT TO MESS UP YOUR GAME.***

**`In MainMenuSate.hx`**
```haxe
GameJoltAPI.getTrophy(151709);
```
Make sure to change/remove this.. or else your game may break or something.
This is a trophyID from the Visual Engine Gamejolt Page, this will not work with your game. *(Unless you keep our ID there, still not sure.)*

After all that mess, you should be done!
Go ham with all those achievements/trophies you are gonna giveout, haha. *(Or not, they may be EXP abuse for gamejolt lol)*
