package com.cp.navigation
{
	import com.cp.model.common.MainModel;

	public class HomeLandmark
	{
		public var mainModel:MainModel;

		public function enter():void
		{
			mainModel.currentCategory = null;
			mainModel.currentMerchant = null;
		}
	}
}
