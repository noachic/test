package com.cp.util
{
	import flash.display.Loader;
	import flash.display.MovieClip;

	public class MovieClipUtil
	{
		public static function getSymbolName(asset:Object):String
		{
			var symbol:Object = getSymbol(asset);

			return symbol == null ? "" : (symbol.name || "") + "\nwidth = " + symbol.width + "\nheight = " + symbol.height;
		}

		public static function getSymbol(asset:Object):Object
		{
			while (asset.parent && asset.parent.parent && !(asset.parent.parent is Loader))
				asset = asset.parent;

			return asset;
		}
	}
}
