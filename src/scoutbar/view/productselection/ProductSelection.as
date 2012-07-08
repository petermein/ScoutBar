package scoutbar.view.productselection
{
	import flash.display.Sprite;
	
	import scoutbar.view.productselection.ProductBoard;
	
	public class ProductSelection extends Sprite
	{
		public var board:ProductBoard = new ProductBoard(40,100,20,330);
		public var border:ProductBar = new ProductBar(300);
		
		public function ProductSelection()
		{
			this.addChild(board);
			this.addChild(border);
		}
	}
}