package;

import haxe.macro.Type.TypedExpr;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class AdjustmentState extends FlxState
{
	public var txtX:FlxText;
	public var txtY:FlxText;

	public var texty:FlxText;
	
	public var grass:FlxSprite;

	override public function create()
	{
		super.create();

		// replace texty with whatever you want to position
		texty = new FlxText(0, 0, 0, "placeholder\n" + "replace with img or whateve", 28);
		texty.setFormat(null, 28, FlxColor.WHITE);

		texty.x = (FlxG.width / 2) - (texty.width / 2);
		texty.y = (FlxG.height / 2) - (texty.height / 2);

		add(texty);

		txtX = new FlxText(5, 0, 0, "pre-init", 28);
		add(txtX);
		
		txtY = new FlxText(5, 50, 0, "pre-init", 28);
		add(txtY);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// haxeflixel adds an offset of 32???
		// i tried using this tool and it worked after i added an additional 32 so yeah????
		// ppl with better haxeflixel skills pls help :pray:
		txtX.text = "X pos: " + (texty.x + 32);
		txtY.text = "Y pos: " + (texty.y + 32);

		if (FlxG.keys.pressed.LEFT)
			texty.x--;
		if (FlxG.keys.pressed.RIGHT)
			texty.x++;
		if (FlxG.keys.pressed.UP)
			texty.y--;
		if (FlxG.keys.pressed.DOWN)
			texty.y++;

		if (FlxG.keys.anyJustPressed([ESCAPE, BACKSPACE]))
			FlxG.switchState(new MenuState());
	}
}
