package scoutbar.view.card
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import scoutbar.resource.Image;

	public class PushCounter extends Sprite
	{
		private var image:Bitmap = new Bitmap(Image.Push.bitmapData);
		private var counter:TextField = new TextField();
		public function PushCounter()
		{
			//this.image.graphics.lineStyle();
			//this.image.graphics.beginFill(0xff0000,1);
			//this.image.graphics.drawCircle(15,15,15);
			//this.image.graphics.endFill();
				
			var textformat:TextFormat = new TextFormat();
			textformat.size = 22;
			this.counter.width = 30;
			this.counter.height = 25;
			this.counter.x = 4;
			this.counter.y = 7;
			textformat.align = TextFormatAlign.CENTER;
			this.counter.defaultTextFormat = textformat;
			this.counter.text = ""
			this.counter.textColor = 0xFFFFFF;
			this.counter.selectable = false;
		}
		public function setcounter(i:int):void
		{
			if(i == 0){
				this.removeChildren();
			}else{
				if(!this.contains(this.counter)){
					this.addChild(this.image);
					this.addChild(this.counter);
				}
				this.counter.text = ""+i;
			}
		}
	}
}