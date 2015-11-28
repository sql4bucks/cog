
<%@ page import="org.cog.UserSubscription" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'userSubscription.label', default: 'UserSubscription')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userSubscription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userSubscription" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="userSubscription.subscription.label" default="Subscription" /></th>
					
						<th><g:message code="userSubscription.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userSubscriptionInstanceList}" status="i" var="userSubscriptionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userSubscriptionInstance.id}">${fieldValue(bean: userSubscriptionInstance, field: "subscription")}</g:link></td>
					
						<td>${fieldValue(bean: userSubscriptionInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < userSubscriptionInstanceTotal}">
				<div class="pagination">
					<g:paginate total="${userSubscriptionInstanceTotal}" />
				</div>
			</g:if>	
		</div>
	</body>
</html>
