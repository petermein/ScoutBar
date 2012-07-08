package scoutbar.view.productselection
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import scoutbar.data.User;
	import scoutbar.resource.Image;
	import scoutbar.view.card.CardArt;

	public class ProductBar extends Sprite
	{
		private var bg:Shape = new Shape();
		private var bg2:Shape = new Shape();
		private var knopshape:Shape = new Shape();
		private var image:CardArt = new CardArt(Image.Panda,200,266);
		private var knop:Sprite = new Sprite();
		private var namefield:TextField = new TextField();
		
		private var Width:int;
		
		public function ProductBar(w:int)
		{
			Width = w;
			this.addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		public function addedHandler(e:Event):void
		{
			this.x = this.stage.stageWidth - Width;
			trace("create product barr");
			this.bg.graphics.lineStyle();
			this.bg.graphics.beginFill(0xf0f0f0,0.5);
			this.bg.graphics.drawRect(0,340,Width,this.stage.stageHeight - 340);
			this.bg.graphics.endFill();
			this.addChild(bg);
			
			this.bg2.graphics.lineStyle();
			this.bg2.graphics.beginFill(0x000000,0.5);
			this.bg2.graphics.drawRect(0,0,Width,340);
			this.bg2.graphics.endFill();
			this.addChild(bg2);
			
			this.knopshape.graphics.lineStyle();
			this.knopshape.graphics.beginFill(0x000000,0.5);
			this.knopshape.graphics.drawRoundRect(20,this.stage.stageHeight - 100,Width-40,80,30,30);
			this.knopshape.graphics.endFill();
			knop.addChild(knopshape);
			knop.addEventListener(MouseEvent.CLICK, send);
			this.addChild(knop);
			
			var textformat:TextFormat = new TextFormat();
			textformat.size = 15;
			textformat.align = TextFormatAlign.CENTER;
			this.namefield.defaultTextFormat = textformat;
			this.namefield.text = "test";
			this.namefield.x = 0;
			this.namefield.y = 320;
			this.namefield.width = Width;
			this.namefield.height = 40;
			this.namefield.textColor = 0xFFFFFF;
			this.namefield.selectable = false;
			this.namefield.wordWrap = true;
			this.addChild(namefield);
			
			this.image.x = 20;//2 / (this.Width - this.image.Width)
			this.image.y = this.image.x;
			this.addChild(image);
		}
		
		public function setUser(user:User):void
		{
			namefield.text = user.voornaam + " " + user.achternaam;
			image.setImage(user.image);
		}
		
		public function send(e:Event):void {
			trace('send in productselection');
			ProductSelection.sendOrder();
		}
	}
}