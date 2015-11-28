<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
		<title><g:message code="default.admin.section.label" default="Admin Section" /></title>
	</head>
	<body>
		<a href="#list-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<section id="list-location" class="content scaffold-list" role="main">
			<h1><g:message code="default.admin.section.label" default="Admin Section" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<article>
			<p style="margin: 20px;">
				Use the menu to the left to maintain database domain objects. To upload media, use the "Content" item. 
			</p>
			</article>
		</section>
	</body>
</html>			
