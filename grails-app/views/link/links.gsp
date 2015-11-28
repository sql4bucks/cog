
<%@ page import="org.cog.Link" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'link.label', default: 'Links')}" />
		<title><g:message code="default.list.title" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-link" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-link" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<p style="margin: 20px;">
				You may be interested in the content provided at the links below. These include preaching, singing, bible studies and assorted content
				from all across the country. Choose a link below to open the site in a separate tab or window. </br></br> 
				<span style="color: red"> <em>Note:</em></span> The link will open in a separate tab or window. Based on your browser settings, 
				the new window or tab may not open in the foreground and will require you to choose it manually.
			</p>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'link.name.label', default: 'Name')}" />
						<g:sortableColumn property="url" title="${message(code: 'link.url.label', default: 'Url')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${linkInstanceList}" status="i" var="linkInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: linkInstance, field: "name")}</td>
						<td><g:link url="${linkInstance.url}" target="_blank">${fieldValue(bean: linkInstance, field: "url")}</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${linkInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
