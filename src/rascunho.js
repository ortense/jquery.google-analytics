(function($, window){
	
	var plugin = {
			name: 'ga',
			accounts: [],
		},

		fn = {
			on: function(evtType){
				$(this).on(evtType, function(){
					$.ga('send', 'event', category, action, label);
				});
			}
		};

	$.fn[plugin.name] = function(method){
		this.each(function(index, element){
			if(fn[method] && 'function' === typeof fn[method]){
				return fn[method]apply(element, arguments);
			}
		});

		return this;
	};
	
	$[plugin.name] = function(){
		var method = arguments[0];

		if(fn[method] && 'function' === typeof fn[method]){
			return fn[method]apply(this, arguments);
		}
		
		return ga.apply(window, arguments);
	};

})(jQuery, window);