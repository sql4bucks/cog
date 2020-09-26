<%@ page import="org.springframework.validation.FieldError; org.cog.Content" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}"/>
    <title><g:message code="default.view.title" args="[entityName]"/></title>
    <meta name="description" content="Listen to or download selected media content from Church of God services"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jplayer-pink.css')}" type="text/css">
    <r:require modules="jPlayer"/>
    <r:script>
			$(document).ready(function() {

	    		$("#jquery_jplayer_1").jPlayer({
	        		ready: function(event) {
	            		$(this).jPlayer("setMedia", {
	                		mp3: "${mediaUrl}/${contentInstance.fileName}"
	            			});
	        			},
		        	swfPath: "/cog/js",
		        	preload: "metadata",
		        	solution: "html, flash", 
		        	supplied: "mp3",
		        	emulateHtml: "true",
		        	cssSelectorAncestor: "#jp_container_1",
					wmode: "window"
	    		});
    		
			});
    </r:script>

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

    <div class="columnarFormLeft">
        <ol class="property-list content">

            <g:if test="${contentInstance?.name}">
                <li class="fieldcontain">
                    <span id="name-label" class="property-label"><g:message code="content.name.label"
                                                                            default="Name"/></span>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${contentInstance}"
                                                                                            field="name"/></span>
                </li>
            </g:if>

            <g:if test="${contentInstance?.author}">
                <li class="fieldcontain">
                    <span id="author-label" class="property-label"><g:message code="content.author.label"
                                                                              default="Author"/></span>
                    <span class="property-value" aria-labelledby="author-label">
                        ${contentInstance?.author?.encodeAsHTML()}
                    </span>
                </li>
            </g:if>

            <g:if test="${contentInstance?.location}">
                <li class="fieldcontain">
                    <span id="location-label" class="property-label"><g:message code="content.location.label"
                                                                                default="Location"/></span>
                    <span class="property-value" aria-labelledby="location-label">
                        ${contentInstance?.location?.encodeAsHTML()}
                    </span>
                </li>
            </g:if>
        </ol>
    </div>

    <div class="columnarFormRight">
        <ol class="property-list content">

            <g:if test="${contentInstance?.type}">
                <li class="fieldcontain">
                    <span id="type-label" class="property-label"><g:message code="content.type.label"
                                                                            default="Type"/></span>
                    <span class="property-value" aria-labelledby="type-label">
                        ${contentInstance?.type?.encodeAsHTML()}
                    </span>
                </li>
            </g:if>

            <g:if test="${contentInstance?.topic}">
                <li class="fieldcontain">
                    <span id="topic-label" class="property-label"><g:message code="content.topic.label"
                                                                             default="Topic"/></span>
                    <span class="property-value" aria-labelledby="topic-label">
                        ${contentInstance?.topic?.encodeAsHTML()}
                    </span>
                </li>
            </g:if>

            <g:if test="${contentInstance?.contentDate}">
                <li class="fieldcontain">
                    <span id="contentDate-label" class="property-label"><g:message code="content.contentDate.label"
                                                                                   default="Content Date"/></span>
                    <span class="property-value" aria-labelledby="contentDate-label">
                        <g:formatDate format="MM/dd/yyyy" date="${contentInstance?.contentDate}"/>
                    </span>
                </li>
            </g:if>
        </ol>
    </div>

    <h1 class="structuralClear"></h1>
</div>
<%-- The download and media player section --%>
<div class="marginLeft">
    <g:link class="large button2 purple download noSpin" action="file" id="${contentInstance.id}">
        Download
    </g:link>

</div>

<div class="contentContainer marginLeft">
    <div id="mediaPlayer" class="mediaContent">
        <div class="centered bigger fullWidth padBelow">Live Streaming Player</div>

        <div id="jquery_jplayer_1" class="jp-jplayer"></div>

        <div id="jp_container_1" class="jp-audio">
            <div class="jp-type-single">
                <div class="jp-gui jp-interface">
                    <ul class="jp-controls">

                        <!-- comment out any of the following <li>s to remove these buttons -->
                        <li><a href="javascript:" class="jp-play" tabindex="1">play</a></li>
                        <li><a href="javascript:" class="jp-pause" tabindex="1">pause</a></li>
                        <li><a href="javascript:" class="jp-stop" tabindex="1">stop</a></li>
                        <li><a href="javascript:" class="jp-mute" tabindex="1" title="mute">mute</a></li>
                        <li><a href="javascript:" class="jp-unmute" tabindex="1" title="unmute">unmute</a></li>
                        <li><a href="javascript:" class="jp-volume-max" tabindex="1" title="max volume">max volume</a>
                        </li>
                    </ul>

                    <!-- you can comment out any of the following <div>s too -->

                    <div class="jp-progress">
                        <div class="jp-seek-bar">
                            <div class="jp-play-bar"></div>
                        </div>
                    </div>

                    <div class="jp-volume-bar">
                        <div class="jp-volume-bar-value"></div>
                    </div>

                    <div class="jp-current-time"></div>

                    <div class="jp-duration"></div>
                </div>

                <div class="jp-title">
                    <ul>
                        <li>${contentInstance?.name}</li>
                    </ul>
                </div>

                <div class="jp-no-solution">
                    <span>Update Required</span>
                    To play the media you will need to either update your browser to a recent version or update your <a
                        href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
