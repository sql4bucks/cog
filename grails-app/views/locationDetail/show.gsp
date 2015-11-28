
<%@ page import="org.cog.LocationDetail" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'locationDetail.label', default: 'LocationDetail')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-locationDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="location" class="back" action="show" id="${locationDetailInstance.location.id}">Back</g:link></li>
				<li><g:link controller="location" class="list" action="list"><g:message code="default.list.label" args="['Location']" /></g:link></li>
			</ul>
		</div>
		<div id="show-locationDetail" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list locationDetail">
			
				<g:if test="${locationDetailInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="locationDetail.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${locationDetailInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationDetailInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="locationDetail.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${locationDetailInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationDetailInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="locationDetail.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${locationDetailInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationDetailInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="locationDetail.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:link controller="location" action="show" id="${locationDetailInstance?.location?.id}">${locationDetailInstance?.location?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationDetailInstance?.sortOrder}">
				<li class="fieldcontain">
					<span id="sortOrder-label" class="property-label"><g:message code="locationDetail.sortOrder.label" default="Sort Order" /></span>
					
						<span class="property-value" aria-labelledby="sortOrder-label"><g:fieldValue bean="${locationDetailInstance}" field="sortOrder"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${locationDetailInstance?.id}" />
					<g:link class="edit" action="edit" id="${locationDetailInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
