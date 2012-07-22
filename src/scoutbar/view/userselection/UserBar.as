package scoutbar.view.userselection
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import scoutbar.data.Global;
	import scoutbar.view.productselection.ToggleButton;

	public class UserBar extends Sprite
	{
		
		private var bg:Shape = new Shape();
		private var Width:int;
		private var classArr:Array = new Array();
		
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
			
			var counter:int = 0;
			for(var index:String in Global.GROUPS){
				var button:ToggleButton = new ToggleButton(Global.GROUPS[index], index);
				button.x = 10;
				button.y = 60 + (counter * 40);
				this.addChild(button);
				button.addEventListener(MouseEvent.CLICK,ClickHandler);
				counter++;
			}
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
			UserSelection.board.sortcards();
		}
	}
}