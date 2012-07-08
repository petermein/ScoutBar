package scoutbar.view.productselection
{
	import flash.display.Sprite;
	import scoutbar.view.productselection.ProductBoard;
	import scoutbar.data.User;
	import scoutbar.events.ProductEvent;
	
	public class ProductSelection extends Sprite
	{
		public var board:ProductBoard = new ProductBoard(20,20,20,270);
		public var border:ProductBar = new ProductBar(250);
		public var user:User;
		
		public function ProductSelection()
		{
			this.addChild(board);
			this.addChild(border);
		}
		
		public function setUser(user:User):void{
			dispatchEvent(new ProductEvent(ProductEvent.USER_LOADED));
		}
	}
}