package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class MenuState extends FlxState
{
    static var accepted:Bool = false;

	override public function create()
	{
		super.create();

        var infoTxt:FlxText = new FlxText(370, 645, 0,
            "Press the number on the corresponding tool you want to use\n"
            + "Press ESC/Backspace to return back to the menu",
            24);

        add(infoTxt);

        var toolTxt:FlxText = new FlxText(100, 25, 0, 
            "[1] Adjustment Tool",
            32);

        add(toolTxt);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

        if (FlxG.keys.justPressed.ONE)
        {
            FlxG.switchState(new AdjustmentState());
        }
	}
}
