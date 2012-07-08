package scoutbar.events
{
	import flash.events.Event;
	
	import scoutbar.data.User;
	
	public class UserEvent extends Event
	{
		public static const USER_READY:String = "userReady";
		
		public var USER_REF:User;
			
		public function UserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}