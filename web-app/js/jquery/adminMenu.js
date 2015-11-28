$(".adminItem").hover(
	function () {
	    $(this).addClass("blueGradient");
	    $(this).css('color', 'yellow')
	},
	function () {
	    $(this).removeClass("blueGradient");
	    
	}
);

$(".adminLink").hover(
		function () {
		    $(this).css('color', 'yellow')
		},
		function () {
		    $(this).css('color', 'green')
		    
		}
	);
	