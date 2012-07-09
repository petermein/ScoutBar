package scoutbar.view.card
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	
	import scoutbar.resource.Image;
	
	public class CardArt extends Sprite
	{
		private var image:Bitmap;
		private var maskingShape:Shape=new Shape();
		private var bg:Shape=new Shape();
		
		public var Width:int;
		public var Height:int;
		
		public function CardArt(img:Bitmap,w:int,h:int,c:uint = 0xffffff)
		{
			this.Width=w;
			this.Height=h;
			image = new Bitmap(img.bitmapData);
			addChild(image);
			
			createGFX(c);
		}
		public function createGFX(c:uint):void
		{
			maskingShape.graphics.lineStyle();
			maskingShape.graphics.beginFill(0x000000,1);
			maskingShape.graphics.drawRoundRect(0,0,Width,Height,40,40);
			maskingShape.graphics.endFill();
			addChild(maskingShape);
			
			var myGlow:GlowFilter = new GlowFilter();
			myGlow.color = c;
			myGlow.strength = 255;
			image.filters = [myGlow];
			
			var ratio:Number = image.height / image.width;
			image.width = Width;
			image.height = Width * ratio;
			image.mask = maskingShape;
			
		
			addChild(image);
		}
		public function setImage(b:Bitmap):void
		{
			image.bitmapData = b.bitmapData;
			var ratio:Number = image.height / image.width;
			image.width = Width;
			image.height = Width * ratio;
		}
	}
}