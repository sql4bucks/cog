
<%@ page import="org.cog.Content" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-content" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<div class="columnarFormLeft">
				<ol class="property-list content">
			
					<g:if test="${contentInstance?.name}">
					<li class="fieldcontain">
						<span id="name-label" class="property-label"><g:message code="content.name.label" default="Name" /></span>
						
							<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${contentInstance}" field="name"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${contentInstance?.author}">
					<li class="fieldcontain">
						<span id="author-label" class="property-label"><g:message code="content.author.label" default="Author" /></span>
						
						<span class="property-value" aria-labelledby="author-label">
							<g:link controller="author" action="show" id="${contentInstance?.author?.id}">${contentInstance?.author?.encodeAsHTML()}</g:link>
						</span>
					</li>
					</g:if>
	
					<g:if test="${contentInstance?.location}">
					<li class="fieldcontain">
						<span id="location-label" class="property-label"><g:message code="content.location.label" default="Location" /></span>
							<span class="property-value" aria-labelledby="location-label"><g:link controller="location" action="show" id="${contentInstance?.location?.id}">${contentInstance?.location?.encodeAsHTML()}</g:link></span>
					</li>
					</g:if>
	
				
					<g:if test="${contentInstance?.fileName}">
					<li class="fieldcontain">
						<span id="fileName-label" class="property-label"><g:message code="content.fileName.label" default="File Name" /></span>
						
							<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${contentInstance}" field="fileName"/></span>
						
					</li>
					</g:if>
					
					<g:if test="${contentInstance?.modifiedUser}">
					<li class="fieldcontain">
						<span id="modifiedUser-label" class="property-label"><g:message code="content.modifiedUser.label" default="Modified User" /></span>
							<span class="property-value" aria-labelledby="modifiedUser-label"><g:link controller="adminUser" action="show" id="${contentInstance?.modifiedUser?.id}">${contentInstance?.modifiedUser?.encodeAsHTML()}</g:link></span>
					</li>
					</g:if>
				</ol>
			</div>					
			<div class="columnarFormRight">
				<ol class="property-list content">
			
					<g:if test="${contentInstance?.type}">
					<li class="fieldcontain">
						<span id="type-label" class="property-label"><g:message code="content.type.label" default="Type" /></span>
							<span class="property-value" aria-labelledby="type-label"><g:link controller="contentType" action="show" id="${contentInstance?.type?.id}">${contentInstance?.type?.encodeAsHTML()}</g:link></span>
					</li>
					</g:if>
			
					<g:if test="${contentInstance?.topic}">
					<li class="fieldcontain">
						<span id="topic-label" class="property-label"><g:message code="content.topic.label" default="Topic" /></span>
							<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${contentInstance?.topic?.id}">${contentInstance?.topic?.encodeAsHTML()}</g:link></span>
					</li>
					</g:if>
		
					<g:if test="${contentInstance?.contentDate}">
					<li class="fieldcontain">
						<span id="contentDate-label" class="property-label"><g:message code="content.contentDate.label" default="Content Date" /></span>
							<span class="property-value" aria-labelledby="contentDate-label"><g:formatDate format="MM/dd/yyyy" date="${contentInstance?.contentDate}" /></span>
					</li>
					</g:if>
		
			
					<g:if test="${contentInstance?.filePath}">
					<li class="fieldcontain">
						<span id="filePath-label" class="property-label"><g:message code="content.filePath.label" default="File Path" /></span>
							<span class="property-value" aria-labelledby="filePath-label"><g:fieldValue bean="${contentInstance}" field="filePath"/></span>
					</li>
					</g:if>
				
			
					<g:if test="${contentInstance?.modifiedDate}">
					<li class="fieldcontain">
						<span id="modifiedDate-label" class="property-label"><g:message code="content.modifiedDate.label" default="Modified Date" /></span>
							<span class="property-value" aria-labelledby="modifiedDate-label"><g:formatDate format="MM/dd/yyyy" date="${contentInstance?.modifiedDate}" /></span>
					</li>
					</g:if>
				</ol>
			</div>	
			<h1 class="structuralClear"></h1>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contentInstance?.id}" />
					<g:link class="edit" action="edit" tabindex="10" id="${contentInstance?.id}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
					<g:actionSubmit class="delete" tabindex="20" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
