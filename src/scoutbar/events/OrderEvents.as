package scoutbar.events
{
	import flash.events.Event;

	public class OrderEvents extends Event
	{
		public static const ORDER_CREATED:String = "orderCreated";

		public static const ORDER_ROW_ADDED:String = "orderRowAdded";

		public static const ORDER_ROW_DELETED:String = "orderRowDeleted";
		
		public static const ORDER_ROW_CLEARED:String = "orderRowCleared";
		
		public static const ORDER_MONEY_ADD:String = "orderMoneyAdd";

		public function OrderEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void
		{
			super(type, bubbles, cancelable);
		}
	}
}
