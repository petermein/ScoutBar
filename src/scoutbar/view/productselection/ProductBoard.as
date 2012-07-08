package scoutbar.view.productselection
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import scoutbar.data.Global;
	import scoutbar.data.Product;
	import scoutbar.view.card.Card;
	
	public class ProductBoard extends Sprite
	{
		
		private var cardarr:Array = new Array();
		private var scrollfield:Sprite = new Sprite();
		private var maskingShape:Shape=new Shape();
		private var maskingShape2:Shape=new Shape();
		
		private var top:int = 0;
		private var bottom:int = 0;
		private var left:int = 0;
		private var right:int = 0;
		
		public function ProductBoard(t:int,b:int,l:int,r:int)
		{
			top = t;
			bottom = b;
			left = l;
			right = r;
			addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		public function addedHandler(e : Event):void
		{
			this.x = left;
			this.y = top;
			createMask();
			createCards();
		}
		public function createMask():void
		{
			maskingShape.graphics.lineStyle();
			maskingShape.graphics.beginFill(0x000000,1);
			maskingShape.graphics.drawRoundRect(0,0,stage.stageWidth - (left+right),stage.stageHeight - (top+bottom),50,50);
			maskingShape.graphics.endFill();
			maskingShape2.graphics.lineStyle();
			maskingShape2.graphics.beginFill(0x00ffff,1);
			maskingShape2.graphics.drawRoundRect(0,0,stage.stageWidth - (left+right),stage.stageHeight - (top+bottom),50,50);
			maskingShape2.graphics.endFill();
			addChild(maskingShape);
			addChild(maskingShape2);
			addChild(scrollfield);
			this.mask = maskingShape;
		}
		public function createCards():void
		{
			for(var index:String in Global.PRODUCTS){
				var card:Card = new Card(Global.PRODUCTS[index],90,90);
				scrollfield.addChild(card);
				card.addEventListener(MouseEvent.CLICK, orderItem);
				cardarr.push(card);
			}
			sortcards();
		}
		public function sortcards(t:String = " "):void
		{
			var xcount:int = maskingShape.width / cardarr[0].width;
			var countx:int = 0;
			var county:int = 0;
			var xoffset:int = (maskingShape.width - (xcount * cardarr[0].width))/2;
			if (xoffset <= cardarr[0].width * 0.2){
				xcount--;
				xoffset = (maskingShape.width - (xcount * cardarr[0].width))/2;
			}
			for(var i:Number=0; i<cardarr.length;i++){
				cardarr[i].x = (cardarr[i].width * countx)+xoffset;
				cardarr[i].y = (cardarr[i].height * county)+20;
				countx++
				if(countx >= xcount){
					countx = 0;
					county++;
				}
			}
		}
		
		public function orderItem(e:Event):void{
			var card:Card = e.currentTarget as Card;
			ProductSelection.order.AddRow(card.incCount(), card.data as Product);
		}
	}
}