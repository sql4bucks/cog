
<%@ page import="org.cog.SecurityRole" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'securityRole.label', default: 'SecurityRole')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-securityRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-securityRole" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'securityRole.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="accessLevel" title="${message(code: 'securityRole.accessLevel.label', default: 'Access Level')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'securityRole.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${securityRoleInstanceList}" status="i" var="securityRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${securityRoleInstance.id}">${fieldValue(bean: securityRoleInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: securityRoleInstance, field: "accessLevel")}</td>
					
						<td>${fieldValue(bean: securityRoleInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${securityRoleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
