
<%@ page import="org.cog.SuggestionBox" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'suggestionBox.label', default: 'SuggestionBox')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-suggestion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-suggestion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list suggestion">
			
				<g:if test="${suggestionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="suggestionBox.name.label" default="Name" /></span>
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${suggestionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${suggestionInstance?.suggestion}">
				<li class="fieldcontain">
					<span id="suggestion-label" class="property-label"><g:message code="suggestionBox.suggestion.label" default="Suggestion" /></span>
						<span class="property-value" aria-labelledby="suggestion-label">
							<g:textArea name="suggestion" maxlength="2000" rows="20" cols="100" required="" value="${suggestionInstance?.suggestion}" disabled="true"/>
						</span>
				</li>
				</g:if>
			
				<g:if test="${suggestionInstance?.modifiedDate}">
				<li class="fieldcontain">
					<span id="modified-date-label" class="property-label"><g:message code="suggestionBox.modifiedDate.label" default="Created Date" /></span>
						<span class="property-value" aria-labelledby="modified-date-label"><g:fieldValue bean="${suggestionInstance}" field="modifiedDate"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${suggestionInstance?.id}" />
					<g:link class="edit" action="edit" id="${suggestionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
