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
		public function formatText(text:String,colorPos:int,backgroundColorPos:int,fontPos:int,safeText:Boolean=true):String{
			var rtf:String = "{";
			if(makeParagraph) rtf+="\\pard";
			rtf+="\\f"+fontPos.toString();
			rtf+="\\cb"+(backgroundColorPos+1).toString();  //Add one because color 0 is null
			rtf+="\\cf"+(colorPos+1).toString(); //yup
			rtf+=align;
			if(fontSize >0) rtf+="\\fs"+(fontSize*2).toString();
			if(bold) rtf+="\\b";
			if(italic) rtf+="\\i";
			if(underline) rtf+="\\ul";
			if(strike) rtf+="\\strike";
			if(leftIndent>0) rtf+="\\li"+leftIndent.toString();
			if(rightIndent>0) rtf+="\\ri"+rightIndent.toString();
			if(subScript) rtf+="\\sub";
			if(superScript) rtf+="\\super";
			
			//we don't escape text if there are other elements in it, so set a flag
			if(safeText){
				rtf+=" "+getRTFSafeText(text);
			}else{
				rtf+=text;
			}
			
			if(makeParagraph) rtf+="\\par";
			rtf+="}"
			return rtf;
		}
		
		private function getRTFSafeText(text:String):String{
			var safeText:String = text;
			safeText.split('\\').join('\\\\'); //turn all single back slashes into double
			safeText.split('{').join('\\{'); 
			safeText.split('}').join('\\}'); 
			safeText.split('~').join('\\~'); 
			safeText.split('-').join('\\-'); 
			safeText.split('_').join('\\_'); 			
			return safeText;
		}
	}
}