package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TodoDAO;
import com.DB.DBConnect;
import com.entity.Entity;

@WebServlet("/updateTask")
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
        try {
            // Get parameters and validate
            String idParam = req.getParameter("id");
            String username = req.getParameter("authorName");
            String todo = req.getParameter("taskName");
            String status = req.getParameter("status");
            
            // Validate required parameters
            if (idParam == null || idParam.trim().isEmpty() ||
                username == null || username.trim().isEmpty() ||
                todo == null || todo.trim().isEmpty() ||
                status == null || status.trim().isEmpty()) {
                
                session.setAttribute("failedMsg", "All fields are required");
                resp.sendRedirect("index.jsp");
                return;
            }
            
            int id = Integer.parseInt(idParam);
            
            TodoDAO dao = new TodoDAO(DBConnect.getConn());
            
            Entity t = new Entity();
            t.setID(id);
            t.setName(username.trim());
            t.setTask(todo.trim());  // FIXED: This should be todo, not status
            t.setStatus(status.trim());
            
            boolean f = dao.updateTodo(t);
            
            if (f) {
                session.setAttribute("succMsg", "Task Updated Successfully");
                resp.sendRedirect("index.jsp");
            } else {
                session.setAttribute("failedMsg", "Failed to update task");
                resp.sendRedirect("index.jsp");
            }
            
        } catch (NumberFormatException e) {
            session.setAttribute("failedMsg", "Invalid task ID");
            resp.sendRedirect("index.jsp");
        } catch (Exception e) {
            session.setAttribute("failedMsg", "Something went wrong on server");
            resp.sendRedirect("index.jsp");
            e.printStackTrace();
        }
    }
}