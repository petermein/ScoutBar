package scoutbar.events
{
	import flash.events.Event;
	
	public class ProductEvent extends Event
	{
		public static const PRODUCT_READY:String = "productReady";
		
		public static const USER_LOADED:String = "userLoaded";

		public function ProductEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}