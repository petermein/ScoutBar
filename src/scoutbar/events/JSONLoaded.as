package scoutbar.events
{
	import flash.events.Event;

	public class JSONLoaded extends Event
	{
		public static const JSON_LOADED:String = "allJsonLoaded";
		
		public function JSONLoaded(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void
		{
			super(type, bubbles, cancelable);
		}
	}
}