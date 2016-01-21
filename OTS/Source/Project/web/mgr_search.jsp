<%-- 
    Document   : mgr_search
    Created on : 1 Dec, 2014, 5:53:57 AM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import ="java.sql.*" %>
<% 
     String fromd = (String)request.getParameter("from");
     String tod = (String)request.getParameter("to");
     String fromd1= fromd +" 00:00:00";
     String tod1= tod +" 23:59:59";
     %> From date <%= fromd %>  <%
     %>| To  date <%= tod %>  <%
    Class.forName("com.mysql.jdbc.Driver");
    
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project", "root", "1234");
    Statement s= con.createStatement ();  
     
    %> 
 
 <table border="2">
<tr>
<td>Transaction ID</td>
<td>Trans_type</td>
<td>Oil_amt</td>
<td>Amount_due</td>
<td>Commission if in cash</td>
<td>Commission if in oil</td>
<td>Transaction Date</td>
<td>Payment Settlement</td>
</tr>
<%
    ResultSet rs2;
  rs2 = s.executeQuery("select * from oil_transaction  where   trans_date between '"+fromd1+"' and '"+tod1+"'  ");

    
    
while(rs2.next())
{
%>    <tr><td><%= rs2.getInt("trans_id") %></td>
    <td><%=rs2.getString("trans_type") %></td>
    <td><%=rs2.getFloat("oil_amount_ltr") %></td>
    <td><%=rs2.getFloat("amt_due") %></td>
    <td><%=rs2.getString("Com_incash") %></td>
     <td><%=rs2.getString("Com_inoil") %></td>
    <td><%=rs2.getString("trans_date") %></td>
     <td><%=rs2.getString("Payment") %></td></tr>
        <%  }
%>
    </table>
<p> </p>  
     <form id="form3" name="form1" method="post" action="manager_acc.jsp"> 
         <p>  <input type="submit" value="Back to home" /></p>
         