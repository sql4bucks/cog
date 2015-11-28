
<%@ page import="org.cog.Content" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-content" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'content.name.label', default: 'Name')}" />
					
						<th><g:message code="content.type.label" default="Type" /></th>
					
						<g:sortableColumn property="author" title="${message(code: 'content.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="topic" title="${message(code: 'content.topic.label', default: 'Topic')}" />
				
						<g:sortableColumn property="location" title="${message(code: 'content.filePath.label', default: 'Location')}" />
						
						<g:sortableColumn property="contentDate" title="${message(code: 'content.contentDate.label', default: 'Content Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentInstanceList}" status="i" var="contentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contentInstance.id}">${fieldValue(bean: contentInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: contentInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: contentInstance, field: "author")}</td>
					
						<td>${fieldValue(bean: contentInstance, field: "topic")}</td>
					
						<td>${fieldValue(bean: contentInstance, field: "location")}</td>

						<td><g:formatDate format="MM/dd/yyyy" date="${contentInstance.contentDate}" /></td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < contentInstanceTotal}">
				<div class="pagination">
					<g:paginate total="${contentInstanceTotal}" />
				</div>
			</g:if>	
		</div>
	</body>
</html>
