<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="hrms.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Human Resource Management System</title>
</head>
<body>
<div class="container-fluid bg-primary bg-gradient py-2 pb-2">
  <div class="row">
  <div class="col-2">
  <a href="/addEmployee"><button class="btn btn-success">Add New Employee</button></a>
  </div>
  <div class="col-8 text-center">
  <h3><span class="navbar-brand mb-0 text-white">Human Resource Management System</span></h3>
  </div>
  </div>
</div>
<br>
<div class="container">
<h1 class="text-center">View Employees</h1>
<br>
<div class="container text-center border-top border-end border-start border-black">
  <div class="row border-bottom border-black">
    <div class="col border-end border-black">
      ID
    </div>
    <div class="col border-end border-black">
      Name
    </div>
    <div class="col border-end border-black">
      Salary
    </div>
    <div class="col border-end border-black">
      Department
    </div>
    <div class="col border-end border-black">
      Edit
    </div>
    <div class="col">
      Delete
    </div>
  </div>
  <% List<Employee> employees = (List<Employee>) request.getAttribute("listEmployees");
       for(Employee employee : employees) {
    %>
      <div class="row border-bottom border-black">
    <div class="col border-end border-black">
      <%= employee.getId() %>
    </div>
    <div class="col border-end border-black">
      <%= employee.getName() %>
    </div>
    <div class="col border-end border-black">
      <%= employee.getSalary() %>
    </div>
    <div class="col border-end border-black">
      <%= employee.getDepartment() %>
    </div>
    <div class="col border-end border-black">
      <a href="/updateEmployee/<%= employee.getId() %>">Edit</a>
    </div>
    <div class="col">
      <a href="/deleteEmployee/<%= employee.getId() %>">Delete</a>
    </div>
  </div>
     <% } %>
</div>
<br>
<div class="text-center">
  <% if (employees != null && !employees.isEmpty()) { %>
    Page: <span><%= (int) request.getAttribute("currentPage") + 1 %></span> of <span><%= request.getAttribute("totalPages") %></span>
  <% } %>
</div>
<div class="text-center">
    <% if (employees != null && !employees.isEmpty()) { %>
        <form action="/" method="get" style="display:inline-block;">
            <input type="hidden" name="page" value="0">
            <input type="hidden" name="size" value="${size}">
            <button type="submit" class="btn btn-secondary"><<</button>
        </form>
        <% int currentPage = (int) request.getAttribute("currentPage");
           int totalPages = (int) request.getAttribute("totalPages");
           int startPage = Math.max(0, currentPage - 2);
           int endPage = Math.min(totalPages - 1, currentPage + 2);
           for (int i = startPage; i <= endPage; i++) {
        %>
            <form action="/" method="get" style="display:inline-block;">
                <input type="hidden" name="page" value="<%= i %>">
                <input type="hidden" name="size" value="${size}">
                <button type="submit" class="btn <%= (i == currentPage) ? "btn-primary" : "btn-secondary" %>"><%= i + 1 %></button>
            </form>
        <% } %>
        <form action="/" method="get" style="display:inline-block;">
            <input type="hidden" name="page" value="${totalPages - 1}">
            <input type="hidden" name="size" value="${size}">
            <button type="submit" class="btn btn-secondary">>></button>
        </form>
    <% } %>
</div>
</div>
</body>
</html>
