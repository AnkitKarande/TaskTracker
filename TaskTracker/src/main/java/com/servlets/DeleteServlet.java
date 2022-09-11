package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Task;
import com.helper.FactoryProvider;
//delete servlet to delete the task by it's id;
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("task_id").trim());
		Session session = FactoryProvider.getFactory().openSession();
		Task task = (Task)session.get(Task.class, id);
		System.out.print(task.getTaskId());
		Transaction tx = session.beginTransaction();
		session.delete(task);
		tx.commit();
		session.close();
		response.sendRedirect("all_task.jsp");
	}
}
