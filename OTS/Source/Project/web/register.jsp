    
    
    <%@ page import ="java.sql.*" %>
<%  String first = request.getParameter("fname");    
    String last = request.getParameter("lname");
    String psw = request.getParameter("pass"); 
    String cellnbr = request.getParameter("cell"); 
    String phonenbr = request.getParameter("phone"); 
    String emailid = request.getParameter("email"); 
    String ucity = request.getParameter("city"); 
    String zipcd = request.getParameter("zip"); 
    String ustate = request.getParameter("state"); 
    int rand= (int)(Math.random() * 100);
    int isgold =0;
    String user_id = request.getParameter("fname")+rand;
    
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project","root", "1234");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into client(userid, password, fname, lname, phone, cell, email, city, state, zip, isgold) values ('" + user_id + "','" + psw + "','" + first + "','" + last + "','" + phonenbr + "','" + cellnbr + "','" + emailid + "','" + ucity + "','" + ustate + "','" + zipcd + "','" + isgold + "')");
            
if (i > 0) {
        %>
<script language="javascript">
      alert ("Sucess!!!  Login with Userid is <%=user_id %>");
      window.location.replace("index.jsp");
     </script>
<% 
    } 
else {
        %>
<script language="javascript">
      alert ("Failure!!! Try again");
      window.location.replace("register.jsp");
       // setTimeout(function(){window.location.href='index.jsp'},200);
     </script>
<% 
    }
%>
</html>
