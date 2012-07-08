package scoutbar.view.productselection
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import scoutbar.view.card.CardArt;
	import scoutbar.resource.Image;

	public class ProductBar extends Sprite
	{
		private var bg:Shape = new Shape();
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
			this.bg.graphics.drawRect(0,0,Width,this.stage.stageWidth);
			this.bg.graphics.endFill();
			this.addChild(bg);
		}
	}
}