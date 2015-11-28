<h2>Congregation List</h2>
<div>
	<g:select id="locationList" name="locationList" size="5" from="${locationList}" 
		optionKey="id" value="1" style="margin: 10px 0 20px 20px; width: 200px;"
		onchange="${remoteFunction(action: 'changeDetails',
                       update: [success: 'contactInfo', failure: 'ohno'],
                       params: '\'id=\' + this.value')};
                  ${remoteFunction(action: 'changeMap',
                       update: [success: 'mapContents', failure: 'ohno'],
                       params: '\'id=\' + this.value')};"
		
		/>
</div>