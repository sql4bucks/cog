<%@ page import="org.cog.LocationDetail" %>

<div class="fieldcontain ${hasErrors(bean: locationDetailInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="locationDetail.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${['text', 'header', 'url', 'email'].sort()}" value="${locationDetailInstance?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationDetailInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="locationDetail.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" maxlength="30" required="" value="${locationDetailInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationDetailInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="locationDetail.value.label" default="Value" />
		
	</label>
	<g:textField name="value" maxlength="50" value="${locationDetailInstance?.value}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationDetailInstance, field: 'sortOrder', 'error')} required">
	<label for="sortOrder">
		<g:message code="locationDetail.sortOrder.label" default="Sort Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="sortOrder" required="" value="${fieldValue(bean: locationDetailInstance, field: 'sortOrder')}"/>
</div>

<g:hiddenField name="location.id" value="${locationDetailInstance.location.id }"/>

