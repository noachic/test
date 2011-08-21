package com.cp.event.business.coupon
{
	import flash.events.Event;

	public class GetCouponListEvent extends Event
	{
		public static const GET_COUPON_LIST:String = "getCouponList";

		public function GetCouponListEvent()
		{
			super(GET_COUPON_LIST, true, true);
		}

		override public function clone():Event
		{
			return new GetCouponListEvent();
		}
	}
}
