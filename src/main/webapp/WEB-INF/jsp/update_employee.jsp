<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Update Employee</title>
</head>
<body>
<div class="container-fluid bg-primary bg-gradient py-2 pb-2 text-center">
  <h3><span class="navbar-brand mb-0 text-white">Human Resource Management System</span></h3>
</div>
<br>
<div class="container text-center" style="width:500px">
  <h1>Update Employee</h1><br>
  <form action="/saveEmployee" method="post">
     <div class="row">
       <input type="hidden" name="id" value= "${employee.id}">
     </div>
     <div class="row">
       Name <input type="text" name="name" value= "${employee.name}">
    </div>
    <div class="row">
       Salary <input type="text" name="salary" value= "${employee.salary}">
    </div>
    <div class="row">
       Department <input type="text" name="department" value= "${employee.department}">
    </div>
    <br>
    <div class="row">
      <button class="btn btn-primary" type="submit">Update Employee</button>
    </div>
  </form>
 </div>
</body>
</html>
