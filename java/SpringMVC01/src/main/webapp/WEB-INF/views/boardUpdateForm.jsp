<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lgdx.entity.Board"%>
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
		<h2>Leave Measge at Mir Isaac Kim's Homepage</h2>
		<div class="card">
			<div class="card-header">Board Writing</div>
			<div class="card-body">
				<form action="boardUpdate.do" method="post">
					<input type="hidden" name="idx" value="<%=vo.getIdx()%>">
					<table class="table table-bordered table-hover">
						<tr>
							<td>Title</td>
							<td><input value="<%=vo.getTitle() %>" name="title" type="text" class="form-control"></td>
						</tr>
						<tr>
							<td>Writer</td>
							<td><input readonly value="<%=vo.getWriter() %>" name="writer" type="text" class="form-control"></td>
						</tr>
						<tr>
							<td>Content</td>
							<td><textarea name="content" class="form-control" cols="" rows="7"><%=vo.getContent() %></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="2">
							
		    					<a href="boardContent.do?idx=<%=vo.getIdx()%>">
									<button class="btn btn-info" type="button">Cancel</button>
								</a>
								<button type="reset" class="btn btn-danger">Reset</button>
								<button type="submit" class="btn btn-warning">Revise</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="card-footer">LG DX School</div>
		</div>
	</div>
</body>
</html>