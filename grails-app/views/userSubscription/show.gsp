
<%@ page import="org.cog.UserSubscription" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userSubscription.label', default: 'UserSubscription')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userSubscription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userSubscription" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userSubscription">
			
				<g:if test="${userSubscriptionInstance?.subscription}">
				<li class="fieldcontain">
					<span id="subscription-label" class="property-label"><g:message code="userSubscription.subscription.label" default="Subscription" /></span>
					
						<span class="property-value" aria-labelledby="subscription-label"><g:link controller="subscription" action="show" id="${userSubscriptionInstance?.subscription?.id}">${userSubscriptionInstance?.subscription?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userSubscriptionInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="userSubscription.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="adminUser" action="show" id="${userSubscriptionInstance?.user?.id}">${userSubscriptionInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userSubscriptionInstance?.id}" />
					<g:link class="edit" action="edit" id="${userSubscriptionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
