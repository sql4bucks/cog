
<%@ page import="org.cog.Scripture" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'scripture.label', default: 'Scripture')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-scripture" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-scripture" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="text" title="${message(code: 'scripture.text.label', default: 'Text')}" />
					
						<g:sortableColumn property="chapterVerse" title="${message(code: 'scripture.chapterVerse.label', default: 'Chapter Verse')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${scriptureInstanceList}" status="i" var="scriptureInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${scriptureInstance.id}">${fieldValue(bean: scriptureInstance, field: "text")}</g:link></td>
					
						<td>${fieldValue(bean: scriptureInstance, field: "chapterVerse")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < scriptureInstanceTotal}">
				<div class="pagination">
					<g:paginate total="${scriptureInstanceTotal}" />
				</div>
			</g:if>	
		</div>
	</body>
</html>
