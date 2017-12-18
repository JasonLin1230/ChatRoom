<%-- 
    Document   : ChatRoom
    Created on : 2017-12-10, 14:47:59
    Author     : JasonLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="pragma" content="no-cache">
        <title>聊天室</title>
        <link rel="stylesheet" href="./css/chatroom.css"/>
    </head>
    <body>
        <div class="content">
            <p class="subtitle pulse animated">聊天室</p>
            <%
//          由于用户量较小，字段相同，且为了方便管理，登录只建一个数据表
            request.setCharacterEncoding("UTF-8");
            Connection conn=null;
            java.lang.String strConn;
            PreparedStatement preparedStmt=null;
            ResultSet sqlRst=null;
            try{
                conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/javaee","root","971230");
                preparedStmt=conn.prepareStatement("select username,password from login where username = ?");
            }catch(java.sql.SQLException e){
                out.println(e.toString());
            }finally{
                if(conn!=null) conn.close();
            }
            String promt=new String();
            String Name=new String();
            String first="1";
            if(request.getParameter("username")!=null){
                Name=request.getParameter("username");
                String pass=request.getParameter("password");
                if(!pass.equals("123")){
                    response.sendRedirect("login.jsp");
                }
                session.setAttribute("last_succ",Name);
                first="1";
            }else{
                Name=(String)session.getAttribute("cur_name");
                first="0";
            }
            boolean hasLog=false;
            ArrayList names=(ArrayList)session.getAttribute("lognames");
            if(names==null){
                names=new ArrayList();
                names.add(Name);
                session.setAttribute("lognames",names);
                promt="这是您第一次登录！";
            }else{
                for(int i=0;i<names.size();i++){
                    String temp=(String)names.get(i);
                    if(temp.equals(Name)){
                        promt="您已经登录过了！";
                        hasLog=true;
                        break;
                    }
                }
                if(!hasLog){
                    names.add(Name);
                    session.setAttribute("lognames",names);
                    promt="这是您第一次登录";
                }
            }
            %>
            <div id="none"><%=promt%></div>
            <div id="none2"><%=first%></div>
            <div class="main">
                <div class="room">
                    <p class="cur_user">欢迎您，<%=Name%></p>
                    <div class="record">
                        <% ArrayList chat_records=new ArrayList(); 
                        chat_records=(ArrayList)application.getAttribute("say");
                        if(chat_records!=null){
                            for (int i=0;i<chat_records.size();i++)
                            {
                                String temp_record=(String)chat_records.get(i);
                                out.println(temp_record);
                                out.println("<br/>");
                            }
                        }
                        %>
                    </div>
                    <form action="say.jsp" method="post">
                        <input type="text" style="display: none;" value="<%=Name%>" name="username">
                        <textarea rows="3" autofocus="autofocus" name="my_meg" required="required"></textarea>
                        <div style="overflow: hidden;">
                            <button type="submit" id="send_meg">发送</button>
                            <button type="reset">重置</button>
                        </div>
                    </form>
                </div>
                <div class="member">
                    <h4 style="font-size:15px;font-weight:400;">当前在线人数：<%=names.size()%></h4>
                    <ul>
                    <%for(int i=0;i<names.size();i++){
                        String temp=(String)names.get(i);
                        out.println("<li>"+temp+"</li>");
                    }
                    %>
                    </ul>
                    <form action="out.jsp" method="post" id="out_form">
                        <input type="text" style="display: none;" value="<%=Name%>" name="username">
                        <button type="submit" id="out">退出</button>
                    </form>
                </div>
            </div>
            <p class="copy fadeIn animated">Copyright © 2017.JasonLin</p>
        </div>
    <canvas id="Mycanvas" style="z-index: -1;position:absolute;top: 0;width: 100%;height: 100%;"></canvas>
    <script src="./js/jquery.min.js"></script>
    <script src="./js/canvas.js"></script>
    <script src="./js/layer.js"></script>
    <script>
        var promt=$("#none").text();
        var first=$("#none2").text();
        if(first==="1"){
            layer.msg(promt, {
                area: ['200px','50px']
            });
        };
        var send_btn=$("#send_meg");
        var textarea=$("textarea");
        send_btn.click(function(){
            if(textarea.val()===""){
                layer.msg('消息不能为空哦', {icon: 5});
            }
        });
//        var out=$("#out_form");
//        out.submit(function(){
//            var sub_flag=true;
//            layer.msg('你确定你很帅么？', {
//                time: 0 //不自动关闭
//                ,btn: ['取消', '确定']
//                ,yes:sub_flag=false
//                }
//            });
//            return sub_flag;
//        });
    </script>
    </body>
</html>
