<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Modern Navbar - First Image Style -->
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid px-4">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-tasks"></i>TaskMate
        </a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="index.jsp">
                <i class="fas fa-home"></i> Home
            </a>
            <a class="nav-link" href="Add_Task.jsp">
                <i class="fas fa-plus"></i> Add Task
            </a>
        </div>
    </div>
</nav>

<style>
/* Modern Navbar Styles - First Image Style */
.navbar {
    background-color: #f8f9fa;
    border-bottom: 1px solid #e9ecef;
    padding: 1rem 0;
    box-shadow: none;
    backdrop-filter: none;
}

.navbar-brand {
    font-weight: 700;
    font-size: 1.5rem;
    color: #6366f1 !important;
    text-decoration: none;
}

.navbar-brand i {
    margin-right: 8px;
    color: #8b5cf6;
}

.navbar-nav {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.nav-link {
    color: #6b7280 !important;
    font-weight: 500;
    font-size: 1rem;
    text-decoration: none;
    padding: 0.5rem 1rem !important;
    border-radius: 6px;
    transition: all 0.2s ease;
    display: flex;
    align-items: center;
}

.nav-link:hover {
    color: #374151 !important;
    background-color: rgba(107, 114, 128, 0.1);
}

.nav-link i {
    margin-right: 6px;
    font-size: 0.9rem;
}

/* Container styling */
.container-fluid {
    max-width: 1200px;
    margin: 0 auto;
}

/* Remove any Bootstrap default styling conflicts */
.navbar-expand-lg .navbar-nav {
    flex-direction: row;
}

.navbar-expand-lg .navbar-nav .nav-link {
    padding-right: 1rem;
    padding-left: 1rem;
}

/* Responsive design */
@media (max-width: 991.98px) {
    .navbar-nav {
        flex-direction: row;
        gap: 0.5rem;
    }
    
    .nav-link {
        font-size: 0.9rem;
        padding: 0.4rem 0.8rem !important;
    }
    
    .navbar-brand {
        font-size: 1.3rem;
    }
}

@media (max-width: 576px) {
    .container-fluid {
        padding-left: 1rem;
        padding-right: 1rem;
    }
    
    .navbar-nav {
        gap: 0.25rem;
    }
    
    .nav-link {
        font-size: 0.85rem;
        padding: 0.3rem 0.6rem !important;
    }
}
</style>