
<%@ page import="org.cog.Picture" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'picture.label', default: 'Picture')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-picture" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-picture" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list picture">
			
				<g:if test="${pictureInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="picture.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${pictureInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictureInstance?.caption}">
				<li class="fieldcontain">
					<span id="caption-label" class="property-label"><g:message code="picture.caption.label" default="Caption" /></span>
					
						<span class="property-value" aria-labelledby="caption-label"><g:fieldValue bean="${pictureInstance}" field="caption"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictureInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="picture.active.label" default="Active" /></span>
						<span class="property-value" aria-labelledby="active-label">
							<g:checkBox name="active" class="checkbox" checked="${pictureInstance.active == 'Y' }"  disabled="true"/>
						</span>
				</li>
				</g:if>
			
				<g:if test="${pictureInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="picture.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${pictureInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictureInstance?.filePath}">
				<li class="fieldcontain">
					<span id="filePath-label" class="property-label"><g:message code="picture.filePath.label" default="File Path" /></span>
					
						<span class="property-value" aria-labelledby="filePath-label"><g:fieldValue bean="${pictureInstance}" field="filePath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictureInstance?.modifiedDate}">
				<li class="fieldcontain">
					<span id="modifiedDate-label" class="property-label">
						<g:message code="picture.modifiedDate.label" default="Modified Date" />
					</span>
					<span class="property-value" aria-labelledby="modifiedDate-label">
						<g:formatDate format="MM/dd/yyyy" date="${pictureInstance?.modifiedDate}" />
					</span>
				</li>
				</g:if>
			
				<g:if test="${pictureInstance?.modifiedUser}">
				<li class="fieldcontain">
					<span id="modifiedUser-label" class="property-label"><g:message code="picture.modifiedUser.label" default="Modified User" /></span>
					
						<span class="property-value" aria-labelledby="modifiedUser-label"><g:link controller="adminUser" action="show" id="${pictureInstance?.modifiedUser?.id}">${pictureInstance?.modifiedUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pictureInstance?.id}" />
					<g:link class="edit" action="edit" tabindex="10" id="${pictureInstance?.id}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
