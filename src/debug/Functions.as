package debug
{
	public class Functions
	{
		public static function pr(obj:*, level:int = 0, output:String = ""):* {
			var tabs:String = "";
			for(var i:int = 0; i < level; i++, tabs += "\t");
			
			for(var child:* in obj) {
				output += tabs +"["+ child +"] => "+ obj[child];
				
				var childOutput:String = pr(obj[child], level+1);
				if(childOutput != '') output += ' {\n'+ childOutput + tabs +'}';
				
				output += "\n";
			}
			
			if(level == 0) trace(output);
			else return output;
		}
	}
}