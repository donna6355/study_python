<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<% 
	// java script here
	String myName = "Mir";
%>
<h2>My name is <%=myName%></h2>
<%
String menu = "Korean";
%>
<%
if(menu.equals("Korean")){%>
	<h3>I like Korean food</h3>
<%}else if (menu.equals("Chinese")){%>
	<h3>I like Chinese food</h3>
<%}else if (menu.equals("Japanese")){%>
	<h3>I like Japanese food</h3>
<%}%>

<%
	if(menu.equals("Korean")){
		out.print("<h3>I like Korean food</h3>");
	}else if (menu.equals("Chinese")){
		out.print("<h3>I like Chinese food</h3>");
	}else if (menu.equals("Japanese")){
		out.print("<h3>I like Japanese food</h}");
	}
%>

<%
	int sum = 0;
	for (int i =1;i<=100;i++){
		sum +=i;
	}

%>

<h4>Sum from 1 to 100 is <%=sum %> :)</h4>
<table border="1px solid black">
	<tr>
	<%
		String td = "";
		for (int i = 1; i<=10; i++){
			td += ("<td>"+i+"</td>");	
		}
		out.print(td);
	%>
	</tr>	
</table>
</body>
</html>
