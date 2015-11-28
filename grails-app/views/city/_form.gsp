<%@ page import="org.cog.City" %>



<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="city.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${cityInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="city.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${cityInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="city.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="state" name="state.id" from="${org.cog.State.list()}" optionKey="id" required="" value="${cityInstance?.state?.id}" class="many-to-one"/>
</div>

