package com.cp.controller.merchant
{
	import com.cp.event.business.merchant.GetMerchantListEvent;
	import com.cp.framework.vomanager.VOManager;
	import com.cp.model.common.ImageCache;
	import com.cp.model.common.MainModel;
	import com.cp.model.merchant.MerchantVo;

	import data.MockData;

	public class GetMerchantListAction
	{
		public var mockData:MockData;

		public var model:MainModel;

		private var imageCache:ImageCache = new ImageCache();

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

				imageCache.merchantLogoCache.load("https://github.com/noachic/test/raw/master/src/asset/images/coupon/" + merchant.merchantId + "/" + merchant.logo);
			}

			model.merchantList.source = merchantArray;
		}
	}
}
