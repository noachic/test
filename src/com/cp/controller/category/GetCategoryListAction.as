package com.cp.controller.category
{
	import com.cp.event.business.category.GetCategoryListEvent;
	import com.cp.framework.vomanager.VOManager;
	import com.cp.model.category.CategoryVo;
	import com.cp.model.common.ImageCache;
	import com.cp.model.common.MainModel;

	import data.MockData;

	public class GetCategoryListAction
	{
		public var mockData:MockData;

		public var model:MainModel;

		private var imageCache:ImageCache = new ImageCache();


		public function getCategoryList(event:GetCategoryListEvent):void
		{
			processData(mockData.categoryList);
		}

		private function processData(xml:XML):void
		{
			var categoryArray:Array = [];

			for each (var x:XML in xml.category)
			{
				var category:CategoryVo = VOManager.getVOFromXML(CategoryVo, x) as CategoryVo;
				categoryArray.push(category);

				imageCache.categoryImageCache.load(category.icon);
			}

			model.categoryList.source = categoryArray;
		}
	}
}
