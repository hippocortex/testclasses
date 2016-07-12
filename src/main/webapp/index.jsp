<%@page import="org.apache.http.client.methods.CloseableHttpResponse" %>
<%@page import="org.apache.http.client.methods.HttpGet" %>
<%@page import="org.apache.http.impl.client.CloseableHttpClient" %>
<%@page import="org.apache.http.impl.client.HttpClients" %>
<%@page import="java.io.IOException" %>
import ;
import ;
import ;
import 
<html>
<script type="text/javascript" >
function connect(){
	<%
	CloseableHttpClient httpclient = HttpClients.createDefault();
	HttpGet httpGet = new HttpGet("http://57.200.214.117:8080/services");
	CloseableHttpResponse response1=null;
	try {
		 response1 = httpclient.execute(httpGet);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		System.out.print(e.getMessage());
	}
	System.out.print(response1.getStatusLine().getStatusCode());
	%>
}
</script>
<body>
<h2>Hello World!</h2>
<form action="#" method="get"><input type="button" onclick="return connect()"/></form>
</body>
</html>
