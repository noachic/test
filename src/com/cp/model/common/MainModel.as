package com.cp.model.common
{
	import com.cp.model.category.CategoryVo;
	import com.cp.model.coupon.CouponVo;
	import com.cp.model.merchant.MerchantVo;

	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;

	[Bindable]
	public class MainModel
	{
		public function MainModel()
		{
			super();

			categorizedMerchantList.filterFunction = filterByCurrentCategory;
			filteredCouponList.filterFunction = filterByCurrentCategoryAndCurrentMerchant;
			BindingUtils.bindSetter(currentCategoryChangeWatcher, this, "currentCategory");
			BindingUtils.bindSetter(currentMerchantChangeWatcher, this, "currentMerchant");
		}

		public var categoryList:ArrayCollection = new ArrayCollection();

		public var merchantList:ArrayCollection = new ArrayCollection();

		public var couponList:ArrayCollection = new ArrayCollection();

		public var categorizedMerchantList:ListCollectionView = new ListCollectionView(merchantList);

		public var filteredCouponList:ListCollectionView = new ListCollectionView(couponList);

		public var currentCategory:CategoryVo;

		public var currentMerchant:MerchantVo;

		private function filterByCurrentCategory(merchant:MerchantVo, ... args):Boolean
		{
			return currentCategory == null || currentCategory.categoryId == merchant.categoryId;
		}

		private function filterByCurrentCategoryAndCurrentMerchant(coupon:CouponVo):Boolean
		{
			return (currentCategory == null || currentCategory.categoryId == coupon.categoryId) && (currentMerchant == null || currentMerchant.merchantId == coupon.merchantId);
		}

		private function currentCategoryChangeWatcher(category:CategoryVo):void
		{
			categorizedMerchantList.refresh();
			filteredCouponList.refresh();
		}

		private function currentMerchantChangeWatcher(merchant:MerchantVo):void
		{
			filteredCouponList.refresh();
		}
	}
}
