package com.cp.framework.vomanager.events
{
	import flash.events.Event;

	public class VOManagerEvent extends Event
	{
		public static const CREATED_VO:String = 'createdVO';

		public var voClass:Class;

		public var voKey:Object;

		public function VOManagerEvent(type:String)
		{
			super(type);
		}

		public static function createCreatedEvent(voClass:Class, voKey:Object):VOManagerEvent
		{
			var event:VOManagerEvent = new VOManagerEvent(CREATED_VO);
			event.voClass = voClass;
			event.voKey = voKey;

			return event;
		}
	}
}
