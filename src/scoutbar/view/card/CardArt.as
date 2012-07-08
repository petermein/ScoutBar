package scoutbar.view.card
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	
	public class CardArt extends Sprite
	{
		private var image:Bitmap;
		private var maskingShape:Shape=new Shape();
		private var dropShadow:DropShadowFilter = new DropShadowFilter();
		
		public var Width:int;
		public var Height:int;
		
		public function CardArt(img:Bitmap,w:int,h:int)
		{
			this.Width=w;
			this.Height=h;
			image = new Bitmap(img.bitmapData);
			addChild(image);
			createGFX();
		}
		public function createGFX():void
		{
			maskingShape.graphics.lineStyle();
			maskingShape.graphics.beginFill(0x000000,1);
			maskingShape.graphics.drawRoundRect(0,0,Width,Height,75,75);
			maskingShape.graphics.endFill();
			addChild(maskingShape);
			
			image.width = Width;
			image.height = Height;
			image.mask = maskingShape;
			
			dropShadow.distance = 10;
			dropShadow.angle = 45;
			dropShadow.color = 0x333333;
			dropShadow.alpha = 1;
			dropShadow.blurX = 10;
			dropShadow.blurY = 10;
			dropShadow.strength = 1.2;
			dropShadow.quality = 15;
			dropShadow.inner = false;
			dropShadow.knockout = false;
			dropShadow.hideObject = false;
			image.filters = new Array(dropShadow);
		
			addChild(image);
		}
		
	}
}