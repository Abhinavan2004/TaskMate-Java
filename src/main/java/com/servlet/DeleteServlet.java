
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

@WebServlet("/delete")  // This should work
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            TodoDAO dao = new TodoDAO(DBConnect.getConn());
            boolean f = dao.deletetask(id);
            HttpSession session = req.getSession();
            
            if(f) { 
                session.setAttribute("SucMsg", "Task Deleted Successfully");
                resp.sendRedirect("index.jsp");
            } else {
                session.setAttribute("FailMsg", "Something went Wrong");
                resp.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("FailMsg", "Error occurred while deleting task");
            resp.sendRedirect("index.jsp");
        }
    }
}
