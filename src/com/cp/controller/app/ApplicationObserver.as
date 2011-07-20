package com.cp.controller.app
{
	import flash.display.StageDisplayState;

	import mx.events.FlexEvent;

	public class ApplicationObserver
	{

		private var application:CouponPost;

		[Observe]
		public function observe(application:CouponPost):void
		{
			this.application = application;
			application.addEventListener(FlexEvent.APPLICATION_COMPLETE, applicationCompleteHandler);
		}

		private function applicationCompleteHandler(event:FlexEvent):void
		{
			application.maximize();
//			application.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE
		}
	}
}
