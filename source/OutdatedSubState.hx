package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

// i may or may have not slightly stole this from kade engine, maybe i didnt and im just messing wtih you? who knows.

class OutdatedSubState extends MusicBeatState
{
	var logoBl:FlxSprite;

	public static var leftState:Bool = false;
	                                // vvvv meant to confuse people
	public static var needVer:String = "oopsie woopsie";
	public static var currChanges:String = "x3";
	
	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stageback', 'shared'));
		bg.screenCenter();
		add(bg);

		logoBl = new FlxSprite(0, -64);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = true;
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
		logoBl.animation.play('bump');
		logoBl.screenCenter(X);
		logoBl.updateHitbox();
		add(logoBl);

		/*var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('logo'));
		logo.screenCenter(X);
		add(logo);*/

		var tint:FlxSprite = new FlxSprite().makeGraphic(1280, 720, FlxColor.BLACK);
		tint.alpha = 0.3;
		add(tint);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Sublime Engine is outdated!\nYou are on v" + Application.current.meta.get('version')
			+ "\nand the latest version is, v" + needVer + "."
			+ "\n\nPress Space to Update or Escape to ignore.",
			32);
		
		txt.setFormat("PhantomMuff 1.5", 32, FlxColor.WHITE, CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			FlxG.openURL("https://github.com/SpunBlue/Friday-Night-Funkin-Sublime-Engine/releases/tag/v" + needVer);
		}
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}

	override function beatHit()
		{
			super.beatHit();
	
			logoBl.animation.play('bump');
		}
}
