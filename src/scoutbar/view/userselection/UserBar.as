package scoutbar.view.userselection
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.Shape;

	public class UserBar extends Sprite
	{
		
		private var bg:Shape = new Shape();
		private var Width:int;
		
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
		}
	}
}