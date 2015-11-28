
<%@ page import="org.cog.Content" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.results.label', default: 'Results')}" />
		<title><g:message code="default.search.title" args="[entityName, 'Results']" /></title>
		<meta name="description" content="Search results of media content"/>
		<calendar:resources lang="en" theme="blue"/>
		<r:require modules="collapse"/>
		<resource:autoComplete skin="default" />
		
		<r:script>
			$(".resultsCollapse").collapse({show: function(){
			        this.animate({
			            opacity: 'toggle', 
			            height: 'toggle'
			        }, 500);
			    },
			    hide : function() {
			    	this.fadeOut();
			    }
			});
		</r:script>
				
	</head>
	<body>
		<a href="#list-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="searchResults" class="resultsCollapse">
			<h3 class="inactive">Search Criteria</h3>
			<div>
			<g:render template="/content/search" model="[cmdObj:cmdObj]"/>
			</div>
		</div>	 
		<div id="list-content" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${contentInstanceList?.size() > 0}">
			<table>
				<thead>
					<tr>
						<g:sortableColumn action="getPage" property="name" title="${message(code: 'content.name.label', default: 'Name')}" />
						<th><g:message code="content.type.label" default="Type" /></th>
						<g:sortableColumn action="getPage" property="author" title="${message(code: 'content.author.label', default: 'Author')}" />
						<g:sortableColumn action="getPage" property="topic" title="${message(code: 'content.topic.label', default: 'Topic')}" />
						<g:sortableColumn action="getPage" property="location" title="${message(code: 'content.filePath.label', default: 'Location')}" />
						<g:sortableColumn action="getPage" property="contentDate" title="${message(code: 'content.contentDate.label', default: 'Content Date')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentInstanceList}" status="i" var="contentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="view" id="${contentInstance.id}" params="[max: params.max, offset: params.offset]">
							${fieldValue(bean: contentInstance, field: "name")}
							</g:link>
						</td>
					
						<td>${fieldValue(bean: contentInstance, field: "type")}</td>
						<td>${fieldValue(bean: contentInstance, field: "author")}</td>
						<td>${fieldValue(bean: contentInstance, field: "topic")}</td>
						<td>${fieldValue(bean: contentInstance, field: "location")}</td>

						<td><g:formatDate format="MM/dd/yyyy" date="${contentInstance.contentDate}" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${params?.max < contentInstanceTotal}">
				<div class="pagination" >
					<g:paginate total="${contentInstanceTotal}" action="getPage"/>
				</div>
			</g:if>
			</g:if>
			<g:else>
				<span class="marginLeft marginTop">No results found. Change your search criteria and try again.</span>
			</g:else>
		</div>
	</body>
</html>
