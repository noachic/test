package com.cp.model.common
{
	import spark.core.ContentCache;

	public class ImageCache
	{
		public static const VIEW_PRIORITY:String = "viewLevelPriority";

		private static const ProductImageCache:ContentCache = initProductImageCache();

		private static const MerchantLogoCache:ContentCache = initMerchantLogoCache();

		private static const CategoryImageCache:ContentCache = initCategoryImageCache();

		private static function initProductImageCache():ContentCache
		{
			const cc:ContentCache = new ContentCache();
			cc.maxCacheEntries = 9999;
			return cc;
		}

		private static function initMerchantLogoCache():ContentCache
		{
			const cc:ContentCache = new ContentCache();
			cc.maxCacheEntries = 999;
			return cc;
		}

		private static function initCategoryImageCache():ContentCache
		{
			const cc:ContentCache = new ContentCache();
			cc.maxCacheEntries = 99;
			return cc;
		}

		public const productImageCache:ContentCache = ProductImageCache;

		public const merchantLogoCache:ContentCache = MerchantLogoCache;

		public const categoryImageCache:ContentCache = CategoryImageCache;
	}
}
