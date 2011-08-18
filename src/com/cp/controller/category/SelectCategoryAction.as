package com.cp.controller.category
{
	import com.adobe.cairngorm.navigation.NavigationEvent;
	import com.cp.event.ui.CategoryListEvent;
	import com.cp.model.common.MainModel;

	public class SelectCategoryAction
	{
		public var dispatch:Function

		public var mainModel:MainModel;

		public function selectCategory(event:CategoryListEvent):void
		{
			mainModel.currentCategory = event.category;

			dispatch(NavigationEvent.createNavigateToEvent("view.coupon"));
		}
	}
}
