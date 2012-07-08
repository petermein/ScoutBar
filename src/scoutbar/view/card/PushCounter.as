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
		private var i:int = 0;
		
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
			this.counter.x = 3;
			this.counter.y = 6;
			textformat.align = TextFormatAlign.CENTER;
			this.counter.defaultTextFormat = textformat;
			this.counter.text = ""
			this.counter.textColor = 0xFFFFFF;
			this.counter.selectable = false;
		}
		public function decrementCounter():int{
			this.i--;
			draw();
			return this.i;
		}
		
		public function incrementCounter():int{
			this.i++;
			draw();
			return this.i;
		}
		
		
		public function setcounter(i:int):int
		{
				this.i = i;
				draw();
				return this.i;
		}
		
		private function draw():void {
			if(this.i == 0){
				this.removeChildren();
			}else{
				if(!this.contains(this.counter)){
					this.addChild(this.image);
					this.addChild(this.counter);
				}
				counter.text = i.toString();
			}
		}
	}
}