<%@ page import="org.cog.SecurityRole" %>



<div class="fieldcontain ${hasErrors(bean: securityRoleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="securityRole.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${securityRoleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: securityRoleInstance, field: 'accessLevel', 'error')} required">
	<label for="accessLevel">
		<g:message code="securityRole.accessLevel.label" default="Access Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="accessLevel" required="" value="${fieldValue(bean: securityRoleInstance, field: 'accessLevel')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: securityRoleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="securityRole.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${securityRoleInstance?.description}"/>
</div>

