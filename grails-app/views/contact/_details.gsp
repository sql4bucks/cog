<h2>Contact Details</h2>
<table style="table-layout: fixed; width: 100%">
<tbody>		
<g:each in="${locationDetails}" var="detail" status="i">
	<tr>
	<g:if test="${detail.type=='header'}">
		<td class="contactLabel contactHeader">
			${detail.label }
		</td>
		<td></td>
	</g:if>
	<g:if test="${detail.type=='text'}">
		<td class="contactLabel">
			${detail.label }
		</td>
		<td class="contactValue">
			${detail.value }
		</td>
	</g:if>
	<g:if test="${detail.type=='url'}">
		<td class="contactLabel">
			${detail.label }
		</td>
		<td class="contactValue">
			<g:link url="${detail.value}" target="_blank">
				${detail.value}
			</g:link>
		</td>
	</g:if>
	<g:if test="${detail.type=='email'}">
		<td class="contactLabel">
			${detail.label }
		</td>
		<td class="contactValue ">
			  <a href="${('&#109;&#097;&#105;&#108;&#116;&#111;:' + detail.encodeMask)}">&#69;&#109;&#97;&#105;&#108;</a>
		</td>
	</g:if>
	</tr>
</g:each>
</tbody>
</table>