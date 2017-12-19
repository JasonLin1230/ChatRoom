<%-- 
    Document   : del
    Created on : 2017-12-19, 21:24:32
    Author     : JasonLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            Connection conn=null;
            PreparedStatement preparedStmt=null;
            String Name=new String();
            if(request.getParameter("username")!=null){
                Name=request.getParameter("username");
                try{
                    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/javaee","root","971230");
                    preparedStmt=conn.prepareStatement("delete from login where username=?");
                    preparedStmt.setString(1,Name);
                    preparedStmt.executeUpdate();
                    response.sendRedirect("manage.jsp");
                }catch(java.sql.SQLException e){
                    out.println(e.toString());
                }finally{
                    if(conn!=null) conn.close();
                }
            }
        %>
    </body>
</html>
