package com.flexstore.control.events.shoppingcart {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.flexstore.model.vo.Product;
	
	import flash.events.Event;
	
	public class UpdateCartQuantityEvent extends CairngormEvent {
		
		static public var EVENT_ID     : String = "updateProductQuantityInCart";
			   public var product      : Product= null;
			   public var qty		   : int    = 0;
		
		/**
		 * LoadConfigurationEvent constructor
		 * @param handlers 
		 */
		public function UpdateCartQuantityEvent ( product:Product, qty:int=1 )  {
			super( EVENT_ID );
			this.product = product;
			this.qty     = qty;
		}
		
		/**
		 * Override clone mehod.
		 */
		override public function clone():Event  {
			
			return new UpdateCartQuantityEvent(product,qty);
		}
		
		/**
		 * Override copyFrom method to get a copy of this event.
		 */
		public function copyFrom(src : Event):Event {	
							
			// Note: can change/specify the values of type,bubbles,etc...
			// during at construction only.
     		this.product = (src as UpdateCartQuantityEvent).product;
     		this.qty     = (src as UpdateCartQuantityEvent).qty;
     		
			return this;
		}
		
		/**
		 * String representation of class.
		 */
		override public function toString():String {
			return (super.toString());
		}
		
	}
}