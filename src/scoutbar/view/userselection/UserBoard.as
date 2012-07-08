package scoutbar.view.userselection
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import scoutbar.ScoutBar;
	import scoutbar.data.Global;
	import scoutbar.view.card.Card;
	
	public class UserBoard extends Sprite
	{
		
		private var cardarr:Array = new Array();
		private var scrollfield:Sprite = new Sprite();
		private var maskingShape:Shape=new Shape();
		private var maskingShape2:Shape=new Shape();
		
		private var top:int = 0;
		private var bottom:int = 0;
		private var left:int = 0;
		private var right:int = 0;
		
		private var currentString:String;
		
		public function UserBoard(t:int,b:int,l:int,r:int)
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
			maskingShape.graphics.drawRect(0,0,stage.stageWidth - (left+right),stage.stageHeight - (top+bottom));
			maskingShape.graphics.endFill();
			addChild(maskingShape);
			addChild(scrollfield);
			this.mask = maskingShape;
		}
		public function createCards():void
		{
			for(var index:String in Global.USERS){
				var card:Card = new Card(Global.USERS[index],90,135);
				card.addEventListener(MouseEvent.CLICK, openOrder);
				scrollfield.addChild(card);
				cardarr.push(card);
				card.setCount(2);
			}
			sortcards();
		}
		public function sortcards(t:String = ""):void
		{
			currentString = t;
			var temparr:Array = cardarr.filter(searchName);
			for(var index:String in cardarr){
				cardarr[index].visible = false;
			}
			for(var index2:String in temparr){
				temparr[index2].visible = true;
			}
			
			var xcount:int = maskingShape.width / temparr[0].width;
			var countx:int = 0;
			var county:int = 0;
			var xoffset:int = (maskingShape.width - (xcount * temparr[0].width))/2;
			if (xoffset <= cardarr[0].width * 0.2){
				xcount--;
				xoffset = (maskingShape.width - (xcount * temparr[0].width))/2;
			}
			for(var i:Number=0; i<temparr.length;i++){
				temparr[i].x = (temparr[i].width * countx)+xoffset;
				temparr[i].y = (temparr[i].height * county)+20;
				countx++
				if(countx >= xcount){
					countx = 0;
					county++;
				}
			}
		}
		private function openOrder(e:MouseEvent):void{
			var ref:Card = e.currentTarget as Card;
			Global.SCOUTBAR.switchToProductSelection(ref.data);
		}
		
		private function searchName(item:*,index:int,array:Array):Boolean
		{
			var nameRegExp:RegExp = new RegExp('^'+ this.currentString, 'i');
			return nameRegExp.test(item.data.voornaam) || nameRegExp.test(item.data.achternaam) || nameRegExp.test(item.data.nickname);
		}
	}
}