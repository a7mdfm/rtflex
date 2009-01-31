/**
 * 
 *  This class just stores what options you have for formatting.
 * 
 **/
package org.RTFlex
{
	public class Format
	{
		public var underline:Boolean=false;
		public var bold:Boolean=false;
		public var italic:Boolean=false;
		public var strike:Boolean=false;
		
		public var superScript:Boolean=false;
		public var subScript:Boolean=false;
		
		public var makeParagraph:Boolean=false;
		
		public var align:String = Align.LEFT;
		
		public var font:String = Fonts.ARIAL;
		public var fontSize:int=12; 
		
		public var leftIndent:int=0;
		public var rightIndent:int=0; 
		
		public var color:RGB = Colors.BLACK;
		public var backgroundColor:RGB = Colors.WHITE
		
		//if defined, this element will become a link to this url
		public var url:String; 
		
		public function Format()
		{
		}
	}
}