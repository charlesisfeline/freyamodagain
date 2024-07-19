package funkin.util.macro;

#if macro
import haxe.macro.Context;
import haxe.macro.Compiler;
import haxe.macro.Expr;

/**
 * Macros containing additional help functions to expand HScript capabilities.
 */
class AdditionalsClassesMacro
{
  public static function addAdditionalClasses()
  {
    for (inc in [
      "flixel",
      "funkin",
      "freya",
      "flxanimate",

      "haxe.ui.backend.flixel.components",
      "haxe.ui.containers.dialogs",
      "haxe.ui.containers.menus",
      "haxe.ui.containers.properties",
      "haxe.ui.core",
      "haxe.ui.components",
      "haxe.ui.containers",

      "lime",
      "openfl",
      "sys", // ugh
      #if hxvlc "hxvlc.flixel", "hxvlc.openfl", #end
      "DateTools",
      "EReg",
      "Lambda",
      "StringBuf",
      "haxe.crypto",
      "haxe.display",
      "haxe.exceptions",
      "haxe.extern"
    ])
      Compiler.include(inc, [
        "flixel.system.macros",
        "flixel.addons.nape",
        "openfl.filters.BlurFilter",
        "haxe.ui.macros",
        "flixel.addons.editors.spine"
      ]);
  }
}
#end
