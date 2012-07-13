package scoutbar
{
	//de json lib die ik nog ni
	import debug.it.flashfuck.debugger.FPSMonitor;
	
	import com.adobe.serialization.json.JSON;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import debug.Functions;
	import nid.ui.controls.VirtualKeyBoard;
	import scoutbar.data.User;
	import scoutbar.data.Global;
	import scoutbar.events.JSONLoaded;
	import scoutbar.events.ProductEvent;
	import scoutbar.loader.JsonLoadEvent;
	import scoutbar.resource.Image;
	import scoutbar.view.productselection.ProductSelection;
	import scoutbar.view.screensaver.Screensaver;
	import scoutbar.view.splash.Splash;
	import scoutbar.loader.JsonSendEvent;
	import scoutbar.view.card.Card;
	import scoutbar.view.userselection.UserSelection;
	
	[SWF(width='600', height='800')]
	public class ScoutBar extends Sprite
	{
		
		public static var stage:Stage;
		public static var splash:Splash = new Splash();
		public static var us:UserSelection;
		public static var ps:ProductSelection;
		public static var screensaver:Screensaver;
		
		public var load:JsonLoadEvent;

		
		//URL request loader voor het php script met de JSON data
		
		public function ScoutBar()
		{
			Global.SCOUTBAR = this;
			this.init();
			this.createSplash();
			load = new JsonLoadEvent();
			load.addEventListener(JSONLoaded.JSON_LOADED, tracetest);
			load.Load();

		}
		
		protected function tracetest(e:Event):void{
			trace("JSON completely loaded");
			createUserSelection();
			createProductSelection();
			screensaver = new Screensaver(stage);
		}
		
		protected function init():void
		{
			trace("Init dataobjects ..");
			stage.displayState = StageDisplayState.FULL_SCREEN;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			var backGroundSprite:Sprite = new Sprite();
			backGroundSprite.graphics.beginBitmapFill(Image.Splashbg.bitmapData);
			backGroundSprite.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			backGroundSprite.graphics.endFill();
			this.addChild(backGroundSprite);
			
			stage.addEventListener(MouseEvent.CLICK, gofullscreen);
			
			trace("Init successfull");
		}
		
		protected function gofullscreen(e:Event):void{
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		
		protected function createSplash():void
		{
			trace("Create splash");
			splash.addEventListener(MouseEvent.CLICK, switchToUserSelection);
			stage.addChild(splash);
			
		}
		
		protected function createUserSelection():void
		{
			trace("Create userselectioin");
			us =  new UserSelection();
			us.x = stage.stageWidth;
			stage.addChild(us);
		}
		
		protected function createProductSelection():void {
			trace("Create productselection");
			ps =  new ProductSelection();
			ps.x = stage.stageWidth*2;
			stage.addChild(ps);
			//this.addChildAt(new FPSMonitor(), this.numChildren);
		}
		
		protected function switchToUserSelection(e:Event):void{
			trace("Switch to userselection");
			//us.addEventListener(MouseEvent.CLICK, switchToProductSelection);
			//TweenLite.to(splash, 1, {x:0-stage.stageWidth});
			splash.x = 0-stage.stageWidth;
			us.x = 0;
			ps.x = stage.stageWidth;
			//TweenLite.to(us, 1, {x:0});
			//TweenLite.to(ps, 1, {x:stage.stageWidth});
		}
		
		public function switchToUserSelectionFromProduct(e:Event):void{
			trace("Switch to userselection");
				us.board.sortcards("");
				us.search.text.text = "";
				us.x = 0;
				ps.x = stage.stageWidth;
				//TweenLite.to(us, 1, {x:0});
				//TweenLite.to(ps, 1, {x:0 + stage.stageWidth});	
		}
		
		public function switchToProductSelection(data:*):void{
			trace("Switch to productselection");
			load.addEventListener(JSONLoaded.JSON_USERS_LOADED, function():void {
				ps.setUser(Global.USERS[data.persoon_id]);
			});
			
			ps.addEventListener(ProductEvent.USER_LOADED, function():void{
				us.x = stage.stageWidth;
				ps.x = 0;
				//TweenLite.to(us, 1, {x:0-stage.stageWidth});
				//TweenLite.to(ps, 1, {x:0});
			});
			load.LoadUsers(data.persoon_id);
		}
		
	}
}
