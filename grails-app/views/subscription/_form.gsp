<%@ page import="org.cog.Subscription" %>



<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="subscription.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${subscriptionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="subscription.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${subscriptionInstance?.description}"/>
</div>

