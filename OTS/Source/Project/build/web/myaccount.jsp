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
<form id="form1" name="form1" method="post" action="transaction.jsp">
  <table width="85%" border="1">
  <tr>
    <td width="16%" height="28">Type : <select name="tran_type">
  <option>Buy</option>
  <option>Sell</option>
</select></td>
    <td width="42%"> Oil Amount (Liters) :
      <label for="enter_amount"></label>
      <input type="text" name="enter_amount" id="enter_amount" /></td>
    <td width="33%">Pay Comminsion By : 
      <select name="pay_mode">
  <option>Cash</option>
  <option>Oil</option>
</select></td>
    <td width="9%"><input type="submit" name="tran" id="tran" value="Submit" /></td>
  </tr>
</table>
  
</form>
<p>&nbsp;</p>   
 <HR />
 
 Recent Transactions:
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
    rs2= s.executeQuery("select * from oil_transaction, client where oil_transaction.clientid = client.client_id and client.userid ='"+user+"'");
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
    
 
  
  
    
