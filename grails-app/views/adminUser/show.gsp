
<%@ page import="org.cog.AdminUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adminUser.label', default: 'AdminUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-adminUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-adminUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list adminUser">
			
				<g:if test="${adminUserInstance?.loginId}">
				<li class="fieldcontain">
					<span id="loginId-label" class="property-label"><g:message code="adminUser.loginId.label" default="Login Id" /></span>
					
						<span class="property-value" aria-labelledby="loginId-label"><g:fieldValue bean="${adminUserInstance}" field="loginId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminUserInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="adminUser.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${adminUserInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminUserInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="adminUser.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${adminUserInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminUserInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="adminUser.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${adminUserInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminUserInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="adminUser.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${adminUserInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminUserInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="adminUser.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="securityRole" action="show" id="${adminUserInstance?.role?.id}">${adminUserInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${adminUserInstance?.id}" />
					<g:link class="edit" action="edit" id="${adminUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
