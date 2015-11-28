<%@ page import="org.cog.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="topic.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${topicInstance?.name}"/>
</div>

