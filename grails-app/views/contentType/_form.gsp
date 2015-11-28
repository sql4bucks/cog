<%@ page import="org.cog.ContentType" %>



<div class="fieldcontain ${hasErrors(bean: contentTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="contentType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${contentTypeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentTypeInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="contentType.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${contentTypeInstance?.type}"/>
</div>

