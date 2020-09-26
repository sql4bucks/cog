<%@ page import="org.springframework.validation.FieldError; org.cog.Content" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}"/>
    <title><g:message code="default.view.title" args="[entityName]"/></title>
    <meta name="description" content="Listen to or download selected media content from Church of God services"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jplayer-pink.css')}" type="text/css">

</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="back" action="getPage" params="[offset: params.offset, max: params.max, sort:params.sort, order:params.order]">
            <g:message code='default.goBack' default='Back'/>
        </g:link>
        </li>
    </ul>
</div>

<div id="show-content" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${contentInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${contentInstance}" var="error">
                <li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="pdfViewer">
        <object data="${mediaUrl}/${contentInstance.fileName}" type="application/pdf" height="100%" width="100%">
            alt : <a href="${mediaUrl}/${contentInstance.fileName}">${contentInstance.fileName}</a>
        </object>
    </div>

</div>


</body>
</html>
