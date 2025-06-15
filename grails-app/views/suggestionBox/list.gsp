
<%@ page import="org.cog.SuggestionBox" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'suggestionBox.label', default: 'SuggestionBox')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-suggestion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-suggestion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'suggestionBox.name.label', default: 'Name')}" />
						<g:sortableColumn property="modifiedDate" title="${message(code: 'suggestionBox.modifiedDate.label', default: 'Modified Date')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${suggestionInstanceList}" status="i" var="suggestionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${suggestionInstance.id}">${fieldValue(bean: suggestionInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: suggestionInstance, field: "modifiedDate")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < suggestionInstanceTotal}">
			<div class="pagination">
				<g:paginate total="${suggestionInstanceTotal}" />
			</div>
			</g:if>
		</div>
	</body>
</html>
