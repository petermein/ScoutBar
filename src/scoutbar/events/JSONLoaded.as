package scoutbar.events
{
	import flash.events.Event;

	public class JSONLoaded extends Event
	{
		public static const JSON_LOADED:String = "allJsonLoaded";
		
		public static const JSON_USERS_LOADED:String = "usersJsonLoaded";
		
		public static const JSON_HISTORY_LOADED:String = "usersJsonLoaded";
		
		public static const JSON_SEND_COMPLETE:String = "sendJsonComplete";

		
		
		
		public function JSONLoaded(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void
		{
			super(type, bubbles, cancelable);
		}
	}
}