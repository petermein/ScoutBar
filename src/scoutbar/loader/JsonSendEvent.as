package scoutbar.loader
{
	import com.adobe.serialization.json.JSON;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.*;
	
	import scoutbar.data.Global;
	
	public class JsonSendEvent extends EventDispatcher
	{
		public function JsonSendEvent()
		{
		}
		
		/**
		 * Test
		 *@param obj Dit is een test object
		 * 
		 **/
		public function Send(obj:Object):Boolean{
			var url:String = Global.SEND_ORDER_URL;
			var request:URLRequest = new URLRequest(url);
			var requestVars:URLVariables = new URLVariables();
			request.data =  com.adobe.serialization.json.JSON.encode(obj);;
			request.method = URLRequestMethod.POST;
			var urlLoader:URLLoader = new URLLoader();
			urlLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			urlLoader.addEventListener(Event.COMPLETE, loaderCompleteHandler, false, 0, true);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler, false, 0, true);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler, false, 0, true);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler, false, 0, true);
			
			//debugging
			for (var prop:String in requestVars) {
				trace("Sent: " + prop + " is: " + requestVars[prop]);
			}
			try {
				urlLoader.load(request);
			} catch (e:Error) {
				trace(e);
				return false;
			}
			return true;
		}
		
		private function loaderCompleteHandler(e:Event):void {
			var responseVars:URLVariables = URLVariables( e.target.data );
			trace( "responseVars: " + responseVars );
			
		}
		private function httpStatusHandler( e:HTTPStatusEvent ):void {
			//trace("httpStatusHandler:" + e);
		}
		private function securityErrorHandler( e:SecurityErrorEvent ):void {
			trace("securityErrorHandler:" + e);
		}
		private function ioErrorHandler( e:IOErrorEvent ):void {
			//trace("ORNLoader:ioErrorHandler: " + e);
			dispatchEvent( e );
		}
		
		private function classType(obj:*):String{
			var className : String = getQualifiedClassName(obj);
			return className.slice(className.lastIndexOf("::") + 2);
		}

	}
}
