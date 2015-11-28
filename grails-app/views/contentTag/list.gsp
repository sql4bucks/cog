
<%@ page import="org.cog.ContentTag" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentTag.label', default: 'ContentTag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contentTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contentTag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="contentTag.content.label" default="Content" /></th>
					
						<th><g:message code="contentTag.modifiedUser.label" default="Modified User" /></th>
					
						<th><g:message code="contentTag.tag.label" default="Tag" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentTagInstanceList}" status="i" var="contentTagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contentTagInstance.id}">${fieldValue(bean: contentTagInstance, field: "content")}</g:link></td>
					
						<td>${fieldValue(bean: contentTagInstance, field: "modifiedUser")}</td>
					
						<td>${fieldValue(bean: contentTagInstance, field: "tag")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contentTagInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
