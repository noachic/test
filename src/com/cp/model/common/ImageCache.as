package com.cp.model.common
{
	import spark.core.ContentCache;

	public class ImageCache
	{
		private static const ProductImageCache:ContentCache = initProductImageCache();

		private static const MerchantLogoCache:ContentCache = initMerchantLogoCache();

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

		public const productImageCache:ContentCache = ProductImageCache;

		public const merchantLogoCache:ContentCache = MerchantLogoCache;
	}
}
