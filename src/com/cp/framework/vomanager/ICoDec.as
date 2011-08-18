package com.cp.framework.vomanager
{

	public interface ICoDec
	{
		/**
		 * Returns An Object returning key/value pairs for decoding the associated
		 * 		IValueObject instance, where keys are the names of the properties
		 * 		of the IValueObject instance, and values could be either a String
		 * 		or a Function.
		 * 		a)	When value is a String, it represents a node name of the XML that
		 * 		is being decoded. With this, XMLCoDecUtil would generate a default
		 * 		decode function to convert the content of such XML node into the
		 * 		appropriate value type of property designated by key. Currently,
		 * 		the following primitive types are supported:
		 * 		-	String
		 * 		-	Number
		 * 		-	int
		 * 		-	uint
		 * 		-	Boolean
		 * 		-	Array
		 * 		-	Object
		 * 		all other types may likely end up with exception, and in which case,
		 * 		solution (b) should be used.
		 *
		 * 		b)	Whe value is a Function, it should have the following signature:
		 * 			function (xml:XML, vo:IValueObject):void
		 * 			where xml is the entire xml object the CoDec is trying to decode,
		 * 			and the vo is the IValueObject instance that is supposed to be
		 * 			the desginated location where each decoded properties should be
		 * 			stored.
		 *
		 * Example:
		 * public function get decodeMap():Object
		 * {
		 *     return {
		 *         boothId: 'boothId',
		 *         boothCd: 'boothCd',
		 *         boothImageUrl: 'boothImageUrl',
		 *         clientId: 'clientId',
		 *         description: 'description',
		 *         exhibitHallImageUrl: 'exhibitHallImageUrl',
		 *         giveaways: 'giveaways',
		 *         logoImageUrl: 'logoImageUrl',
		 *         numOfDocuments: 'numOfDocuments',
		 *         numOfGiveways: 'numOfGiveways',
		 *         numOfPolls: 'numOfPolls',
		 *         numOfSurveys: 'numOfSurveys',
		 *         numOfWebcasts: 'numOfWebcasts',
		 *         offset: 'offset',
		 *         properties: 'properties',
		 *         row: 'row',
		 *         sponsorId: 'sponsorId',
		 *         title: 'title',
		 *         tradeshowId: 'tradeshowId',
		 *         traverseSequenceNum: 'traverseSequenceNum'
		 *     };
		 * }
		 */
		function get decodeMap():Object; // previously called fieldMap

		/**
		 * This returns an object of key/value map just like the decodeMap above, except
		 * 		that now the keys are representing the node name of the encoded xml, and
		 * 		values could also be either a String or a Function:
		 * 		a)	When value is a String, it represents a property name of the IValueObject
		 * 			instance that is being encoded into XML.
		 * 		b)	When value is a Function, it should have the following signature:
		 * 			function (vo:IValueObject):XMLList
		 */
		function get encodeMap():Object;
	}
}
