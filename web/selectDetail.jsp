<%@ page import="beans.Book" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/11 0011
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>商品页面</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="../css/optstyle.css" rel="stylesheet" />
    <link type="text/css" href="../css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="../basic/js/quick_links.js"></script>

    <script type="text/javascript" src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="../js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="../js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../js/list.js"></script>

</head>

<body>


<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd">
            </div>
        </div>
    </ul>
    <%--<ul class="message-r">--%>
        <%--<div class="topMessage home">--%>
            <%--<div class="menu-hd"><a href="showHeader.jsp" target="_top" class="h">书城首页</a></div>--%>
        <%--</div>--%>
        <%--<div class="topMessage my-shangcheng">--%>
            <%--<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a></div>--%>
        <%--</div>--%>
        <%--<div class="topMessage mini-cart">--%>
            <%--<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>--%>
        <%--</div>--%>
        <%--<div class="topMessage favorite">--%>
            <%--<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>个人中心</span></a></div>--%>
    <%--</ul>--%>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logoBig">
        <li><img src="../images/logo_sdname02.jpg" height="80px" width="auto" /></li>
    </div>
    <%--<div class="search-bar pr">--%>
        <%--<a name="index_none_header_sysc" href="#"></a>--%>
        <%--<form>--%>
            <%--<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">--%>
            <%--<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">--%>
        <%--</form>--%>
    </div>

</div>

<div class="clear"></div>
<b class="line"></b>
<div class="listMain">

    <%--<!--分类-->--%>
    <%--<div class="nav-table">--%>
        <%--<div class="long-title"><span class="all-goods">全部分类</span></div>--%>
        <%--<div class="nav-cont">--%>
            <%--<ul>--%>
                <%--<li class="index"><a href="#">首页</a></li>--%>
                <%--<li class="qc"><a href="#">文学</a></li>--%>
                <%--<li class="qc"><a href="#">社科</a></li>--%>
                <%--<li class="qc"><a href="#">少儿</a></li>--%>
                <%--<li class="qc last"><a href="#">艺术</a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%
        Book book=(Book)session.getAttribute("selectDetail");
    %>
    <ol class="am-breadcrumb am-breadcrumb-slash">
        <li class="am-active">首页</li>
        <%--<li class="am-active">文学</li>--%>
        <li class="am-active">《书名》</li>
    </ol>
    <div class="scoll">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <img src="../images/01.jpg" />
                    </li>
                    <li>
                        <img src="../images/02.jpg" />
                    </li>
                    <li>
                        <img src="../images/03.jpg" />
                    </li>
                </ul>
            </div>
        </section>
    </div>

    <div class="clear"></div>

    <div>

        <div>
            <div class="clearfixLeft" id="clearcontent" >
                <img src=<%=book.getBookpic()%> width="340px" height="340px" style="text-align:center" />
            </div>
            <div class="clearfixRight">
                <p style="font-family:黑体;font-size:25px;color:#ae426c;font-weight:bold;">《<%=book.getBookname()%>》</p>
                <br/>
                <p style="font-family:宋体;font-size:18px;color:#727579;"><%=book.getBookdescription()%></p>
                <hr/>
                <p style="font-family:宋体;font-size:15px;color:#a0a3a6">作者：<%=book.getBookauthor()%>&nbsp;&nbsp;&nbsp;&nbsp出版社：XXX出版社 </p>
                <br/>
                <div class="pay">
                    <li>
                        <div style="width:300px;">
                            <span style="">价格：<%=book.getBookprice()%>元</span>
                        </div>
                    </li>
                    <li>
                        <div class="clearfix tb-btn tb-btn-basket theme-login">
                            <a id="LikBasket" title="加入购物车" href="servlets/CarServlet?action=add&pic=<%=book.getBookpic()%>&name=<%=book.getBookname()%>&price=<%=book.getBookprice()%>"><i></i>加入购物车</a>
                        </div>
                    </li>
                </div>
            </div>
        </div>
        <div class="clear"></div>

    </div>

</div>

</div>

<div class="clear"></div>

<div class="footer">
    <div class="footer-bd">
        <p>
            <em>&nbsp;&nbsp;&nbsp;&nbsp;计算机161班XXX小组制作&nbsp;&nbsp;&nbsp;我们的联系方式为：aaaaaa****@jk161.com</em>
        </p>
    </div>
</div>
</div>

</div>
</div>


</body>

</html>
