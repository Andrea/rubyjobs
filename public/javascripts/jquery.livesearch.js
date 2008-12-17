jQuery.fn.liveUpdate = function(list){
	list = jQuery(list);

	if ( list.length ) {
		var rows = list.children('li'),
			cache = rows.map(function(){
                            // The searched index forms the basis of the scoring algorithm for the livesearch.
                            // Thus we want to use plain text and strip out newlines and whitespace
                            // TODO: DMG: OPTIMIZEME
                            searched_index = this.textContent.replace(/\n/g,' ').replace(/^\W+/g,' ').replace(/\W+$/g,' ')
                            return searched_index.toLowerCase();
			});
			
		this
			.keyup(filter).keyup()
			.parents('form').submit(function(){
				return false;
			});
	}
		
	return this;
		
	function filter(){
		var term = jQuery.trim( jQuery(this).val().toLowerCase() ), scores = [];
		
		if ( !term ) {
			rows.show();
		} else {
			rows.hide();

			cache.each(function(i){
				var score = this.score(term);
				if (score > 0) { scores.push([score, i]); }
			});

			jQuery.each(scores.sort(function(a, b){return b[0] - a[0];}), function(){
				jQuery(rows[ this[1] ]).show();
			});
		}
	}
};
