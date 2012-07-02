package com.flexstore.control.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.flexstore.control.events.shoppingcart.AddProductToCartEvent;
	import com.flexstore.control.events.shoppingcart.LoadCartEvent;
	import com.flexstore.control.events.shoppingcart.RemoveProductFromCartEvent;
	import com.flexstore.control.events.shoppingcart.SaveCartEvent;
	import com.flexstore.control.events.shoppingcart.UpdateCartQuantityEvent;
	import com.flexstore.model.ModelLocator;
	import com.flexstore.model.OrderCart;
	import com.flexstore.model.vo.Product;
	
	import mx.messaging.Producer;
	import mx.rpc.IResponder;
	

	public class CartCommand implements ICommand, IResponder
	{
		/**
		  * Execute() method required by the ICommand interface.
		  * Allows events to be delegated to a command instance for processing
		  */
		public function execute(event:CairngormEvent):void {
			switch(event.type) {
				case AddProductToCartEvent.EVENT_ID 		:	addToCart(event as AddProductToCartEvent);				break;
				case RemoveProductFromCartEvent.EVENT_ID	:   removeFromCart(event as RemoveProductFromCartEvent);	break;
				case UpdateCartQuantityEvent.EVENT_ID		:	updateQuantity(event as UpdateCartQuantityEvent);		break;
				
				case LoadCartEvent.EVENT_ID					:	// TODO: implement next phase			
				case SaveCartEvent.EVENT_ID					:	// TODO: implement next phase
				default										:	break;
			}
		}
		
		
		// *****************************************************************
		// Private methods
		// *****************************************************************
		
		private function addToCart(event:AddProductToCartEvent):void {
			if (event == null) return;	// TODO: throw invalid event error here...
			
			var product : Product   = event.product;	
			var cart    : OrderCart = __model.shoppingCart;
			 
			cart.addItem(product);
			__model.catalogState = (cart.numProducts < 1) ? 'showFilter' : 'showCart';			
		}
		
		public function updateQuantity(event:UpdateCartQuantityEvent):void {
			var product : Product   = event.product;	
			var qty     : int       = event.qty;				
			var cart    : OrderCart = __model.shoppingCart;
			 
			cart.updateItemQty(product,qty);
			__model.catalogState = (cart.numProducts < 1) ? 'showFilter' : 'showCart';
		}
		
		
		public function removeFromCart(event:RemoveProductFromCartEvent):void {
			var product : Product 	= event.product;	
			var cart    : OrderCart = __model.shoppingCart;
			 
			cart.removeItem(product);
			if (cart.numProducts < 1) {
				__model.catalogState = 'showFilter';
			}
		}
		
		
		// Stubs required for IResponder interface; need as Delegate constructor argument
		public function fault(info  :  Object)  :  void {	}
		public function result(data :  Object)  :  void {   
			
		}

		/**
		  * Alias to the singleton instance
		  */
		private var __model : ModelLocator = ModelLocator.getInstance();
	}
}