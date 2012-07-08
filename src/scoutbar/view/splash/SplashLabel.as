package scoutbar.view.splash
{
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	public class SplashLabel extends TextField
	{
		
		public function SplashLabel(text:String)
		{
			super();
			this.type = TextFieldType.DYNAMIC; 
			this.text = text;
		}
	}
}