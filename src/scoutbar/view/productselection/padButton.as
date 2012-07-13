package scoutbar.view.productselection
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class padButton extends Sprite
	{
		private var background:Shape = new Shape();
		public var text:TextField = new TextField();
		
		public function padButton(t:String)
		{
			this.background.graphics.lineStyle();
			this.background.graphics.beginFill(0xffffff,1);
			this.background.graphics.drawRoundRect(0,0,60,30,20,20);
			this.background.graphics.endFill();
			this.addChild(this.background);
			
			var textformat:TextFormat = new TextFormat();
			textformat.size = 20;
			textformat.align = TextFormatAlign.CENTER;
			this.text.defaultTextFormat = textformat;
			this.text.text = t;
			this.text.y = 0;
			this.text.width = this.width;
			this.text.height = this.height;
			this.text.selectable = false;
			this.addChild(text);
		}
	}
}