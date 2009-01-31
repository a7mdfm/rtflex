package org.RTFlex
{
	
	public class GroupElement
	{
		
		
		public var name:String;
		public var format:Format;
		
		//
		private var _colorPos:int;
		private var _backgroundColorPos:int;
		private var _fontPos:int;
		
		private var elements:Array;
		
		public function GroupElement(name:String,format:Format,colorPos:int,backgroundColorPos:int,fontPos:int)
		{
			elements = new Array();
			this.name=name;
			this.format=format;
			_colorPos=colorPos;
			_backgroundColorPos=backgroundColorPos;
			_fontPos=fontPos; 
		}
		public function addElement(element:*):void{//can be a string (command) or TextElemetn
			elements.push(element);
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
			
			//outputs the elements
		 	for(var i:int=0;i<elements.length;i++){
		 		if(elements[i] is TextElement){
		 			rtf+=TextElement(elements[i]).getRTFCode();
		 		}else if(elements[i] is String){
		 			rtf+=elements[i];
		 		}
		 	}
		 	
			if(format.makeParagraph) rtf+="\\par";
			rtf+="}"
			return rtf;
		}
		
		
		
	}
}