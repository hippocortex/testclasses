<%@page import="org.apache.http.client.methods.CloseableHttpResponse" %>
<%@page import="org.apache.http.client.methods.HttpGet" %>
<%@page import="org.apache.http.impl.client.CloseableHttpClient" %>
<%@page import="org.apache.http.impl.client.HttpClients" %>
<%@page import="java.io.IOException" %>
<head>
<script type="text/javascript" >
function connect(){
	alert("test");
	<%
	CloseableHttpClient httpclient = HttpClients.createDefault();
	HttpGet httpGet = new HttpGet("https://anais1.accor.com/asl");
	CloseableHttpResponse response1=null;
	try {
		 response1 = httpclient.execute(httpGet);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		System.out.print(e.getMessage());
	}
	System.out.print(response1.getStatusLine().getStatusCode());
	%>
	var resp = <%=response1.getStatusLine().getStatusCode()%>;
	
	
	alert(resp);
}
</script>
</head>
<html>

<body>
<h2>Hello World!</h2>
<a href="javascript:connect()">Appel Java via javascript</a>
</body>
</html>
