
<%@ page import="org.cog.Location" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-location" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list location">
			
				<g:if test="${locationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="location.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${locationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="location.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${locationInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="location.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${locationInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="location.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:link controller="city" action="show" id="${locationInstance?.city?.id}">${locationInstance?.city?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<fieldset class="adminFieldSet">
				<legend> &nbsp;&nbsp;Location Details&nbsp;&nbsp; </legend>
				<g:render template="/location/details" model="${[locationDetails: locationInstance?.details] }"></g:render>
			</fieldset>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${locationInstance?.id}" />
					<g:link class="edit" action="edit" id="${locationInstance?.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:link class="multi" controller="location" action="addChildrenFromTemplate" id= "${locationInstance?.id}">
						<g:message code="default.location.addDetail.template.label" default="Add Detail From Template" />
					</g:link>
					<g:link class="add" controller="locationDetail" action="create" params="[parentLocation: locationInstance?.id]">
						<g:message code="default.location.addDetail.label" default="Add Location Detail" />
					</g:link>	
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" 
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
