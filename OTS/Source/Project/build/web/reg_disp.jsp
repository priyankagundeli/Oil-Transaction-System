<%-- 
    Document   : reg_disp
    Created on : 16 Nov, 2014, 5:11:12 PM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
body {
	background-color: #CCC;
	text-align: center;
}
</style>
</head>

<body>
<h1>Register</h1>
<form id="form1" name="form1" method="post" action="register.jsp">
  <p>First Name: 
    <label for="fname"></label>
  <input type="text" name="fname" id="fname" />
  </p>
  <p>Last Name:
    <label for="lname"></label>
    <input type="text" name="lname" id="lname" />
  </p>
  <p>Password   : 
    <label for="pass"></label>
    <input type="text" name="pass" id="pass" />
  </p>
  <p>Cell Nmbr : 
    <label for="cell"></label>
    <input type="text" name="cell" id="cell" />
  </p>
  <p>OtherPhone:
    <label for="phone"></label>
    <input type="text" name="phone" id="phone" />
  </p>
  <p>Email  id  :  
    <label for="email"></label>
    <input type="text" name="email" id="email" />
  </p>
  <p>Your City : 
    <label for="city"></label>
    <input type="text" name="city" id="city" />
  </p>
  <p>Zip Code : 
    <label for="zip"></label>
    <input type="text" name="zip" id="zip" />
  </p>
  <p>State : 
    <label for="state"></label>
    <input type="text" name="state" id="state" />
  </p>
  <p>
    <input type="submit" name="Register" id="Register" value="Submit" />
  </p>
</form>
</html>
