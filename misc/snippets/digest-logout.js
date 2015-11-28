function clearAuthenticationCache(page) {
  // Default to a non-existing page (give error 500).
  // An empty page is better, here.
  if (!page) page = '.force_logout';
  try{
    var agt=navigator.userAgent.toLowerCase();
    if (agt.indexOf("msie") != -1) {
      // IE clear HTTP Authentication
      document.execCommand("ClearAuthenticationCache");
    }
    else {
      // Let's create an xmlhttp object
      var xmlhttp = createXMLObject();
      // Let's prepare invalid credentials
      xmlhttp.open("GET", page, true, "logout", "logout");
      // Let's send the request to the server
      xmlhttp.send("");
      // Let's abort the request
      xmlhttp.abort();
    }
  } catch(e) {
    // There was an error
    return;
  }
}
    
function createXMLObject() {
  try {
    if (window.XMLHttpRequest) {
      xmlhttp = new XMLHttpRequest();
    }
    // code for IE
    else if (window.ActiveXObject) {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  } catch (e) {
    xmlhttp=false
  }
  return xmlhttp;
}