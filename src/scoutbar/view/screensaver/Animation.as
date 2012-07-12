package scoutbar.view.screensaver
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import scoutbar.data.Global;
	import scoutbar.resource.Image;
	import scoutbar.view.userselection.NewsTicker;
	

	public class Animation extends Sprite
	{
		private var newsTicker:NewsTicker;
		private var timer:Timer = new Timer(5000, 0);
		private var _x:int;
		private var _y:int;
		private var logo:Bitmap = Image.Logo; 
		
		private var background:Shape = new Shape();
		
		public function Animation(w:int, h:int) 
		{
			_x = h;
			_y = w;
			newsTicker = new NewsTicker(Global.NEWS, 0, 60);
			background.graphics.lineStyle();
			background.graphics.beginFill(0x000000);
			background.graphics.drawRect(0,0,w,h);
			background.graphics.endFill();
			this.addChild(background);
			logo.scaleX = 0.2;
			logo.scaleY = 0.2;
			logo.x = 0;
			logo.y = 0;
			this.addChild(logo);
			this.addChild(newsTicker);
			
			timer.addEventListener(TimerEvent.TIMER, movelogo);
			timer.start();
		}
		
		private function movelogo(e:Event):void{
			var lx:int = Math.floor(Math.random()*(1+(_x-logo.width)-0))+0;
			var ly:int = Math.floor(Math.random()*(1+(_y-logo.height)-0))+0;
			logo.x = lx;
			logo.y = ly;
		}
	}
}