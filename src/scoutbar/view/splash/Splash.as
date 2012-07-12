package scoutbar.view.splash
{
	import com.greensock.*;
	
	import flash.display.*;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
		
	import scoutbar.resource.Fonts;
	import scoutbar.resource.Image;
	import scoutbar.view.ScaleableSprite;
	
	
	public class Splash extends ScaleableSprite
	{
		private var myFont:String = Fonts._mistral;
		private var label1:SplashLabel = new SplashLabel("ScoutBar");
		private var label2:SplashLabel = new SplashLabel("Bestellen & Afrekenen");
		private var input1:TextField = new TextField();
		//private var preloader:PreLoader = new PreLoader();
		
		public function Splash()
		{
			super();
		}
		
		protected override function paint():void 
		{
			label1.selectable = false;
			label1.embedFonts = true;
			//set properties of objects
			var label1format:TextFormat = new TextFormat();  
			label1format.color = 0xEE8833;   
			label1format.size = 200;   
			label1format.italic = true; 
			label1format.font = "Mistral";
			label1.setTextFormat(label1format);  
			label1.autoSize = TextFieldAutoSize.CENTER;
			label1.filters = [new DropShadowFilter()];
			
			label2.selectable = false;
			label2.embedFonts = true;
			var label2format:TextFormat = new TextFormat();  
			label2format.color = 0xffffff;   
			label2format.size = 100;   
			label2format.italic = true; 
			label2format.font = "Mistral";
			label2.setTextFormat(label2format);  
			label2.autoSize = TextFieldAutoSize.CENTER;
			//label2.filters = [new DropShadowFilter()];

			input1.type = TextFieldType.INPUT;
			input1.setTextFormat(label2format);

			this.addChild(label1);
			this.addChild(label2);
			this.addChild(input1);

			//set the right locations
				label1.x = (stage.stageWidth/2) - (label1.width/2);
				label1.y = (stage.stageHeight/2) - (label1.height/2);
				label2.x = label1.x;
				label2.y = label1.y + label1.height/2 + 100;
				
			//resize bg
				
			//preloader.x = this.stage.stageWidth/2;
			//preloader.y = this.stage.stageHeight/2 - 200;
			//this.addChild(preloader);
		

		}

		
		protected override function resize(e : Event):void
		{

		}
	

		;

	}
}