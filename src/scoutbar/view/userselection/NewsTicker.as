package scoutbar.view.userselection
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class NewsTicker extends Sprite
	{
		private var newsArr:Array = new Array();
		private var text1:TextField = new TextField();
		private var text2:TextField = new TextField();
		private var temptext:String = "";
		private var offset:int;
		private var size:int;
		
		public function NewsTicker(newsItems:Array, offset:int = 200, size:int = 30)
		{
			this.size = size;
			this.offset = offset;
			newsArr = newsItems;
			for(var index:String in newsArr){
				temptext += (" || " + newsArr[index]);
			}
			this.addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		public function addedHandler(e:Event):void
		{
				this.addEventListener(Event.ENTER_FRAME,enterframeHandler);
				var maskshape:Shape = new Shape();
				maskshape.graphics.lineStyle();
				maskshape.graphics.beginFill(0xffffff,0);
				maskshape.graphics.drawRect(0,0,stage.stageWidth - offset,size+10);
				maskshape.graphics.endFill();
				this.addChild(maskshape);
				this.mask = maskshape;
				
				this.x = offset/2
				
				var textformat:TextFormat = new TextFormat();
				textformat.size = this.size;
				textformat.align = TextFormatAlign.LEFT;
				
				this.text1.defaultTextFormat = textformat;
				this.text1.text = temptext;
				this.text1.x = 0;
				this.text1.y = 5;
				this.text1.width = text1.textWidth + 5;
				this.text1.textColor = 0xFFFFFF;
				this.text1.selectable = false;
				this.addChild(text1);
				
				this.text2.defaultTextFormat = textformat;
				this.text2.text = temptext;
				this.text2.x = text1.width;
				this.text2.y = 5;
				this.text2.width = text2.textWidth + 5;
				this.text2.textColor = 0xFFFFFF;
				this.text2.selectable = false;
				this.addChild(text2);
		}
		public function enterframeHandler(e:Event):void
		{
			text1.x -= 3;
			text2.x -= 3;
			//trace(text1.x);
			if(text1.x < (0-text1.width)){
				text1.x += text1.width*2;
			}
			if(text2.x < (0-text2.width)){
				text2.x += text2.width*2;
			}
		}
	}
}