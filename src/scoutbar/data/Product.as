package scoutbar.data
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	import scoutbar.events.ProductEvent;
	import scoutbar.logic.UserFunctions;
	import scoutbar.resource.Image;

 	
	public class Product extends EventDispatcher
	{		
		public var product_id:int = 123;
	
		public var naam:String;
		
		public var prijs:Number;
		
		public var min_leeftijd:int;
		
		public var categorie:int;
		
		public var imgpath:String;

		public var image:Bitmap;
		
		[Transient]
		private var imageLoader:Loader = new Loader();
		
		public function Product(data:Object)
		{
			this.product_id = data.product_id;
			this.naam = data.naam;
			this.prijs = data.prijs;
			this.min_leeftijd = data.min_leeftijd;
			this.imgpath = data.imgpath;
			this.categorie = data.categorie;
			
			if(this.imgpath != null){
				var path:String = Global.BASE_IMG_PATH+''+this.imgpath;
				var imageRequest:URLRequest = new URLRequest(path);
				imageLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loaderIOErrorHandler);
				imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
				
				imageLoader.load(imageRequest);
			} else {
				loaderIOErrorHandler(null);
			}
		}	
		
		private function onComplete(evt:Event):void
		{
			imageLoader.removeEventListener(Event.COMPLETE, onComplete);
			imageLoader.removeEventListener(IOErrorEvent.IO_ERROR, loaderIOErrorHandler);
			this.image = Bitmap(imageLoader.content);
			dispatchEvent(new ProductEvent(ProductEvent.PRODUCT_READY));
		}
		
		private function loaderIOErrorHandler(evt:Event):void
		{
			imageLoader.removeEventListener(Event.COMPLETE, onComplete);
			imageLoader.removeEventListener(IOErrorEvent.IO_ERROR, loaderIOErrorHandler);
			trace('No image found, taking standard');
			this.image =  Image.Panda;
			dispatchEvent(new ProductEvent(ProductEvent.PRODUCT_READY));
		}
		
		public override function toString():String {
			return this.naam;
		}
	}
}