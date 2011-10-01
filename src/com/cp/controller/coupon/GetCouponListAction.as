package com.cp.controller.coupon
{
	import com.cp.event.business.coupon.GetCouponListEvent;
	import com.cp.framework.vomanager.VOManager;
	import com.cp.model.common.ImageCache;
	import com.cp.model.common.MainModel;
	import com.cp.model.coupon.CouponVo;
	import com.cp.model.merchant.MerchantVo;

	import data.MockData;

	import flash.utils.Dictionary;

	public class GetCouponListAction
	{
		public var mockData:MockData;

		public var model:MainModel;

		private var imageCache:ImageCache = new ImageCache();


		public function getCouponList(event:GetCouponListEvent):void
		{
			processData(mockData.couponList);
		}

		private function processData(xml:XML):void
		{
			var couponArray:Array = [];
			var merchantMap:Object = {};

			for each (var x:XML in xml.coupon)
			{
				var coupon:CouponVo = VOManager.getVOFromXML(CouponVo, x) as CouponVo;
				couponArray.push(coupon);

				if (!merchantMap[coupon.merchantId])
					merchantMap[coupon.merchantId] = [];

				merchantMap[coupon.merchantId].push(coupon);

				imageCache.productImageCache.load("https://github.com/noachic/test/raw/master/src/asset/images/coupon/" + coupon.merchantId + "/" + coupon.offerImage);
			}

			model.couponList.source = couponArray;

			attachedToMerchant(merchantMap);
		}

		private function attachedToMerchant(merchantMap:Object):void
		{
			for (var merchantId:String in merchantMap)
			{
				var merchant:MerchantVo = VOManager.getVO(MerchantVo, MerchantVo.makePrimaryKey(Number(merchantId))) as MerchantVo;
				merchant.coupons.source = merchantMap[merchantId];
			}
		}
	}
}
