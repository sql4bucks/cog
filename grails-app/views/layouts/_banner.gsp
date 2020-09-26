		<section id="banner" class="blueGradient" role="banner">
			<article id="logo" class="floatLeft cogPic">
				<g:link url="http://www.inspired-art.com" target="_blank">
					<img src="${resource(dir: 'images', file: 'jesusHugging.jpg')}"
						 alt="Forgiven" class="smallShadow cogImage"/>
				</g:link>
			</article>	
			<article id="login" class="headerRight">
					<sec:ifLoggedIn>
						Welcome, <g:userProperty field="firstName"/> <br />
						<g:link controller='logout'>Logout</g:link>
					</sec:ifLoggedIn>
					<sec:ifNotLoggedIn>
						<g:link controller='login' action='auth'>Login</g:link>
					</sec:ifNotLoggedIn>
					<br>	
			</article>
			<div class="h1 titleMargin floatLeft"><h1>Church of God - Portland, Oregon</h1></div>
			<div class="floatLeft notMobile bannerText" >
				<p>Website of the Church of God in Portland, Oregon. We publish recorded media for the
				encouragement of those in the Portland area and across the web. Sermons, singing and links to
				additional rich content are available for those thirsting for truth.
				</p>
			</div>
			<div class="floatLeft desktopOnly bannerText" >
				<p>
				The "Evening Light" congregation in Portland, Oregon currently meets at the Gladstone Community Center,
				located here: </p>
				<p>255 E. Exeter St, Gladstone, Oregon.</p>
			</div>
			<div class="floatLeft ifMobile" style="margin:0;max-width:60%" >
				Website of the Church of God in Portland, Oregon, spreading truth across the web.
			</div>
			<div class="clearBoth"></div>
		</section>
