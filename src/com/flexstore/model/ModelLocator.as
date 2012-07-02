package com.flexstore.model {
	
	import com.adobe.cairngorm.model.IModelLocator;
	
	import mx.collections.ArrayCollection;
   
  	[Bindable]
  	public class ModelLocator implements IModelLocator {
  	
  		/**
  		 * Holds list of all product listed in the Product Catalog
  		 */
  		public var catalog        : ArrayCollection = null;
	    
	    /**
	      * This is the current shopping cart with products and quantity and costs
	      */
	    public var shoppingCart   : OrderCart       = new OrderCart();
	    public var compareCart    : OrderCart       = new OrderCart();

		
		/**
		  * Should the catalog panel slide over to show the filters or shoppingCart
		  */ 
		public var catalogState   : String			= 'showFilter';






	    // **********************************************************
	    // Singleton methods
	    // **********************************************************
	    
	    /**
	     * This returns and instance of the custom ModelLocator. 
	     * @return ModelLocator
	     */
	    public static function getInstance() : com.flexstore.model.ModelLocator {
	      
			if ( __modelLocator == null ) {
				__modelLocator = new com.flexstore.model.ModelLocator(new ConstructorBlock);
			}
	
			return __modelLocator;
		}
     
     	/**
     	 * Default constructor.
     	 * @param block Private class required. 
     	 *              Prevents public, direct instantiation of multiple instances
     	 */
		public function ModelLocator(block:ConstructorBlock) {
       	
			if ( com.flexstore.model.ModelLocator.__modelLocator != null ) {
				throw new Error( "Only one ModelLocator instance should be instantiated" );   
			} 
			com.flexstore.model.ModelLocator.__modelLocator = this;
		}
  
		// **********************************************************
	    // Singleton attribute
	    // **********************************************************
	    
	    private static var __modelLocator : com.flexstore.model.ModelLocator = null;
    
	}
}

// Declared outside package so it can be used 
// to prevent direct construction of ModelLocator instances
class ConstructorBlock {  }

