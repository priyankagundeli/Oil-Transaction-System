<%-- 
    Document   : client_login.jsp
    Created on : 17 Nov, 2014, 4:04:16 AM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head></html>
  <%@page import ="java.sql.*" %>
<% 
    String user_id = request.getParameter ("client_text");
     String client_pass = request.getParameter ("client_text2");
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project", "root", "1234");
    Statement s= con.createStatement ();
    ResultSet result;
    result= s.executeQuery("select * from client where userid ='"+user_id+"' and password = '"+client_pass+"'");
    
    if(result.next())
    {
    session.setAttribute("user_id", user_id);
    response.sendRedirect("myaccount.jsp");
    }
    else{
    %>
<script language="javascript">
      alert ("Failure!!! Try again");
      window.location.replace("index.jsp");
            </script>
<%    
    }
    %>