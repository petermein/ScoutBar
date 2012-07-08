package scoutbar.view.card
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import scoutbar.data.Global;
	import scoutbar.resource.Image;
	
	public class Card extends Sprite
	{
		
		private var bg:Shape = new Shape();
		private var image:CardArt;
		private var push:PushCounter = new PushCounter();
		private var text:TextField = new TextField();
		
		public var data:*;
		
		private var imageLoader:Loader = new Loader();
		
		public function Card(dao:*)
		{
			this.data = dao;
			this.image = new CardArt(dao.image,90,90);
			this.addChild(image);
			
			this.bg.graphics.lineStyle();
			this.bg.graphics.beginFill(0xf0f0f0,0);
			this.bg.graphics.drawRect(0,0,110,150);
			this.bg.graphics.endFill();
			this.addChild(this.bg);

			image.x = 10;
			image.y = 10;
			this.addChild(image);
			
			var textformat:TextFormat = new TextFormat();
			textformat.size = 15;
			textformat.align = TextFormatAlign.CENTER;
			text.defaultTextFormat = textformat;
			text.text = data.toString();
			text.x = 0;
			text.y = 105;
			text.width = 110;
			text.height = 40;
			text.textColor = 0xFFFFFF;
			text.selectable = false;
			text.wordWrap = true;
			this.addChild(text);
			
			push.x = 80;
			push.y = 5;
			this.addChild(push);
		}
		public function setCount(i:int):void{
			push.setcounter(i);
		}
	}
}