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
<style> 
  body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 0;
            margin: 0;
        }
        .page-title {
            text-align: center;
            color: white;
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 3rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .page-title i {
            margin-right: 1rem;
            color: #fbbf24;
        }
</style>
<%@include file="components/all_css.jsp" %>
</head>
<body class="bg-light">
<%@include file="components/navbar.jsp" %>

<%
// Check if id parameter exists and is not null/empty
String idParam = request.getParameter("id");
if (idParam == null || idParam.trim().isEmpty()) {
%>
    <div class="container mt-5">
        <div class="alert alert-danger text-center">
            <h4>Error: Task ID is missing!</h4>
            <p>Please select a valid task to edit.</p>
            <a href="index.jsp" class="btn btn-primary">Go Back to Home</a>
        </div>
    </div>
</body>
</html>
<%
    return;
}

int id = 0;
Entity t = null;
try {
    id = Integer.parseInt(idParam);
    TodoDAO dao = new TodoDAO(DBConnect.getConn());
    t = dao.gettoById(id);
    
    // Check if task exists
    if (t == null) {
%>
    <div class="container mt-5">
        <div class="alert alert-warning text-center">
            <h4>Task Not Found!</h4>
            <p>The task you're looking for doesn't exist.</p>
            <a href="index.jsp" class="btn btn-primary">Go Back to Home</a>
        </div>
    </div>
</body>
</html>
<%
        return;
    }
} catch (NumberFormatException e) {
%>
    <div class="container mt-5">
        <div class="alert alert-danger text-center">
            <h4>Invalid Task ID!</h4>
            <p>The provided task ID is not valid.</p>
            <a href="index.jsp" class="btn btn-primary">Go Back to Home</a>
        </div>
    </div>
</body>
</html>
<%
    return;
}
%>
<h1 class="page-title mt-auto">
            <i class="fas fa-calendar-day"></i>Edit Your Task
        </h1>

<div class="container">
    <!-- Content here -->
    <div class="card mt-4 mx-auto" style="max-width: 600px;">
        <div class="card-body">
            <h5 class="card-title text-center mb-4">Your Task Details</h5>

            <form action="updateTask" method="post">
                <!-- Hidden field to pass the task ID -->
                <input type="hidden" name="id" value="<%= t.getID() %>">

                <div class="mb-3">
                    <label for="authorName" class="form-label">Author Name</label>
                    <input type="text" class="form-control" id="authorName" name="authorName" 
                           value="<%= t.getName() != null ? t.getName() : "" %>" 
                           placeholder="Enter author's name" required>
                </div>

                <div class="mb-3">
                    <label for="taskName" class="form-label">Task Name</label>
                    <input type="text" class="form-control" id="taskName" name="taskName" 
                           value="<%= t.getTask() != null ? t.getTask() : "" %>" 
                           placeholder="Enter task name" required>
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