package com.cp.controller.category
{
	import com.adobe.cairngorm.navigation.NavigationEvent;
	import com.cp.event.ui.CategoryListEvent;
	import com.cp.model.common.MainPublisher;

	public class SelectCategoryAction
	{
		public var dispatch:Function

		public var mainPublisher:MainPublisher;

		public function selectCategory(event:CategoryListEvent):void
		{
			mainPublisher.currentCategory = event.category;

			dispatch(NavigationEvent.createNavigateToEvent("view.coupon"));
		}
	}
}
