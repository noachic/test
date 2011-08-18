package com.cp.framework.vomanager
{

	public interface IXMLCoDec extends ICoDec
	{
		function get rootName():String;

		function primaryKeyFromXML(xml:XML):Object;
	}
}
