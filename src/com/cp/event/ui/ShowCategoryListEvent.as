package com.cp.event.ui
{
	import flash.events.Event;

	public class ShowCategoryListEvent extends Event
	{
		public static const SHOW_CATEGORY_LIST:String = "showCategoryList";

		public function ShowCategoryListEvent()
		{
			super(SHOW_CATEGORY_LIST, true, true);
		}

		override public function clone():Event
		{
			return new ShowCategoryListEvent();
		}
	}
}
