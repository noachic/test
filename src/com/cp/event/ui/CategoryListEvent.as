package com.cp.event.ui
{
	import com.cp.model.category.CategoryVo;

	import flash.events.Event;

	public class CategoryListEvent extends Event
	{
		public static const SHOW_CATEGORY_LIST:String = "showCategoryList";

		public static const SELECT_CATEGORY:String = "selectCategory";

		public var category:CategoryVo;

		public static function showCategoryList():CategoryListEvent
		{
			return new CategoryListEvent(SHOW_CATEGORY_LIST);
		}

		public static function selectCategory(category:CategoryVo):CategoryListEvent
		{
			var e:CategoryListEvent = new CategoryListEvent(SELECT_CATEGORY);
			e.category = category;

			return e;
		}

		public function CategoryListEvent(type:String)
		{
			super(type, true, true);
		}

		override public function clone():Event
		{
			var e:CategoryListEvent = new CategoryListEvent(type);
			e.category = category;

			return e;
		}
	}
}
