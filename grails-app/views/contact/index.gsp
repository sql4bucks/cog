<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Church of God - Contact Information</title>
		<meta name="description" content="Contact information for Church of God congregations across the country"/> 
	</head>
	<body>
		<h1 class="structuralClear"></h1>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="page-body" class="content scaffold-show" role="main">
			<h1 style="margin-top: 20px;">Contact Us</h1>
			<p style="margin: 10px 20px;">
				This web site is provided by the Church of God located in Clackamas, Oregon. However, there are many affiliated
				congregations scattered across the country. Click on the location near you for more details. A hearty invitation
				is extended to you to attend our services or contact us using the information below
			</p>
			<div id="locationList" class="locationList lightGradient">
				<g:render template="/contact/list"/ model="${[locationList: locationList]}"/>
			</div>
			<div id="contactInfo" class="contactInfo lightGradient">
				<g:render template="/contact/details" model="${[locationDetails: defaultDetails]}"/>
			</div>
			<section id="googleMap" class="googleMap lightGradient">
				<h2 style="margin 20px;">Map</h2>
				<div id="mapContents">
					<g:render template="/contact/map" model="${[location: defaultLocation]}" />
				</div>
			</section>
		</div>
	</body>
</html>
