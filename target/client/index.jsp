<%@page import="org.apache.http.client.*" %>
<%@page import="org.apache.http.impl.*" %>
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
     CloseableHttpClient httpclient = HttpClients.custom()
             .setDefaultCredentialsProvider(credsProvider).build();
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
             CloseableHttpResponse response = httpclient.execute(target, httpget, localContext);
             try {
                 System.out.println("----------------------------------------");
                 System.out.println(response.getStatusLine());
                 System.out.println(EntityUtils.toString(response.getEntity()));
             } finally {
                 response.close();
             }
         }
     } finally {
         httpclient.close();
     }
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
