package com.cp.controller.coupon
{
	import com.cp.event.business.coupon.GetCouponListEvent;
	import com.cp.framework.vomanager.VOManager;
	import com.cp.model.common.MainModel;
	import com.cp.model.coupon.CouponVo;

	import data.MockData;

	public class GetCouponListAction
	{
		public var mockData:MockData;

		public var model:MainModel;


		public function getCouponList(event:GetCouponListEvent):void
		{
			processData(mockData.couponList);
		}

		private function processData(xml:XML):void
		{
			var couponArray:Array = [];

			for each (var x:XML in xml.coupon)
			{
				var coupon:CouponVo = VOManager.getVOFromXML(CouponVo, x) as CouponVo;
				couponArray.push(coupon);
			}

			model.couponList.source = couponArray;
		}
	}
}
