<table>
	<thead>
		<tr>
			<g:sortableColumn property="label" title="${message(code: 'locationDetail.label.label', default: 'Label')}" />

			<g:sortableColumn property="type" title="${message(code: 'locationDetail.type.label', default: 'Type')}" />
		
			<g:sortableColumn property="value" title="${message(code: 'locationDetail.value.label', default: 'Value')}" />
		
			<g:sortableColumn property="sortOrder" title="${message(code: 'locationDetail.sortOrder.label', default: 'Sort Order')}" />
		
		</tr>
	</thead>
	<tbody>
	<g:each in="${locationDetails}" status="i" var="locationDetailInstance">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		
			<td>
				<g:link controller="locationDetail" action="show" id="${locationDetailInstance.id}">
					${fieldValue(bean: locationDetailInstance, field: "label")}
				</g:link>
			</td>
		
			<td>${fieldValue(bean: locationDetailInstance, field: "type")}</td>
		
			<td>${fieldValue(bean: locationDetailInstance, field: "value")}</td>
		
			<td>${fieldValue(bean: locationDetailInstance, field: "sortOrder")}</td>
		
		</tr>
	</g:each>
	</tbody>
</table>
<g:if test="${params.max < locationDetailInstanceTotal}">
	<div class="pagination">
		<g:paginate total="${locationDetailInstanceTotal}" />
	</div>
</g:if>
