package scoutbar.view.userselection
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	public class UserSelection extends Sprite
	{
		public var board:UserBoard = new UserBoard(40,100,20,20);
		public var search:SearchBar = new SearchBar(20,50,100);
		
		public function UserSelection()
		{
			this.addChild(board);
			this.addChild(search);
			search.text.addEventListener(Event.CHANGE, updateusers);
		}
		public function updateusers(e:Event):void
		{
			board.sortcards(search.text.text);
		}
	}
}