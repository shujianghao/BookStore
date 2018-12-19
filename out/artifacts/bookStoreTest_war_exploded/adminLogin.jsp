<%@ page import="java.net.URLDecoder" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/23 0023
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
    <link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
</head>

<body>

<div class="login-boxtitle">
    <a href="home2.html"><img alt="logo" src="../images/logo_sdname02.jpg" /></a>
</div>

<div class="login-banner" style="background-color:#83a0a0">
    <div class="login-main">
        <div class="login-banner-bg"><span></span><img src="../images/big_bookad.jpg" style="margin-top:80px;margin-left:-130px"/></div>
        <div class="login-box">
            <h3 class="title">Admin登录BOOKSTORE</h3>
            <div class="clear"></div>
            <div class="login-form">
                <form action="/servlets/adminLoginServlet" method="post">
                    <div class="user-name">
                        <label for="user"><i class="am-icon-user"></i></label>
                        <input type="text" name="admin" id="admin" placeholder="用户名">
                    </div>
                    <div class="user-pass">
                        <label for="password"><i class="am-icon-lock"></i></label>
                        <input type="password" name="adminpassword" id="adminpassword" placeholder="请输入密码">
                    </div>

                    <div class="am-cf">
                        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
                    </div>
                </form>
            </div>
            <%--<div class="login-links">--%>
            <%--<label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>--%>
            <%--<a href="#" class="am-fr">忘记密码</a>--%>
            <%--<a href="register.jsp" class="zcnext am-fr am-btn-default">注册</a>--%>
            <%--<br />--%>
            <%--</div>--%>

            <div class="partner">
                <h3>合作账号</h3>
                <div class="am-btn-group">
                    <li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
                    <li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
                    <li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="footer ">

    <div class="footer-bd ">
        <p>
            <em>&nbsp;&nbsp;&nbsp;&nbsp;计算机161班XXX小组制作&nbsp;&nbsp;&nbsp;我们的联系方式为：aaaaaa****@jk161.com</em>
        </p>
    </div>
</div>
</body>

</html>
