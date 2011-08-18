package com.cp.model.common
{
	import com.cp.model.category.CategoryVo;
	import com.cp.model.merchant.MerchantVo;

	import mx.collections.ArrayCollection;

	[Bindable]
	public class MainModel
	{
		public var categoryList:ArrayCollection = new ArrayCollection();

		public var merchantList:ArrayCollection = new ArrayCollection();

		public var currentCategory:CategoryVo;

		public var currentMerchant:MerchantVo;
	}
}
