package scoutbar.view.productselection
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import scoutbar.resource.Image;
	import scoutbar.view.card.CardArt;

	public class ProductBar extends Sprite
	{
		private var bg:Shape = new Shape();
		private var bg2:Shape = new Shape();
		private var knop:Shape = new Shape();
		private var image:CardArt = new CardArt(Image.Panda,200,300);
		private var Width:int;
		
		public function ProductBar(w:int)
		{
			Width = w;
			this.addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		public function addedHandler(e:Event):void
		{
			this.x = this.stage.stageWidth - Width;
			trace("create product barr");
			this.bg.graphics.lineStyle();
			this.bg.graphics.beginFill(0xf0f0f0,0.5);
			this.bg.graphics.drawRect(0,340,Width,this.stage.stageHeight - 340);
			this.bg.graphics.endFill();
			this.addChild(bg);
			
			this.bg2.graphics.lineStyle();
			this.bg2.graphics.beginFill(0x000000,0.5);
			this.bg2.graphics.drawRect(0,0,Width,340);
			this.bg2.graphics.endFill();
			this.addChild(bg2);
			
			this.knop.graphics.lineStyle();
			this.knop.graphics.beginFill(0x000000,0.5);
			this.knop.graphics.drawRoundRect(20,this.stage.stageHeight - 100,Width-40,80,30,30);
			this.knop.graphics.endFill();
			this.addChild(knop);
			
			this.image.x = 20;//2 / (this.Width - this.image.Width)
			this.image.y = this.image.x;
			this.addChild(image);
		}
	}
}