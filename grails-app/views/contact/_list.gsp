<div>
	<g:select id="locationList" name="locationList" from="${locationList}"
		optionKey="id" value="${defaultLocation.id}"
		optionValue="${{it?.name + ", " + it?.city?.state?.code}}"
		style="margin: 10px 0 5px 20px; width: 200px;"
		onchange="${remoteFunction(action: 'changeDetails',
                       update: [success: 'contactInfo', failure: 'ohno'],
                       params: '\'id=\' + this.value')};
                  ${remoteFunction(action: 'changeMap',
                       update: [success: 'mapContents', failure: 'ohno'],
                       params: '\'id=\' + this.value')};"
		
		/>
</div>