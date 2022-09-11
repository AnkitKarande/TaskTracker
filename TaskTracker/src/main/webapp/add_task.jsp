<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>ADD TASK</title>
  <!-- including the header files that contain css and javascript file -->
	<%@include file="header_files.jsp"  %>
</head>
<body>
	<div class="container">
  <!-- including the navbar into the page -->
		<%@include file="navbar.jsp"%>
		<br/>
<!-- add task form -->
	<div class="col-8 mx-auto">
		<form action="SaveTaskServlet" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Task Title</label> 
				<input type="text" name="title" required class="form-control" id="title" placeholder="Title">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Task Description</label>
				<textarea id="content" name="content" required class="form-control" placeholder="Type here..."></textarea>
			</div>
		
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
	</div>
</body>
</html>