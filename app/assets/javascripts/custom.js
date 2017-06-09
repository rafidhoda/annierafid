var $ = jQuery.noConflict();
$(document).ready(function() {
   "use strict";

  $(".animsition").animsition({
    inClass: 'fade-in-down-sm',
    outClass: 'fade-out-up-sm',
	linkElement: '.fade-page'
  });
  
  $( '.swipebox' ).swipebox();
  
   
  $('#defaultCountdown').countdown({until: new Date(2017, 8 - 1, 9, 16), format: 'y-o-d-h'});						   

	$("#weddingcarousel").owlCarousel({
	items : 4,
	itemsScaleUp : true,
	theme : "owl-themecarousel"
	});
  
  
});