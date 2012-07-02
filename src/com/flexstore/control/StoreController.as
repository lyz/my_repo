package com.flexstore.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.flexstore.control.commands.*;
	import com.flexstore.control.events.catalog.*;
	import com.flexstore.control.events.shoppingcart.*;
	

	public class StoreController extends FrontController {
		
		public function StoreController() {
			super();			
			registerAllCommands();
		}
		
		private function registerAllCommands():void {

			// Register events for Catalog functionality			
			addCommand( LoadCatalogEvent.EVENT_ID,  			CatalogCommand );
			addCommand( GetPublishDetailsEvent.EVENT_ID,		CatalogCommand );

			// register events for Shopping Cart functionality
			addCommand( AddProductToCartEvent.EVENT_ID,  		CartCommand);
			addCommand( LoadCartEvent.EVENT_ID,  		 		CartCommand);
			addCommand( SaveCartEvent.EVENT_ID,  		 		CartCommand);
			addCommand( RemoveProductFromCartEvent.EVENT_ID,  	CartCommand);
			addCommand( UpdateCartQuantityEvent.EVENT_ID,  		CartCommand);
		}
	}
}