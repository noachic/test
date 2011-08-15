package com.cp.model.common
{

	[Bindable]
	public class PageVo
	{
		public function PageVo(pageIndex:int)
		{
			super();

			this.pageIndex = pageIndex;
		}

		public var pageIndex:int;
	}
}
