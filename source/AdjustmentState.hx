package;

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

		// turns out FlxNapeSprite and FlxSprite's x and y thingies are different
		// i had to tweak the code for FlxNapeSprites and then it positioned well
		// i have no idea why, still seeking help from good Haxeflixeleres!!!
		txtX.text = "X pos: " + (texty.x);
		txtY.text = "Y pos: " + (texty.y);

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
