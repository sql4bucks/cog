
<%@ page import="org.cog.LocationDetail" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'locationDetail.label', default: 'LocationDetail')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-locationDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-locationDetail" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="locationDetail.location.label" default="Location" /></th>

						<g:sortableColumn property="type" title="${message(code: 'locationDetail.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="label" title="${message(code: 'locationDetail.label.label', default: 'Label')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'locationDetail.value.label', default: 'Value')}" />
					
						<g:sortableColumn property="sortOrder" title="${message(code: 'locationDetail.sortOrder.label', default: 'Sort Order')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${locationDetailInstanceList}" status="i" var="locationDetailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: locationDetailInstance, field: "location")}</td>

						<td><g:link action="show" id="${locationDetailInstance.id}">${fieldValue(bean: locationDetailInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: locationDetailInstance, field: "label")}</td>
					
						<td>${fieldValue(bean: locationDetailInstance, field: "value")}</td>
					
						<td>${fieldValue(bean: locationDetailInstance, field: "sortOrder")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params.max < locationDetailInstanceTotal}">
				<div class="pagination">
					<g:paginate total="${locationDetailInstanceTotal}" />
				</div>
			</g:if>
		</div>
	</body>
</html>
