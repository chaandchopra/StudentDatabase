<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<style>
		a {
		color: hotpink;
		}
	</style>
	<title>Student Tracker App</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%-- <%= theStudents %>  --%>
	<div class="container">
	  <div class="jumbotron">
	    <h1>My Student DataBase</h1>
	    <p>Student database based on JSP and Servlet allows you to update, delete and add data.</p>
	  </div>		
	<div id = "container">
		<div id = "content">
			<table class="table" >
				<thead class="thead-dark">
				<tr>
					<th >First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				</thead>
				<c:forEach var = "temp" items ="${STUDENT_LIST}">
					<c:url var = "templink" value = "StudentControllerServlet">
						<c:param name = "command" value = "LOAD" />
						<c:param name="studentId" value = "${temp.id}" />
					</c:url>
					<c:url var = "deletelink" value = "StudentControllerServlet">
						<c:param name = "command" value = "DELETE" />
						<c:param name="studentId" value = "${temp.id}" />
					</c:url>					
					<tr>
						<td>${temp.firstName }</td>
						<td>${temp.lastName }</td>
						<td>${temp.email }</td>
						<td>
						<a href = "${templink}" class="btn btn-info">Update</a>
						<a class="btn btn-danger" href = "${deletelink}" onclick = "if (!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a>
						</td>
					</tr>				
				</c:forEach>
			</table>
	<button class="btn btn-primary" onclick = "window.location.href='add-student-form.jsp'; return false;" >Add Student</button>
		</div>	
	</div>
	</div>
</body>
</html>