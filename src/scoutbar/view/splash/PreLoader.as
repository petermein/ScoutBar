package scoutbar.view.splash
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;

	public class PreLoader extends Sprite
	{
		private var img:Shape = new Shape();
		private var img2:Shape = new Shape();
		
		public function PreLoader()
		{
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.img.graphics.lineStyle();
			this.img.graphics.beginFill(0xffffff,1);
			this.img.graphics.drawRoundRect(-20,-10,40,20,20,20);
			this.img.graphics.endFill();
			this.addChild(this.img);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.img2.graphics.lineStyle();
			this.img2.graphics.beginFill(0xffffff,1);
			this.img2.graphics.drawRoundRect(-10,-20,20,40,20,20);
			this.img2.graphics.endFill();
			this.addChild(this.img2);
		}
		public function onEnterFrame(e:Event):void
		{
			this.rotation += 5;
		}
	}
}