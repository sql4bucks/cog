
<%@ page import="org.cog.Scripture" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'scripture.label', default: 'Scripture')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-scripture" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-scripture" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list scripture">
			
				<g:if test="${scriptureInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="scripture.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${scriptureInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scriptureInstance?.chapterVerse}">
				<li class="fieldcontain">
					<span id="chapterVerse-label" class="property-label"><g:message code="scripture.chapterVerse.label" default="Chapter Verse" /></span>
					
						<span class="property-value" aria-labelledby="chapterVerse-label"><g:fieldValue bean="${scriptureInstance}" field="chapterVerse"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${scriptureInstance?.id}" />
					<g:link class="edit" action="edit" id="${scriptureInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
