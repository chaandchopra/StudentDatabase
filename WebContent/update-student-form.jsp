<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Update Student</title>

</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>Update Student</h1>      
		</div>
		<form class="form-horizontal" action = "StudentControllerServlet" method = "GET" >	
		<input type = "hidden" name = "command" value = "UPDATE" />
		<input type = "hidden" name = "studentId" value = "${THE_STUDENT.id}" />
			<div class="form-group">
			 <label for="usr">First Name: </label> 
			<input class="form-control" id="usr" type = "text" name = "firstname"  value = "${THE_STUDENT.firstName}"/> </div>
			<div class="form-group">
			 <label for="usr">Last Name: </label> 
			<input class="form-control" id="usr" type = "text" name = "lastname" value = "${THE_STUDENT.lastName}"/> </div>
			<div class="form-group">
			 <label for="email">Email: </label> 
			<input class="form-control" id="usr" type = "text" name = "email" value = "${THE_STUDENT.email}"/> </div>
			 <div class="form-group">
			 <input class="btn btn-info" type = "submit" value = "Update" class = "save"/>
			 <a href = "StudentControllerServlet" class="btn btn-danger">Back to List</a>
			 </div>								
	</form>	
	</div>
</body>
</html>