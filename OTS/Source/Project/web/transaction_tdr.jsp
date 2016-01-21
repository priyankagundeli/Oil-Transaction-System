<%-- 
    Document   : transaction
    Created on : 24 Nov, 2014, 5:44:06 PM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import ="java.sql.*" %>

<% 
     String type = (String)request.getParameter("tran_type");
     String entered_amt = request.getParameter("enter_amount"); 
     String mode = (String)request.getParameter("pay_mode"); 
     String client = (String)request.getParameter("Client_ID"); 
     int entered = Integer.parseInt(entered_amt);   
     float xb= entered *10;
     float amountdue=0; 
     float oilamount=0;
     float price=0;
     float silvercash =0;
   float silveroil =0;
   float goldcash =0;
   float goldoil =0;
   float oil_comm=0;
   float cash_comm=0;
   int gold=0;
  
     float oil_sold=0;
      float oil_bought=0;
      float oil_in_acc=0 ;
      int n=0;
      
     String user= (String)session.getAttribute("user_id");
     //String userid = session.getAttribute("user_id");
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project", "root", "1234");
    Statement s= con.createStatement ();
       
    ResultSet rs;
    rs= s.executeQuery("select * from client where userid ='"+user+"'");
   if (rs.next())
   {gold =rs.getInt("isgold") ;
      }
   
   ResultSet rs5;
    rs5= s.executeQuery("select sum(oil_amount_ltr)from oil_transaction where trans_type = 'sell' and payment <>'cancel' and clientid ='"+client+"'");
   if (rs5.next())
   {oil_sold =rs5.getInt(1) ; 
       }


ResultSet rs6;
    rs6= s.executeQuery("select sum(oil_amount_ltr) as sum2  from oil_transaction where trans_type = 'buy' and payment <>'cancel' and clientid ='"+client+"'");
   if (rs6.next())
   { oil_bought =rs6.getInt(1) ; 
    }

    oil_in_acc = oil_bought- oil_sold; 
  
 
   ResultSet rs2;
    rs2= s.executeQuery("select * from oil_price");
   if (rs2.next())
   {price =rs2.getFloat("price_per_ltr");
    }  
     ResultSet rs3;
    rs3= s.executeQuery("select * from commision");
   if (rs3.next())
   {silvercash =rs3.getFloat("silver_inCash");
   silveroil =rs3.getFloat("silver_inOil");
    goldcash =rs3.getFloat("gold_incash");
   goldoil =rs3.getFloat("gold_inoil");   }
  
   if (gold == 0 )
   {
   
    if(type.equals("Buy") )
    { 
    if(mode.equals("Cash") )
    { 
        amountdue= (entered* price ) +(entered *silvercash) ;
        oilamount=  entered;
        oil_comm =0;
        cash_comm= entered *silvercash;
   n = s.executeUpdate("insert into oil_transaction ( clientid, trans_type , oil_amount_ltr, amt_due,com_incash,com_inoil) values ('" + client + "','" + type + "','" + oilamount + "','" + amountdue + "','" + cash_comm + "','" + oil_comm + "')");
   %> Transaction Successful <% }
    if(mode.equals("Oil") )
    {amountdue= (entered* price )  ;
        oilamount=  entered-(entered*silveroil);
        oil_comm =entered * silveroil;
        cash_comm= 0;
     n = s.executeUpdate("insert into oil_transaction ( clientid, trans_type , oil_amount_ltr, amt_due,com_incash,com_inoil) values ('" + client + "','" + type + "','" + oilamount + "','" + amountdue + "','" + cash_comm + "','" + oil_comm + "')");
  %> Transaction Successful <% 
    }
    }
    
    if(type.equals("Sell") )
    { 
    if(mode.equals("Cash") )
    { 
        amountdue= (entered* price ) -(entered *silvercash) ;
        oilamount=  entered;
        oil_comm =0;
        cash_comm= entered *silvercash;
   if(oilamount<=oil_in_acc)
   { n = s.executeUpdate("insert into oil_transaction ( clientid, trans_type , oil_amount_ltr, amt_due,com_incash,com_inoil) values ('" + client + "','" + type + "','" + oilamount + "','" + amountdue + "','" + cash_comm + "','" + oil_comm + "')");
 } else {%> You don't have enough Oil  <%}
    }
    if(mode.equals("Oil") )
    {amountdue= (entered)*price  ;
        oilamount=  entered+(entered*silveroil);
        oil_comm = entered*silveroil;
        cash_comm= 0;
     if(oilamount<=oil_in_acc)
   { n = s.executeUpdate("insert into oil_transaction ( clientid, trans_type , oil_amount_ltr, amt_due,com_incash,com_inoil) values ('" + client + "','" + type + "','" + oilamount + "','" + amountdue + "','" + cash_comm + "','" + oil_comm + "')");
 }else {%> You don't have enough Oil  <%}}
    }
   
   } // end of if
   else
   {
       if(type.equals("Buy") )
    { 
    if(mode.equals("Cash") )
    { 
        amountdue= (entered* price ) +(entered *goldcash) ;
        oilamount=  entered;
        oil_comm =0;
        cash_comm= entered *goldcash;
   n = s.executeUpdate("insert into oil_transaction ( clientid, trans_type , oil_amount_ltr, amt_due,com_incash,com_inoil) values ('" + client + "','" + type + "','" + oilamount + "','" + amountdue + "','" + cash_comm + "','" + oil_comm + "')");
   %> Transaction Successful <% 
    }
    if(mode.equals("Oil") )
    {amountdue= (entered* price )  ;
        oilamount=  entered-(entered*goldoil);
        oil_comm =entered * goldoil;
        cash_comm= 0;
     n = s.executeUpdate("insert into oil_transaction ( clientid, trans_type , oil_amount_ltr, amt_due,com_incash,com_inoil) values ('" + client + "','" + type + "','" + oilamount + "','" + amountdue + "','" + cash_comm + "','" + oil_comm + "')");
 %> Transaction Successful <% }
    }
    
    if(type.equals("Sell") )
    { 
    if(mode.equals("Cash") )
    { 
        amountdue= (entered* price ) -(entered *goldcash) ;
        oilamount=  entered;
        oil_comm =0;
        cash_comm= entered *goldcash;
   if(oilamount<=oil_in_acc)
   { n = s.executeUpdate("insert into oil_transaction ( clientid, trans_type , oil_amount_ltr, amt_due,com_incash,com_inoil) values ('" + client + "','" + type + "','" + oilamount + "','" + amountdue + "','" + cash_comm + "','" + oil_comm + "')");
 }else {%> You don't have enough Oil  <%}
    }
    if(mode.equals("Oil") )
    {amountdue= (entered)*price  ;
        oilamount=  entered+(entered*goldoil);
        oil_comm = entered*goldoil;
        cash_comm= 0;
     if(oilamount<=oil_in_acc)
   { n = s.executeUpdate("insert into oil_transaction ( clientid, trans_type , oil_amount_ltr, amt_due,com_incash,com_inoil) values ('" + client + "','" + type + "','" + oilamount + "','" + amountdue + "','" + cash_comm + "','" + oil_comm + "')");
 }else {%> You don't have enough Oil  <%}}
    }
   
   } // end of else
   
     
   
  %>
   
   
     
     
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction success</title>
    </head>
    <body>
        
       <% ResultSet rs9;
    rs9= s.executeQuery("select sum(oil_amount_ltr)from oil_transaction where trans_type = 'sell' and payment <>'cancel' and clientid ='"+client+"'");
   if (rs9.next())
   {oil_sold =rs9.getInt(1) ; 
       }


ResultSet rs10;
    rs10= s.executeQuery("select sum(oil_amount_ltr) as sum2  from oil_transaction where trans_type = 'buy' and payment <>'cancel' and clientid ='"+client+"'");
   if (rs10.next())
   { oil_bought =rs10.getInt(1) ; 
    }

    oil_in_acc = oil_bought- oil_sold;
    
    if (oil_in_acc>=3577)
    {int k = s.executeUpdate("UPDATE client SET isgold='1' WHERE client_id ='"+client+"'");
 
    }
    
       %><p> Total Oil in Account: <%= oil_in_acc %></p>  <%  %>
     <form id="form1" name="form1" method="post" action="trader_acc.jsp"> 
         <p>  <input type="submit" value="Back to home" /></p>
         
    </body>
</html>
