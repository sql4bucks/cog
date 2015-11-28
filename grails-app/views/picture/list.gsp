
<%@ page import="org.cog.Picture" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'picture.label', default: 'Picture')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-picture" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-picture" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'picture.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="caption" title="${message(code: 'picture.caption.label', default: 'Caption')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'picture.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="fileName" title="${message(code: 'picture.fileName.label', default: 'File Name')}" />
					
						<g:sortableColumn property="modifiedDate" title="${message(code: 'picture.modifiedDate.label', default: 'Uploaded Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pictureInstance.id}">${fieldValue(bean: pictureInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: pictureInstance, field: "caption")}</td>
					
						<td><g:checkBox name="active" class="checkbox" value="Y" checked="${pictureInstance.active == 'Y'}" disabled="true" /></td>
					
						<td>${fieldValue(bean: pictureInstance, field: "fileName")}</td>
					
						<td><g:formatDate format="MM-dd-yyyy" date="${pictureInstance.modifiedDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < pictureInstanceTotal}">
			<div class="pagination">
				<g:paginate total="${pictureInstanceTotal}" />
			</div>
			</g:if>
		</div>
	</body>
</html>
