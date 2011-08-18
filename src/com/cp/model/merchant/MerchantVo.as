package com.cp.model.merchant
{
	import com.cp.framework.vomanager.ICoDec;
	import com.cp.framework.vomanager.IValueObject;

	import flash.events.EventDispatcher;

	[Bindable]
	public class MerchantVo extends EventDispatcher implements IValueObject
	{
		public var merchantId:Number;

		public var name:String;

		public var logo:String;


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
									"logo": "logo" };


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

