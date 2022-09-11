package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Task;
import com.helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Task;
import com.helper.FactoryProvider;
//update servlet to update the task by it's id;
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int id = Integer.parseInt(request.getParameter("task_id").trim());
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		Task task = session.get(Task.class, id);
		task.setTitle(title);
		task.setContent(content);
		task.setDate(new Date());

		tx.commit();
		session.close();
		response.sendRedirect("all_task.jsp");
	}

}
