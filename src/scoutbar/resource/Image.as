package scoutbar.resource
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public final class Image
	{
		
		[Embed (source="./assets/bg.jpg" )]
		private static const _splashbg:Class;
		public static const Splashbg:Bitmap = new _splashbg() as Bitmap;
		
		[Embed (source="./assets/panda.jpeg" )]
		private static const _panda:Class;
		public static const Panda:Bitmap = new _panda() as Bitmap;
		
		[Embed (source="./assets/push.png" )]
		private static const _push:Class;
		public static const Push:Bitmap = new _push() as Bitmap;
		
		[Embed (source="./assets/gloss.png" )]
		private static const _gloss:Class;
		public static const Gloss:Bitmap = new _gloss() as Bitmap;
		
		[Embed (source="./assets/logo trui.jpg" )]
		private static const _logo:Class;
		public static const Logo:Bitmap = new _logo() as Bitmap;
		
		[Embed (source="./assets/qrcode.png" )]
		private static const _qr:Class;
		public static const Qr:Bitmap = new _qr() as Bitmap;
	}
}