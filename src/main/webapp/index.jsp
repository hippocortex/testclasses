<%@page import=" org.apache.http.HttpHost"%>
<%@page import=" org.apache.http.auth.AuthScope"%>
<%@page import=" org.apache.http.auth.UsernamePasswordCredentials"%>
<%@page import=" org.apache.http.client.AuthCache"%>
<%@page import=" org.apache.http.client.CredentialsProvider"%>
<%@page import=" org.apache.http.client.methods.CloseableHttpResponse"%>
<%@page import=" org.apache.http.client.methods.HttpGet"%>
<%@page import=" org.apache.http.client.protocol.HttpClientContext"%>
<%@page import=" org.apache.http.impl.auth.BasicScheme"%>
<%@page import=" org.apache.http.impl.client.BasicAuthCache"%>
<%@page import=" org.apache.http.impl.client.BasicCredentialsProvider"%>
<%@page import=" org.apache.http.impl.client.CloseableHttpClient"%>
<%@page import=" org.apache.http.impl.client.HttpClients"%>
<%@page import=" org.apache.http.util.EntityUtils"%>
<%@page import="java.io.IOException" %>
<head>
<script type="text/javascript" >
function connect(){
	alert("test");
	<%
	CloseableHttpClient httpclient = HttpClients.createDefault();
	HttpGet httpGet = new HttpGet("https://anais2.accor.com/odataint");
	CloseableHttpResponse response1=null;
	try {
		 response1 = httpclient.execute(httpGet);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		System.out.print(e.getMessage());
	}
	System.out.print(response1.getStatusLine().getStatusCode());
	
	
	 HttpHost target = new HttpHost("anais2.accor.com", 443, "https");
	 
     CredentialsProvider credsProvider = new BasicCredentialsProvider();
     credsProvider.setCredentials(
             new AuthScope(target.getHostName(), target.getPort()),
             new UsernamePasswordCredentials("aslpocint", "U7U1i#ujUsuZo3yTaQA7o5et"));
     CloseableHttpClient  httpclient2 = HttpClients.custom()
             .setDefaultCredentialsProvider(credsProvider).build();
     CloseableHttpResponse response2=null;
     try {

         // Create AuthCache instance
         AuthCache authCache = new BasicAuthCache();
         // Generate BASIC scheme object and add it to the local
         // auth cache
         BasicScheme basicAuth = new BasicScheme();
         authCache.put(target, basicAuth);

         // Add AuthCache to the execution context
         HttpClientContext localContext = HttpClientContext.create();
         localContext.setAuthCache(authCache);

         HttpGet httpget = new HttpGet("https://anais2.accor.com/odataint");
         
         System.out.println("Executing request " + httpget.getRequestLine() + " to target " + target);
         for (int i = 0; i < 3; i++) {
              response2 = httpclient2.execute(target, httpget, localContext);
             try {
                 System.out.println("----------------------------------------");
                 System.out.println(response2.getStatusLine());
                 System.out.println(EntityUtils.toString(response2.getEntity()));
             } finally {
                 response2.close();
             }
         }
     } finally {
         httpclient.close();
     }
	%>
	var resp2 = <%=response2.getStatusLine()%>;
	var resp = <%=response1.getStatusLine().getStatusCode()%>;
	
	
	alert(resp+" "+resp2);
}
</script>
</head>
<html>

<body>
<h2>Hello World!</h2>
<a href="javascript:connect()">Appel Java via javascript</a>
</body>
</html>
