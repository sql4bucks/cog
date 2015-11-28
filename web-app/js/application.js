//Globals
var cancelSpinner = false;        
var debug = false

// On document ready, call registerEvents (defined below)
$("document").ready(registerEvents) 

// Called to confirm if someone wants to cancel an update/delete, etc. 
function cancelConfirm() {
	var result = confirm("Are you sure you want to cancel?");
	if (!result) {
  		cancelSpinner = true;
  	}
	return result;
} 

// Go back to the previous page
function goBack() {
  	history.go(-1);
} 
    	          
// Show the spinner - called from event listeners
function showSpinner(e) {
		var spinner = document.getElementById("spinner")
		if (spinner) {
			if (!cancelSpinner) {
		  		toggleElement(spinner,true);
		  	} else {
		  		cancelSpinner = false;
		  	}	
		}  	
};

//Hide the spinner - called when someone chooses to stay on a page after prompted to confirm
function hideSpinner() {
	var spinner = document.getElementById("spinner")
	if (spinner) {
	  	toggleElement(spinner, false);
	}  	
};

//Hide the spinner - called from a listener
function hideSpinner(e) {
	var spinner = document.getElementById("spinner")
	if (spinner) {
	  	toggleElement(spinner,false);
	}  	
};



// Don't turn on the spinner - called by links that don't want to call the spinner
function disableSpinner() {
	cancelSpinner = true;
}

//Turn on the spinner 
function enableSpinner() {
	cancelSpinner = false;
}

// Called on document ready - registers the forms and links to show spinner 
function registerEvents() {
	registerAjax();
	registerLinks();
	registerForm();
	$('#pictureAccordion').animate({ opacity: 'toggle' }, 2000, 'linear');
	$('ul#squares').imgbubbles({factor:2.00}); //add bubbles effect to UL id="squares"
	$("#spinner").hide();
	$(window).focus( function () { hideSpinner(); } );
	$(window).unload( function () { hideSpinner(); } );
	$("form:first :input:visible:first").focus();
}	


// Links on the page will show the spinner
function registerLinks() {
	// Add event listeners to all links on the page
	// to show the spinner on the clicked event
	var allLinks = document.links;
	var test = "Links: ";
	for (var i=0; i < allLinks.length; i++) {
  		if (allLinks[i].addEventListener ) {
  			// Exclude the richui tabs
  			if (allLinks[i].href.indexOf("tab") < 0 && allLinks[i].href.indexOf("undefined") < 0 
  					&& allLinks[i].href.indexOf("#") < 0 && allLinks[i].href.indexOf("javascript:;") < 0
  					&& allLinks[i].className.indexOf("noSpin") < 0) {
  				test += allLinks[i].href + "; ";
  				allLinks[i].addEventListener('click', showSpinner, false);
  			}	
  		}		
	}
	if (debug) {
		alert(test);
	}

}

function registerAjax() {
	if (typeof jQuery !== 'undefined') {
		(function($) {
			$('#spinner').ajaxStart(function() {
				$(this).fadeIn();
			}).ajaxStop(function() {
				$(this).fadeOut();
			});
		})(jQuery);
	}
}

// Form submissions will show spinner
function registerForm() {
	firstForm = document.forms[0]
	if (firstForm) {
		// Add listener on submit to show the spinner
		if (firstForm.addEventListener) {
			firstForm.addEventListener('submit', showSpinner, true);
		}
	}	
} 

// Focus on the first field in the form if possible
function focusForm() {
	firstForm = document.forms[0]
	if (firstForm) {
		theElement = firstForm.elements[0]	
		if (theElement) {
			try {	
				theElement.focus()
			} catch(error) { }		
		}
	}	
} 

function toggleElement(object, show) {
	if (show) {
		object.style.display="inline";
	} else {
		object.style.display="none";	
	}	
}

