<%@ page import="org.cog.Content" %>

<div class="columnarFormLeft">
	<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'name', 'error')} required">
		<label for="name">
			<g:message code="content.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="name" maxlength="30" size="30" required="" value="${contentInstance?.name}"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'author', 'error')} ">
		<label for="author">
			<g:message code="content.author.label" default="Author" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="author" name="author.id" from="${org.cog.Author.list().sort{it.lastName}}" optionKey="id" 
			required="" noSelection="${['null':'Select One...']}" value="${contentInstance?.author?.id}" class="many-to-one"/>
	</div>

	<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'location', 'error')} required">
		<label for="location">
			<g:message code="content.location.label" default="Location" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="location" name="location.id" from="${org.cog.Location.list().sort{it.name}}" optionKey="id" 
			required="" noSelection="${['null':'Select One...']}" value="${contentInstance?.location?.id}" class="many-to-one"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'active', 'error')} required">
		<label for="active">
			<g:message code="content.active.label" default="Active" />
			<span class="required-indicator">*</span>
		</label>
		<g:if test="${view=='create'}">
			<g:checkBox name="active" class="checkbox" value="Y" checked="true" />
		</g:if>
		<g:else>
			<g:checkBox name="active" checked=" value="${contentInstance?.active}" class="checkbox"
			checked="${contentInstance.active == 'Y' }" value="Y" disabled="${view=='show'}"/>
		</g:else>	
	</div>

</div>

<div class="columnarFormRight">

	<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'type', 'error')} required">
		<label for="type">
			<g:message code="content.type.label" default="Type" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="type" name="type.id" from="${org.cog.ContentType.list().sort{it.type}}" optionKey="id" 
			required="" noSelection="${['null':'Select One...']}" value="${contentInstance?.type?.id}" class="many-to-one"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'topic', 'error')} required">
		<label for="topic">
			<g:message code="content.topic.label" default="Topic" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="topic" name="topic.id" from="${org.cog.Topic.list().sort{it.name}}" optionKey="id" 
			required="" noSelection="${['null':'Select One...']}" value="${contentInstance?.topic?.id}" class="many-to-one"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'contentDate', 'error')} required">
		<label for="contentDate">
			<g:message code="content.contentDate.label" default="Content Date" />
			<span class="required-indicator">*</span>
		</label>
		<calendar:datePicker name="contentDate" dateFormat="%m/%d/%Y" value="${contentInstance?.contentDate}"  />
	</div>

</div>

<h1 class="structuralClear" ></h1>

<fieldset class="texturedFieldSet">
    <legend>File Upload</legend>
	<div class="innerField ${hasErrors(bean: contentInstance, field: 'uploadFile', 'error')}">
		<label for="uploadFile">
			<g:message code="content.fileName.label" default="File Name" />
		</label>
		<g:if test="${view=='create'}">
			<input name="uploadFile" type="file" size="50" required="" value="${contentInstance?.uploadFile ?: ''}"/>
		</g:if>
		<g:else>
			<input name="uploadFile" type="file" size="50" value="${contentInstance?.uploadFile ?: ''}"/>
		</g:else>
	</div>
</fieldset>

<g:hiddenField name="modifiedDate" value="${g.formatDate(format:'yyyy-MM-dd HH:mm:ss.S',  date:contentInstance?.modifiedDate)}" />
<g:hiddenField name="modifiedUser.id" value="${contentInstance?.modifiedUser?.id}"/>
<g:hiddenField name="fileName" value="${contentInstance?.fileName}"/>
<g:hiddenField name="filePath" value="${contentInstance?.filePath}" />
