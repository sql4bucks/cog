
<%@ page import="org.cog.City" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'city.label', default: 'City')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-city" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-city" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'city.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'city.description.label', default: 'Description')}" />
					
						<th><g:message code="city.state.label" default="State" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cityInstanceList}" status="i" var="cityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cityInstance.id}">${fieldValue(bean: cityInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: cityInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: cityInstance, field: "state")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < cityInstanceTotal}">
			<div class="pagination">
				<g:paginate total="${cityInstanceTotal}" />
			</div>
			</g:if>
		</div>
	</body>
</html>
