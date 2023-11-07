		<section id="banner" class="blueGradient" role="banner">
			<article id="logo" class="floatLeft cogPic">
				<g:link controller="content" action="doSearch">
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
				<p>Website of the Church of God "Evening Light" congregation in Portland, Oregon.
				</p>
			</div>
			<div class="floatLeft desktopOnly bannerText" >
				<p>Come worship with us!</br>
				Gladstone Community Center - 255 E. Exeter St, Gladstone, Oregon. </br>
					Join us in person or virtually on <a href="https://us02web.zoom.us/j/4179158207?pwd=N1hwVUNnQWw5R3JkbjdZYmVGUndUUT09">Zoom</a>.</br></br>
				<g:link controller='about' action='index'>Service Schedule</g:link>
				</>
			</div>
			<div class="floatLeft ifMobile" style="margin:0;max-width:60%" >
				Website of the Church of God in Portland, Oregon. </br>
				Join us in person or virtually on <a href="https://us02web.zoom.us/j/4179158207?pwd=N1hwVUNnQWw5R3JkbjdZYmVGUndUUT09">Zoom</a>.</br></br>
				<g:link controller='about' action='index'>Service Schedule</g:link>
			</div>
			<div class="clearBoth"></div>
		</section>
