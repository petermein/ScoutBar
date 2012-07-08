package scoutbar.resource
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public final class Image
	{
		[Embed (source="./assets/background.png" )]
		private static const _background:Class;
		public static const Background:Bitmap = new _background() as Bitmap;
		
		[Embed (source="./assets/splashbg.png" )]
		private static const _splashbg:Class;
		public static const Splashbg:Bitmap = new _splashbg() as Bitmap;
		
		[Embed (source="./assets/panda.jpeg" )]
		private static const _panda:Class;
		public static const Panda:Bitmap = new _panda() as Bitmap;
		
		[Embed (source="./assets/push.png" )]
		private static const _push:Class;
		public static const Push:Bitmap = new _push() as Bitmap;
	}
}