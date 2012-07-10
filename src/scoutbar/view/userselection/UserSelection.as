package scoutbar.view.userselection
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
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
			this.menu.graphics.drawRect(0,0,stage.stageWidth,40);
			this.menu.graphics.endFill();
			this.addChild(menu);
			
			var textformat3:TextFormat = new TextFormat();
			textformat3.size = 30;
			textformat3.align = TextFormatAlign.CENTER;
			this.text.defaultTextFormat = textformat3;
			this.text.text = "Wij schenken geen alcohol onder de 16 !!!";
			this.text.x = 0;
			this.text.y = 5;
			this.text.width = stage.stageWidth;
			this.text.height = 40;
			this.text.textColor = 0xFFFFFF;
			this.text.selectable = false;
			this.text.wordWrap = true;
			this.addChild(text);
		}
	}
}