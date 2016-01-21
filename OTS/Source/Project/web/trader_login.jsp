<%-- 
    Document   : trader_login
    Created on : 1 Dec, 2014, 3:55:41 AM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           </head>
    <body>
           </body>
</html>
<%@page import ="java.sql.*" %>
<% 
    String user_id = request.getParameter ("trader_text1");
     String trader_pass = request.getParameter ("trader_text2");
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project", "root", "1234");
    Statement s= con.createStatement ();
    ResultSet result;
    result= s.executeQuery("select * from trader where userid ='"+user_id+"' and password = '"+trader_pass+"'");
    
    if(result.next())
    {
    session.setAttribute("user_id", user_id);
    response.sendRedirect("trader_acc.jsp");
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
