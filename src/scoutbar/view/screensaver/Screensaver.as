package scoutbar.view.screensaver
{
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import scoutbar.data.Global;
	
	public class Screensaver
	{
		private var _stage:Stage;
		private var minuteTimer:Timer;
		private var animation:Animation;
		
		public function Screensaver(_stage:Stage)
		{
			this._stage = _stage;
			animation = new Animation(_stage.stageWidth, _stage.stageHeight);
			startTimer();
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, resetTimer);
			//_stage.addEventListener(MouseEvent.CLICK, resetTimer);


		}
		
		public function screensaver(e:TimerEvent):void{
			minuteTimer.start();   ////stop the timer or it will keep going.
			minuteTimer.removeEventListener(TimerEvent.TIMER, screensaver);

			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, resetTimer);
			//_stage.removeEventListener(MouseEvent.CLICK, resetTimer);
			animation.addEventListener(MouseEvent.MOUSE_MOVE, stopscreensaver);
			//animation.addEventListener(MouseEvent.CLICK, stopscreensaver);
			
			_stage.addChild(animation);
		}
		
		private function stopscreensaver(e:MouseEvent):void
		{
			_stage.removeChild(animation);
			startTimer();
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, resetTimer);
			//_stage.addEventListener(MouseEvent.CLICK, resetTimer);
		}
		
		public function resetTimer(e:MouseEvent):void
		{
			minuteTimer.reset();
			minuteTimer.start();
		}
		
		public function startTimer():void
		{
			//sets the 7 second Timer variable. 
			minuteTimer = new Timer(15000, 0);
			
			//Listens for the checkbox to see if it is clicked, if so, add a timer to the picture change. 
			
			// creates a new Timer
			// designates listeners for the interval and completion events
			minuteTimer.addEventListener(TimerEvent.TIMER, screensaver);
			// starts the timer ticking
			minuteTimer.start();
			//minuteTimer.stop(); stops it
			//minuteTimer.reset(); resets it. 
		}
	}
}