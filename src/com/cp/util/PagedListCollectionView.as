package com.cp.util
{
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.ListCollectionView;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	[Bindable]
	public class PagedListCollectionView extends ListCollectionView
	{
		private static const majorEventKinds:Array = [ CollectionEventKind.ADD,
													   CollectionEventKind.REMOVE,
													   CollectionEventKind.RESET ];

		public function PagedListCollectionView(list:IList=null)
		{
			super(list);

			filterFunction = filterForPage;
			addEventListener(CollectionEvent.COLLECTION_CHANGE, handleCollectionChange);
			refresh();
		}

		private var _currentPage:int = 0;

		private var _pageSize:uint = 10;

		private var _startIndex:int = 0;

		private var _totalPages:int = 1;

		override public function set list(value:IList):void
		{
			value = value || new ArrayCollection();

			if (super.list != value)
			{
				if (super.list != null)
					super.list.removeEventListener(CollectionEvent.COLLECTION_CHANGE, handleUnderlyingCollectionChange);

				super.list = value;

				super.list.addEventListener(CollectionEvent.COLLECTION_CHANGE, handleUnderlyingCollectionChange);
			}
		}

		[ChangeEvent("collectionChange")]
		public function get currentPage():int
		{
			return _currentPage;
		}

		public function set currentPage(value:int):void
		{
			_currentPage = value;
			refresh();
		}

		[ChangeEvent("collectionChange")]
		public function get pageSize():uint
		{
			return _pageSize;
		}

		public function set pageSize(value:uint):void
		{
			_pageSize = value;
			refresh();
		}

		[ChangeEvent("collectionChange")]
		public function get startIndex():int
		{
			return _startIndex;
		}

		public function set startIndex(value:int):void
		{
			_startIndex = value;
			currentPage = Math.floor(_startIndex / pageSize);
			refresh();
		}

		[ChangeEvent("collectionChange")]
		public function get totalLength():uint
		{
			return list.length;
		}

		[ChangeEvent("collectionChange")]
		public function get totalPages():uint
		{
			var result:Number = list.length / pageSize;
			result = Math.ceil(result);
			return result;
		}

		private function handleCollectionChange(event:CollectionEvent):void
		{
			if (majorEventKinds.indexOf(event.kind) == -1)
				return;

			if (!isNaN(_totalPages) && _totalPages != totalPages)
				_totalPages = totalPages;
		}

		private function handleUnderlyingCollectionChange(event:CollectionEvent):void
		{
			if (majorEventKinds.indexOf(event.kind) != -1)
				refresh();
		}

		private function filterForPage(item:Object):Boolean
		{
			var windowMaximum:Number = pageSize * (currentPage + 1);
			var windowMinimum:Number = windowMaximum - pageSize;

			var index:Number = getItemIndex(item);
			return windowMinimum <= index && index < windowMaximum;
		}
	}
}
