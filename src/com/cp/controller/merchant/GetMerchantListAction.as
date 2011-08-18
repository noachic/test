package com.cp.controller.merchant
{
	import com.cp.event.business.merchant.GetMerchantListEvent;
	import com.cp.framework.vomanager.VOManager;
	import com.cp.model.common.MainModel;
	import com.cp.model.merchant.MerchantVo;

	import data.MockData;

	public class GetMerchantListAction
	{
		public var mockData:MockData;

		public var model:MainModel;

		public function getMerchantList(event:GetMerchantListEvent):void
		{
			processData(mockData.merchantList);
		}

		private function processData(xml:XML):void
		{
			var merchantArray:Array = [];

			for each (var x:XML in xml.merchant)
			{
				var merchant:MerchantVo = VOManager.getVOFromXML(MerchantVo, x) as MerchantVo;
				merchantArray.push(merchant);
			}

			model.merchantList.source = merchantArray;
		}
	}
}
