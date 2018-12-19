<%@ page import="java.net.URLDecoder" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/23 0023
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script type="text/javascript">
        function reloadCode(){
            var time = new Date().getTime();
            document.getElementById("imageCode").src="servlet/ImageServlet?d="+time;
        }
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String userName = "";
    String userPassword = "";
    Cookie[] cookies = request.getCookies();
    if(cookies != null && cookies.length > 0) {
        for(Cookie c : cookies) {
            if(c.getName().equals("loginUser")) {
                userName = URLDecoder.decode(c.getValue(), "utf-8");
            }
            if(c.getName().equals("loginPassword")) {
                userPassword = URLDecoder.decode(c.getValue(), "utf-8");
            }
        }
    }
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="modal-title">
    <h1 class="text-center">登录</h1>
</div>
<div class="modal-body">
    <form class="form-group" action="/servlets/loginServlet" method="post">
        <div class="form-group">
            <label>用户名</label>
<input type="text" class="form-control" required="required" placeholder="请输入用 户 名" name="loginUsername" value="<%=userName%>" />
        </div>
            <div class="form-group">
            <label>密码</label>
<input type="password" class="form-control" required="required" placeholder="请输入密 码" name="loginPassword" value="<%=userPassword%>" />
            </div>
        <div class="form-group">
    <input type="text" required="required" placeholder="验 证 码" name="checkCode" />
    &nbsp;&nbsp;&nbsp;
    <image alt="验证码" src="servlets/ImageServlet"/>
        <a href="javascript: reloadCode();" style="color: #f9fff3;">看不清</a>
        </div>
        <div class="text-right">
<button class="loginbutton" type="submit">登录</button>
    <label for="check">记住我</label>
    <input type="checkbox"  checked="checked" name="isUseCookie"/>
    <a href="register.jsp" style="color: #f9fff3;">注册</a>
            </div>

</form>
</body>
</html>
