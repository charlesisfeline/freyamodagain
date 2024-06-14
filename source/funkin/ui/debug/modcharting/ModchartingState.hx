package funkin.ui.debug.modcharting;

import flixel.addons.display.FlxGridOverlay;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;
import funkin.audio.FunkinSound;
import funkin.input.Cursor;
import funkin.play.character.BaseCharacter;
import funkin.play.character.CharacterData;
import funkin.play.character.CharacterData.CharacterDataParser;
import funkin.play.character.SparrowCharacter;
import funkin.ui.mainmenu.MainMenuState;
import funkin.util.MouseUtil;
import funkin.util.SerializerUtil;
import funkin.util.SortUtil;
import haxe.ui.components.DropDown;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;
import haxe.ui.events.ItemEvent;
import haxe.ui.events.UIEvent;
import haxe.ui.RuntimeComponentBuilder;
import lime.utils.Assets as LimeAssets;
import openfl.Assets;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.geom.Rectangle;
import openfl.net.FileReference;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;

using flixel.util.FlxSpriteUtil;

#if web
import js.html.FileList;
#end
#if sys
import sys.io.File;
#end

class ModchartingState extends MusicBeatState
{
  /*
    TODAY'S TO-DO!!!!!!!
    - Actually work on this.
   */
  var bg:FlxSprite;

  var hudCam:FlxCamera;

  var dropDownSetup:Bool = false;

  var uiStuff:Component;

  var haxeUIFocused(get, default):Bool = false;

  function get_haxeUIFocused():Bool
  {
    // get the screen position, according to the HUD camera, temp default to FlxG.camera juuust in case?
    var hudMousePos:FlxPoint = FlxG.mouse.getScreenPosition(hudCam ?? FlxG.camera);
    return Screen.instance.hasSolidComponentUnderPoint(hudMousePos.x, hudMousePos.y);
  }

  override function create()
  {
    hudCam = new FlxCamera();
    hudCam.bgColor.alpha = 0;

    bg = FlxGridOverlay.create(10, 10);
    // bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.GREEN);

    bg.scrollFactor.set();
    add(bg);

    // we are setting this as the default draw camera only temporarily, to trick haxeui
    FlxG.cameras.add(hudCam);

    super.create();
  }

  override function update(elapsed:Float)
  {
    if (FlxG.keys.justPressed.H) hudCam.visible = !hudCam.visible;

    if (FlxG.keys.justPressed.TWO) FlxG.switchState(() -> new MainMenuState());

    // bg.scale.x = FlxG.camera.zoom;
    // bg.scale.y = FlxG.camera.zoom;

    bg.setGraphicSize(Std.int(bg.width / FlxG.camera.zoom));

    super.update(elapsed);
  }
}
