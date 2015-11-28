
<%@ page import="org.cog.ContentTag" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentTag.label', default: 'ContentTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contentTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contentTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contentTag">
			
				<g:if test="${contentTagInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="contentTag.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:link controller="content" action="show" id="${contentTagInstance?.content?.id}">${contentTagInstance?.content?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentTagInstance?.modifiedUser}">
				<li class="fieldcontain">
					<span id="modifiedUser-label" class="property-label"><g:message code="contentTag.modifiedUser.label" default="Modified User" /></span>
					
						<span class="property-value" aria-labelledby="modifiedUser-label"><g:link controller="adminUser" action="show" id="${contentTagInstance?.modifiedUser?.id}">${contentTagInstance?.modifiedUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentTagInstance?.tag}">
				<li class="fieldcontain">
					<span id="tag-label" class="property-label"><g:message code="contentTag.tag.label" default="Tag" /></span>
					
						<span class="property-value" aria-labelledby="tag-label"><g:link controller="tag" action="show" id="${contentTagInstance?.tag?.id}">${contentTagInstance?.tag?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contentTagInstance?.id}" />
					<g:link class="edit" action="edit" id="${contentTagInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
