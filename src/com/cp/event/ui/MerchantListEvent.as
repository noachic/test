package com.cp.event.ui
{
	import com.cp.model.merchant.MerchantVo;

	import flash.events.Event;

	public class MerchantListEvent extends Event
	{
		public static const SHOW_MERCHANT_LIST:String = "showMerchantList";

		public static const SELECT_MERCHANT:String = "selectMerchant";

		public static function showMerchantList():MerchantListEvent
		{
			return new MerchantListEvent(SHOW_MERCHANT_LIST);
		}

		public static function selectMerchant(merchant:MerchantVo):MerchantListEvent
		{
			var e:MerchantListEvent = new MerchantListEvent(SELECT_MERCHANT);
			e.merchant = merchant;

			return e;
		}

		public function MerchantListEvent(type:String)
		{
			super(type, true, true);
		}

		public var merchant:MerchantVo;

		override public function clone():Event
		{
			var e:MerchantListEvent = new MerchantListEvent(type);
			e.merchant = merchant;

			return e;
		}
	}
}
