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
</style>
<%@include file="components/all_css.jsp" %>
</head>
<body class="bg-light">
<%@include file="components/navbar.jsp" %>
<h2 class="text-center mt-5 text-white">ADD A TASK</h2>
<div class="container">
  <!-- Content here -->
  <div class="card mt-4 mx-auto" style="max-width: 600px;">
  <div class="card-body">
    <h5 class="card-title text-center mb-4">New Task Details</h5>
    
    <form action="addTask" method="post">
    
    <div class="mb-3">
        <label for="authorName" class="form-label">Author Name</label>
        <input type="text" class="form-control" id="authorName" name="authorName" placeholder="Enter author's name" required>
      </div>
      
      <div class="mb-3">
        <label for="taskName" class="form-label">Task Name</label>
        <input type="text" class="form-control" id="taskName" name="taskName" placeholder="Enter task name" required>
      </div>
      
      <div class="mb-3">
        <label for="status" class="form-label">Status</label>
        <select class="form-select" id="status" name="status" required>
          <option selected disabled value="">Choose status...</option>
          <option value="Pending">Pending</option>
          <option value="Ongoing">Ongoing</option>
          <option value="Completed">Completed</option>
        </select>
      </div>
      
      <div class="d-grid gap-2">
        <button type="submit" class="btn btn-primary">Add Task</button>
      </div>
    </form>
  </div>
</div>
  
</div>

</body>
</html>