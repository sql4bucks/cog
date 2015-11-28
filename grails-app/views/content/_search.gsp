<g:form method="post" >	
<div class="container">

	<div class="columnarFormLeft">
		<div class="searchFields">
			<label for="name">
				<g:message code="content.name.label" default="Name" />
			</label>
			<richui:autoComplete name="name" maxlength="50" size="50" shadow="true" typeAhead="false" maxResultsDisplayed="15" 
				minQueryLength="1" queryDelay="0" action="${createLinkTo('dir': 'content/autoComplete/')}"
				value="${cmdObj?.name}" tabindex="10"/>
		</div>
	
		<div class="searchFields">
			<label for="author">
				<g:message code="content.author.label" default="Author" />
			</label>
			<g:select id="author" name="author.id" from="${org.cog.Author.list().sort{it.lastName}}" optionKey="id" 
			  noSelection="['0' : 'All']" value="${cmdObj?.author?.id}" class="many-to-one" tabindex="20"/>
		</div>
	
		<div class="searchFields">
			<label for="location">
				<g:message code="content.location.label" default="Location"/>
			</label>
			<g:select id="location" name="location.id" from="${org.cog.Location.list().sort{it.name}}" optionKey="id" 
				noSelection="['0' : 'All']" value="${cmdObj?.location?.id}" class="many-to-one" tabindex="30"/>
		</div>
		<div class="searchFields">
			<label for="type">
				<g:message code="content.type.label" default="Type" />
			</label>
			<g:select id="type" name="type.id" from="${org.cog.ContentType.list().sort{it.type}}" optionKey="id" 
				noSelection="['0' : 'All']" value="${cmdObj?.type?.id}" class="many-to-one" tabindex="40"/>
		</div>		
	</div>
	
	<div class="columnarFormRight">
		<div class="searchFields">
			<label for="topic">
				<g:message code="content.topic.label" default="Topic"/>
			</label>
			<g:select id="topic" name="topic.id" from="${org.cog.Topic.list().sort{it.name}}" optionKey="id" 
				noSelection="['0' : 'All']" value="${cmdObj?.topic?.id}" class="many-to-one" tabindex="50"/>
		</div>
		
		<fieldset class="dateRangeFieldSet">
			<legend> Date Range </legend> 
			<div class="innerDate">
				<label for="afterDate">
					<g:message code="content.afterDate.label" default="After"  />
				</label>
				<calendar:datePicker name="afterDate" dateFormat="%m/%d/%Y" value="${cmdObj?.afterDate}" tabindex="60" />
			</div>
			<div class="innerDate">
				<label for="beforeDate">
					<g:message code="content.before.Date.label" default="Before" />
				</label>
				<calendar:datePicker name="beforeDate" dateFormat="%m/%d/%Y" value="${cmdObj?.beforeDate}" tabindex="70" />
			</div>
		</fieldset>
	</div>
	
	
	<h1 class="structuralClear" ></h1>
</div>

<fieldset class="buttons">
	<g:actionSubmit class="search" tabindex="80" action="doSearch" value="${message(code: 'default.button.search.label', default: 'Search')}" />
	<g:actionSubmit class="reset" tabindex="90" action="search" value="${message(code: 'default.button.reset.label', default: 'Reset')}" />
</fieldset>
</g:form>
