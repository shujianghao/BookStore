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
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.min.css" />
    <link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

<div class="login-boxtitle">
    <a href="home2.html"><img alt="bookstore" src="../images/logo_sdname02.jpg" /></a>
</div>

<div class="res-banner" style="background-color:#83a0a0">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="../images/big_bookad.jpg" style="margin-top:80px;margin-left:-130px" /></div>
        <div class="login-box">

            <div class="am-tabs" id="doc-my-tabs">
                <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                    <li class="am-active"><a href="">注册register</a></li>
                </ul>

                <div class="am-tabs-bd">
                    <div class="am-tab-panel am-active">
                        <form method="post" action="/servlets/registerServlet">

                            <div class="user-name">
                                <label for="name"><i class="am-icon-envelope-o"></i></label>
                                <input type="text" name="username" id="username" placeholder="请输入您的用户名">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="设置密码">
                            </div>
                            <%--<div class="login-links">--%>
                            <%--<label for="reader-me">--%>
                            <%--<input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》--%>
                            <%--</label>--%>
                            <%--</div>--%>
                            <span style="color: red">该用户名已存在，请重新输入</span>
                            <div class="am-cf">
                                <input type="submit" name="zhuce" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                            </div>
                        </form>
                    </div>

                    <div class="am-tab-panel">
                        <form method="post">
                            <div class="user-phone">
                                <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
                                <input type="tel" name="" id="phone" placeholder="请输入手机号">
                            </div>
                            <div class="verification">
                                <label for="code"><i class="am-icon-code-fork"></i></label>
                                <input type="tel" name="" id="code" placeholder="请输入验证码">
                                <a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
                                    <span id="dyMobileButton">获取</span></a>
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="password" placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="passwordRepeat" placeholder="确认密码">
                                <span>改用户名已存在</span>
                            </div>
                        </form>
                        <div class="login-links">
                            <label for="reader-me">
                                <input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                        </div>

                        <hr>
                    </div>

                    <script>
                        $(function() {
                            $('#doc-my-tabs').tabs();
                        })
                    </script>

                </div>
            </div>

        </div>
    </div>

    <div class="footer ">
        <div class="footer-hd ">
            <p>
                <a href="# ">恒望科技</a>
                <b>|</b>
                <a href="# ">商城首页</a>
                <b>|</b>
                <a href="# ">支付宝</a>
                <b>|</b>
                <a href="# ">物流</a>
            </p>
        </div>
        <div class="footer-bd ">
            <p>
                <a href="# ">关于恒望</a>
                <a href="# ">合作伙伴</a>
                <a href="# ">联系我们</a>
                <a href="# ">网站地图</a>
                <em>© 2015-2025 Hengwang.com 版权所有</em>
            </p>
        </div>
    </div>
</body>

</html>









<%--<html>--%>
<%--<head>--%>
<%--<title>注册</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="/servlets/registerServlet" method="post">--%>
<%--<label>用户名</label>--%>
<%--<input type="text" name="username">--%>
<%--<label>密码</label>--%>
<%--<input type="password" name="password">--%>
<%--<input type="submit" value="注册">--%>
<%--</form>·--%>
<%--<%--%>
<%--/*--%>
<%--String username=request.getParameter("username");--%>
<%--String password=request.getParameter("password");--%>
<%--Register register=new Register();--%>
<%--ArrayList users=register.queryAllUsers();--%>
<%--System.out.println(username);--%>
<%--System.out.println(password);--%>

<%--for(int i=0;i<users.size();i++) {--%>
<%--User user=(User)users.get(i);--%>
<%--String Username=(String)user.getUsername();--%>
<%--System.out.println(Username);--%>
<%--if(Username.equals(username))//之前username放在前面时报了异常，估计时觉得username可能没有接受到数据，为空--%>
<%--{--%>

<%--该用户已注册！--%>

<%--}--%>
<%--}--%>
<%--*/--%>

<%--%>--%>
<%--</body>--%>
<%--</html>--%>
