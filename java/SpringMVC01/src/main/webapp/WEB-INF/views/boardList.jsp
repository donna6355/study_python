<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lgdx.entity.Board"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>Board List with MVC</h1>
<h3>Mir Isaac Kim's Homepage</h3>

<%
	//fetch model value
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	String tBody  = "";	
	for (int i = 0;i<list.size();i++){
		Board data = list.get(i);
		tBody  += "<tr><td>"+data.getIdx()+"</td><td><a href='boardContent.do?idx="+data.getIdx()+"'>"+data.getTitle()+"</a></td><td>"+data.getWriter()+"</td><td>"+data.getIndate()+"</td><td>"+data.getCount()+"</td></tr>"; 	
	}
%>

<div class="container">
  <h2>Card Header and Footer</h2>
  <div class="card">
    <div class="card-header">Board List</div>
    <div class="card-body">
    	<table class ="table table-bordered table-hover">
    		<thead>
    			<tr class="table-info">
    				<td>idx</td>
    				<td>title</td>
    				<td>writer</td>
    				<td>date</td>
    				<td>view</td>
    			</tr>
    		</thead>
    		<tbody>
    			<%=tBody%>
    		</tbody>
    		
    	</table>
	    <a href="boardInesrtForm.do">
	    	<button class="btn btn-primary">Write</button>	    
	    </a>
    </div> 
    <div class="card-footer">LG DX School - </div>
  </div>
</div>
</body>
</html>