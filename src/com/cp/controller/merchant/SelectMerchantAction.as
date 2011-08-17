package com.cp.controller.merchant
{
	import com.adobe.cairngorm.navigation.NavigationEvent;
	import com.cp.event.ui.MerchantListEvent;
	import com.cp.model.common.MainPublisher;

	public class SelectMerchantAction
	{
		public var dispatch:Function;

		public var mainPublisher:MainPublisher;

		public function selectMerchant(event:MerchantListEvent):void
		{
			mainPublisher.currentMerchant = event.merchant;

			dispatch(NavigationEvent.createNavigateToEvent("view.coupon"));
		}
	}
}
