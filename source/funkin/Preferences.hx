package funkin;

import funkin.save.Save;

/**
 * A core class which provides a store of user-configurable, globally relevant values.
 */
class Preferences
{
  /**
   * Whenever to display a splash animation when perfectly hitting a note.
   * @default `true`
   */
  public static var noteSplash(get, set):Bool;

  static function get_noteSplash():Bool
  {
    return Save?.instance?.options?.noteSplash;
  }

  static function set_noteSplash(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.noteSplash = value;
    save.flush();
    return value;
  }

  /**
   * Whenever to display judgement popups every time a note gets hit.
   * @default `true`
   */
  public static var comboPopUp(get, set):Bool;

  static function get_comboPopUp():Bool
  {
    return Save?.instance?.options?.comboPopUp;
  }

  static function set_comboPopUp(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.comboPopUp = value;
    save.flush();
    return value;
  }

  /**
   * Whenever to display the judgement info text on the left side of the screen.
   * @default `true`
   */
  public static var judgementsText(get, set):Bool;

  static function get_judgementsText():Bool
  {
    return Save?.instance?.options?.judgementsText;
  }

  static function set_judgementsText(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.judgementsText = value;
    save.flush();
    return value;
  }

  /**
   * If enabled, hides the opponent notes and puts the player strums to the middle.
   * @default `false`
   */
  public static var middlescroll(get, set):Bool;

  static function get_middlescroll():Bool
  {
    return Save?.instance?.options?.middlescroll;
  }

  static function set_middlescroll(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.middlescroll = value;
    save.flush();
    return value;
  }

  /**
   * If enabled, makes the graphics look sharper, however it can reduce performance.
   * @default `true`
   */
  public static var antialiasing(get, set):Bool;

  static function get_antialiasing():Bool
  {
    return Save?.instance?.options?.antialiasing;
  }

  static function set_antialiasing(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.antialiasing = value;
    save.flush();
    return value;
  }

  /**
   * Whether some particularly fowl language is displayed.
   * @default `true`
   */
  public static var naughtyness(get, set):Bool;

  static function get_naughtyness():Bool
  {
    return Save?.instance?.options?.naughtyness;
  }

  static function set_naughtyness(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.naughtyness = value;
    save.flush();
    return value;
  }

  /**
   * If enabled, the strumline is at the bottom of the screen rather than the top.
   * @default `false`
   */
  public static var downscroll(get, set):Bool;

  static function get_downscroll():Bool
  {
    return Save?.instance?.options?.downscroll;
  }

  static function set_downscroll(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.downscroll = value;
    save.flush();
    return value;
  }

  /**
   * If true, the player will not receive the ghost miss penalty if there are no notes within the hit window.
   * This is the thing people have been begging for forever lolol.
   * @default `false`
   */
  public static var ghostTapping(get, set):Bool;

  static function get_ghostTapping():Bool
  {
    return Save?.instance?.options?.ghostTapping ?? false;
  }

  static function set_ghostTapping(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.ghostTapping = value;
    save.flush();
    return value;
  }

  /**
   * If disabled, flashing lights in the main menu and other areas will be less intense.
   * @default `true`
   */
  public static var flashingLights(get, set):Bool;

  static function get_flashingLights():Bool
  {
    return Save?.instance?.options?.flashingLights ?? true;
  }

  static function set_flashingLights(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.flashingLights = value;
    save.flush();
    return value;
  }

  /**
   * If disabled, the camera bump synchronized to the beat.
   * @default `false`
   */
  public static var zoomCamera(get, set):Bool;

  static function get_zoomCamera():Bool
  {
    return Save?.instance?.options?.zoomCamera;
  }

  static function set_zoomCamera(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.zoomCamera = value;
    save.flush();
    return value;
  }

  /**
   * If enabled, an FPS and memory counter will be displayed even if this is not a debug build.
   * @default `false`
   */
  public static var debugDisplay(get, set):Bool;

  static function get_debugDisplay():Bool
  {
    return Save?.instance?.options?.debugDisplay;
  }

  static function set_debugDisplay(value:Bool):Bool
  {
    if (value != Save.instance.options.debugDisplay)
    {
      toggleDebugDisplay(value);
    }

    var save = Save.instance;
    save.options.debugDisplay = value;
    save.flush();
    return value;
  }

  /**
   * Adds a song position bar.
   * @default `false`
   */
  public static var songPositionBar(get, set):Bool;

  static function get_songPositionBar():Bool
  {
    return Save?.instance?.options?.songPositionBar ?? false;
  }

  static function set_songPositionBar(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.songPositionBar = value;
    save.flush();
    return value;
  }

  /**
   * If enabled, the game will automatically pause when tabbing out.
   * @default `true`
   */
  public static var autoPause(get, set):Bool;

  static function get_autoPause():Bool
  {
    return Save?.instance?.options?.autoPause ?? true;
  }

  static function set_autoPause(value:Bool):Bool
  {
    if (value != Save.instance.options.autoPause) FlxG.autoPause = value;

    var save:Save = Save.instance;
    save.options.autoPause = value;
    save.flush();
    return value;
  }

  /**
   * Changes default health bar colors to characters dominant color from health icon.
   * @default `false`
   */
  public static var coloredHealthBar(get, set):Bool;

  static function get_coloredHealthBar():Bool
  {
    return Save?.instance?.options?.coloredHealthBar ?? false;
  }

  static function set_coloredHealthBar(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.coloredHealthBar = value;
    save.flush();
    return value;
  }

  /**
   * Loads the user's preferences from the save data and apply them.
   */
  public static function init():Void
  {
    // Apply the autoPause setting (enables automatic pausing on focus lost).
    FlxG.autoPause = Preferences.autoPause;
    // Apply the debugDisplay setting (enables the FPS and RAM display).
    toggleDebugDisplay(Preferences.debugDisplay);
  }

  static function toggleDebugDisplay(show:Bool):Void
  {
    if (show)
    {
      // Enable the debug display.
      FlxG.stage.addChild(Main.fpsCounter);
      #if !html5
      FlxG.stage.addChild(Main.memoryCounter);
      #end
    }
    else
    {
      // Disable the debug display.
      FlxG.stage.removeChild(Main.fpsCounter);
      #if !html5
      FlxG.stage.removeChild(Main.memoryCounter);
      #end
    }
  }
}
