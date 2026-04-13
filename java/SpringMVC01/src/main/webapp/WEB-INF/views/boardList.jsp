<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    			<tr>
    				<td>1</td>
    				<td>Chicken night?</td>
    				<td>Moomin</td>
    				<td>2026.04.13</td>
    				<td>97</td>
    			</tr>
    			<tr>
    				<td>2</td>
    				<td>How will win today?</td>
    				<td>Kkomi</td>
    				<td>2024.06.13</td>
    				<td>197</td>
    			</tr>
    			<tr>
    				<td>3</td>
    				<td>join our yoga class</td>
    				<td>Mir</td>
    				<td>2026.04.13</td>
    				<td>9227</td>
    			</tr>
    		</tbody>
    		
    	</table>
    	<button class="btn btn-primary">Write</button>
    </div> 
    <div class="card-footer">LG DX School - </div>
  </div>
</div>
</body>
</html>