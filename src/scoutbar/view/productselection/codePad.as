package scoutbar.view.productselection
{
	import flash.display.Sprite;

	public class codePad extends Sprite
	{
		public var _1:padButton = new padButton("1");
		public var _2:padButton = new padButton("2");
		public var _3:padButton = new padButton("3");
		public var _4:padButton = new padButton("4");
		public var _5:padButton = new padButton("5");
		public var _6:padButton = new padButton("6");
		public var _7:padButton = new padButton("7");
		public var _8:padButton = new padButton("8");
		public var _9:padButton = new padButton("9");
		public var _0:padButton = new padButton("0");
		public var ok:padButton = new padButton("ok");
		public var _x:padButton = new padButton("x");
		
		public function codePad()
		{
			_1.x = 0;
			_1.y = 0;
			_2.x = 50;
			_2.y = 0;
			_3.x = 100;
			_3.y = 0;
			_4.x = 0;
			_4.y = 30;
			_5.x = 50;
			_5.y = 30;
			_6.x = 100;
			_6.y = 30;
			_7.x = 0;
			_7.y = 60;
			_8.x = 50;
			_8.y = 60;
			_9.x = 100;
			_9.y = 60;
			_0.x = 0;
			_0.y = 90;
			ok.x = 50;
			ok.y = 90;
			_x.x = 100;
			_x.y = 90;
			this.addChild(_1);
			this.addChild(_2);
			this.addChild(_3);
			this.addChild(_4);
			this.addChild(_5);
			this.addChild(_6);
			this.addChild(_7);
			this.addChild(_8);
			this.addChild(_9);
			this.addChild(_0);
			this.addChild(ok);
			this.addChild(_x);
		}
	}
}