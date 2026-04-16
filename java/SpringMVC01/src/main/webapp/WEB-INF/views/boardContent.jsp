<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lgdx.entity.Board"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.lgdx.entity.Member"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%
	Board vo = (Board) request.getAttribute("vo");
	%>
	<div class="container">
		<jsp:include page="./header.jsp"></jsp:include>
		<h2>Mir Isaac Kim's Homepage</h2>
		<div class="card">
			<div class="card-header">Board Detail</div>
			<div class="card-body">
				<table class="table table-bordered table-hover">
					<tr>
						<td>Title</td>
						<td><%=vo.getTitle()%></td>
					</tr>
					<tr>
						<td>Writer</td>
						<td><%=vo.getWriter().replace("\n", "<br/>")%></td>
					</tr>
					<tr>
						<td>Content</td>
						<td>
						
						
						<% if(vo.getFilepath() != null) {%>
						<img width="100%" src="resources/images/<%=vo.getFilepath()%>"><br/>
						<%} %>
						
						<%=vo.getContent()%></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><a href="boardList.do">
								<button class="btn btn-info" type="button">Return</button>
						</a>
						
						<% 
						Member info = (Member)session.getAttribute("info");
						if(info == null || !info.getId().equals(vo.getId())){ %>
							<button disabled="disabled" type="button" class="btn btn-danger">Edit</button>
							<button disabled="disabled" type="button" class="btn btn-warning">Delete</button> 
							
							<%}else{ %>
							<a
							href="boardUpdateForm.do?idx=<%=vo.getIdx()%>"><button
									type="button" class="btn btn-danger">Edit</button> </a> <a
							href="boardDelete.do?idx=<%=vo.getIdx()%>"><button
									type="button" class="btn btn-warning">Delete</button> </a>
									
							<%} %>
									</td>
									
					</tr>
				</table>
			</div>
			<div class="card-footer">LG DX School</div>
		</div>
	</div>
</body>
</html>