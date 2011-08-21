package com.cp.event.ui
{
	import com.cp.model.coupon.CouponVo;

	import flash.events.Event;

	public class PrintCouponEvent extends Event
	{
		public static const START_PRINT:String = "startPrint";

		public static const COMPLETE_PRINT:String = "completePrint";

		public static function startPrint(coupon:CouponVo):PrintCouponEvent
		{
			return new PrintCouponEvent(START_PRINT, coupon);
		}

		public static function completePrint():PrintCouponEvent
		{
			return new PrintCouponEvent(COMPLETE_PRINT);
		}

		public function PrintCouponEvent(type:String, coupon:CouponVo=null)
		{
			super(type, true, true);

			this.coupon = coupon;
		}

		public var coupon:CouponVo;

		override public function clone():Event
		{
			return new PrintCouponEvent(type, coupon);
		}
	}
}
