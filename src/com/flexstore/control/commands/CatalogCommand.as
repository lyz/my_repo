package com.flexstore.control.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.flexstore.control.delegates.CatalogDelegate;
	import com.flexstore.control.events.catalog.*;
	import com.flexstore.model.ModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	

	public class CatalogCommand implements ICommand, IResponder
	{
		/**
		  * Execute() method required by the ICommand interface.
		  * Allows events to be delegated to a command instance for processing
		  */
		public function execute(event:CairngormEvent):void {
			switch(event.type) {
				case LoadCatalogEvent.EVENT_ID		:	loadCatalog(event as LoadCatalogEvent);					break;
				case GetPublishDetailsEvent.EVENT_ID:	loadPublishDetails(event as GetPublishDetailsEvent);	break;
				default								:	break;
			}
		}
		

		// *************************************************************
		// Private Catalog API
		// *************************************************************
		
		private function loadCatalog(event:LoadCatalogEvent):void {
			var handlers : IResponder = new mx.rpc.Responder(onResults_loadCatalog,fault);
			getDelegate(handlers).loadCatalog();
		}		

		private function loadPublishDetails(event:GetPublishDetailsEvent):void {
			var handlers : IResponder = new mx.rpc.Responder(onResults_loadPublishDetails,fault);
			getDelegate(handlers).getCatalogPublishDetails();
		}


		// *************************************************************
		// Private Event Handlers
		// *************************************************************

		private function onResults_loadCatalog(data:Object):void {
			__model.catalog = new ArrayCollection(data as Array);
		}		
		
		
		private function onResults_loadPublishDetails(data:Object):void {
			// TODO: not yet implemented
		}

		// *************************************************************
		// IResponder Interface Method stubs
		// *************************************************************
		
		// Stubs required for IResponder interface; need as Delegate constructor argument
		public function fault(info  :  Object)  :  void {	Alert.show(info.toString());		}
		public function result(data :  Object)  :  void {   /* no longer used */ 				}



		// *************************************************************
		// Private Utility methods and Attributes
		// *************************************************************

		/**
		  * Convenience method to create instance of CatalogDelegate
		  * @param handler Handlers for CatalogDelegate asynchronous notifications
		  */
		private function getDelegate(handler:IResponder):CatalogDelegate {
			return (new CatalogDelegate(handler));
		}
		
		/**
		  * Alias to the singleton instance
		  */
		private var __model : ModelLocator = ModelLocator.getInstance();
	}
}