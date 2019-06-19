<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>Add Student</h1>      
		</div>

	<form class="form-horizontal" action = "StudentControllerServlet" method = "GET" >	
		<input type = "hidden" name = "command" value = "ADD" />
			<div class="form-group">
			 <label for="usr">First Name: </label> 
			<input class="form-control" id="usr" type = "text" name = "firstname"/> </div>
			<div class="form-group">
			 <label for="usr">Last Name: </label> 
			<input class="form-control" id="usr" type = "text" name = "lastname"/> </div>
			<div class="form-group">
			 <label for="email">Email: </label> 
			<input class="form-control" type = "text" name = "email"/> </div>
			 <div class="form-group">
			 <input class="btn btn-info" type = "submit" value = "Add" class = "save"/>
			 <a href = "StudentControllerServlet" class="btn btn-danger">Back to List</a>
			 </div>								
	</form>
	</div>
</body>
</html>