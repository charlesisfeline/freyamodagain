package freya;

import flixel.math.FlxMath;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end
import flixel.util.FlxSave;
import sys.io.Process;
#if cpp
import cpp.vm.Gc;
#elseif hl
import hl.Gc;
#elseif java
import java.vm.Gc;
#elseif neko
import neko.vm.Gc;
#end
import openfl.system.System;

using StringTools;

class FreyaUtils
{
  inline public static function quantize(f:Float, interval:Float)
  {
    return Std.int((f + interval / 2) / interval) * interval;
  }

  inline public static function capitalize(text:String)
    return text.charAt(0).toUpperCase() + text.substr(1).toLowerCase();

  public static function getSizeString(size:Float):String
  {
    var labels = ["B", "KB", "MB", "GB", "TB", "PB"];
    var rSize:Float = size;
    var label:Int = 0;
    while (rSize > 1024 && label < labels.length - 1)
    {
      label++;
      rSize /= 1024;
    }
    return '${Std.int(rSize) + "." + addZeros(Std.string(Std.int((rSize % 1) * 100)), 2)}${labels[label]}';
  }

  public static function truncateFloat(number:Float, precision:Int):Float
  {
    var num = number;
    num = num * Math.pow(10, precision);
    num = Math.round(num) / Math.pow(10, precision);
    return num;
  }

  public static inline function addZeros(str:String, num:Int)
  {
    while (str.length < num)
      str = '0${str}';
    return str;
  }

  public static function getUsername():String
  {
    #if windows
    return Sys.environment()["USERNAME"].trim();
    #elseif (linux || macos)
    return Sys.environment()["USER"].trim();
    #else
    return 'Dude';
    #end
  }

  inline public static function GCD(a, b)
    return b == 0 ? FlxMath.absInt(a) : GCD(b, a % b);

  public static var programList:Array<String> = [
    'obs',
    'bdcam',
    'fraps',
    'xsplit', // TIL c# program
    'hycam2', // hueh
    'twitchstudio' // why
  ];

  public static function isRecording():Bool
  {
    var isOBS:Bool = false;
    try
    {
      #if windows
      var taskList:Process = new Process('tasklist');
      #elseif (linux || macos)
      var taskList:Process = new Process('ps --no-headers');
      #end
      var readableList:String = taskList.stdout.readAll().toString().toLowerCase();
      for (i in 0...programList.length)
      {
        if (readableList.contains(programList[i])) isOBS = true;
      }
      taskList.close();
      readableList = '';
    }
    catch (e)
    {
      // If for some reason the game crashes when trying to run Process, just force OBS on.
      // Just in case this happens when they're streaming.
      isOBS = true;
    }
    return isOBS;
  }
}

class FreyaMemory
{
  public static var disableCount:Int = 0;

  public static function askDisable()
  {
    disableCount++;
    if (disableCount > 0) disable();
    else
      enable();
  }

  public static function askEnable()
  {
    disableCount--;
    if (disableCount > 0) disable();
    else
      enable();
  }

  public static function init() {}

  public static function clearMinor()
  {
    #if (cpp || java || neko)
    Gc.run(false);
    #end
  }

  public static function clearMajor()
  {
    #if cpp
    Gc.run(true);
    Gc.compact();
    #elseif hl
    Gc.major();
    #elseif (java || neko)
    Gc.run(true);
    #end
  }

  public static function enable()
  {
    #if (cpp || hl)
    Gc.enable(true);
    #end
  }

  public static function disable()
  {
    #if (cpp || hl)
    Gc.enable(false);
    #end
  }

  public static inline function currentMemUsage()
  {
    #if cpp
    return Gc.memInfo64(Gc.MEM_INFO_USAGE);
    #elseif sys
    return cast(cast(System.totalMemory, UInt), Float);
    #else
    return 0;
    #end
  }

  private static var _nb:Int = 0;
  private static var _nbD:Int = 0;
  private static var _zombie:Dynamic;

  public static function destroyFlixelZombies()
  {
    #if cpp
    // Gc.enterGCFreeZone();

    while ((_zombie = Gc.getNextZombie()) != null)
    {
      _nb++;
      if (_zombie is flixel.util.FlxDestroyUtil.IFlxDestroyable)
      {
        flixel.util.FlxDestroyUtil.destroy(cast(_zombie, flixel.util.FlxDestroyUtil.IFlxDestroyable));
        _nbD++;
      }
    }
    Sys.println('Zombies: ${_nb}; IFlxDestroyable Zombies: ${_nbD}');

    // Gc.exitGCFreeZone();
    #end
  }
}
