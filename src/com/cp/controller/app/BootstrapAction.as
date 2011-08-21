package com.cp.controller.app
{
	import com.cp.event.business.category.GetCategoryListEvent;
	import com.cp.event.business.coupon.GetCouponListEvent;
	import com.cp.event.business.merchant.GetMerchantListEvent;

	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	public class BootstrapAction
	{
		public var dispatch:Function;

		public function init():void
		{
			setupEnvironment();
			getInitialData();
		}

		private function setupEnvironment():void
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		}

		private function getInitialData():void
		{
			dispatch(new GetCategoryListEvent());
			dispatch(new GetMerchantListEvent());
			dispatch(new GetCouponListEvent());
		}
	}
}
