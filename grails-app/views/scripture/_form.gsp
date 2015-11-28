<%@ page import="org.cog.Scripture" %>



<div class="fieldcontain ${hasErrors(bean: scriptureInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="scripture.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="text" cols="40" rows="5" maxlength="512" required="" value="${scriptureInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scriptureInstance, field: 'chapterVerse', 'error')} required">
	<label for="chapterVerse">
		<g:message code="scripture.chapterVerse.label" default="Chapter Verse" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="chapterVerse" maxlength="75" required="" value="${scriptureInstance?.chapterVerse}"/>
</div>

