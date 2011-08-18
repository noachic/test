package com.cp.framework.vomanager
{

	public class ObjectUtil
	{
		public static function getObjectKeys(object:Object):Array
		{
			var keys:Array = [];

			for (var i:String in object)
				keys.push(i);

			return keys;
		}
	}
}
