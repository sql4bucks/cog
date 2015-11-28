<%@ page import="org.cog.AdminUser" %>



<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'loginId', 'error')} required">
	<label for="loginId">
		<g:message code="adminUser.loginId.label" default="Login Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="loginId" maxlength="30" required="" value="${adminUserInstance?.loginId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="adminUser.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="30" required="" value="${adminUserInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="adminUser.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="30" required="" value="${adminUserInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="adminUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="30" required="" value="${adminUserInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="adminUser.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" maxlength="75" required="" value="${adminUserInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="adminUser.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${org.cog.SecurityRole.list()}" optionKey="id" required="" value="${adminUserInstance?.role?.id}" class="many-to-one"/>
</div>

