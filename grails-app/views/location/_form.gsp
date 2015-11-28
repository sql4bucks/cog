<%@ page import="org.cog.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="location.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${locationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="location.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${locationInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="location.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${locationInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="location.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="city" name="city.id" from="${org.cog.City.list()}" optionKey="id" required="" value="${locationInstance?.city?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'active', 'error')}">
	<label for="active">
		<g:message code="location.active.label" default="Active" />
	</label>
	<g:if test="${view=='create'}">
		<g:checkBox name="active" class="checkbox" value="Y" checked="true" />
	</g:if>
	<g:else>
		<g:checkBox name="active" checked=" value="${locationInstance?.active}" class="checkbox"
		checked="${locationInstance.active == 'Y' }" value="Y" disabled="${view=='show'}"/>
	</g:else>	
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'googleUrl', 'error')}">
	<label for="city">
		<g:message code="location.googleUrl.label" default="GoogleUrl" />
	</label>
	<g:textArea name="googleUrl" value="${locationInstance?.googleUrl}" escapeHtml="false"/>
</div>


