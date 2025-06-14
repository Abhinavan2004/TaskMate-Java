<%@page import="com.entity.Entity"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.TodoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TASKMATE : A Java TODO APP</title>
<%@include file="components/all_css.jsp" %>
</head>
<body class="bg-light">
<%@include file="components/navbar.jsp" %>

<%
int id=Integer.parseInt(request.getParameter("id"));

TodoDAO dao=new TodoDAO(DBConnect.getConn());
Entity t = dao.gettoById(id);
%>
<h2 class="text-center mt-5">EDIT YOUR TASK</h2>
<div class="container">
  <!-- Content here -->
  <div class="card mt-4 mx-auto" style="max-width: 600px;">
  <div class="card-body">
    <h5 class="card-title text-center mb-4">Your Task Details</h5>
    
    <form action="addTask" method="post">
    
      <!-- Hidden field to pass the task ID -->
                <input type="hidden" name="id" value="<%= t.getID() %>">
    
    
    <div class="mb-3">
        <label for="authorName" class="form-label">Author Name</label>
        <input type="text" class="form-control" id="authorName" name="authorName" value="<%= t.getName() %>" placeholder="Enter author's name" required>
      </div>
      
      <div class="mb-3">
        <label for="taskName" class="form-label">Task Name</label>
        <input type="text" class="form-control" id="taskName" name="taskName" value="<%= t.getTask() %>" placeholder="Enter task name" required>
      </div>
      
     
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-select" id="status" name="status" required>
                        <option disabled value="">Choose status...</option>
                        <option value="Pending" <%= "Pending".equals(t.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="Ongoing" <%= "Ongoing".equals(t.getStatus()) ? "selected" : "" %>>Ongoing</option>
                        <option value="Completed" <%= "Completed".equals(t.getStatus()) ? "selected" : "" %>>Completed</option>
                    </select>
                </div>
      
      <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Update Task</button>
                    <a href="index.jsp" class="btn btn-secondary">Cancel</a>
                </div>
    </form>
  </div>
</div>
  
</div>

</body>
</html>