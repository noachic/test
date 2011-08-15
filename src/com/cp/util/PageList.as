package com.cp.util
{
	import com.cp.model.common.PageVo;

	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.collections.ListCollectionView;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	import org.spicefactory.lib.reflect.types.Void;

	[Bindable]
	public class PageList extends ListCollectionView
	{
		public function PageList(list:IList=null)
		{
			super(list);
		}

		private var _pagedList:PagedListCollectionView;

		private var _selectedIndex:int;

		public function get pagedList():PagedListCollectionView
		{
			return _pagedList;
		}

		public function set pagedList(value:PagedListCollectionView):void
		{
			if (_pagedList != value)
			{
				if (_pagedList != null)
					_pagedList.removeEventListener(CollectionEvent.COLLECTION_CHANGE, pagedList_collectionChangeHandler);

				_pagedList = value;

				if (_pagedList != null)
					_pagedList.addEventListener(CollectionEvent.COLLECTION_CHANGE, pagedList_collectionChangeHandler, false, 0, true);


				generatePages();
				setSelectedPage();
			}
		}

		public function get selectedIndex():int
		{
			return _selectedIndex;
		}

		public function set selectedIndex(value:int):void
		{
			_selectedIndex = Math.min(length, value);
		}

		private function pagedList_collectionChangeHandler(event:CollectionEvent):void
		{
			switch (event.kind)
			{
				case CollectionEventKind.ADD:
				case CollectionEventKind.REMOVE:
				case CollectionEventKind.REFRESH:
				case CollectionEventKind.RESET:
					generatePages();
					setSelectedPage();
					break;

				default:
					setSelectedPage();
					break;
			}
		}

		private function setSelectedPage():void
		{
			selectedIndex = pagedList == null ? -1 : pagedList.currentPage;
		}

		private function generatePages():void
		{
			var data:Array = [];
			if (pagedList != null)
			{
				for (var i:int = 0; i < pagedList.totalPages; i++)
					data[i] = new PageVo(i);
			}

			list = new ArrayList(data);
		}
	}
}
