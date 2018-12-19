<%@ page import="dao.Register" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/23 0023
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form action="/servlets/registerServlet" method="post">
    <label>用户名</label>
    <input type="text" name="username">
    <label>密码</label>
    <input type="password" name="password">
    <input type="submit" value="注册">
</form>·
<%
    /*
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    Register register=new Register();
    ArrayList users=register.queryAllUsers();
    System.out.println(username);
    System.out.println(password);

    for(int i=0;i<users.size();i++) {
        User user=(User)users.get(i);
        String Username=(String)user.getUsername();
        System.out.println(Username);
        if(Username.equals(username))//之前username放在前面时报了异常，估计时觉得username可能没有接受到数据，为空
        {

该用户已注册！

        }
    }
*/

%>
</body>
</html>
