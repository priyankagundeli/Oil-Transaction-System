<%-- 
    Document   : manager_search
    Created on : 1 Dec, 2014, 5:37:26 AM
    Author     : saurabh
--%>
<h3> Search transactions: </h3>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
Enter Date in (YYYY-MM-DD)
<form id="form2" name="form2" method="post" action="mgr_search.jsp">
  <table width="50%" border="1">
  <tr>
       <td width="22%"> From Date :
            <input type="text" name="from" id="from" /></td>
    
    <td width="22%" height="28">To Date:
        <input type="text" name="to" id="to" /></td>
  
</select></td>
 <td width="6%"><input type="submit" name="tran2" id="tran2" value="Submit" /></td> </tr>
</table>
