package com.flexstore.model
{
	import com.adobe.cairngorm.vo.IValueObject;
	import com.flexstore.model.vo.Product;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	// TODO: This cart does not account for external, direct value changes to product quantities or prices properties

	[Bindable]
	public class OrderCart implements IValueObject
	{
		
		// ****************************************************
		// Public READ-ONLY properties
		// ****************************************************
		
		[Bindable(event='productsChange')]
		public function get products():ArrayCollection {
			return __products;
		}
		
		[Bindable(event='numProductsChange')]
		public function get numProducts():int {
			var count : int = 0;
			for each (var it:Product in __products) {
			 	count += it.qty;
			}
			return count;
		}
		
		[Bindable(event='subTotalChange')]
		public function get subTotal():Number {
			var cost : Number = 0;
			for each (var it:Product in __products) {
			 	cost += it.price * it.qty;
			}
			return cost;
		}		

		[Bindable(event='shippingChange')]
		public function get shipping():Number {
			return (COST_SHIPPING * numProducts);
		}		
				
		[Bindable(event='totalChange')]
		public function get total():Number {
			return ((numProducts > 0) ? (shipping + subTotal) : 0);
		}		

		// ****************************************************
		// Public methods
		// ****************************************************
		
		public function addItem(product:Product, qty:int = 1):void {
			if ((product == null) || (product.productId == 0)) return;
			
			var entry : Product = null;
			
			if (alreadyInCart(product) != true) {
				// make a clone of product... 
				entry = new Product().copyFrom(product);
				entry.qty = 1;
				
				__products.addItem(entry);
			} else {
				entry = find(product.productId);
				if (entry != null) {					
					entry.qty += qty;
					
					if (entry.qty < 1) removeItem(entry);
				}	
			}

			announceCartChanges();
		}
		
		public function removeItem(item:Product):void {
			if ((item == null) || (item.productId == 0)) return;
			
			if (alreadyInCart(item) == true) {
				// Remember, the __products list may contain a clone of item
				var entry : Product = find(item.productId);
				__products.removeItemAt( __products.getItemIndex(entry) );

				announceCartChanges();
			} 
		}
		
		public function updateItemQty(src:Product,qty:int):void {
			if ((src == null) || (src.productId == 0)) return;
			
			if (alreadyInCart(src) == true) {
				// let's change quantity
				var it:Product = find(src.productId);
				if (it != null) {
					it.qty = qty;
					if (it.qty < 1) removeItem(it);
					
					announceCartChanges();
				}
			} else {
				addItem(src,qty);
			} 
		}
		
		// ****************************************************
		// Private methods
		// ****************************************************
		
		private function announceCartChanges():void {
			// Since [Bindable] ValueObjects are event dispatchers... 
			// Cause all data bindings to trigger for updated src data
			dispatchEvent( new Event('numProductsChange') );
			dispatchEvent( new Event('shippingChange') );
			dispatchEvent( new Event('subTotalChange') );
			dispatchEvent( new Event('totalChange') );
		}
		
		
		private function alreadyInCart(product:Product):Boolean {
			var results : Boolean = false;
			for each (var it:Product in __products) {
				if (it.productId == product.productId) {
					results = true;
					break;
				}
			}
			return results;
		}
		
		private function find(productID:int):Product {
			var results : Product = null;
			for each (var it:Product in __products) {
				if (it.productId == productID) {
					results = it;
					break;
				}
			}
			return results;
		}

		
		// ****************************************************
		// Private attributes
		// ****************************************************
		
		static 	private const COST_SHIPPING : Number 		   = 1.99;
				private var __products 		: ArrayCollection  = new ArrayCollection();
		
	}
}