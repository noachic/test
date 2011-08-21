package com.cp.util
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	[Event(name="countDownComplete", type="flash.events.Event")]
	public class CountDownTimer extends EventDispatcher
	{
		private var timer:Timer;

		public var interval:Number = 1000; // miliseconds

		public var duration:Number = 10000; // miliseconds

		[Bindable]
		public var countDown:Number;

		public function run():void
		{
			if (timer != null)
			{
				if (timer.running)
					timer.stop();
				timer.removeEventListener(TimerEvent.TIMER, timerHandler);
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
			}

			var i:int = duration % interval;
			var j:int = interval;
			while (i != 0 && j != i)
			{
				j = i;
				i = duration % i;
			}

			timer = new Timer(j, duration / j);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);

			countDown = duration / interval;
			timer.start();
		}

		private function timerHandler(event:TimerEvent):void
		{
			var curTime:Number = duration - timer.currentCount * timer.delay;
			if (curTime % interval == 0)
				countDown = curTime / interval;
		}

		private function timerCompleteHandler(event:TimerEvent):void
		{
			countDown = 0;
			dispatchEvent(new Event("countDownComplete"));
		}
	}
}
