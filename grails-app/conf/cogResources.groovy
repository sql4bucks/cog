modules = {
	collapse {
		dependsOn 'jquery'
		resource url: '/js/jquery/jquery.collapse.js', disposition: 'head', bundle: 'jQuery'
	}	
	
	jPlayer {
		dependsOn 'jquery'
		resource url: '/js/jquery/jQuery.jPlayer.2.1.0/jquery.jplayer.min.js', disposition:'head', bundle: 'jPlayer'
		resource url: '/js/jquery/jQuery.jPlayer.2.1.0/add-on/jplayer.playlist.min.js', disposition:'head', bundle: 'jPlayer'
		resource url: '/js/jquery/jQuery.jPlayer.2.1.0/add-on/jquery.jplayer.inspector.js', disposition:'head', bundle: 'jPlayer'
	}
	
	uniform {
		dependsOn 'jquery'
		resource url: '/js/jquery/uniform/jquery.uniform.min.js', disposition:'head', bundle: 'uniform'
		resource url: '/js/jquery/uniform/css/uniform.aristo.css', disposition:'head', bundle: 'uniform'
		resource url: '/js/jquery/uniform/images/sprite-aristo.png', disposition:'head'
	}
	
	imageBubbles {
		dependsOn 'jquery'
		resource url: '/js/imgbubbles.js', disposition:'head', bundle: 'imageBubbles'
		resource url: '/css/imgbubbles.css', disposition:'head', bundle: 'imageBubbles'
	}
	
	haccordion {
		dependsOn 'jquery'
		resource url: '/js/jquery/haccordion.js', disposition: 'head', bundle: 'haccordion'
		resource url: '/css/haccordion.css', disposition: 'head', bundle: 'haccordion'
	}
	
	jMagnifier {
		dependsOn 'jquery'
		resource url: '/js/jquery/jquery.magnifier.js', disposition: 'head'
	}
	
	adminMenu {
		dependsOn 'jquery'
		resource url: '/js/jquery/adminMenu.js'
	}
}
