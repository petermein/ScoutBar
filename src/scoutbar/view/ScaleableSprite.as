package scoutbar.view
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Stage;
	

	public class ScaleableSprite extends Sprite
	{
		public function ScaleableSprite()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.addedHandler, false, 0, true);
		}
		
		public function addedHandler(e : Event):void
		{
			stage.addEventListener(Event.RESIZE, this.resize);
			this.paint();
		}
		
		protected function paint():void
		{
		//must be overriden
		};
		
		protected function resize(e : Event):void
		{
		//must be overriden!
		};
		

	}
}