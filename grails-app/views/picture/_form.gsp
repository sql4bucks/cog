<%@ page import="org.cog.Picture" %>

<div class="fieldcontain ${hasErrors(bean: pictureInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="picture.description.label" default="Description" />
		<span class="required-indicator">*</span>	
	</label>
	<g:textField name="description" maxlength="75" size="60" value="${pictureInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pictureInstance, field: 'caption', 'error')} ">
	<label for="caption">
		<g:message code="picture.caption.label" default="Caption" />
	</label>
	<g:textField name="caption" maxlength="30" size="60" value="${pictureInstance?.caption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pictureInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="picture.active.label" default="Active" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${view=='create'}">
		<g:checkBox name="active" class="checkbox" value="Y" checked="true" />
	</g:if>
	<g:else>
		<g:checkBox name="active" class="checkbox" value="Y" checked="${pictureInstance.active == 'Y'}" />
	</g:else>
		
		
</div>

<div class="fieldcontain ${hasErrors(bean: pictureInstance, field: 'uploadFile', 'error')} ">
	<label for="uploadFile">
		<g:message code="content.fileName.label" default="File Name" />
		<g:if test="${view=='create'}">
			<span class="required-indicator">*</span>
		</g:if>	
	</label>
	<g:if test="${view=='create'}">
		<input name="uploadFile" type="file" size="50" required="" value="${pictureInstance?.uploadFile ?: ''}"/>
	</g:if>
	<g:else>
		<input name="uploadFile" type="file" size="50" value="${pictureInstance?.uploadFile ?: ''}"/>
	</g:else>
</div>

<g:hiddenField name="modifiedDate" value="${g.formatDate(format:'yyyy-MM-dd HH:mm:ss.S',  date:pictureInstance?.modifiedDate)}" />
<g:hiddenField name="modifiedUser.id" value="${pictureInstance?.modifiedUser?.id}"/>
<g:hiddenField name="fileName" value="${pictureInstance?.fileName}"/>
<g:hiddenField name="filePath" value="${pictureInstance?.filePath}" />

