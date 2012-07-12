package scoutbar.data
{
	import flash.events.EventDispatcher;
	
	import scoutbar.events.OrderEvents;
	
	
	public class Order extends EventDispatcher
	{
		public var User:int;
		public var BarUser:int = -1;
		public var Account:int;
		public var Rows:Array = new Array();
		
		public function Order(user:*){
			this.User = user.persoon_id;
			this.Account = user.rekening;
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_CREATED));
		}
		
		public function startAddMoney(personel:*):void{
			this.BarUser = personel.persoon_id;
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_MONEY_ADD));
		}
		
		public function AddRow(amount:int, product:Product):void{
			var Row:OrderRow = new OrderRow(amount, product);
			this.Rows[product.product_id] = Row;
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_ROW_ADDED));
		}
				
		public function Clear():void{
			this.Rows = new Array();
			dispatchEvent(new OrderEvents(OrderEvents.ORDER_ROW_CLEARED));
		}
	}
}