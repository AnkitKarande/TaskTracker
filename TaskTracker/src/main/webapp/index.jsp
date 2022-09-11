<!doctype html>
<html lang="en">
  <head>
  <!-- including the header files that contain css and javascript file -->
	<%@include file="header_files.jsp" %>
    <title>Task Tracker</title>
  </head>
  <body>
	<div class="container">
  <!-- including the navbar into the page -->	
		<%@include file="navbar.jsp"%>
		<br />
		<div class="col-8 card mx-auto shadow bg-white py-5">
			<img class="img-fluid mx-auto" style="max-width: 300px;" src="images/task_icon.png">
			<h1 class="text-primary text-uppercase text-center mt-3">Start Noting Your Task</h1>
			<div class="container text-center">
				<a href="add_task.jsp" class="btn btn-outline-primary">Start here</a>
			</div>
		</div>
	</div>
</body>
</html>