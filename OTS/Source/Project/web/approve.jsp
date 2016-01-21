<%-- 
    Document   : approve
    Created on : 1 Dec, 2014, 4:36:27 AM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import ="java.sql.*" %>
<% 
     String transid = (String)request.getParameter("Transaction_ID");
     String status1 = (String)request.getParameter("status"); 
     %> transaction id <%= transid %>  <%
     %> status <%= status1 %>  <%
Class.forName("com.mysql.jdbc.Driver");
    
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project", "root", "1234");
    Statement s= con.createStatement (); 
     int n = s.executeUpdate("UPDATE oil_transaction SET Payment='"+status1+"' WHERE trans_id ='"+transid+"'");
     
    %> 
    
    <p> Status Updated </p>  
     <form id="form1" name="form1" method="post" action="trader_acc.jsp"> 
         <p>  <input type="submit" value="Back to home" /></p>
         