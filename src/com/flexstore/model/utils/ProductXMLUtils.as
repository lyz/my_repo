package com.flexstore.model.utils
{
	import mx.utils.StringUtil;
	import com.flexstore.model.vo.Product;
	
	public class ProductXMLUtils {
		
		public function ProductXMLUtils() {  
		
		}
		
		public function toProducts(data:XML):Array {
			var results : Array = [];
			if (data != null) {
				var items   : XMLList = data.product;
				
				/** Sample XML 
				 *
				 * 	    <product productId="1">
				 *	        <name>Nokia 6010</name>
				 *	        <description>Easy</description>
				 *	        <price>99.99</price>
				 *	        <image>Nokia_6010.gif</image>
				 *	        <series>6000</series>
				 *	        <triband>false</triband>
				 *	        <camera>false</camera>
				 *	        <video>false</video>
				 *	        <highlight1>MMS</highlight1>
				 *			<highlight2>Large color display</highlight2>
				 *	    </product>
				 */
				
				for each (var it:XML in items) {
					var product : Product = new Product();
					
						// Initialize product instance and update path to image store
						product.productId 	= it.@productId;
						product.name      	= (it["name"][0] as XML);
						product.description	= it.description;
						product.price		= it.price;

						product.image       = StringUtil.substitute(PATH_CATALOG_IMAGES,[it.image]);

						product.series		= it.series;
						product.triband		= it.triband;
						product.camera		= it.camera;
						product.video		= it.video;
						product.highlight1	= it.highlight1;
						product.highlight2	= it.highlight2;
					
					results.push(product);					
				}
			}		
			
			return results;
		}
		
		public function toXML(products:Array):XML {
			// TODO: not yet implemented
			var results : XML = null;
			
			return results;
		}

		static  private const  PATH_CATALOG_IMAGES : String			= 'data/catalog/{0}';
	}
}