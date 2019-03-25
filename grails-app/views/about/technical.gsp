<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>About the Church of God - Portland, Oregon - Technical Information</title>
		<meta name="description" content="About the Church of God at Portland, Oregon. Technical information and credits."/>
		<meta name="robots" content="index, nofollow">
		<meta name="revisit-after" content="14 days">
		<style type="text/css">
		 p {
		 	margin: 10px 20px 15px 20px;
		 	clear: both;
		 }
		 
		 .content h1 {
		 	margin-top: 20px;
		 }
		 
		 .content h2 {
		 	font-weight: bold;
		 	color: navy;
		 }
		 
		 h3 {
		 	margin: 10px 0 5px 20px;
		 	color: green;
		 }
		 
		 a {
		 	text-decoration: none;
		 }
		 
		 thead tr {
		 	background:#D5CEA6;
		 }
		 
		 tbody tr {
		 	background: white;
		 }
		 
		 tbody tr:hover {
		 	background: white;
		 }

		</style>
	</head>
	<body>
	
		<h1 class="structuralClear"></h1>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<section id="page-body" role="main" class="content scaffold-show">
			<article id="technical">
				<h2>Technical Information</h2>
				<p>
					We recommend a recent version of Chrome, Firefox, Safari or Opera to view this site as it was intended.
					In addition, Javascript <em>must be enabled</em> to correctly render all the features included
				    on this site. <br><br>
				</p>
				<g:render template="/about/browserDetails" model="${[agentInfo: agentInfo] }"></g:render>
				<p>
					<br><b>Bugs, Technical Issues</b><br>
					For technical issues or to report bugs or broken links,
					<a href="${('&#109;&#097;&#105;&#108;&#116;&#111;:' + adminMail)}">click here to contact the webmaster.</a>
				</p>
			</article>
			<article id="credits">
				<h2>Technical Credits</h2>
				<p>
					<g:link url="http://grails.org/" target="_blank"><g:img dir="images" file="grails.png" class="smallShadow userAgentIcons"/></g:link>
					<b>Grails</b> <br>
					This website was developed using the <g:link url="http://grails.org/" target="_blank">Grails framework</g:link> (v2.5.2) from the good folks at SpringSource. Grails
					is a tremendously productive framework that removes the plumbing out of web development. Highly recommended! <br>
					Some of the individuals that have contributed to this framework or are simply giants in the community include the following:<br>
					<g:link url="https://twitter.com/graemerocher" target="_blank">Graeme Rocher</g:link>,&nbsp;
					<g:link url="https://twitter.com/jeffscottbrown" target="_blank">Jeff Brown</g:link>,&nbsp;
					<g:link url="https://twitter.com/pledbrook" target="_blank">Peter Ledbrook</g:link>,&nbsp;
					<g:link url="https://twitter.com/burtbeckwith" target="_blank">Burt Beckwith</g:link>,&nbsp;
					<g:link url="https://twitter.com/ldaley" target="_blank">Luke Daley</g:link>,&nbsp;
					<g:link url="http://grails-contributors.cloudfoundry.com/lhotari" target="_blank">Lari Hotari</g:link>,&nbsp;
					<g:link url="http://grails-contributors.cloudfoundry.com/marcpalmer" target="_blank">Marc Palmer</g:link>,&nbsp;
					<g:link url="http://www.thirstyhead.com/" target="_blank">Scott Davis</g:link>
				</p>
				<p>
					<g:link url="http://groovy.codehaus.org/" target="_blank"><g:img dir="images" file="groovy.jpg" class="smallShadow userAgentIcons"/></g:link>
					<b>Groovy</b> <br>
					You can't mention Grails without giving a hat tip to <g:link url="http://groovy.codehaus.org/" target="_blank"><em>Groovy</em></g:link> too.
					Groovy is a dynamic language that runs in the Java Virtual Machine. Groovy is what makes Grails, well, so groovy. This is an absolutely fun
					programming language. A few of the generous contributors to the Groovy community follow: <br>
					<g:link url="http://glaforge.appspot.com/" target="_blank">Guillaume Laforge</g:link>,&nbsp;
					<g:link url="http://www.linkedin.com/in/paulwilliamking" target="_blank">Paul King</g:link>,&nbsp;
					<g:link url="http://www.amazon.com/Dierk-K%C3%B6nig/e/B001JOTVHE" target="_blank">Dierk König</g:link>,&nbsp;
					<g:link url="http://blackdragsview.blogspot.com/" target="_blank">Jochen Theodorou</g:link>,&nbsp;
					<g:link url="http://www.jroller.com/melix/" target="_blank">Cedric Champeau</g:link>,&nbsp;
					<g:link url="http://hamletdarcy.blogspot.com/" target="_blank">Hamlet D'Arcy</g:link>,&nbsp;
					<g:link url="http://mrhaki.blogspot.com/" target="_blank">Hubert Klein Ikkin</g:link>
				</p>
				<p>
					<g:link url="http://jquery.com/" target="_blank"><g:img dir="images" file="jquery.jpg" class="smallShadow userAgentIcons"/></g:link>
					<b>jQuery</b> <br>
					<g:link url="http://jquery.com/" target="_blank">jQuery</g:link> takes away the tediousness of dealing with multiple browser platforms and simply works. This javascript library is a <em>must</em>
					for any front end web developer.
				</p>
				<p>
					<g:link url="http://jplayer.org/" target="_blank"><g:img dir="images" file="jplayer_logo.gif" class="smallShadow userAgentIcons"/></g:link>
					<b>jPlayer</b> <br>
					The online, live streaming media player of choice is <g:link url="http://jplayer.org/" target="_blank">jPlayer</g:link>. My use of it here only scratches
					the surface of all its capabilities. My favorite feature is that it will attempt to use HTML 5 audio capabilities but will fall back to Flash when
					the audio feature is not available. Many thanks to <g:link url="http://twitter.com/#!/thepag" target="_blank">Mark Panaghiston</g:link>,
					<g:link url="http://twitter.com/#!/maboa" target="_blank">Mark Boas</g:link>, and Silvia Benvenuti of
					<g:link url="http://www.happyworm.com/" target="_blank">Happyworm.com</g:link>
				</p>
				<p><g:link url="http://www.dynamicdrive.com" target="_blank"><g:img dir="images" file="dynamic.JPG" class="smallShadow userAgentIcons"/></g:link>
					<b>Dynamic Drive</b> <br>
					This site has developed some really sweet JQuery plugins, including the
					<g:link url="http://www.dynamicdrive.com/dynamicindex17/haccordion.htm" target="_blank">Horizontal Accordion</g:link>, which I use on the home page,
					and the <g:link url="http://www.dynamicdrive.com/dynamicindex4/imagebubbles.htm" target="_blank"><em>Image Bubble effects</em></g:link>, used on the main menu.
					They have a plethora of other goodies, visit <g:link url="http://www.dynamicdrive.com" target="_blank">their site</g:link> for more details.
				</p>

			 </article>
		</section>
	</body>
</html>
