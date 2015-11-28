<p class="style1">
  <noscript>
  	<g:img dir="images" file="thumb-down-icon.png" class="smallShadow userAgentIcons" style="border: thin solid red;"/>
  	Javascript is disabled! Several features of this site will not function correctly until you enable it.
  </noscript>
</p>

<g:if test="${[0,1,2,4,6,8].contains(agentInfo.browserType)}">
	<g:if test="${agentInfo.browserType==4 }">
		<p>
		<g:img dir="images" file="thumb-down-icon.png" class="smallShadow userAgentIcons" style="border: thin solid red;"/>
		You appear to be using <span style="color:red">${agentInfo.browserName}</span> version ${agentInfo.browserVersion} <br> 
		<g:if test="${Double.parseDouble(agentInfo.browserVersion) < Double.parseDouble("9.0")}">
		We <em>strongly urge you</em> to upgrade your web browser. Many of the features of this web site do not display as designed
		with older versions of Internet Explorer. <br><br>  
		</g:if>
		<g:else>
		We recommend that you switch to a different web browser. <br><br>   
		</g:else>
		This site is best viewed using Chrome, Firefox, Safari, or Opera. We have provided convenient links to install any of the recommended browsers below: <br>
		<a href="http://www.google.com/intl/en/chrome/browser/" target="_blank">Chrome</a>&nbsp;
		<a href="http://www.mozilla.org/en-US/firefox/new/" target="_blank">Firefox</a>&nbsp;
		<a href="http://www.apple.com/safari/download/" target="_blank">Safari</a>&nbsp;
		<a href="http://www.opera.com/download/" target="_blank">Opera</a><br>
	</g:if>
	<g:else>
		<p>
		<g:img dir="images" file="thumb-up-icon.png" class="smallShadow userAgentIcons"/>
		<span "style="float:left">
		You appear to be using ${agentInfo.browserName} version ${agentInfo.browserVersion}. <br> 
		Sweet.
		</span>
		</p>
	</g:else>
</g:if>
<g:else>
	<p>
	We are not able to detect your browser type.
	</p>
</g:else>

