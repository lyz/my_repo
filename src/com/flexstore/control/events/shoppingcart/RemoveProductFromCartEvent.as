package com.flexstore.control.events.shoppingcart {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.flexstore.model.vo.Product;
	
	import flash.events.Event;
	
	public class RemoveProductFromCartEvent extends CairngormEvent {
		
		static public var EVENT_ID     : String = "removeProductFromCart";
			   public var product      : Product= null;
		
		/**
		 * LoadConfigurationEvent constructor
		 * @param handlers 
		 */
		public function RemoveProductFromCartEvent ( product:Product )  {
			super( EVENT_ID );
			this.product = product;
		}
		
		/**
		 * Override clone mehod.
		 */
		override public function clone():Event  {
			
			return new RemoveProductFromCartEvent(product).copyFrom( this );
		}
		
		/**
		 * Override copyFrom method to get a copy of this event.
		 */
		public function copyFrom(src : Event):Event {	
							
			// Note: can change/specify the values of type,bubbles,etc...
			// during at construction only.
     		this.product = (src as RemoveProductFromCartEvent).product;
     		
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