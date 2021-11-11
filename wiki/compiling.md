### Required Packages

1. Make sure to install [Haxe 4.1.5](https://haxe.org/download/version/4.1.5/). Installing this will download haxe to your computer, any later versions is not recommended.
2. You must also download [HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/). This will download well.. what you make the game/mod with? Haha.
3. Make sure to download [Git-SCM](https://git-scm.com/downloads). This is required for downloading things from github.
4. Open a command prompt, make sure to type/copy & paste the commands below. *(Must do steps above first before then.)*

```
haxelib install lime 7.9.0
haxelib install openfl
haxelib install flixel
haxelib run lime setup
haxelib run lime setup flixel
haxelib install flixel-tools
haxelib run flixel-tools setup
haxelib install flixel-addons
haxelib install flixel-ui
haxelib install hscript
haxelib install newgrounds
haxelib install linc_luajit
haxelib git faxe https://github.com/uhrobots/faxe
haxelib git polymod https://github.com/larsiusprime/polymod.git
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
haxelib git tentools https://github.com/TentaRJ/tentools.git
haxelib git systools https://github.com/haya3218/systools
haxelib run lime rebuild systools [windows, mac, linux]
```

A few gamejolt achievement things are needed to be done also.
Click here to get started. --> [Link](wiki/gamejolt.md).

This should be everything that you need to install with HaxeLib, now moving on.

### Required VS-Components
If you are using Windows, make sure to install/download [Visual Studio Community 2019](https://visualstudio.microsoft.com/en/vs/community/). Do **NOT** click on any workloads.. as that will just waste your storage, instead click on "Individual Components" tab, and continue from there, components to install are listed below.. *(This is required to build on windows, if not installed you will not be able to do that.)*

```
MSVC v142 - VS 2019 C++ x64/x86 build tools
Windows SDK (10.0.19041.0)
```

You will need *ATLEAST* 4gb of storage on your main hard drive for this, so make sure you do.
*(I do not know how to compile for MacOS, but I'm sure that Haxe or Youtube has tutorials for that stuff.)*

### Actually Compiling Visual Engine
Now that you have installed *EVERYTHING* from above. *(If you haven't, PLEASE make sure you do or else.)*
You can now start actually compiling the engine! This may take a while for the first time, but it does for everyone.. don't worry.

#### Debug

```
lime test windows -debug
```

#### Release

```
lime test windows -release
```
Or
```
lime test windows
```

#### 32 Bit

```
lime test windows -32bit
```

#### HTML5

```
lime test html5 -debug
lime test html5 -release
lime test html5 -32bit
```

If you want to compile for Linux, Mac, or any of that kind of stuff.. just replace `windows` or `html5` with it, no big deal!

Now that all this is done, you have did it!
You have compiled Visual Engine successfully hopefully, now have fun. :D