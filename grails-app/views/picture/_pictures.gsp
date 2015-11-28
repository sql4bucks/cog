<div id="pictureAccordion" class="haccordion" style="display:none;">
	<ul>
		<g:each in="${pictureSet}" status="i" var="picture">
			<li>
			<div class="hpanel">
				<figure>
					<img src="${picture.url}" class="magnify" alt="${picture.caption}" style="float:left; padding-right:8px; width:400px; height:348px" />
					<figcaption class="pictureCaption">${picture.caption}</figcaption>
				</figure>	
			</div>
			</li>
		</g:each>	
	</ul>
</div>








