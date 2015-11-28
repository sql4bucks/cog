<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>About the Church of God - Portland, Oregon</title>
		<meta name="description" content="About the Church of God website - credits and technical information"/>
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
			<h1>About this site</h1>
			<p>
				The Church of God, <em>where salvation makes you a member</em>. <br><br>
				This web site is presented by the Church of God	congregation at Clackamas, a suburb of Portland, Oregon. <br>
				&copy; 2012 - Church of God. All Rights Reserved.
			</p>
			<article id="technical">
				<h2>Technical Information</h2>
				<p>
				This web site was designed to take advantage of the latest HTML, CSS and JavaScript technologies. Some older browsers will not 
				display the content on this site correctly. In addition, Javascript <em>must be enabled</em> to correctly render all the features included
				on this site. <br><br>
				We recommend a recent version of Chrome, Firefox, Safari or Opera to view this site as it was intended.
				</p>  
				<g:render template="/about/browserDetails" model="${[agentInfo: agentInfo] }"></g:render>
				<p>
				<br><b>Bugs, Technical Issues</b><br>
				For technical issues or to report bugs or broken links,	
					<a href="${('&#109;&#097;&#105;&#108;&#116;&#111;:' + adminMail)}">click here to contact the webmaster.</a>
				</p>	
			</article>
			<article id="credits">
			<h2>Credits</h2>
			<p>
			This section "gives credit where credit is due". This web site has benefited from the works of many individuals, whether it be open source software, 
			jQuery plug-ins, dazzling artwork or programming blogs that have shed light on seemingly insurmountable problems. Here is a brief list of folks that 
			made this effort that much easier or elegant.
			</p>
			<p>
			<g:link url="http://grails.org/" target="_blank"><g:img dir="images" file="grails.png" class="smallShadow userAgentIcons"/></g:link>
			 <b>Grails</b> <br>
			This website was developed using the <g:link url="http://grails.org/" target="_blank">Grails framework</g:link> (v2.0.3) from the good folks at SpringSource. Grails
			is a tremendously productive framework that removes the plumbing out of web development. Highly recommended! <br>
			Some of the individuals that have contributed to this framework or are simply giants in the community include the following:<br>
			<g:link url="http://grails-contributors.cloudfoundry.com/graemerocher" target="_blank">Graeme Rocher</g:link>,&nbsp; 
			<g:link url="http://grails-contributors.cloudfoundry.com/jeffbrown" target="_blank">Jeff Brown</g:link>,&nbsp; 
			<g:link url="http://grails-contributors.cloudfoundry.com/pledbrook" target="_blank">Peter Ledbrook</g:link>,&nbsp; 
			<g:link url="http://grails-contributors.cloudfoundry.com/burtbeckwith" target="_blank">Burt Beckwith</g:link>,&nbsp; 
			<g:link url="http://grails-contributors.cloudfoundry.com/alkemist" target="_blank">Luke Daley</g:link>,&nbsp;
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
			 <h3>Artwork</h3>
			 <p>
			 A web site is not complete without some stellar images. I'm no graphic designer, so I have to use the work of others to dress up the place. 
			 Most of the images on this site are used based on the 
			 <g:link url="http://creativecommons.org/licenses/by/3.0/" target="_blank">CC Attribution 3.0 license </g:link> or by permission from the artist. 
			 These artists do amazing work, and we want to acknowledge their contributions here. 
			 <table>
			 <colgroup span="3">
			 	<col width="20%">
				<col width="10%">	                              
				<col width="70%">	                              
			 </colgroup>
			 <thead>
			 	<tr><td><b>Artist</b></td><td><b>Links</b></td><td><b>Description</b></td></tr>
			 </thead>
			 <tbody>
			 <tr>
			 	<td>Danny Hahlbohm</td>
			 	<td>
			 		<g:link url="http://www.inspired-art.com" target="_blank">
			 			<g:img dir="images" file="world_link.png" class="smallShadow userAgentIcons" />
			 		</g:link>
			 	</td>
			 	<td>	
			 		Danny is a magnificent artist whose work is in thousands of web pages and homes around the world.  
			 		His painting <g:link url="http://www.inspired-art.com/christian/welcome_home.html" target="_blank"><em>Welcome Home</em></g:link> graces every
			 		single page of our site. It is a wonderful message of love, redemption and hope. Check out his work at his web site, 
			 		<g:link url="http://www.inspired-art.com" target="_blank">Inspired-Art.com</g:link><br><br>
			 		&copy; 2012 Danny Hahlbohm, all rights reserved by the artist<br>
			 	</td>
			 </tr>
			 <tr>
				 <td>Deleket (Jojo Mendoza)</td>
				 <td>
					<g:link url="http://www.deleket.com" target="_blank">
			 			<g:img dir="images" file="world_link.png" class="smallShadow userAgentIcons" />
			 		</g:link> &nbsp;&nbsp;
			 		<g:link url="https://twitter.com/deleket" target="_blank">
			 			<g:img dir="images" file="Social-Network-Twitter-icon.png" class="smallShadow userAgentIcons"/> 
			 		</g:link>
			 	 </td>	
				 <td>
				 	 	Jojo Mendoza is a very talented artist who creates eye-catching, stylistic icons. 
			 			Many of his icons are in use on this site.
				 </td>
			 </tr>
			 <tr>
			 	<td>Oxygen Team</td>
			 	<td>
			 		<g:link url="http://www.oxygen-icons.org" target="_blank">
			 			<g:img dir="images" file="world_link.png" class="smallShadow userAgentIcons" />
					</g:link>	
			 	</td>
			 	<td>
			 		The Oxygen Team icon set is beautiful and classy. They have a large set of icons available free of charge under the GNU license. 
			 	</td>
			 </tr>		
			 <tr>
			 	<td>Fat Cow</td>
			 	<td>
			 		<g:link url="http://www.fatcow.com/free-icons" target="_blank">
			 			<g:img dir="images" file="world_link.png" class="smallShadow userAgentIcons" />
					</g:link>	
			 	</td>
			 	<td>
			 		Fat Cow is one of the biggest web hosting companies in the country. They have also provided a large number of sweet icons free of charge. 
			 	</td>
			 </tr>		
			 <tr>
			 	<td>WebIconSet</td>
			 	<td>
			 		<g:link url="http://www.webiconset.com" target="_blank">
			 			<g:img dir="images" file="world_link.png" class="smallShadow userAgentIcons" />
					</g:link>	
			 	</td>
			 	<td>
			 		A wide variety of beautiful icons are available at the <g:link url="http://www.webiconset.com" target="_blank">WebIconSet</g:link> web site.  
			 	</td>
			 </tr>
			 <tr>
			 	<td>Yellow Icon Design</td>
			 	<td>
			 		<g:link url="http://www.yellowicon.com" target="_blank">
			 			<g:img dir="images" file="world_link.png" class="smallShadow userAgentIcons" />
					</g:link>	
			 	</td>
			 	<td>
			 		Yellow Icons has released a set of beautiful icons under the GNU General Public License. This web site utilizes its "Home"
			 		<g:img dir="images" file="Home-icon.png" class="smallShadow userAgentIcons" /> 
			 		icon, which looks like it was designed specifically for this site.  
			 	</td>
			 </tr>
			 <tr>
			 	<td>Icon Leak</td>
			 	<td>
			 		<g:link url="http://iconleak.com" target="_blank">
			 			<g:img dir="images" file="world_link.png" class="smallShadow userAgentIcons" />
					</g:link>	
			 	</td>
			 	<td>
			 		The detailed binoculars 
			 		<g:img dir="images" file="Binoculars.png" class="smallShadow userAgentIcons" />
			 		icon on the search page was created by these fine folks.  
			 	</td>
			 </tr>
			 <tr>
			 	<td>Anna Shlyapnikova</td>
			 	<td>
			 		<g:link url="http://shlyapnikova.deviantart.com/" target="_blank">
			 			<g:img dir="images" file="world_link.png" class="smallShadow userAgentIcons" />
					</g:link>	
			 	</td>
			 	<td>
			 		Anna created the small church icon used as the "favicon" for this site.
			 	</td>
			 </tr>
			 </tbody>
			 </table>
			 </article>
		</section>
	</body>
</html>
