package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
//save servlet to save the task;
public class SaveTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//getting data from the form
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Session session = FactoryProvider.getFactory().openSession();
		
		//creating task object
		Task task = new Task(title,content,new Date());
		//saving data to db
		Transaction tx = session.beginTransaction();
		session.save(task);
		tx.commit();
		session.close();
		response.sendRedirect("all_task.jsp");
		
	}
}
