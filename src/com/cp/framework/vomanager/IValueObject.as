package com.cp.framework.vomanager
{
	import flash.events.IEventDispatcher;

	public interface IValueObject extends IEventDispatcher
	{
		function get codec():ICoDec;

		function get primaryKey():Object;
	}
}
