package com.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TodoDAO;
import com.DB.DBConnect; 


@WebServlet("/addTask")
public class Add_task_Servlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String name = req.getParameter("authorName");
        String task = req.getParameter("taskName");
        String status = req.getParameter("status");
        
        System.out.println("Author: " + name + ", Task: " + task + ", Status: " + status);
      
        TodoDAO dao = new TodoDAO(DBConnect.getConn());
        Boolean f = dao.addTodo(name, task, status);
        
        HttpSession session = req.getSession();
        
        if(f) {
        	session.setAttribute("SucMsg", "Task Added Successfully");
        	System.out.println("Data Inserted Successfully");
            resp.sendRedirect("index.jsp"); 
        }
        else {
        	session.setAttribute("FailMsg", "Task Not Added Successfully");
        	System.out.println("Error");
        	resp.sendRedirect("index.jsp");
        }
        
        
    }
}