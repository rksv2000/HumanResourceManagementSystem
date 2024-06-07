<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Add Employee</title>
</head>
<body>
<div class="container-fluid bg-primary bg-gradient py-2 pb-2 text-center">
  <h3><span class="navbar-brand mb-0 text-white">Human Resource Management System</span></h3>
</div>
<br>
<div class="container text-center" style="width:500px">
 <h1>Add New Employee</h1><br>
 <form action="/saveEmployee" method="post">
    <div class="row">
       Name <input type="text" name="name">
    </div>
    <div class="row">
       Salary <input type="text" name="salary">
    </div>
    <div class="row">
       Department <input type="text" name="department">
    </div>
    <br>
    <div class="row">
      <button class="btn btn-primary" type="submit">Add Employee</button>
    </div>
 </form>
 </div>
</body>
</html>