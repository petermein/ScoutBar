package scoutbar.data
{
	public class OrderRow
	{
		public var aantal:int;
		public var product:int;
		public var price:Number;
		public var naam:String;
		
		
		public function OrderRow(amount:int, product:Product)
		{
			this.naam = product.naam;
			this.aantal = amount;
			this.product = product.product_id;
			this.price = (product.prijs * amount);
			}
	}
}