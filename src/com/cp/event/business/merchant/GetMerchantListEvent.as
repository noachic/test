package com.cp.event.business.merchant
{
	import flash.events.Event;

	public class GetMerchantListEvent extends Event
	{
		public static const GET_MERCHANT_LIST:String = "getMerchantList";

		public function GetMerchantListEvent()
		{
			super(GET_MERCHANT_LIST, true, true);
		}

		override public function clone():Event
		{
			return new GetMerchantListEvent();
		}
	}
}
