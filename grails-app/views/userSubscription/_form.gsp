<%@ page import="org.cog.UserSubscription" %>



<div class="fieldcontain ${hasErrors(bean: userSubscriptionInstance, field: 'subscription', 'error')} required">
	<label for="subscription">
		<g:message code="userSubscription.subscription.label" default="Subscription" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscription" name="subscription.id" from="${org.cog.Subscription.list()}" optionKey="id" required="" value="${userSubscriptionInstance?.subscription?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userSubscriptionInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userSubscription.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${org.cog.AdminUser.list()}" optionKey="id" required="" value="${userSubscriptionInstance?.user?.id}" class="many-to-one"/>
</div>

