package;

import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
import Sys.Sys;
#end

using StringTools;

class MainMenuState extends MusicBeatState
{
	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	#if !switch
	var optionShit:Array<String> = ['story mode', 'freeplay', 'donate', 'options', 'credits', 'changelog', 'quit'];
	#else
	var optionShit:Array<String> = ['story mode', 'freeplay'];
	#end

	var newGaming:FlxText;
	var newGaming2:FlxText;
	var logoBl:FlxSprite;
	var visualLogoBl:FlxSprite;
	var girlfriend:Character;
	var options:TweenOptions = {type: PINGPONG};

	public static var firstStart:Bool = true;

	public static var nightly:String = "";

	public static var visualEngineVer:String = "1.0-B" + nightly;
	public static var gameVer:String = "0.2.7.1";

	// var magenta:FlxSprite;
	var flickerColor:FlxSprite;
	var camFollow:FlxObject;
	public static var finishedFunnyMove:Bool = false;

	override function create()
	{
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('menuDesat'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.3));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		bg.color = 0xFFfd719b;
		bg.flipX = true;
		add(bg);

		// Tween that shiz
		FlxTween.color(bg, 3, FlxColor.GRAY, 0xFFfd719b, options);

		/*girlfriend = new Character(FlxG.width * 0.4, FlxG.height * 0.07, 'gf');
		girlfriend.scale.set(0.8, 0.8);
		girlfriend.scrollFactor.set(0, 0);
		girlfriend.playAnim('cheer');
		add(girlfriend);*/

		if (!Main.watermarks) {
			logoBl = new FlxSprite(-150, -100);
			logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
			logoBl.antialiasing = true;
			logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
			logoBl.animation.play('bump');
			logoBl.updateHitbox();
			logoBl.setGraphicSize(Std.int(logoBl.width * 0.95));
			// logoBl.x += 600;
			logoBl.y += 120;
			logoBl.scrollFactor.x = 0;
			logoBl.scrollFactor.y = 0.10;
			logoBl.screenCenter();
			logoBl.alpha = 0.55;
			add(logoBl);
		}

		if (Main.watermarks) {
			visualLogoBl = new FlxSprite(-150, -100);
			visualLogoBl.frames = Paths.getSparrowAtlas('logoBumpinVisual');
			visualLogoBl.antialiasing = true;
			visualLogoBl.animation.addByPrefix('bump', 'logo bumin visual', 24);
			visualLogoBl.animation.play('bump');
			visualLogoBl.updateHitbox();
			visualLogoBl.setGraphicSize(Std.int(visualLogoBl.width * 0.95));
			visualLogoBl.y += 120;
			visualLogoBl.scrollFactor.x = 0;
			visualLogoBl.scrollFactor.y = 0.10;
			visualLogoBl.screenCenter();
			visualLogoBl.alpha = 0.55;
			add(visualLogoBl);
		}

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		flickerColor = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		flickerColor.scrollFactor.x = 0;
		flickerColor.scrollFactor.y = 0.10;
		flickerColor.setGraphicSize(Std.int(flickerColor.width * 1.3));
		flickerColor.updateHitbox();
		flickerColor.screenCenter();
		flickerColor.visible = false;
		flickerColor.antialiasing = true;
		flickerColor.color = 0xFFea71fd;
		flickerColor.flipX = true;
		add(flickerColor);
		// magenta.scrollFactor.set();

		FlxTween.color(flickerColor, 3, FlxColor.GRAY, 0xFFea71fd, options);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var tex = Paths.getSparrowAtlas('FNF_main_menu_assets');

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(0, FlxG.height * 1.6);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;

			if (!FlxG.save.data.menuButtons)
				{
					switch (menuItem.ID)
					{
						case 0:
						{
							menuItem.setPosition(20, -300);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.49));
						}
						case 1:
						{
							menuItem.setPosition(445, -300);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.49));
						}
						case 2:
						{
							menuItem.setPosition(870, -300);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.49));
						}
						case 3:
						{
							menuItem.setPosition(20, 600);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.52));
						}
						case 4:
						{
							menuItem.setPosition(445, 600);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.49));
						}
						case 5:
						{
							menuItem.setPosition(870, 600);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.55));
						}
						case 6:
						{
							menuItem.setPosition(445, 1200);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.39));
						}
					}
				}
				if (FlxG.save.data.menuButtons)
				{
					switch (menuItem.ID)
					{
						case 0:
						{
							menuItem.setPosition(20, -300);
							menuItem.alpha = 0.50;
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.49));
						}
						case 1:
						{
							menuItem.setPosition(445, -300);
							menuItem.alpha = 0.50;
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.49));
						}
						case 2:
						{
							menuItem.setPosition(870, -300);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.49));
						}
						case 3:
						{
							menuItem.setPosition(20, 600);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.52));
						}
						case 4:
						{
							menuItem.setPosition(445, 600);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.49));
						}
						case 5:
						{
							menuItem.setPosition(870, 600);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.55));
						}
						case 6:
						{
							menuItem.setPosition(445, 1200);
							menuItem.setGraphicSize(Std.int(menuItem.width * 0.39));
						}
					}
				}

			// menuItem.screenCenter(X);
			menuItems.add(menuItem);
			menuItem.scrollFactor.set(0, 1);
			menuItem.antialiasing = true;
			// menuItem.setGraphicSize(Std.int(menuItem.width - 0.15));
			// if(i == 0){menuItem.setGraphicSize(Std.int(menuItem.width * 0.65));}
			// else{menuItem.setGraphicSize(Std.int(menuItem.width * 0.55));}

			// menuItem.x = 4 + (i * 450);
			// menuItem.y += 300;
			finishedFunnyMove = true;
		}

		firstStart = false;

		FlxG.camera.follow(camFollow, null, 0.60 * (60 / FlxG.save.data.fpsCap));

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, gameVer +  (Main.watermarks ? " FNF - " + visualEngineVer + " Visual Engine" : ""), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();


		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				FlxG.switchState(new TitleState());
			}

			if (controls.UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(3);
			}
			
			if (controls.DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-3);
			}

			if (controls.ACCEPT)
			{
				if (FlxG.save.data.menuButtons) {
					if (optionShit[curSelected] == 'options') {
						FlxG.switchState(new OptionsMenu());
					}
					if (optionShit[curSelected] == 'quit') {
						#if windows
						Sys.exit(0);
						#end
					}
				}
				if (optionShit[curSelected] == 'donate')
				{
					FlxG.switchState(new MainMenuState());
					fancyOpenURL("https://discord.com/invite/2UsNmPKxeu");
				}
				if (optionShit[curSelected] == "credits")
				{
					FlxG.switchState(new MainMenuState());
					fancyOpenURL("https://github.com/ItzBlueBerries/VisualEngine/blob/master/CREDITS.md");
				}
				if (optionShit[curSelected] == "changelog")
				{
					FlxG.switchState(new MainMenuState());
					fancyOpenURL("https://github.com/ItzBlueBerries/VisualEngine/blob/master/CHANGELOG.md");
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));
					
					if (FlxG.save.data.flashing)
						FlxFlicker.flicker(flickerColor, 1.1, 0.15, false);

						if (!FlxG.save.data.menuButtons)
						{
							menuItems.forEach(function(spr:FlxSprite)
								{
									if (curSelected != spr.ID)
									{
										FlxTween.tween(spr, {alpha: 0, y: -16}, 1.3, {
											ease: FlxEase.circOut,
											onComplete: function(twn:FlxTween)
											{
												spr.kill();
											}
										});
									}
									else
									{
										if (FlxG.save.data.flashing)
										{
											FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
											{
												goToState();
											});
										}
										else
										{
											new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												goToState();
											});
										}
									}
								});
							}
							if (FlxG.save.data.menuButtons)
							{
								menuItems.forEach(function(spr:FlxSprite)
									{
										FlxG.switchState(new MainMenuState());
									});
							}
				}
			}
		}

		super.update(elapsed);

		/* menuItems.forEach(function(spr:FlxSprite)
		{
			// spr.screenCenter(X);
			// spr.x += -300;
		}); */
	}
	
	function goToState()
	{
		var daChoice:String = optionShit[curSelected];

		if (!FlxG.save.data.menuButtons)
			{
				switch (daChoice)
				{
					case 'story mode':
						FlxG.switchState(new StoryMenuState());
					case 'freeplay':
						FlxG.switchState(new FreeplayState());
					case 'options':
						FlxG.switchState(new OptionsMenu());
					/*case 'credits':
						fancyOpenURL("https://www.kickstarter.com/projects/funkin/friday-night-funkin-the-full-ass-game");
						FlxG.switchState(new MainMenuState());*/
					case 'quit':
						#if windows
						Sys.exit(0);
						#end
				}
			}
			if (FlxG.save.data.menuButtons)
			{
				switch (daChoice)
				{
					case 'story mode':
						FlxG.switchState(new MainMenuState());
					case 'freeplay':
						FlxG.switchState(new MainMenuState());
					case 'options':
						FlxG.switchState(new OptionsMenu());
					/*case 'credits':
						fancyOpenURL("https://www.kickstarter.com/projects/funkin/friday-night-funkin-the-full-ass-game");
						FlxG.switchState(new MainMenuState());*/
					case 'quit':
						#if windows
						Sys.exit(0);
						#end
				}
			}
	}

	function changeItem(huh:Int = 0)
	{
		if (finishedFunnyMove)
		{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
		}
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected && finishedFunnyMove)
			{
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});
	}
}
