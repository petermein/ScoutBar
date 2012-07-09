package scoutbar.data
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	import scoutbar.events.UserEvent;
	import scoutbar.logic.UserFunctions;
	import scoutbar.resource.Image;
 	
	public class User extends EventDispatcher
	{
		public var persoon_id:int;
		
		public var voornaam:String;
		
		public var achternaam:String;
		
		public var email:String;
		
		public var telefoon_nr:String;
		
		public var nickname:String;
		
		public var geboortedatum:Date;
		
		public var saldo:Number;
		
		public var level:int;
		
		public var password:String;
		
		public var leeftijd:Number;
		
		public var rekening:int;
		
		public var imgpath:String;
		
		public var image:Bitmap;
		
		[Transient]
		private var imageLoader:Loader = new Loader();

		public function User(data:Object)
		{
			this.persoon_id = parseInt(data.persoon_id);
			this.voornaam = data.voornaam;
			this.achternaam = data.achternaam;
			this.email = data.email;
			this.telefoon_nr = data.telefoon_nr;
			this.nickname = data.nickname;
			this.geboortedatum = UserFunctions.convertMySQLDateToActionscript(data.geboortedatum);
			this.saldo = data.saldo;
			this.level = data.level;
			this.password = data.password;
			this.rekening = data.rekening;
			this.imgpath = data.imgpath;
			this.leeftijd = UserFunctions.calculateAge(this.geboortedatum);
			
			if(this.imgpath != null || this.imgpath == ''){
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
	 trace('Complete');
		this.image = Bitmap(imageLoader.content);
		trace(this.image.width, this.image.height);
		dispatchEvent(new UserEvent(UserEvent.USER_READY));
	}
	
	private function loaderIOErrorHandler(evt:Event):void
	{
		trace('No image found, taking standard');
		this.image =  Image.Panda;
		dispatchEvent(new UserEvent(UserEvent.USER_READY));

	}	
	
	public override function toString():String {
		return this.voornaam + " " + this.achternaam;
	}
	}
}