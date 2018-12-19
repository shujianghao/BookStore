<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>搜索页面</title>

    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

    <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="../css/seastyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>
</head>

<body>

<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd">
                <%--<a href="login.jsp" target="_top" class="h">亲，请登录</a>--%>
                <%--<a href="register.jsp" target="_top">免费注册</a>--%>
            </div>
        </div>
    </ul>
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="index.jsp" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="cart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
        </div>
        <div class="topMessage favorite">
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logo"><img src="../images/logo.png" /></div>
    <div class="logoBig">
        <li><img src="../images/logo_sdname02.jpg" /></li>
    </div>

    <%--<div class="search-bar pr">--%>
        <%--<a name="index_none_header_sysc" href="#"></a>--%>
        <%--<form>--%>
            <%--<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">--%>
            <%--<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">--%>
        <%--</form>--%>
    <%--</div>--%>
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="search">
    <div class="search-list">
        <div class="nav-table">
            <div class="long-title"><span class="all-goods">全部分类</span></div>
            <div class="nav-cont">
                <ul>

                    <li class="index"><a href="index.jsp">首页</a></li>
                    <li class="qc"><a href="getBook.jsp?id=1">文学</a></li>
                    <li class="qc"><a href="getBook.jsp?id=2">社科</a></li>
                    <li class="qc"><a href="getBook.jsp?id=3">少儿</a></li>
                    <li class="qc last"><a href="getBook.jsp?id=4">艺术</a></li>
                </ul>
            </div>
        </div>


        <div class="am-g am-g-fixed">
            <div class="am-u-sm-12 am-u-md-12">
                <ul class="search-content">
                    <div class="sort">
                        <li><a href="index.jsp">首页</a></li>
                        <li><a href="#">分类</a></li>
                        <li class="am-active">内容</li>
                    </div>
                    <div class="clear"></div>

                    <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                        <%
                            String url = "jdbc:mysql://localhost:3306/db_bookstore?"
                                    + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url);
                            conn = DriverManager.getConnection(url);
                            String id = request.getParameter("id");
                            String sql = "SELECT BookPic,BookPrice,BookTypeId,BookName,BookDescription FROM db_bookstore.tb_bookinfo where BookTypeId = '"+id+"'";
                            System.out.println(id);
                            Statement pstat=conn.createStatement();
                            ResultSet rs = pstat.executeQuery(sql);
                            while (rs.next()) {
                                System.out.println("成功");
                        %>
                        <li>
                            <div class="i-pic limit">

                                <a href="servlets/selectDetailServlet?bookname=<%=rs.getString("BookName")%>"><img src="<%=rs.getString("BookPic")%>"></a>
                                <p class="title fl"><%=rs.getString("BookName")%></p>
                                <p class="price fl">
                                    <b>¥</b>
                                    <strong><%=rs.getString("BookPrice")%></strong>
                                </p>
                                <p class="number fl">
                                    <a href="servlets/CarServlet?action=add&pic=<%=rs.getString("BookPic")%>&name=<%=rs.getString("BookName")%>&price=<%=rs.getFloat("BookPrice")%>" style="color:navy">加入购物车</a>
                                </p>
                            </div>
                        </li>
                        <%
                            }
                            pstat.close();
                            conn.close();
                        %>
                    </ul>
                    <div class="clear"></div>
                    <!--分页 -->
                    <%--<ul class="am-pagination am-pagination-right">--%>
                        <%--<li class="am-disabled"><a href="#">&laquo;</a></li>--%>
                        <%--<li class="am-active"><a href="#">1</a></li>--%>
                        <%--<li><a href="#">2</a></li>--%>
                        <%--<li><a href="#">3</a></li>--%>
                        <%--<li><a href="#">4</a></li>--%>
                        <%--<li><a href="#">5</a></li>--%>
                        <%--<li><a href="#">&raquo;</a></li>--%>
                    <%--</ul>--%>

            </div>
        </div>
        <div class="footer">
            <div class="footer-bd ">
                <p>
                    <em>&nbsp;&nbsp;&nbsp;&nbsp;计算机161班XXX小组制作&nbsp;&nbsp;&nbsp;我们的联系方式为：aaaaaa****@jk161.com</em>
                </p>
            </div>
        </div>
    </div>

</div>

<script>
    window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
</script>
<script type="text/javascript" src="../basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

</body>

</html>