package com.cp.model.coupon
{
	import com.cp.framework.vomanager.ICoDec;
	import com.cp.framework.vomanager.IValueObject;

	import flash.events.EventDispatcher;

	[Bindable]
	public class CouponVo extends EventDispatcher implements IValueObject
	{
		public var couponId:Number;

		public var promotionType:String;

		public var title:String;

		public var offerImage:String;

		public var shortDescription:String;

		public var offerTerm:String;

		public var volume:Number;

		public var endDate:String;

		public var categoryId:Number;

		public var merchantId:Number;

		public var showDescription:Boolean;

		public static function makePrimaryKey(couponId:Number):Object
		{
			return { "couponId": couponId };
		}


		public function get codec():ICoDec
		{
			return new CouponVoXMLCoDec();
		}

		public function get primaryKey():Object
		{
			return makePrimaryKey(couponId);
		}
	}
}


import com.cp.framework.vomanager.IXMLCoDec;
import com.cp.model.coupon.CouponVo;

class CouponVoXMLCoDec implements IXMLCoDec
{
	private var fieldMap:Object = { "couponId": "couponId",
									"promotionType": "promotionType",
									"title": "title",
									"offerImage": "offerImage",
									"shortDescription": "shortDescription",
									"offerTerm": "offerTerm",
									"volume": "volume", "endDate": "endDate",
									"categoryId": "categoryId",
									"merchantId": "merchantId" };


	public function get rootName():String
	{
		return "coupon";
	}

	public function primaryKeyFromXML(xml:XML):Object
	{
		var couponId:Number = xml.couponId;
		return CouponVo.makePrimaryKey(couponId);
	}

	public function get decodeMap():Object
	{
		return fieldMap;
	}

	public function get encodeMap():Object
	{
		return fieldMap;
	}
}
