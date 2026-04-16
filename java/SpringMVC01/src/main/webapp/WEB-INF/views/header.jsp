<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.lgdx.entity.Member"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="boardList.do">Mir's Sweet Home</a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">Link 1</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link 2</a></li>

			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Dropdown link </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Link 1</a> <a
						class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item"
						href="#">Link 3</a>
				</div></li>


		</ul>
		<ul class="navbar-nav ml-auto">
			<%
				Member info = (Member) session.getAttribute("info");
			%>
			<% if (info == null){%>
			
			
			<li class="nav-item" style="foat: right;"><a class="nav-link"
				href="loginForm.do">Login</a></li>

			<li class="nav-item"><a class="nav-link" href="joinForm.do">Sign
					Up</a></li>
			
			<%} else {%>
			
			<li class="nav-item" style="foat: right;">
				<b>Welcome <%=info.getNick() %></b>
			</li>
			
			<li class="nav-item" style="foat: right;"><a class="nav-link"
				href="updateForm.do">Edit Info</a></li>

			<li class="nav-item"><a class="nav-link" href="logout.do">Log out</a></li>
			<%}%>
		</ul>
	</nav>
</body>

</html>