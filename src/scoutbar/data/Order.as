package scoutbar.data
{
	import scoutbar.data.User;
	import scoutbar.events.OrderEvents;
	import flash.events.EventDispatcher;
	
	public class Order extends EventDispatcher
	{
		private var User:int;
		private var Account:int;
		private var Rows:Array = new Array();
		
		public function Order(User:User)
		{
			this.User = User.persoon_id;
			this.Account = User.rekening;
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_CREATED));
		}
		
		public function AddRow(amount:int, product:Product){
			var Row = new OrderRow(amount, product);
			this.Rows[product.product_id] = Row;
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_ROW_ADDED));
		}
				
		public function Clear(){
			this.Rows = new Array();
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_ROW_CLEARED));
		}
	}
}