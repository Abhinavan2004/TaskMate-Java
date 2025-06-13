<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Connection,java.sql.DriverManager, com.DB.DBConnect" %>
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
      <tr>
        <td>1</td>
        <td>Abhinav</td>
        <td>Complete project</td>
        <td>Pending</td>
        <td>
          <button type="button" class="btn btn-success">EDIT</button>
          <button type="button" class="btn btn-danger">DELETE</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>
