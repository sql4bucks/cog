<div id="adminContainer" class="adminContainer">
<ul class="adminMenu">
	<li class="adminItem brownGradient">
		<g:link controller="author" action="list" class="adminLink">
		Authors 
		</g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="city" action="list" class="adminLink"> Cities </g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="content" action="list" class="adminLink"> Content </g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="contentType" action="list" class="adminLink"> Content Type </g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="location" action="list" class="adminLink"> Location </g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="link" action="list" class="adminLink"> Links </g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="picture" action="list" class="adminLink"> Pictures </g:link>
	</li>
	<sec:access expression="hasRole('ROLE_SUPER')">		
		<li class="adminItem brownGradient">
			<g:link controller="role" action="list" class="adminLink"> Roles </g:link>
		</li>
	</sec:access>	
	<li class="adminItem brownGradient">
		<g:link controller="scripture" action="list" class="adminLink"> Scriptures </g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="state" action="list" class="adminLink"> States </g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="subscription" action="list" class="adminLink"> Subscription Types </g:link>
	</li>
	<li class="adminItem brownGradient">
		<g:link controller="topic" action="list" class="adminLink"> Topics </g:link>
	</li>
	<sec:access expression="hasRole('ROLE_SUPER')">
		<li class="adminItem brownGradient">
			<g:link controller="user" action="list" class="adminLink"> User </g:link>
		</li>
		<li class="adminItem brownGradient">
			<g:link controller="userRole" action="list" class="adminLink"> User Roles </g:link>
		</li>
	</sec:access>	
	<li class="adminItem brownGradient">
		<g:link controller="userSubscription" action="list" class="adminLink"> User Subscription </g:link>
	</li>
</ul>
</div>