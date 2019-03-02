
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
				This page contains a variety of links, including preaching, singing, bible studies and assorted content
				from all across the country. Choose a link below to open the site in a separate tab or window. </br></br> 
			</p>
			<table>
				<thead>
					<tr>
						<th><g:message code="default.links.label" default="Links" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${linkInstanceList}" status="i" var="linkInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link url="${linkInstance.url}" target="_blank">${fieldValue(bean: linkInstance, field: "name")}</g:link></td>
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
