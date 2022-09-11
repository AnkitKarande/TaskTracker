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
<title>SEARCH TASK</title>
  <!-- including the header files that contain css and javascript file -->
<%@include file="header_files.jsp"%>
</head>
<body>
	<div class="container">
  <!-- including the navbar into the page -->
		<%@include file="navbar.jsp"%>
	<br/>
	<h1 class="text-center"> Search Task Result </h1>
		<div class="row">
			<div class="col-8 mx-auto">
				<%
				/* retriving the searched text */
				String search = request.getParameter("search").trim();
				/* flag is used when the searched text is not available */
				boolean flag = true;
				Session showSession = FactoryProvider.getFactory().openSession();
				Query query = showSession.createQuery("from Task");
				List<Task> list = query.list();
				for (Task task : list) {
					/* formatting date */
					String Date = new SimpleDateFormat("dd MMMM yyyy").format(task.getDate());
					/* checking in the task list if not found then continue to next task */
					if(!task.getTitle().contains(search)) continue;
				%>
				<!-- Displaying searched result -->
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
					flag = false;
				}
				/* if we can't searched text is not present then result not found will be displayed */
					if(flag){
					%>
						<div class="col-12 card mx-auto text-center">	
						<h1><b class="text-danger"> No Result Found </b></h1>
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