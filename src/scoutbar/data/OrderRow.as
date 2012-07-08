package scoutbar.data
{
	public class OrderRow
	{
		private var aantal:int;
		private var product:int;
		private var price:Number;
		
		public function OrderRow(amount:int, product:Product)
		{
			this.aantal = amount;
			this.product = product.product_id;
			this.price = (product.prijs * amount);
			
			
		}
	}
}