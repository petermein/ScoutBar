package scoutbar.view.userselection
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;

	public class SearchBar extends Sprite
	{
		public var text:TextField = new TextField();
		public var shape:Shape = new Shape();
		
		private var borderX:int;
		private var H:int;
		private var borderY:int;
		
		public function SearchBar(borderx:int,h:int,y:int)
		{
			
			this.borderY = y;
			this.borderX = borderx;
			this.H = h;
			this.addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		public function addedHandler(e:Event):void
		{
			this.y = stage.stageHeight - (borderY - 20);
			this.shape.graphics.lineStyle();
			this.shape.graphics.beginFill(0xf0f0f0,1);
			this.shape.graphics.drawRoundRect(borderX,0,stage.stageWidth - (borderX*2),H,H,H);
			this.shape.graphics.endFill();
			this.addChild(this.shape);
			
			this.text.type = TextFieldType.INPUT;
			var textformat:TextFormat = new TextFormat();
			textformat.size = 30;
			this.text.defaultTextFormat = textformat;
			this.text.x = borderX + 15;
			this.text.y = 7;
			this.text.width = stage.stageWidth - (borderX*2);
			this.text.height = H;
			this.text.border = false;
			this.addChild(text);
			stage.focus = text;
			
		}
	}
}