package scoutbar.data
{
	import flash.events.EventDispatcher;
	import scoutbar.data.User;
	import scoutbar.events.OrderEvents;
	
	
	public class Order extends EventDispatcher
	{
		private var User:int;
		private var Account:int;
		private var Rows:Array = new Array();
		
		public function Order(user:User, test:String){
			this.User = user.persoon_id;
			this.Account = user.rekening;
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_CREATED));
		}
		
		public function AddRow(amount:int, product:Product):void{
			var Row = new OrderRow(amount, product);
			this.Rows[product.product_id] = Row;
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_ROW_ADDED));
		}
				
		public function Clear():void{
			this.Rows = new Array();
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_ROW_CLEARED));
		}
	}
}