package com.cp.framework.vomanager
{
	import com.cp.framework.vomanager.events.VOManagerEvent;

	import flash.events.EventDispatcher;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	import mx.utils.DescribeTypeCache;

	public class VOManager
	{
		public static var eventDispatcher:EventDispatcher = new EventDispatcher();
		;

		private static var registry:Object = new Object();

		private static function getPrimaryKeyHash(inPrimaryKeys:Object):String
		{
			var myUniqueKey:String = ''; //getQualifiedClassName(clazz) + '@';

			// create a hash-map code outta the primary keys:
			//
			// updates 04/2009:
			// In order to match up key / value pairs coming in different orders
			// in the primaryKeys object in different function calls, when we need
			// to sort the keys first.
			var keyList:Array = [];
			if (inPrimaryKeys != null)
			{
				// extract the keys from the keys object, followed by sorting the keys.
				for (var myLookupKey:String in inPrimaryKeys)
					keyList.push(myLookupKey + '#' + inPrimaryKeys[myLookupKey]);
				keyList = keyList.sort();
			}

			return myUniqueKey + keyList.join('##');
		}

		public static function voExist(inClass:Class, inPrimaryKeys:Object):Boolean
		{
			var hash:String = getPrimaryKeyHash(inPrimaryKeys);
			if (registry[hash] == undefined || registry[hash] == null)
				return false;

			var vo:IValueObject = registry[hash];
			var cName:String = getQualifiedClassName(vo);
			var c:Class = getDefinitionByName(cName) as Class;
			if (c == inClass)
				return true;

			// here's the meat of the new approach
			var desc:XML = DescribeTypeCache.describeType(vo).typeDescription;
			var superClasses:XMLList = desc.extendsClass.@type;
			for each (var superClass:XML in superClasses)
			{
				c = getDefinitionByName(String(superClass)) as Class;
				if (c == inClass)
					return true;
			}

			return false;
		}

		/**
		 * blai: as of 06/19/2009, we are changing the behavior of getVO to the following. Any caller of such function
		 * must pass in a valid Class and valid key object.
		 * A key object is consider valid only if every key component is valid (and the key itself cannot be null). If a
		 * key component is of any number type (int, uint, Number), isNaN() function call will be used to determine the
		 * validity, if a key component is of any other type, it is valid as long as it isn't equal to null.
		 *
		 * When key is not fully valid, this function will return null. This is b/c we don't want the funciton caller
		 * to think that they are actually getting an instance that everybody else can share.
		 *
		 * While the new change prevents the function caller to retrieve the shared instance of such object, a way to
		 * workaround is prvoided. First of, any function caller of this function should have no problem creating a
		 * dummy instance of the class you want themselves. Secondly, this new implementation of VOManager embeds an
		 * event dispatcher internally, such that it will dispatch a VOManagerEvent whenever a new IValueObject instance
		 * is added to the registry. This allows the function caller to first create a dummy object as place holder to
		 * get around any null pointer exceptions, then it can listen to the updates from VOManager for any new object
		 * that is being added into its registry, find out if the object is what could replace the dummy object and
		 * proceed with the swapping.

		 * Note: The swapping MUST not replace the instance of the object from VOManager. Instead the caller should copy
		 *				the dummy objects properties into the VOManager instance.
		 */
		public static function getVO(inClass:Class, inPrimaryKeys:Object):IValueObject
		{
			// description: looks for existing instance of given class that contains given primary key.
			// precondition 1: inClass must implement IValueObject. 
			// precondition 2: inPrimaryKeys must not be null, and must contain key/val pair that is legitimate assignment for inClass.
			// return value: if instance already exists, will return that instance without further ado.
			// return value: if instance doesn't exist, will return a new instance after newing it and defining it's primary key.

			// blai: as of 06/19/2009, we no long return a dummy instance of the inClass, instead we return null if
			// the key is no fully valid.
			if (!keyIsValid(inPrimaryKeys))
				return null;

			var myUniqueKey:String = getPrimaryKeyHash(inPrimaryKeys);
			var retval:* = registry[myUniqueKey];

			if (retval == null)
			{
				// if we still don't have a retval, then we need to create one and add it to the registry by key.

				retval = IValueObject(new inClass());
				for (var myNewKey:String in inPrimaryKeys)
				{
					// fyi: if you get an error right here, check out precondition #2 commented at top of function.
					retval[myNewKey] = inPrimaryKeys[myNewKey]
				}
				registry[myUniqueKey] = retval;

				eventDispatcher.dispatchEvent(VOManagerEvent.createCreatedEvent(inClass, inPrimaryKeys));
			}

			return IValueObject(retval);
		}

		public static function getVOFromXML(voClass:Class, xml:XML, codec:IXMLCoDec=null, defaultValues:Object=null, lazy:Boolean=false):IValueObject
		{
			if (codec == null)
				codec = IValueObject(new voClass()).codec as IXMLCoDec;

			var key:Object = codec.primaryKeyFromXML(xml);
			if (!voExist(voClass, key) && lazy)
				return null;

			var vo:IValueObject = getVO(voClass, key);
			XMLCoDecUtil.fromXML(vo, xml, codec, defaultValues);

			return vo;
		}

		public static function keyIsValid(key:Object):Boolean
		{
			if (key == null)
				return false;

			var pk:*;
			for (var prop:String in key)
			{
				//determine if any key property is not set
				pk = key[prop];
				switch (typeof pk)
				{
					case 'number':
						if (isNaN(pk))
							return false;
					default:
						if (pk == null)
							return false;
				}
			}
			return true;
		}
	}
}
