<%@ page import="org.cog.ContentTag" %>



<div class="fieldcontain ${hasErrors(bean: contentTagInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="contentTag.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="content" name="content.id" from="${org.cog.Content.list()}" optionKey="id" required="" value="${contentTagInstance?.content?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentTagInstance, field: 'modifiedUser', 'error')} required">
	<label for="modifiedUser">
		<g:message code="contentTag.modifiedUser.label" default="Modified User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modifiedUser" name="modifiedUser.id" from="${org.cog.AdminUser.list()}" optionKey="id" required="" value="${contentTagInstance?.modifiedUser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentTagInstance, field: 'tag', 'error')} required">
	<label for="tag">
		<g:message code="contentTag.tag.label" default="Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tag" name="tag.id" from="${org.cog.Tag.list()}" optionKey="id" required="" value="${contentTagInstance?.tag?.id}" class="many-to-one"/>
</div>

