<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Connection,java.sql.DriverManager, com.DB.DBConnect" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.TodoDAO" %>
<%@ page import="com.entity.Entity" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TASKMATE : A Java TODO APP</title>
<%@include file="components/all_css.jsp" %>

</head>
<body>
<%@include file = "components/navbar.jsp" %>


<%
String msg = (String) session.getAttribute("SucMsg");
if(msg != null){
%>
<div class="alert alert-success" role="alert">
<%=msg%>
</div>
<% session.removeAttribute("SucMsg"); } %>



<%
String fmsg = (String) session.getAttribute("FailMsg");
if(fmsg != null){
%>
<div class="alert alert-danger" role="alert">
<%=fmsg %></div>
<% session.removeAttribute("FailMsg"); } %>

<h2 class="text-center mt-5">TODAY'S TASKS</h2>

<!-- for just checking that the mysql is properly connected or not  

<%--
    Connection conn = DBConnect.getConn();
    out.print(conn);
--%>

-->


<div class="d-flex justify-content-center mt-4">
  <table class="table" style="width:80%">
    <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">NAME</th>
        <th scope="col">TASK NAME</th>
        <th scope="col">STATUS</th>
        <th scope="col">ACTION</th>
      </tr>
    </thead>
    <tbody>
    <%
TodoDAO dao = new TodoDAO(DBConnect.getConn());
List<Entity> todo = dao.getTodo();
for (Entity t : todo) {
%>
<tr>
<td scope="row"><%=t.getID()%></td>
<td scope="col"><%=t.getName()%></td>
<td><%=t.getTask()%></td>
                        <td>
                            <% if("Completed".equals(t.getStatus())) { %>
                                <span class="badge bg-success"><%= t.getStatus() %></span>
                            <% } else if("Ongoing".equals(t.getStatus())) { %>
                                <span class="badge bg-warning"><%= t.getStatus() %></span>
                            <% } else { %>
                                <span class="badge bg-secondary"><%= t.getStatus() %></span>
                            <% } %>
                        </td>

<td><a href="Edit.jsp?id=<%= t.getID() %>" class="btn btn-sm btn-success">Edit</a>
<a href="delete?id=<%= t.getID() %>" class="btn btn-sm btn-danger" 
       onclick="return confirm('Are you sure you want to delete this task?')">Delete</a>
</td>
</tr>
<% 
}
%>
     
    </tbody>
  </table>
</div>

</body>
</html>
