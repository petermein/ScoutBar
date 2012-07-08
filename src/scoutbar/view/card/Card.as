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
	
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	
	public class Card extends Sprite
	{
		
		private var bg:Shape = new Shape();
		private var image:CardArt;
		private var push:PushCounter = new PushCounter();
		private var text:TextField = new TextField();
		
		public var data:*;
		
		private var imageLoader:Loader = new Loader();
		
		public function Card(dao:*,w:int,h:int)
		{
			this.data = dao;
			this.image = new CardArt(dao.image,w,h);
			this.addChild(image);
			
			this.bg.graphics.lineStyle();
			this.bg.graphics.beginFill(0xf0f0f0,0);
			this.bg.graphics.drawRect(0,0,110,150);
			this.bg.graphics.endFill();
			this.addChild(this.bg);

			image.x = 10;
			image.y = 10;
			this.addChild(image);
			
			var matrix:Array = new Array();
			matrix=matrix.concat([0.5,0.5,0.5,0,0]);// red
			matrix=matrix.concat([0.5,0.5,0.5,0,0]);// green
			matrix=matrix.concat([0.5,0.5,0.5,0,0]);// blue
			matrix=matrix.concat([0,0,0,1,0]);// alpha
			var my_filter:ColorMatrixFilter=new ColorMatrixFilter(matrix);
			image.filters=[my_filter];
			
			
			
			var textformat:TextFormat = new TextFormat();
			textformat.size = 15;
			textformat.align = TextFormatAlign.CENTER;
			text.defaultTextFormat = textformat;
			text.text = data.toString();
			text.x = 0;
			text.y = 15 + h;
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
		public function incCount():int{
			return push.incrementCounter();
		}
		
		public function setCount(i:int):void{
			push.setcounter(i);
		}
		public function compareCards(a:Card,b:Card):int
		{
			if(a.data.voornaam == b.data.voornaam){
				if(a.data.achternaam <= b.data.achternaam){
					return -1;
				}else{
					return 1;
				}
			}else if(a.data.voornaam < b.data.voornaam){
				return -1;
			}else{
				return 1;
			}
		}
	}
}