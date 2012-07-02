////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2003-2006 Adobe Macromedia Software LLC and its licensors.
// All Rights Reserved.
// The following is Sample Code and is subject to all restrictions on such code
// as contained in the End User License Agreement accompanying this product.
// If you have received this file from a source other than Adobe,
// then your use, modification, or distribution of it requires
// the prior written permission of Adobe.
//
////////////////////////////////////////////////////////////////////////////////
package com.flexstore.view.products.cart {
	
	import com.flexstore.model.vo.Product;
	import flash.events.Event;
	
	public class ProductListEvent extends Event
	{
	    static public const PRODUCT_ADD			:  String = "addProduct";
	    static public const PRODUCT_DUPLICATE	:  String = "duplicateProduct";
	    static public const PRODUCT_REMOVE		:  String = "removeProduct";
	    static public const PRODUCT_QTY_CHANGE	:  String = "productQtyChange";
	    
	    public var product : Product = null;
	    
	    public function ProductListEvent(type:String, product:Product=null, bubbles:Boolean=true, cancelable:Boolean=false)
	    {
		    //making the default bubbles behavior of the event to true since we want
		    //it to bubble out of the ProductListItem and beyond
	        super(type, bubbles, cancelable);
	        this.product = product; 
	    }

		override public function clone():Event {
			return new ProductListEvent(this.type,this.product,this.bubbles,this.cancelable);
		}	    
	}

}