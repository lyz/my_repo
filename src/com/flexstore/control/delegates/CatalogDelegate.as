package com.flexstore.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.flexstore.model.utils.ProductXMLUtils;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class CatalogDelegate
	{
		public function CatalogDelegate( responder : IResponder) {
			__responder = responder;		
		}

		// ************************************************
		// Public Catalog RDS API
		// ************************************************
		
		public function loadCatalog():void {
			var handlers : IResponder = new mx.rpc.Responder(onResults_loadCatalog,null);
			var token    : AsyncToken = service.send();
			
			    token.addResponder(handlers);
		}
		
		public function getCatalogPublishDetails():void {
			// not yet implemented
		}
		
		// ************************************************
		// Private ResultEvent Handlers
		// ************************************************
		
		private function onResults_loadCatalog(event:ResultEvent):void {
			var products : Array = new ProductXMLUtils().toProducts(event.result as XML);
		
			// Notify caller with Products [NOT the ResultEvent)	
			__responder.result(products);
			
		}
		
		// ************************************************
		// Private Utility methods and attributes
		// ************************************************
		
		private function get service():HTTPService {
			if (__service == null) {
				__service = ServiceLocator.getInstance().getHTTPService("catalogService");
			}
			
			return __service; 
		}
		
		private var __service   : HTTPService = null;
		private var __responder : IResponder  = null;
	}
}