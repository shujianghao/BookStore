<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/23 0023
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.Car" %>
<%@ page import="beans.Item" %>
<%@ page import="dao.DataBaseConnection" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>购物车页面</title>

    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.js"></script>

</head>
<body>
<div class="am-container header">
    <ul class="message-l">

    </ul>
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="showHeader.jsp" target="_top" class="h">商城首页</a></div>
        </div>
        <%--<div class="topMessage favorite">--%>
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logoBig">
        <li><img src="../images/logo_sdname02.jpg" height="80px" width="auto" /></li>
    </div>


</div>

<div class="clear"></div>

<!--购物车 -->
<div class="concent">
    <div id="cartTable">
        <div class="cart-table-th">
            <div class="wp">
                <div class="th th-chk">
                    <div id="J_SelectAll1" class="select-all J_SelectAll">

                    </div>
                </div>
                <div class="th th-item">
                    <div class="td-inner">商品信息</div>
                </div>
                <div class="th th-price">
                    <div class="td-inner">单价</div>
                </div>
                <div class="th th-amount">
                    <div class="td-inner">数量</div>
                </div>
                <div class="th th-sum">
                    <div class="td-inner">金额</div>
                </div>
                <div class="th th-op">
                    <div class="td-inner">操作</div>
                </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <%
            float allPrice=0;
            float price=0;
            int count0=0;
            ArrayList<Car> books = (ArrayList<Car>)request.getSession().getAttribute("books");
            int i=0;
            //首先判断session中是否有购物车对象,判断是否登陆了
            if(request.getSession().getAttribute("user") != null) {
                if(request.getSession().getAttribute("books")!=null){

                    for(i=0;i<books.size();i++){
                        price=(int)books.get(i).getBookcount()*(float)books.get(i).getBookprice();
                        allPrice=allPrice+price;
                        int count=books.get(i).getBookcount();
                        count0=count0+count;

        %>
        <%--<%--%>
            <%--DataBaseConnection conn=new DataBaseConnection();--%>

        <%--%>--%>
        <tr class="item-list">
            <div class="bundle  bundle-last ">

                <div class="clear"></div>
                <div class="bundle-main">
                    <ul class="item-content clearfix">
                        <li class="td td-chk">
                            <div class="cart-checkbox ">
                                <input class="check" id="J_CheckBox_170037950254" name="items[]" value="170037950254" type="checkbox">
                                <label for="J_CheckBox_170037950254"></label>
                            </div>
                        </li>
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="#" target="_blank" data-title="活着" class="J_MakePoint" data-point="tbcart.8.12">
                                    <img src="<%=books.get(i).getBookPic()%>" class="itempic J_ItemImg"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" target="_blank" title="活着" class="item-title J_MakePoint" data-point="tbcart.8.11"> <%=books.get(i).getBookname()%></a>
                                </div>
                            </div>
                        </li>

                        <li class="td td-price" style="margin-left:205px">
                            <%=books.get(i).getBookprice()%>
                        </li>
                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <div class="sl">

                                        <form action="servlets/CarServlet?action=summore&name=<%=books.get(i).getBookname()%>&price=<%=books.get(i).getBookprice()%>" method="post">
                                            <input class="min am-btn" name="" type="submit" value="-" />
                                        </form>
                                            <input class="text_box" name="" type="text" value=<%=count%> style="width:30px;" />
                                        <form action="servlets/CarServlet?action=addmore&name=<%=books.get(i).getBookname()%>&price=<%=books.get(i).getBookprice()%>" method="post">
                                            <input class="add am-btn" name="" type="submit" value="+" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-sum">
                            <div class="td-inner">
                                <em tabindex="0" class="J_ItemSum number"><%=price%></em>
                            </div>
                        </li>
                        <li class="td td-sum" style="margin-left: 30px">
                            <div class="td-inner">
                                <a href="servlets/CarServlet?action=delete&name=<%=books.get(i).getBookname()%>&price=<%=books.get(i).getBookprice()%>" data-point-url="#" class="delete">删除</a>
                            </div>
                        </li>
                    </ul>

                    <%
                        }
                        }
                        }
                        else
                        {
                            response.sendRedirect("/login.jsp");
                        }
                    %>
                </div>
            </div>
        </tr>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>

    <div class="float-bar-wrapper">
        <div id="J_SelectAll2" class="select-all J_SelectAll">
            <div class="cart-checkbox">
                <input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
                <label for="J_SelectAllCbx2"></label>
            </div>
            <%--<span>全选</span>--%>
        </div>
        <div class="operations">
            <%--<a href="servlets/CarServlet?action=deleteAll&name=0&price=0%>" hidefocus="true" class="deleteAll">删除</a>--%>
        </div>
        <div class="float-bar-right">
            <div class="amount-sum">
                <span class="txt">已选商品</span>
                <em id="J_SelectedItemsCount"><%=count0%></em><span class="txt">件</span>
                <div class="arrow-box">
                    <span class="selected-items-arrow"></span>
                    <span class="arrow"></span>
                </div>
            </div>


            <div class="price-sum">
                <span class="txt">合计:</span>
                <strong class="price">¥<em id="J_Total"><%=allPrice%></em></strong>
            </div>
            <div class="btn-area">
                <a href="servlets/OrderServlets" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
                    <span>结&nbsp;算</span></a>
            </div>
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
</body>
</html>
