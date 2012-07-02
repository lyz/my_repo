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
package com.flexstore.model.vo
{
	
	[Bindable]
	public class Product
	{
	
	    public var productId		:  int		= 0;
	    public var name				:  String	= "";
	    public var description		:  String	= "";
	    public var price			:  Number	= 0;
	    public var qty				:  int		= 1;
	
	    public var image			:  String	= "";
	
	    public var series			:  String	= "";
	    public var triband			:  Boolean	= false;
	    public var camera			:  Boolean	= false;
	    public var video			:  Boolean	= false;
	    public var highlight1		:  String	= "";
	    public var highlight2		:  String	= "";
	

		public function copyFrom(src:*):Product {
			if (src is Product) {
				this.productId 		= (src as Product).productId;
				this.name     		= (src as Product).name;
				this.description	= (src as Product).description;
				this.price			= (src as Product).price;
				this.qty			= (src as Product).qty;
				
				this.image			= (src as Product).image;
				
				this.series			= (src as Product).series;
				this.triband		= (src as Product).triband;
				this.camera			= (src as Product).camera;
				this.video			= (src as Product).video;
				this.highlight1		= (src as Product).highlight1;
				this.highlight2		= (src as Product).highlight2;
			}else {
				this.fill(src);
			}
			
			return this;
		}
		
		/**
		  * Use when initializing Product instance with object data
		  * NOTE: this is not good practice.
		  * 
		  * @param Default object created by HTTPService during load
		  */
	    public function fill(obj:Object):void {
	        for (var key:String in obj)
	        {
	            this[key] = obj[key];
	        }
	    }
	
	    [Bindable(event="propertyChange")]
	    public function get featureString():String
	    {
	    	var str:String = "";
	    	if (triband)
	    		str += "Tri-band ";
	
			if (camera)
				str += "Camera ";
	
			if (video)
				str += "Video";
	
			return str;
	    }
	
	}

}