<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.entities.Task"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>ALL TASK</title>
  <!-- including the header files that contain css and javascript file -->
<%@include file="header_files.jsp"%>
</head>
<body>
	<div class="container">
  <!-- including the navbar into the page -->
		<%@include file="navbar.jsp"%>
	<br/>
	<h1 class="text-center"> All Tasks </h1>
		<div class="row">
			<div class="col-8 mx-auto">
				<% /* retriving the task list from database */
				Session showSession = FactoryProvider.getFactory().openSession();
				Query query = showSession.createQuery("from Task");
				List<Task> list = query.list();
				for (Task task : list) {
					/* formatting date */
					String Date = new SimpleDateFormat("dd MMMM yyyy").format(task.getDate());
				%>
				<!-- Displaying the all retrived task -->
				<div class="card mt-3">
					<img class="card-img-top mt-2 mx-auto" style="max-width:100px" src="images/task_icon.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=task.getTitle() %></h5>
						<p class="card-text"><b><%=Date %></b></p>
						<p class="card-text"><%=task.getContent() %></p>
						<div class="container text-center">
							<a href="update_task.jsp?task_id=<%=task.getTaskId() %>" class="btn btn-primary">Update</a>
							<a href="DeleteServlet?task_id=<%=task.getTaskId() %>" class="btn btn-danger">Delete</a>
						</div>
					</div>
				</div>
				<%
				}
					showSession.close();
				%>
			</div>
		</div>
	</div>

</body>
</html>