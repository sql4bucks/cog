<%@ page import="org.cog.SuggestionBox" %>

<g:hiddenField name="id" value="${suggestionInstance?.id}" />
<g:hiddenField name="reviewed" value="${suggestionInstance?.reviewed}" />
<g:hiddenField name="modifiedDate" value="${suggestionInstance?.modifiedDate}" />

<div class="fieldcontain ${hasErrors(bean: suggestionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="suggestionBox.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${suggestionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: suggestionInstance, field: 'suggestion', 'error')} required">
	<label for="suggestion">
		<g:message code="suggestionBox.suggestion.label" default="Suggestion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="suggestion" maxlength="2000" rows="20" cols="100" required="" value="${suggestionInstance?.suggestion}"/>
</div>

