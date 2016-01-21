<%-- 
    Document   : tdr_cl_srch.jsp
    Created on : 1 Dec, 2014, 6:48:55 AM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import ="java.sql.*" %>
<% 
    String fnam = (String)request.getParameter("fn"); 
    String zp = (String)request.getParameter("zipd"); 
   
    
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project", "root", "1234");
    Statement s= con.createStatement ();
    %>
    
    
    <h3>  Client Info:</h3>
 <table border="2">
<tr>
<td>Client ID</td>
<td>User Id:</td>
<td>Phone:</td>
<td>Cell:</td>
<td>email:</td>
<td>City:</td>
<td>Zip:</td>
<td>Gold Status:</td>
</tr>
    
  <%  ResultSet rs2;
    rs2= s.executeQuery("select * from  client where fname = '"+fnam+"'");
while(rs2.next())
{
%>    <tr><td><%= rs2.getInt("client_id") %></td>
    <td><%=rs2.getString("userid") %></td>
    <td><%=rs2.getInt("phone") %></td>
    <td><%=rs2.getInt("cell") %></td>
    <td><%=rs2.getString("email") %></td>
     <td><%=rs2.getString("city") %></td>
    <td><%=rs2.getString("zip") %></td>
     <td><%=rs2.getInt("isgold") %></td></tr>
        <%  }

ResultSet rs3;
    rs3= s.executeQuery("select * from  client where zip = '"+zp+"'");
while(rs3.next())
{
%>    <tr><td><%= rs3.getInt("client_id") %></td>
    <td><%=rs3.getString("userid") %></td>
    <td><%=rs3.getInt("phone") %></td>
    <td><%=rs3.getInt("cell") %></td>
    <td><%=rs3.getString("email") %></td>
     <td><%=rs3.getString("city") %></td>
    <td><%=rs3.getString("zip") %></td>
     <td><%=rs3.getInt("isgold") %></td></tr>
        <%  }

%>
   