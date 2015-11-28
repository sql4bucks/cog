<%@ page import="org.cog.Link" %>



<div class="fieldcontain ${hasErrors(bean: linkInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="link.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${linkInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: linkInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="link.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" maxlength="100" required="" value="${linkInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: linkInstance, field: 'sortOrder', 'error')} ">
	<label for="sortOrder">
		<g:message code="link.sortOrder.label" default="Sort Order" />
		
	</label>
	<g:field type="number" name="sortOrder" max="1000" value="${fieldValue(bean: linkInstance, field: 'sortOrder')}"/>
</div>

