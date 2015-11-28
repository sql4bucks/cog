<%@ page import="org.cog.AdminUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'default.login.label', default: 'Login')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="login" class="content scaffold-edit" role="main">
			<h1><g:message code="default.login.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form method="post" >
				<fieldset class="form">
					<div class="fieldcontain required">
						<label for="email">
						<g:message code="adminUser.email.label" default="Email" />
						<span class="required-indicator">*</span>
						</label>
						<g:field type="email" name="email" size="50" maxlength="75"  required="" value="${params.email}" autofocus="autofocus" tabindex="10" />
					</div>
					<div class="fieldcontain required">
						<label for="password">
						<g:message code="adminUser.password.label" default="Password" />
						<span class="required-indicator">*</span>
						</label>
						<g:field type="password" name="password" maxlength="75" required="" value="" tabindex="20" accesskey="p"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="authenticate" value="${message(code: 'default.button.login.label', default: 'Login')}" />
					<g:actionSubmit class="cancel" action="index" value="${message(code: 'default.button.cancel.label', default: 'Cancel')}" formnovalidate="" />
				</fieldset>
				<input type="hidden" name="cName" value="${params.cName}">
		  		<input type="hidden" name="aName" value="${params.aName}">
		  		<input type="hidden" name="id" value="${params.id}">
				
			</g:form>
		</div>
	</body>
</html>
