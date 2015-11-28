
<%@ page import="org.cog.UserRole" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userRole" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="userRole.user.label" default="User" /></th>
						<th><g:message code="userRole.role.label" default="Role" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userRoleInstanceList}" status="i" var="userRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userRoleInstance.id}">${fieldValue(bean: userRoleInstance, field: "user")}</g:link></td>
						<td>${fieldValue(bean: userRoleInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < userRoleInstanceTotal}">
				<div class="pagination">
					<g:paginate total="${userRoleInstanceTotal}" />
				</div>
			</g:if>	
		</div>
	</body>
</html>
