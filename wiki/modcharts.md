# Visual Engine Modcharts
Visual Engine is again built over Kade Engine 1.5.1, so it has the modchart features from that version..
But we decided to also add a few functions of our own.. which we are still developing as we go.

In order to run a modchart, you must make a `modchart.lua` file in your `data` folder of your song.
Example: `data/milf/modchart.lua`
This is also where you will be putting your LUA code for the modchart.

If there is no `modchart.lua`, nothing will work. *(Also MUST be exactly modchart.lua)*

## Default Main Functions

```lua
function start (song)

end

function update (elapsed)

end

function beatHit (beat)

end

function stepHit (step)

end
```

`keyPressed` also exist, its just not used much. *(Well as I see it isn't, haha)*
If you would like to see examples of some modchart features from Kade Engine 1.5.1 being used, click on the link below please, it will link you to the modchart page. *(Same thing for global variables, etc, as long as its from KE 1.5.1)*

## VisualE Functions

*--> [Default Kade Engine 1.5.1 M-Functions](https://github.com/KadeDev/Kade-Engine/blob/1.5.1/docs/modchart.md)*

### camShake()

Usage:
`camShake(intense:Float)`

The duration goes for as long as the `curStep` is, then it will go away.