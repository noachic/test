package com.cp.controller.app
{
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	public class BootstrapAction
	{

		[Init]
		public function init():void
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		}
	}
}
