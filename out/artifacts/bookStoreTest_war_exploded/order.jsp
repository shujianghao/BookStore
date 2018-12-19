<%@ page import="beans.Item" %>
<%@ page import="beans.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.impl.UserDAOImpl" %>
<%@ page import="dao.DataBaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: 舒姜豪
  Date: 2018/12/4
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>来历书城-我的订单</title>

    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.js"></script>


</head>

<body>

<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">

    </ul>
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="showHeader.jsp" target="_top" class="h">商城首页</a></div>
        </div>

        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="cart.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>购物车</a></div>
        </div>
        <div class="topMessage favorite">
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logoBig">
        <li><img src="../images/logo_sdname02.jpg" height="80px" width="auto" /></li>
    </div>


</div>

<div class="clear"></div>
<center><hr style="width:80%;align:center"/></center>
<span style="font-size:25px;padding-left:135px;">我的订单</span>
<br/>
<br/>
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
                    <div class="td-inner">状态</div>
                </div>
                <div class="th th-amount">
                    <div class="td-inner">数量</div>
                </div>
                <div class="th th-sum">
                    <div class="td-inner">金额</div>
                </div>
                <%--<div class="th th-op">--%>
                    <%--<div class="td-inner">操作</div>--%>
                <%--</div>--%>
            </div>
        </div>
        <div class="clear"></div>
        <%
//            Item item= (Item) session.getAttribute("item");
//            User user=item.getUser();
//            String name=user.getUsername();

            String name=(String)request.getSession().getAttribute("user");
//            DataBaseConnection conn1=new DataBaseConnection();
            UserDAO user1=new UserDAOImpl();
            int id=user1.select(name).getId();
//            username=user.getUsername();
            String url = "jdbc:mysql://localhost:3306/db_bookstore?"
                    + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url);
            conn = DriverManager.getConnection(url);
            try{
            String sql = "SELECT BookPic,price,BookName,Ordermount,state FROM db_bookstore.tb_bookinfo,db_bookstore.tb_order where db_bookstore.tb_order.BookId=db_bookstore.tb_bookinfo.BookId and CustomerId='"+id+"'";
            System.out.println(id);
            Statement pstmt=conn.createStatement();
            ResultSet rs = pstmt.executeQuery(sql);
            while (rs.next()) {
                System.out.println("成功");
        %>
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
                                    <img src="<%=rs.getString("BookPic")%>" class="itempic J_ItemImg"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" target="_blank" title="活着" class="item-title J_MakePoint" data-point="tbcart.8.11"><%=rs.getString("BookName")%></a>
                                </div>
                            </div>
                        </li>

                        <li class="td td-price" style="margin-left:205px">
                            <%=rs.getString("state")%>
                        </li>
                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <div class="sl">

                                        <input class="text_box" name="" type="text" value="<%=rs.getInt("Ordermount")%>" style="width:30px;" />

                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-sum">
                            <div class="td-inner">
                                <em tabindex="0" class="J_ItemSum number"><%=rs.getFloat("price")%></em>
                            </div>
                        </li>

                    </ul>

                </div>
            </div>
        </tr>
        <%
            }
            } catch (SQLException E){
                E.printStackTrace();
            }
            catch (IOException e){
                e.printStackTrace();
            }
            try{
            conn.close() ;
        }catch (Exception e){
            System.out.println("数据库连接关闭失败");
        }

        %>
        <div class="clear"></div>


    </div>
    <div class="clear"></div>

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