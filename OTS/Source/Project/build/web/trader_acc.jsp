<%-- 
    Document   : trader_acc
    Created on : 1 Dec, 2014, 4:06:02 AM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <%@page import ="java.sql.*" %>
        <h2>
            
     Welcome : <%= session.getAttribute("user_id")%>  </h2>
     <% 
     String user= (String)session.getAttribute("user_id");
     
     //String userid = session.getAttribute("user_id");
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project", "root", "1234");
    Statement s= con.createStatement ();
    ResultSet rs;
    rs= s.executeQuery("select * from client where userid ='"+user+"'");
   if (rs.next())
   { %> Gold Status: <%=rs.getInt("isgold") %>  <%}
  %>  
    <HR /><h3>Make New Transaction: </h3>

  Transaction: </h3>
<form id="form1" name="form1" method="post" action="transaction_tdr.jsp">
  <table width="85%" border="1">
  <tr>
    <td width="25%" height="28">Type : <select name="tran_type">
  <option>Buy</option>
  <option>Sell</option>
</select></td>
    <td width="25%"> Oil Amount (Liters) :
      <label for="enter_amount"></label>
      <input type="text" name="enter_amount" id="enter_amount" /></td>
    <td width="25%"> Client ID :
      <label for="Client_ID"></label>
      <input type="text" name="Client_ID" id="Client_ID" /></td>
    <td width="25%">Pay Comminsion By : 
      <select name="pay_mode">
  <option>Cash</option>
  <option>Oil</option>
</select></td>
    <td width="9%"><input type="submit" name="tran" id="tran" value="Submit" /></td>
  </tr>
</table>
  
</form>
<HR />
<h3>Payment Settlement:</h3>
<form id="form2" name="form2" method="post" action="approve.jsp">
  <table width="50%" border="1">
  <tr>
       <td width="22%"> Transaction ID :
      <label for="Transaction_ID"></label>
      <input type="text" name="Transaction_ID" id="Transaction_ID" /></td>
    
    <td width="22%" height="28">Update Status: <select name="status">
  <option>Approve</option>
  <option>cancel</option>
</select></td>
<td width="6%"><input type="submit" name="tran2" id="tran2" value="Submit" /></form></td> </tr>
</table>
<p>&nbsp;</p>   
 <HR />
 <h3>Search Client:</h3>
<form id="form4" name="form4" method="post" action="tdr_cl_srch.jsp">
  <table width="50%" border="1">
  <tr>
       <td width="22%"> Search by First name:
            <input type="text" name="fn" id="fn" /></td>
    
      
</select></td>
<td width="6%"><input type="submit" name="tran4" id="tran4" value="Submit" /></form></td> </tr>
</table>
    
    <form id="form7" name="form7" method="post" action="tdr_cl_srch.jsp">
  <table width="50%" border="1">
  <tr>
       <td width="22%"> Search by Zip:
            <input type="text" name="zipd" id="zipd" /></td>
    
      
</select></td>
<td width="6%"><input type="submit" name="tran7" id="tran7" value="Submit" /></form></td> </tr>
</table>
</html>
