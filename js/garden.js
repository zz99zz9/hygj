function item_masonry(){ 
	$('.item img').load(function(){ 
		$('.infinite_scroll').masonry({ 
			itemSelector: '.masonry_brick',
			columnWidth:230,
			gutterWidth:12								
		});		
	});
		
	$('.infinite_scroll').masonry({ 
		itemSelector: '.masonry_brick',
		columnWidth:230,
		gutterWidth:12								
	});	
}

$(function(){

	function item_callback(){ 		
		item_masonry();	
	}

	item_callback();  

	$('.item').fadeIn();

	var sp = 1
	
	
});