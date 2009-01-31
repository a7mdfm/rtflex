package org.RTFlex
{
	
	public class TextElement
	{
		public var text:String;
		public var format:Format;
		
		//
		private var _colorPos:int;
		private var _backgroundColorPos:int;
		private var _fontPos:int;
		
		public function TextElement(text:String,format:Format,colorPos:int,backgroundColorPos:int,fontPos:int):void
		{
			this.text=text; 
			this.format=format;
			_colorPos=colorPos;
			_backgroundColorPos=backgroundColorPos;
			_fontPos=fontPos;
		}
		
		
		private function getRTFSafeText():String{
			var safeText:String = text;
			safeText.split('\\').join('\\\\'); //turn all single back slashes into double
			safeText.split('{').join('\\{'); 
			safeText.split('}').join('\\}'); 
			safeText.split('~').join('\\~'); 
			safeText.split('-').join('\\-'); 
			safeText.split('_').join('\\_'); 			
			return safeText;
		}
		
		public function getRTFCode():String{
			var rtf:String = "{";
			if(format.makeParagraph) rtf+="\\pard";
			rtf+="\\f"+_fontPos.toString();
			rtf+="\\cb"+(_backgroundColorPos+1).toString();  //Add one because color 0 is null
			rtf+="\\cf"+(_colorPos+1).toString(); //yup
			if(format.fontSize >0) rtf+="\\fs"+(format.fontSize*2).toString();
			if(format.bold) rtf+="\\b";
			if(format.italic) rtf+="\\i";
			if(format.underline) rtf+="\\ul";
			if(format.strike) rtf+="\\strike";
			if(format.leftIndent>0) rtf+="\\li"+format.leftIndent.toString();
			if(format.rightIndent>0) rtf+="\\ri"+format.rightIndent.toString();
			if(format.subScript) rtf+="\\sub";
			if(format.superScript) rtf+="\\super";
			
			rtf+=" "+getRTFSafeText();
			
			if(format.makeParagraph) rtf+="\\par";
			rtf+="}"
			return rtf;
		}
	}
}