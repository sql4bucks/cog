		<section id="banner" class="blueGradient" role="banner">
			<article id="logo" class="floatLeft cogPic">
				<g:link url="http://www.inspired-art.com" target="_blank">
					<img src="${resource(dir: 'images', file: 'jesusHugging.jpg')}" alt="Forgiven" class="smallShadow"/>
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
			<div class="h0">Church of God</div>
			<h1>Portland, Oregon</h1>
			<article class="scriptureBox lightGradient floatLeft defaultShadow">
				<g:scripture/>
			</article>
			<hr class="clearBoth"/>
		</section>
