jQuery(document).ready(function(){
	//var href=jQuery('#query_in_top_menu').parent().attr('href');
	jQuery('#query_in_top_menu').parent().attr('href', jQuery('#query_in_top_menu_query_link').html());
	jQuery('#query_in_top_menu').parent().html(jQuery('#query_in_top_menu_query_name span').html());
	});