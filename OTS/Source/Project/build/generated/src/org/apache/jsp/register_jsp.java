package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
  String first = request.getParameter("fname");    
    String last = request.getParameter("lname");
    String psw = request.getParameter("pass"); 
    String cellnbr = request.getParameter("cell"); 
    String phonenbr = request.getParameter("phone"); 
    String emailid = request.getParameter("email"); 
    String ucity = request.getParameter("city"); 
    String zipcd = request.getParameter("zip"); 
    String ustate = request.getParameter("state"); 
    int rand= (int)(Math.random() * 10);
    int isgold =0;
    String user_id = request.getParameter("fname")+rand;
    
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project","root", "1234");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into client(userid, password, fname, lname, phone, cell, email, city, state, zip, isgold) values ('" + user_id + "','" + psw + "','" + first + "','" + last + "'," + phonenbr + "'," + cellnbr + "'," + emailid + "'," + ucity + "'," + zipcd + "'," + ustate + "'," + isgold + "')");
    out.println("int i ="+i);
    if (i > 0) {
        out.write ("<script type= 'text/javascripst'>");
        out.write("alert ('Sucess!!!  Login with Userid:'+user_id);");
        out.write("setTimeout(function()[window.location.href='index.jsp'},200);");
        out.write("</script>\n");
    } else {
        response.sendRedirect("index.jsp");
    }

      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
