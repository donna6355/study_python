<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="container">
		<jsp:include page="./header.jsp"></jsp:include>
		<div class="card">
			<div class="card-header">UPDATE INFO</div>
			<div class="card-body">
			<%
				Member info = (Member) session.getAttribute("info");
			%>
				<form action="update.do" method="post">
					<table class="table table-bordered table-hover">
						<tr>
							<td>ID</td>
							<td><input readonly value= "<%=info.getId() %>" name="id" type="text" class="form-control" paceholder="please input id"></td>
						</tr>
						<tr>
							<td>PASSWORD</td>
							<td><input name="pw" type="password" class="form-control" paceholder="please input password"></td>
						</tr>
						<tr>
							<td>NICKNAME</td>
							<td><input value= "<%=info.getNick() %>" name="nick" type="text" class="form-control" paceholder="please input your nickname"></td>
						</tr>
						<tr>
							<td>PHONE</td>
							<td><input value= "<%=info.getPhone() %>" name="phone" type="text" class="form-control" paceholder="please input your phone number"></td>
						</tr>
						<tr>
							<td align="center" colspan="2"><a href="boardList.do">
									<button class="btn btn-info" type="button">Cancel</button>
							</a>
								<button type="reset" class="btn btn-danger">Reset</button>
								<button type="submit" class="btn btn-warning">Update info</button></td>
						</tr>
						
					</table>
				</form>
			</div>
			<div class="card-footer">LG DX School</div>
		</div>
	</div>
</body>
</html>