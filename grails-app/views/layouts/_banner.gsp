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
			<div class="h1 titleMargin floatLeft"><h1>Church of God - Portland</h1></div>
			<article class="scriptureBox lightGradient floatLeft defaultShadow">
				<g:scripture/>
			</article>
			<div class="clearBoth"></div>
		</section>
