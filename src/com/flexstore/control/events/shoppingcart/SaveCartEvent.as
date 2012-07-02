package com.flexstore.control.events.shoppingcart {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	public class SaveCartEvent extends CairngormEvent {
		
		static public var EVENT_ID     : String = "saveShoppingCart";
		
		/**
		 * LoadConfigurationEvent constructor
		 * @param handlers 
		 */
		public function SaveCartEvent (  ) 
		{
			super( EVENT_ID );
		}
		
		/**
		 * Override clone mehod.
		 */
		override public function clone():Event  {
			
			return new SaveCartEvent().copyFrom( this );
		}
		
		/**
		 * Override copyFrom method to get a copy of this event.
		 */
		public function copyFrom(src : Event):Event {	
							
			// Note: can change/specify the values of type,bubbles,etc...
			// during at construction only.
     
			return this
		}
		
		/**
		 * String representation of class.
		 */
		override public function toString():String {
			
			return super.toString();
		}
		
	}
}