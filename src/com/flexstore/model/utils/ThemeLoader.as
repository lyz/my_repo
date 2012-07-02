package com.flexstore.model.utils
{
	import flash.events.IEventDispatcher;
	
	import mx.events.StyleEvent;
	import mx.styles.StyleManager;
	import mx.utils.StringUtil;
	
	public class ThemeLoader
	{
		static  public const   THEME_BLUE          : String            = 'blue';
		static  public const   THEME_BIEGE         : String            = 'beige';					

		public function ThemeLoader(caller:Function) {
			__handler = caller;		
		}

		public function toggleTheme():void {
			loadTheme( __currentTheme == THEME_BIEGE ? THEME_BLUE : THEME_BIEGE );
		}
        public function loadTheme(name:String = ''):void {        	
        	if ( __handler != null) {
	        	__currentTheme = (name=="") ? THEME_BIEGE : name;  

	        	var pathToStyles   : String           = StringUtil.substitute(PATH_THEMES,[__currentTheme]);
	            var dispatcher     : IEventDispatcher = StyleManager.loadStyleDeclarations(pathToStyles);
	            
	            dispatcher.addEventListener(StyleEvent.COMPLETE, __handler);
        	}
        }

				private var     __handler           : Function			= null;
        		private var 	__currentTheme  	: String 			= "";

		static  private const  	PATH_THEMES         : String			= "assets/css/{0}.swf";
	}
}