package scoutbar.loader
{
	import com.adobe.serialization.json.JSON;
	
	import debug.Functions;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import scoutbar.data.Global;
	import scoutbar.data.Product;
	import scoutbar.data.User;
	import scoutbar.events.JSONLoaded;
	import scoutbar.events.ProductEvent;
	import scoutbar.events.UserEvent;
	
	public class JsonLoadEvent extends EventDispatcher
	{
		private var Loaders:Array = new Array();
		
		private var UserLoaded:Boolean = false;
		private var ProductsLoaded:Boolean = false;
		
		public function JsonLoadEvent(){

		}
		
		public function Load():void {
			LoadUsers();
			LoadProducts();
		}
		
		public function LoadUsers(id:int = -1):void {
				var path:String = Global.USER_URL;
			if(id != -1){
				path += "?id=" + id.toString();
			}
			var Request:URLRequest = new URLRequest(path);
			this.Loaders['users'] = (new URLLoader());
			this.Loaders['users'].addEventListener(Event.COMPLETE, saveUsers);
			try {
				this.Loaders['users'].load(Request);
			} catch (e:Error) {
				trace(e);
			}
			
		}
		
		private function saveUsers(e : Event):void {
			trace('LoadUsers');
			var myData:Object = com.adobe.serialization.json.JSON.decode(this.Loaders['users'].data);
			var count:int = 0;
			var total:int = 0;
			for(var i:String in myData.data){
				total++;
			}
			for(var index:String in myData.data){
				var myUser:User = new User(myData.data[index]);
				Global.USERS[myUser.persoon_id]=(myUser);
				trace(myUser.saldo);
				myUser.addEventListener(UserEvent.USER_READY, function():void {
					count++;
					//trace(count + "" + total);
					if(count == total){
						UserLoaded = true;
						Test();
					}
				});
			}
		}
		
		public function LoadProducts():void {
			this.Loaders['products'] = new URLLoader();
			var Request:URLRequest = new URLRequest(Global.PRODUCT_URL);
			this.Loaders['products'].addEventListener(Event.COMPLETE, saveProducts);
			try {
				this.Loaders['products'].load(Request);
			} catch (e:Error) {
				trace(e);
			}
		}
		
		private function saveProducts(e : Event):void {
			var myData:Object = com.adobe.serialization.json.JSON.decode(this.Loaders['products'].data);
			var count:int = 0;
			var total:int = 0;
			for(var i:String in myData.data){
				total++;
			}
			for(var index:String in myData.data){
				var myProduct:Product = new Product(myData.data[index]);
				Global.PRODUCTS.push(myProduct);
				myProduct.addEventListener(ProductEvent.PRODUCT_READY, function():void {
					count++;
					if(count == total){
						ProductsLoaded = true;
						Test();
					}			
				});
			}
		}
		
		private function Test():void{
			//trace(this.ProductsLoaded +" "+ this.UserLoaded);
			if(this.ProductsLoaded && this.UserLoaded){	
				var jlevent:Event = new JSONLoaded("allJsonLoaded");
				dispatchEvent(jlevent);
			}
		}
	}
}