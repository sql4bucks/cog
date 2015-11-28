
<%@ page import="org.cog.Location" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-location" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'location.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'location.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'location.address.label', default: 'Address')}" />
					
						<th><g:message code="location.city.label" default="City" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${locationInstanceList}" status="i" var="locationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "name")}</g:link></td>
					
						<td><g:checkBox name="active" class="checkbox" value="Y" checked="${locationInstance.active == 'Y'}" disabled="true" /></td>
					
						<td>${fieldValue(bean: locationInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "city")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < locationInstanceTotal}">
				<div class="pagination">
					<g:paginate total="${locationInstanceTotal}" />
				</div>
			</g:if>	
		</div>
	</body>
</html>
