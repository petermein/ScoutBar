package scoutbar.view.productselection
{
	import flash.display.Sprite;
	
<<<<<<< HEAD
	import scoutbar.view.productselection.ProductBoard;
	import scoutbar.data.User;
	import scoutbar.events.ProductEvent;
	
=======
>>>>>>> ProductBar update
	public class ProductSelection extends Sprite
	{
		public var board:ProductBoard = new ProductBoard(40,100,20,330);
		public var border:ProductBar = new ProductBar(300);
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