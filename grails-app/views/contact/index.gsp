<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Church of God - Contact Information</title>
		<meta name="description" content="The Church of God, Portland, Oregon. This page lists contact information for affiliated congregations across the country." />
		<meta name="robots" content="index, follow">
		<meta name="revisit-after" content="14 days">
		<link rel="canonical" href="http://churchofgodportland.org/contact/index" />
	</head>
	<body>
		<h1 class="structuralClear"></h1>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="page-body" class="content scaffold-show" role="main">
			<h1 style="margin-top: 20px;">Contact Us</h1>
			<p style="margin: 10px 20px;">
				This web site is provided by the Church of God located in Gladstone, Oregon. However, there are many affiliated
				congregations scattered across the country. Click on the location near you for more details. A hearty invitation
				is extended to you to attend our services or contact us using the information below
			</p>
			<div id="locationList" class="locationList">
				<g:render template="/contact/list" model="${[locationList: locationList, defaultLocation: defaultLocation]}"/>
			</div>
			<div id="contactInfo" class="contactInfo">
				<g:render template="/contact/details" model="${[locationDetails: defaultDetails]}"/>
			</div>
			<section id="googleMap" class="googleMap">
				<div id="mapContents">
					<g:render template="/contact/map" model="${[location: defaultLocation]}" />
				</div>
			</section>
		</div>
	</body>
</html>
