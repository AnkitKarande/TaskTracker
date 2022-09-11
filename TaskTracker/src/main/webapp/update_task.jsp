<%@page import="com.entities.Task"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>UPDATE TASK</title>
  <!-- including the header files that contain css and javascript file -->
<%@include file="header_files.jsp" %>
</head>
<body>
<%
	/* getting the task details by task_id */
	int id = Integer.parseInt(request.getParameter("task_id").trim());
	Session editSession = FactoryProvider.getFactory().openSession();
	Task task = (Task)editSession.get(Task.class,id);
	editSession.close();
%>
	<div class="container">
  <!-- including the navbar into the page -->
		<%@include file="navbar.jsp"%>
		<br/>
<!-- Displaying the task details -->
	<div class="col-8 mx-auto">
		<form action="UpdateServlet" method="post">
			<div class="mb-3">
			<input type="hidden" value="<%=task.getTaskId() %>" name="task_id"/>
				<label for="title" class="form-label">Task Title</label> 
				<input type="text" name="title" 
				value="<%=task.getTitle() %>"
				required class="form-control" id="title" placeholder="Title">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Task Description</label>
				<textarea id="content" name="content" required class="form-control"><%=task.getContent() %></textarea>
			</div>
		
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</form>
	</div>
	</div>

</body>
</html>