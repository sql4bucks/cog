
<%@ page import="org.cog.ContentType" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'contentType.label', default: 'ContentType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contentType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contentType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'contentType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'contentType.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentTypeInstanceList}" status="i" var="contentTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contentTypeInstance.id}">${fieldValue(bean: contentTypeInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: contentTypeInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < contentTypeInstanceTotal}">
				<div class="pagination">
					<g:paginate total="${contentTypeInstanceTotal}" />
				</div>
			</g:if>
		</div>
	</body>
</html>
