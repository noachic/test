package com.cp.model.category
{
	import com.cp.framework.vomanager.ICoDec;
	import com.cp.framework.vomanager.IValueObject;

	import flash.events.EventDispatcher;

	[Bindable]
	public class CategoryVo extends EventDispatcher implements IValueObject
	{
		public var categoryId:Number;

		public var name:String;

		public var icon:String;


		public static function makePrimaryKey(categoryId:Number):Object
		{
			return { "categoryId": categoryId };
		}


		public function get codec():ICoDec
		{
			return new CategoryVoXMLCoDec();
		}

		public function get primaryKey():Object
		{
			return makePrimaryKey(categoryId);
		}
	}
}


import com.cp.framework.vomanager.IXMLCoDec;
import com.cp.model.category.CategoryVo;

class CategoryVoXMLCoDec implements IXMLCoDec
{
	private var fieldMap:Object = { "categoryId": "categoryId", "name": "name",
									"icon": "icon" };


	public function get rootName():String
	{
		return "category";
	}

	public function primaryKeyFromXML(xml:XML):Object
	{
		var categoryId:Number = xml.categoryId;
		return CategoryVo.makePrimaryKey(categoryId);
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
