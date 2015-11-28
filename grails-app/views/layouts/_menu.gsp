		<nav class="siteNav">
			<ul id="squares" class="bubblewrap">
			<li>
				<a class="navItem" href="${createLink(uri: '/')}">
						<div class="navButton">
							<img src="${resource(dir: 'images', file: 'Home-icon.png')}" alt="Home"/>
						</div>
						<g:message code="default.home.label"/>
				</a>
			</li>
			<li>
			<g:link class="navItem" controller="content" action="search">	
				<div class="navButton">
					<img src="${resource(dir: 'images', file: 'volume-high-icon.png')}" alt="Media"/>
				</div>
				<g:message code="default.media.label"/>
			</g:link>
			</li>
			<%--			
			<li>
			<g:link class="navItem" controller="subscription" action="create">	
				<div class="navButton">
					<img src="${resource(dir: 'images', file: 'Checked_Shield_Green.png')}" alt="Subscribe"/>
				</div>
				<g:message code="default.subscribe.label"/>
			</g:link>
			</li>
			--%>
			<li>
			<g:link class="navItem" controller="contact" action="index">	
				<div class="navButton">
					<img src="${resource(dir: 'images', file: 'User-Chat-icon.png')}" alt="Contact Us"/>
				</div>
				<g:message code="default.contact.nav.label"/>
			</g:link>
			</li>
			<li>
			<g:link class="navItem" controller="link" action="links">	
				<div class="navButton">
					<img src="${resource(dir: 'images', file: 'link-go-icon.png')}" alt="Links"/>
				</div>
				<g:message code="default.links.label"/>
			</g:link>
			</li>
			<li>
			<g:link class="navItem" url="http://delwell2.blogspot.com">	
				<div class="navButton">
					<img src="${resource(dir: 'images', file: 'My-blog-icon.png')}" alt="Blog"/>
				</div>
				<g:message code="default.blog.label"/>
			</g:link>
			</li>
			<sec:access expression="hasRole('ROLE_ADMIN')">
				<li>
				<g:link class="navItem" controller="admin" action="index">	
					<div class="navButton">
						<img src="${resource(dir: 'images', file: 'admin-icon.png')}" alt="Admin"/>
					</div>
					<g:message code="default.admin.label"/>
				</g:link>
				</li>
			</sec:access>
			<li>
			<g:link class="navItem" controller="about" action="index">	
				<div class="navButton">
					<img src="${resource(dir: 'images', file: 'Get-Info-icon.png')}" alt="About"/>
				</div>
				<g:message code="default.about.label"/>
			</g:link>
				
			</ul>
		</nav>
