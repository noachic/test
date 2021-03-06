package com.cp.model.merchant
{
	import com.cp.framework.vomanager.ICoDec;
	import com.cp.framework.vomanager.IValueObject;

	import flash.events.EventDispatcher;

	import mx.collections.ArrayCollection;

	[Bindable]
	public class MerchantVo extends EventDispatcher implements IValueObject
	{

		[PrimaryKey]
		[XPath("merchantId")]
		public var merchantId:Number;

		[XPath("name")]
		public var name:String;

		[XPath("logo")]
		public var logo:String;

		[XPath("categoryId")]
		public var categoryId:Number;

		public var coupons:ArrayCollection = new ArrayCollection();


		public static function makePrimaryKey(merchantId:Number):Object
		{
			return { "merchantId": merchantId };
		}


		public function get codec():ICoDec
		{
			return new MerchantVoXMLCoDec();
		}

		public function get primaryKey():Object
		{
			return makePrimaryKey(merchantId);
		}
	}
}


import com.cp.framework.vomanager.IXMLCoDec;
import com.cp.model.merchant.MerchantVo;

class MerchantVoXMLCoDec implements IXMLCoDec
{
	private var fieldMap:Object = { "merchantId": "merchantId", "name": "name",
									"logo": "logo", "categoryId": "categoryId" };


	public function get rootName():String
	{
		return "merchant";
	}

	public function primaryKeyFromXML(xml:XML):Object
	{
		var merchantId:Number = xml.merchantId;
		return MerchantVo.makePrimaryKey(merchantId);
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

