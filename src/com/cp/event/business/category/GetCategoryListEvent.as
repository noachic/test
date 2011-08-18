package com.cp.event.business.category
{
	import flash.events.Event;

	public class GetCategoryListEvent extends Event
	{
		public static const GET_CATEGORY_LIST:String = "getCategoryList";

		public function GetCategoryListEvent()
		{
			super(GET_CATEGORY_LIST, true, true);
		}

		override public function clone():Event
		{
			return new GetCategoryListEvent();
		}
	}
}
