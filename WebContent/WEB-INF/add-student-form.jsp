<html>
<head>
<link rel = "stylesheet" href ="css/style.css">
<link rel = "stylesheet" href ="css/add-student-style.css">
</head>
<body>
	<div id = "wrapper">
		<div id = "header">
			<h2> Lahore University</h2>	
		</div>
	</div>
	<div id = "container">
		<h3> Add Student </h3>
		<form action = "StudentControllerServlet" method = "GET">
		
			<input type = "hidden" name = "command" value = "ADD" />
			<table>
				<tbody>
				<tr>
					<td><label>FirstName: </label></td>
					<td><input type = "text" name = "firstname"/></td>
				</tr>
				<tr>
					<td><label>LastName: </label></td>
					<td><input type = "text" name = "lastname"/></td>
				</tr>
				<tr>
					<td><label>Email: </label></td>
					<td><input type = "text" name = "email"/></td>
				</tr>
				</tbody>
			</table>
			<input type = "submit" value = "Save" class = "save"/>								
		</form>
		<div style = "clear: both;">
			<p>
				<a href = "StudentControllerServlet">Back to List</a>
			</p>
		</div>
	</div>
</body>
</html>