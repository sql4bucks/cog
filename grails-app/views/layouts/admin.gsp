<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Church Of God - Portland"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="robots" content="noindex,nofollow">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'fav.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'adminMenu.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main-02.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile-02.css')}" type="text/css">
		<script type="text/javascript">
		/*****************************************************************************************
		 * Credits: Using the following scripts from dynamicdrive.com:
		 * ==================================================================================
		 * Horizontal Accordion script- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
		 * jQuery Image Magnify- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
		 * Image Bubbles effect- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
		 *
		 * This notice MUST stay intact for legal use
		 * Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
		 *****************************************************************************************/
		</script>	 
		<g:javascript library="jquery" />
		<g:javascript library="application" />
		<r:require modules="imageBubbles"/>
		<r:require modules="adminMenu"/>
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
		<g:render template="/layouts/banner"/>
		<g:render template="/layouts/menu"/>
		<section class="adminPage">		
		<g:render template="/layouts/adminMenu"/>	
		<article class="adminSection">	
		<div class="adminContent">
		<g:layoutBody/>
		<div id="spinner" class="spinner" ></div>
		</div>
		</article>
		</section>
		<g:render template="/layouts/footer"/>
		<r:layoutResources/>

	</body>
</html>