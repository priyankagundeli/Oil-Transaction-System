<%-- 
    Document   : index
    Created on : 11 Nov, 2014, 5:12:32 PM
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
	background-image:url(img01.jpg);
        background-size: 100%;
        background-repeat: no-repeat;        
}
</style>
</head>

<body>
<h1 align="center"> Oil transaction system</h1>

<p>&nbsp;</p>
<div align="center">
  <table width="85%" height="109" border="1">
    <caption>
        <h3> Login</h3>
    </caption>
    <tr>
      <td width="21%">Clients</td>
      <td width="26%"><form id="form1" name="form1" method="post" action="client_login.jsp">
        <label for="client_text"></label>
        <input type="text" name="client_text" id="client_text" value="username" />
      </td>
      <td width="28%"><input type="password" name="client_text2" id="client_text2" value="password"/></td>
      <td width="25%"><input type="submit" name="client_but" id="client_but" value="Login" /></td></form>
    </tr>
    <tr>
      <td>Traders</td><form id="form2" name="form2" method="post" action="trader_login.jsp">
      <td><input type="text" name="trader_text1" id="trader_text1" /></td>
      <td><input type="password" name="trader_text2" id="trader_text2" /></td>
      <td><input type="submit" name="trader_but" id="trader_but" value="Login" /></td></form>
    </tr>
    <tr>
      <td>Managers</td><form id="form3" name="form3" method="post" action="mgr_login.jsp">
      <td><input type="text" name="maneger_text1" id="maneger_text1" /></td>
      <td><input type="password" name="maneger_text2" id="maneger_text2" /></td>
      <td><input type="submit" name="maneger_but" id="maneger_but" value="Login" /></td></form>
    </tr>
  </table>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p><p>&nbsp;</p>
<p>&nbsp;</p><p>&nbsp;</p>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<h3><div align="center">New Clients : <a href="reg_disp.jsp">Register</a></div>
</h3>

</body>

</html>