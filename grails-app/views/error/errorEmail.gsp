<%@ page contentType="text/html"%>
  <head>
	  <title>CAR - Runtime Exception</title>
	  <style type="text/css">
	  		.errorDetails {
	  			padding: 0px;
	  			color: black;
	  		}
	  		.strong {
	  			font-weight:bold;
	  			color:navy;
	  		}
	  </style>
  </head>

  <body>
  	<h1 style="color:green; font-weight:bold">CAR Exception Notification</h1>

  	<table  border="2" cellpadding="2" cellspacing="1">
  	<tr>
  		<td class="strong"> Platform:</td>
  		<td> ${platform} </td>
  	</tr>
  	<tr>
  		<td class="strong"> User:</td>
  		<td> ${user} </td>
  	</tr>
  	<tr>
  		<td class="strong"> Class:</td>
  		<td> ${exception.className} </td>
  	</tr>
  	<tr>
  		<td class="strong"> At Line:</td>
  		<td> ${exception.lineNumber} </td>
  	</tr>
  	<tr>
  		<td class="strong"> Message:</td>
  		<td> ${exception.message} </td>
  	</tr>
  	<tr>
  		<td class="strong"> Caused By:</td>
  		<td> ${exception.cause?.message} </td>
  	</tr>
  	<tr>
  		<td class="strong"> Code Snippet:</td>
  		<td> <g:each in="${exception.codeSnippet}">
				${it.encodeAsHTML()} </br>
			 </g:each> 
		</td>
  	</tr>
  	<tr>
  		<td class="strong"> Stack Trace:</td>
  		<td> <g:each in="${exception.stackTraceLines}">
				${it.encodeAsHTML()} </br>
			 </g:each> 
		</td>
  	</tr>
	</table>
  </body>
</html>
