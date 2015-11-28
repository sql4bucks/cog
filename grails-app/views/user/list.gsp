
<%@ page import="org.cog.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
						<g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
						<g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
						<g:sortableColumn property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}" />
						<g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />
						<g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Locked')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
						<td>${fieldValue(bean: userInstance, field: "firstName")}</td>
						<td>${fieldValue(bean: userInstance, field: "lastName")}</td>
						<td><g:checkBox name="passwordExpired" class="checkbox" checked="${userInstance.passwordExpired == '1'}" disabled="true" /></td>
						<td><g:checkBox name="accountExpired" class="checkbox" checked="${userInstance.accountExpired == '1'}" disabled="true" /></td>
						<td><g:checkBox name="accountLocked" class="checkbox" checked="${userInstance.accountLocked == '1'}" disabled="true" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < userInstanceTotal}">
				<div class="pagination">
					<g:paginate total="${userInstanceTotal}" />
				</div>
			</g:if>	
		</div>
	</body>
</html>
