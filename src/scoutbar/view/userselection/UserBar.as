package scoutbar.view.userselection
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import org.flexunit.runner.manipulation.OrderArgumentPlusAlphaSorter;
	
	import scoutbar.data.Global;
	import scoutbar.data.Order;
	import scoutbar.view.card.Card;
	import scoutbar.view.productselection.ProductBoard;
	import scoutbar.view.productselection.ToggleButton;
	import scoutbar.loader.JsonSendEvent;

	public class UserBar extends Sprite
	{
		
		private var bg:Shape = new Shape();
		private var Width:int;
		private var classArr:Array = new Array();
		public var card:Card;
		private var cancelknop:Sprite = new Sprite();
		private var canceltext:TextField = new TextField();
		
		public function UserBar(w:int)
		{
			Width = w;
			this.addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		
		public function addedHandler(e:Event):void
		{
			
			this.x = this.stage.stageWidth - Width;
			this.bg.graphics.lineStyle();
			this.bg.graphics.beginFill(0x000000,0.5);
			this.bg.graphics.drawRect(0,50,Width,this.stage.stageHeight - 420);
			this.bg.graphics.endFill();
			this.addChild(bg);	
			var button2:ToggleButton = new ToggleButton("Iedereen","0");
			button2.x = 10;
			button2.y = 60;
			this.addChild(button2);
			button2.addEventListener(MouseEvent.CLICK,ClickHandler);
			var counter:int = 1;
			
			for(var index:String in Global.GROUPS){
				var button:ToggleButton = new ToggleButton(Global.GROUPS[index], index);
				button.x = 10;
				button.y = 60 + (counter * 40);
				this.addChild(button);
				button.addEventListener(MouseEvent.CLICK,ClickHandler);
				counter++;
			}
			
			card = new Card(Global.PRODUCTS[2],90,90,0xffff00);
			card.x =20;
			card.y = this.stage.stageHeight - (420 + 130);
			card.addEventListener(MouseEvent.CLICK,productClick);
			this.addChild(card);
			
			var myGlow:GlowFilter = new GlowFilter();
			myGlow.color = 0x9e6e57;
			myGlow.strength = 255;
			
			var cancels:Shape = new Shape();
			cancels.filters = [myGlow];
			cancels.graphics.lineStyle();
			cancels.graphics.beginFill(0xffffff,1);
			cancels.graphics.drawRoundRect(0,0,Width-40,50,30,30);
			cancels.graphics.endFill();
			cancelknop.addChild(cancels);
			cancelknop.addEventListener(MouseEvent.CLICK, massaStreep);
			this.addChild(cancelknop);
			
			cancelknop.x = 10;
			cancelknop.y = this.stage.stageHeight - (450 + 160);
			
			var textformat6:TextFormat = new TextFormat();
			textformat6.size = 50;
			textformat6.align = TextFormatAlign.CENTER;
			textformat6.font = "Mistral";
			this.canceltext.embedFonts = true;
			this.canceltext.defaultTextFormat = textformat6;
			this.canceltext.text = "start";
			this.canceltext.x = -20;
			this.canceltext.y = -5;
			this.canceltext.width = Width;
			this.canceltext.height = 50;
			this.canceltext.textColor = 0x000000;
			this.canceltext.selectable = false;
			this.canceltext.wordWrap = true;
			cancelknop.addChild(canceltext);
			
		}
		public function ClickHandler(e:MouseEvent):void
		{
			if(e.currentTarget.on){
				e.currentTarget.bg2.visible = false;
				e.currentTarget.on = false;
				UserSelection.userFilterArr[e.currentTarget.index] = false;
			}else{
				e.currentTarget.bg2.visible = true;
				e.currentTarget.on = true;
				UserSelection.userFilterArr[e.currentTarget.index] = true;
			}
			UserSelection.board.toggleSort();
		}
		public function massaStreep(e:MouseEvent):void
		{
			if(Global.MASSASTREEP){
				canceltext.text = "Start";
				Global.MASSASTREEP = false;
				confirmStreep();
			}else{
				canceltext.text = "Streep";
				Global.MASSASTREEP = true;
			}
		}
		public function productClick(e:MouseEvent):void
		{
			UserSelection.board.visible = false;
			UserSelection.product.visible = true;
		}
		public function confirmStreep():void
		{
			for(var index:String in UserSelection.board.cardarr){
				if(UserSelection.board.cardarr[index].getCount()>0){
					var _order:Order = new Order(UserSelection.board.cardarr[index].data);
					_order.AddRow(UserSelection.board.cardarr[index].getCount(),card.data);
					var sender:JsonSendEvent = new JsonSendEvent();
					sender.Send(_order);
					UserSelection.board.cardarr[index].setCount(0);
				}
			}
		}
	}
}