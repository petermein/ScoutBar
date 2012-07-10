package scoutbar.view.userselection
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Timer;
	
	import nid.ui.controls.VirtualKeyBoard;
	import nid.ui.controls.vkb.KeyBoardEvent;
	
	import scoutbar.data.Global;

	public class UserSelection extends Sprite
	{
		public var board:UserBoard = new UserBoard(40,100,10,10);
		public var search:SearchBar = new SearchBar(20,50,100);
		public var menu:Shape = new Shape();
		public var text:TextField = new TextField();
		public var keyboard:VirtualKeyBoard = VirtualKeyBoard.getInstance();
		public var clockTimer:Timer = new Timer(1000, 0);
		public var timeTextfield:TextField = new TextField();
		public var newsbar:NewsTicker = new NewsTicker(["tes   asdfasdfasdfasdf   t123","Ermasdfasdfasdfagnie    tgdr      oasdfasdfsadfasdfnkenwordena;lk     jsadfasdfsadfasdfasdfsadfasdfasdfasdfsdf   l;kj","nogmesadfasdfasdfsadf       rtro   ep","stop  d  d  d  ||"]);
		
		public function UserSelection()
		{
			drawKeyboard();
			this.addChild(board);
			this.addChild(search);
			this.addChild(keyboard);
			VirtualKeyBoard.getInstance().init(Global.SCOUTBAR.stage);
			VirtualKeyBoard.getInstance().target = { field:search.text, fieldName:"Test" };
			VirtualKeyBoard.getInstance().addEventListener(KeyBoardEvent.UPDATE, updateusers);
			search.text.addEventListener(Event.CHANGE, updateusers);
			addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		
		private function drawKeyboard():void{
			board = new UserBoard(40,100+280,10,10);
			search = new SearchBar(20,50,100+280);
			keyboard.y = Global.SCOUTBAR.stage.stageHeight - 300;
		}

		public function updateusers(e:Event):void
		{
			board.sortcards(search.text.text);
		}
		public function addedHandler(e:Event):void
		{
			this.menu.graphics.lineStyle();
			this.menu.graphics.beginFill(0x000000,0.5);
			this.menu.graphics.drawRect(0,0,stage.stageWidth,50);
			this.menu.graphics.endFill();
			this.addChild(menu);
			
			var textformat3:TextFormat = new TextFormat();
			textformat3.size = 30;
			textformat3.align = TextFormatAlign.CENTER;
		
			
			this.addChild(newsbar);
			
			timeTextfield.defaultTextFormat = textformat3;
			timeTextfield.x = stage.stageWidth - 100;
			timeTextfield.y = 5;
			timeTextfield.textColor = 0xFFFFFF;
			timeTextfield.selectable = false;
			timeTextfield.text = getFormattedTime();
			this.addChild(timeTextfield);
			
			clockTimer.addEventListener(TimerEvent.TIMER, onClockTimer);
			clockTimer.start();
		}
		public function onClockTimer(e:TimerEvent):void {
			timeTextfield.text = getFormattedTime();
		}
		
		public function getFormattedTime():String {
			var now:Date = new Date();
			var hrs:String = String(now.getHours());
			if (hrs.length < 2) {
				hrs = "0" + hrs;
			}
			var mins:String = String(now.getMinutes());
			if (mins.length < 2) {
				mins = "0" + mins;
			}
			return hrs + ":" + mins;
		}
	}
}