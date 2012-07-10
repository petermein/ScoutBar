package scoutbar.view.screensaver
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.display.Shape;
	
	public class Screensaver
	{
		private var _stage:Stage;
		private var minuteTimer:Timer;
		
		public function Screensaver(_stage:Stage)
		{
			this._stage = _stage;
			//sets the 7 second Timer variable. 
			minuteTimer = new Timer(7000, 0);
			
			//Listens for the checkbox to see if it is clicked, if so, add a timer to the picture change. 
			
			// creates a new Timer
			// designates listeners for the interval and completion events
			minuteTimer.addEventListener(TimerEvent.TIMER, screensaver);
			// starts the timer ticking
			minuteTimer.start();
			//minuteTimer.stop(); stops it
			//minuteTimer.reset(); resets it. 
		}
		
		public function screensaver(e:TimerEvent):void{
			minuteTimer.start();   ////stop the timer or it will keep going.
			minuteTimer.removeEventListener(TimerEvent.TIMER, screensaver);
			trace('start screensaver');
			var blackbox:Shape = new Shape();
			blackbox.graphics.lineStyle();
			blackbox.graphics.beginFill(0xffffff,1);
			blackbox.graphics.drawRoundRect(200, 1000, 1000,50,30,30);
			blackbox.graphics.endFill();
			_stage.addChild(blackbox);
		}
	}
}