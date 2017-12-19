<%-- 
    Document   : NewUser
    Created on : 2017-12-19, 17:47:07
    Author     : JasonLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
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
                String password=request.getParameter("password");
                try{
                    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/javaee","root","971230");
                    preparedStmt=conn.prepareStatement("insert into login(username,password)value(?,?)");
                    preparedStmt.setString(1,Name);
                    preparedStmt.setString(2,password);
                    int uu=preparedStmt.executeUpdate();
                    session.setAttribute("cur_name",Name);
                    if(uu==0){
                        session.setAttribute("login_feedback","注册失败，当前用户名已存在");
                        response.sendRedirect("login.jsp");
                    }else{
                        session.setAttribute("login_feedback","注册成功，可以登录啦！");
                        response.sendRedirect("login.jsp");
                    }
                }catch(java.sql.SQLException e){
                    out.println(e.toString());
                }finally{
                    if(conn!=null) conn.close();
                }
            }
        %>
    </body>
</html>
