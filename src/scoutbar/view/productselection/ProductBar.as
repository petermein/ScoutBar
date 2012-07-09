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
		private var cancelknop:Sprite = new Sprite();
		private var namefield:TextField = new TextField();
		private var productfield:TextField = new TextField();
		private var pricefield:TextField = new TextField();
		private var saldo:TextField = new TextField();
		private var pad:codePad = new codePad();
		
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
			this.bg.graphics.beginFill(0x000000,0.5);
			this.bg.graphics.drawRect(0,340,Width,this.stage.stageHeight - 340);
			this.bg.graphics.endFill();
			this.addChild(bg);
			
			this.bg2.graphics.lineStyle();
			this.bg2.graphics.beginFill(0x000000,0.5);
			this.bg2.graphics.drawRect(0,0,Width,340);
			this.bg2.graphics.endFill();
			this.addChild(bg2);
			
			this.knopshape.graphics.lineStyle();
			this.knopshape.graphics.beginFill(0xffffff,1);
			this.knopshape.graphics.drawRoundRect(20,this.stage.stageHeight - 100,Width-40,80,30,30);
			this.knopshape.graphics.endFill();
			knop.addChild(knopshape);
			knop.addEventListener(MouseEvent.CLICK, send);
			this.addChild(knop);
			
			var cancels:Shape = new Shape();
			cancels.graphics.lineStyle();
			cancels.graphics.beginFill(0xffffff,1);
			cancels.graphics.drawRoundRect(20,this.stage.stageHeight - 200,Width-40,80,30,30);
			cancels.graphics.endFill();
			cancelknop.addChild(cancels);
			cancelknop.addEventListener(MouseEvent.CLICK, cancel);
			this.addChild(cancelknop);
			
			var textformat:TextFormat = new TextFormat();
			textformat.size = 20;
			textformat.align = TextFormatAlign.CENTER;
			this.namefield.defaultTextFormat = textformat;
			this.namefield.text = "test";
			this.namefield.x = 0;
			this.namefield.y = 293;
			this.namefield.width = Width;
			this.namefield.height = 40;
			this.namefield.textColor = 0xFFFFFF;
			this.namefield.selectable = false;
			this.namefield.wordWrap = true;
			this.addChild(namefield);
			
			var textformat2:TextFormat = new TextFormat();
			textformat2.size = 15;
			textformat2.align = TextFormatAlign.LEFT;
			this.productfield.defaultTextFormat = textformat2;
			this.productfield.text = "";
			this.productfield.x = 20;
			this.productfield.y = 350;
			this.productfield.border = true;
			this.productfield.borderColor = 0xffffff;
			this.productfield.width = Width - 40;
			this.productfield.height = 350;
			this.productfield.textColor = 0xFFFFFF;
			this.productfield.selectable = false;
			this.productfield.wordWrap = true;
			this.addChild(productfield);
			
			this.pricefield.defaultTextFormat = textformat2;
			this.pricefield.text = "";
			this.pricefield.x = 170;
			this.pricefield.y = 350;
			this.pricefield.border = true;
			this.pricefield.borderColor = 0xffffff;
			this.pricefield.width = Width - 190;
			this.pricefield.height = 350;
			this.pricefield.textColor = 0xFFFFFF;
			this.pricefield.selectable = false;
			this.pricefield.wordWrap = true;
			this.addChild(pricefield);
			
			var textformat3:TextFormat = new TextFormat();
			textformat3.size = 30;
			textformat3.align = TextFormatAlign.CENTER;
			this.saldo.defaultTextFormat = textformat3;
			this.saldo.text = "";
			this.saldo.x = 0;
			this.saldo.y = 315;
			this.saldo.border = false;
			this.saldo.borderColor = 0xffffff;
			this.saldo.width = Width;
			this.saldo.height = 30;
			this.saldo.textColor = 0xFFFFFF;
			this.saldo.selectable = false;
			this.saldo.wordWrap = true;
			this.addChild(saldo);
			
			this.pad.x = 60;
			this.pad.y = 760;
			this.addChild(pad);
			
			this.image.x = (this.Width - this.image.Width)/2;
			this.image.y = this.image.x;
			this.addChild(image);
		}
		
		public function setUser(user:User):void
		{
			if(user.saldo < 0){
				saldo.textColor = 0xff0000;
			}else{
				saldo.textColor = 0xffffff;
			}
			saldo.text = "€ "+user.saldo.toFixed(2);
			ProductSelection.board.sortcards();
			productfield.text = "";
			pricefield.text = "";
			namefield.text = user.voornaam + " " + user.achternaam;
			image.setImage(user.image);
		}
		
		public function send(e:Event):void {
			trace('send in productselection');
			ProductSelection.sendOrder();
		}
		
		public function cancel(e:Event):void {
			trace('cancel in productselection');
			ProductSelection.cancelOrder();
		}
		
		public function updateProductField():void
		{
			productfield.text = "";
			pricefield.text = "";
			var total:Number = 0;
			for(var index:String in ProductSelection.order.Rows){
				if(ProductSelection.order.Rows[index] != null){
					total += ProductSelection.order.Rows[index].price;
					productfield.appendText(ProductSelection.order.Rows[index].aantal+" x "+ProductSelection.order.Rows[index].naam + "\n");
					pricefield.appendText("€ " + ProductSelection.order.Rows[index].price.toFixed(2) + "\n");
				}
			}
			pricefield.appendText("---------\n");
			pricefield.appendText("€ " + total.toFixed(2));
		}
	}
}