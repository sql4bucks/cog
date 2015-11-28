
<%@ page import="org.cog.Content" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.search.title" args="[entityName]" /></title>
		<meta name="description" content="Search for audio content including preaching and special singing for encouragement and spiritual enlightenment"/>
		<calendar:resources lang="en" theme="blue"/>
		<resource:autoComplete skin="default" />
	</head>
	<body>
		<a href="#list-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
	<div id="search-content" class="content scaffold-edit" role="main">
		<h1><g:message code="default.search.label" args="[entityName]" /></h1>
		<g:render template="/content/search" model="[cmdObj: cmdObj]"/>
	</div>	
	</body>
</html>
