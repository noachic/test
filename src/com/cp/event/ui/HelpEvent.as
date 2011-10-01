package com.cp.event.ui
{
	import flash.events.Event;

	public class HelpEvent extends Event
	{
		public static const SHOW_HELP:String = "showHelp";

		public static const HIDE_HELP:String = "hideHelp";

		public static function showHelp():HelpEvent
		{
			return new HelpEvent(SHOW_HELP);
		}

		public static function hideHelp():HelpEvent
		{
			return new HelpEvent(HIDE_HELP);
		}

		public function HelpEvent(type:String)
		{
			super(type, true, true);
		}

		override public function clone():Event
		{
			return new HelpEvent(type);
		}
	}
}
