package com.cp.navigation
{
	import com.cp.model.common.MainPublisher;

	public class HomeLandmark
	{
		public var mainPublisher:MainPublisher;

		public function enter():void
		{
			mainPublisher.currentCategory = null;
			mainPublisher.currentMerchant = null;
		}
	}
}
