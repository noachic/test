package com.cp.controller.merchant
{
	import com.adobe.cairngorm.navigation.NavigationEvent;
	import com.cp.event.ui.MerchantListEvent;
	import com.cp.model.common.MainModel;

	public class SelectMerchantAction
	{
		public var dispatch:Function;

		public var mainModel:MainModel;

		public function selectMerchant(event:MerchantListEvent):void
		{
			mainModel.currentMerchant = event.merchant;

			dispatch(NavigationEvent.createNavigateToEvent("view.coupon"));
		}
	}
}
