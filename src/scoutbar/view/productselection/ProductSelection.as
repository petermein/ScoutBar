package scoutbar.view.productselection
{
	import com.adobe.serialization.json.JSON;
	
	import debug.Functions;
	
	import flash.display.Sprite;
	
	import scoutbar.data.Global;
	import scoutbar.data.Order;
	import scoutbar.data.User;
	import scoutbar.events.ProductEvent;
	import scoutbar.loader.JsonLoadEvent;
	import scoutbar.loader.JsonSendEvent;
	import scoutbar.view.productselection.ProductBoard;
	
	public class ProductSelection extends Sprite
	{
		public static var board:ProductBoard = new ProductBoard(20,20,20,270);
		public static var border:ProductBar = new ProductBar(250);
		public static var user:User;
		public static var order:Order;
		
		public function ProductSelection()
		{
			this.addChild(board);
			this.addChild(border);
		}
		
		public static function sendOrder():void{
			var sender:JsonSendEvent = new JsonSendEvent();
			sender.Send(order);
			var loader:JsonLoadEvent = new JsonLoadEvent();
			loader.LoadUsers();
			order = null;
			board.clearAll();
			Global.SCOUTBAR.switchToUserSelectionFromProduct(null);
		}
		
		public function setUser(user:User):void{
			order = new Order(user);
			border.setUser(user);
			dispatchEvent(new ProductEvent(ProductEvent.USER_LOADED));
		}
	}
}