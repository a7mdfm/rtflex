# Document Formatting #
The main RTF object has these properties:
  * marginLeft,marginRight,marginBottom,marginTop - top,left,right,bottom in "twips"
  * orientation: landscape or portrait
  * language: default is english
  * columns: A number of columns
  * columnLines: display a line between columns (not supported?)
  * pageNumbering: true/false, numbers pages

# Text Formatting #
Use the Format() object to set these properties, then pass it along.
  * underline:Boolean;
  * bold:Boolean;
  * italic:Boolean;
  * strike:Boolean;
  * superScript:Boolean;
  * subScript:Boolean;
  * makeParagraph:Boolean;
  * align:String = use statics from Align
  * font: any font string
  * fontSize;
  * leftIndent:int=0;
  * rightIndent:int=0;
  * color: use RGB object
  * backgroundColor: same as above... doesn't seem to be working

# Tables #
  * Tables are possible, but this needs a lot of work still. Create a "TableElement" object and then add rows which are arrays of column items for that row.

# Other Elements #
These methods are on the main RTF object and can be applied to a group
  * addPage(), adds a page
  * addLineBreak(), adds a line break
  * addTab(), adds a tab

# Saving #
  * Remote - for flex (sends btyearray to a page to be outputed)
  * Local - for air (generates bytearray)