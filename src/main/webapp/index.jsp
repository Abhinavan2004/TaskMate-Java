<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.Connection,java.sql.DriverManager, com.DB.DBConnect" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.TodoDAO" %>
<%@ page import="com.entity.Entity" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TaskMate - Modern Todo App</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #6366f1;
            --secondary-color: #8b5cf6;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --pending-color: #6b7280;
            --bg-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --card-shadow: 0 10px 25px rgba(0,0,0,0.1);
            --hover-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }

        * {
            font-family: 'Inter', sans-serif;
        }

        body {
            background: var(--bg-gradient);
            min-height: 100vh;
            padding: 0;
            margin: 0;
        }

        /* Modern Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary-color) !important;
        }

        .navbar-brand i {
            margin-right: 8px;
            color: var(--secondary-color);
        }

        /* Main Container */
        .main-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        /* Alert Messages */
        .alert {
            border: none;
            border-radius: 12px;
            margin-bottom: 2rem;
        }

        .alert-success {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
        }

        .alert-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
        }

        /* Page Title */
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

        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: var(--card-shadow);
            backdrop-filter: blur(10px);
        }

        .stat-icon {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }

        .stat-label {
            color: #6b7280;
            font-weight: 500;
        }

        /* Table Container */
        .table-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: var(--card-shadow);
            backdrop-filter: blur(10px);
            overflow: hidden;
        }

        /* Modern Table */
        .modern-table {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: none;
        }

        .modern-table thead {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }

        .modern-table thead th {
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
            padding: 1rem;
            font-size: 0.875rem;
        }

        .modern-table tbody tr {
            border: none;
        }

        .modern-table tbody td {
            padding: 1.25rem 1rem;
            vertical-align: middle;
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }

        /* Status Badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem 1.25rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.875rem;
            min-width: 100px;
            position: relative;
            overflow: hidden;
        }

        .status-completed {
            background: linear-gradient(135deg, var(--success-color), #059669);
            color: white;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        }

        .status-ongoing {
            background: linear-gradient(135deg, var(--warning-color), #d97706);
            color: white;
            box-shadow: 0 4px 15px rgba(245, 158, 11, 0.3);
        }

        .status-pending {
            background: linear-gradient(135deg, var(--pending-color), #4b5563);
            color: white;
            box-shadow: 0 4px 15px rgba(107, 114, 128, 0.3);
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn-modern {
            border: none;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            font-weight: 600;
            font-size: 0.875rem;
            position: relative;
            overflow: hidden;
        }

        .btn-edit {
            background: linear-gradient(135deg, var(--success-color), #059669);
            color: white;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.2);
        }

        .btn-delete {
            background: linear-gradient(135deg, var(--danger-color), #dc2626);
            color: white;
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.2);
        }

        /* Add Task Button - Keep animation for + button only */
        .add-task-btn {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            color: white;
            font-size: 1.5rem;
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.4);
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .add-task-btn:hover {
            transform: scale(1.1) rotate(90deg);
            box-shadow: 0 12px 35px rgba(99, 102, 241, 0.6);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-container {
                padding: 0 0.5rem;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            .table-container {
                padding: 1rem;
            }
            
            .modern-table {
                font-size: 0.875rem;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .add-task-btn {
                bottom: 1rem;
                right: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Modern Navbar -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-tasks"></i>TaskMate
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a>
                <a class="nav-link" href="Add_Task.jsp"><i class="fas fa-plus"></i> Add Task</a>
            </div>
        </div>
    </nav>

    <div class="main-container">
        <!-- Alert Messages -->
        <%
        String msg = (String) session.getAttribute("SucMsg");
        if(msg != null){
        %>
        <div class="alert alert-success" role="alert">
            <i class="fas fa-check-circle me-2"></i><%=msg%>
        </div>
        <% session.removeAttribute("SucMsg"); } %>

        <%
        String fmsg = (String) session.getAttribute("FailMsg");
        if(fmsg != null){
        %>
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i><%=fmsg %>
        </div>
        <% session.removeAttribute("FailMsg"); } %>

        <!-- Page Title -->
        <h1 class="page-title">
            <i class="fas fa-calendar-day"></i>Today's Tasks
        </h1>

        <!-- Stats Cards -->
        <%
        TodoDAO dao = new TodoDAO(DBConnect.getConn());
        List<Entity> todoList = dao.getTodo();
        int totalTasks = todoList.size();
        int completedTasks = 0;
        int ongoingTasks = 0;
        int pendingTasks = 0;
        
        for (Entity t : todoList) {
            if("Completed".equals(t.getStatus())) completedTasks++;
            else if("Ongoing".equals(t.getStatus())) ongoingTasks++;
            else pendingTasks++;
        }
        %>
        
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-icon" style="color: var(--primary-color);">
                    <i class="fas fa-list"></i>
                </div>
                <div class="stat-number" style="color: var(--primary-color);"><%=totalTasks%></div>
                <div class="stat-label">Total Tasks</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon" style="color: var(--success-color);">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="stat-number" style="color: var(--success-color);"><%=completedTasks%></div>
                <div class="stat-label">Completed</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon" style="color: var(--warning-color);">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="stat-number" style="color: var(--warning-color);"><%=ongoingTasks%></div>
                <div class="stat-label">Ongoing</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon" style="color: var(--pending-color);">
                    <i class="fas fa-pause-circle"></i>
                </div>
                <div class="stat-number" style="color: var(--pending-color);"><%=pendingTasks%></div>
                <div class="stat-label">Pending</div>
            </div>
        </div>

        <!-- Tasks Table -->
        <div class="table-container">
            <div class="table-responsive">
                <table class="table modern-table">
                    <thead>
                        <tr>
                            <th><i class="fas fa-hashtag me-2"></i>ID</th>
                            <th><i class="fas fa-user me-2"></i>Name</th>
                            <th><i class="fas fa-tasks me-2"></i>Task</th>
                            <th><i class="fas fa-flag me-2"></i>Status</th>
                            <th><i class="fas fa-cogs me-2"></i>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (Entity t : todoList) {
                        %>
                        <tr>
                            <td><strong><%=t.getID()%></strong></td>
                            <td><%=t.getName()%></td>
                            <td><%=t.getTask()%></td>
                            <td>
                                <% if("Completed".equals(t.getStatus())) { %>
                                <span class="status-badge status-completed">
                                    <i class="fas fa-check me-1"></i><%= t.getStatus() %>
                                </span>
                                <% } else if("Ongoing".equals(t.getStatus())) { %>
                                <span class="status-badge status-ongoing">
                                    <i class="fas fa-spinner me-1"></i><%= t.getStatus() %>
                                </span>
                                <% } else { %>
                                <span class="status-badge status-pending">
                                    <i class="fas fa-clock me-1"></i><%= t.getStatus() %>
                                </span>
                                <% } %>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <a href="Edit.jsp?id=<%= t.getID() %>" class="btn btn-modern btn-edit">
                                        <i class="fas fa-edit me-1"></i>Edit
                                    </a>
                                    <a href="delete?id=<%= t.getID() %>" class="btn btn-modern btn-delete"
                                       onclick="return confirm('🗑️ Are you sure you want to delete this task?')">
                                        <i class="fas fa-trash me-1"></i>Delete
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Floating Add Task Button -->
    <button class="add-task-btn" onclick="window.location.href='Add_Task.jsp'" title="Add New Task">
        <i class="fas fa-plus"></i>
    </button>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        // Add smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>