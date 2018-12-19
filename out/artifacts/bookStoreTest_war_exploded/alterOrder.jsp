<%--
  Created by IntelliJ IDEA.
  User: 礼文
  Date: 2018/12/4
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.*"%>
<%@ page import="dao.Manager.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
    <meta charset="utf-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="左右结构项目，属于大人员的社交工具">
    <meta name="keywords" content="左右结构项目 社交 占座 ">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">//-->
    <title>订单修改</title>
    <script src = "js/commons.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function() {
            $(".meun-item").click(function() {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function() {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png")
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                ;
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function() {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function() {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function() {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function() {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/slide.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
</head>
<body style=" background-color: #EFF3F6;" onload="initAJAX()">
<div role="tabpanel" class="tab-pane active" id="sour">
    <div class="check-div form-inline">
        <!--<button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSource">添加书籍</button>-->
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div style="width: 5%;float: left;text-align:center;">
                订单号
            </div>
            <div style="width: 20%;float: left; text-align:center;">
                顾客名称
            </div>
            <div style="width: 20%;float: left;text-align:center;">
                所购书籍
            </div>
            <div style="width: 15%;float: left;text-align:center;">
                购买数量
            </div>
            <div style="width: 15%;float: left;text-align:center;">
                应付费用
            </div>
            <div style="width: 20%;float: left;text-align:center;">
                修改状态
            </div>
        </div>
        <!--循环输出书籍-->
        <div class="tablebody">

            <%
                ManagerDAO managerDAO = new ManagerDAOImpl();
                List<Order> all = managerDAO.selectUnfinishOrder();
                Iterator<Order> iter = all.iterator();
                int i = 0;
                while(iter.hasNext()) {
                    Order order = iter.next();

            %>

            <div class="row">
                <div style="width: 5%;float: left;text-align:center;">
                    <%=order.getOrderid()%>
                </div>
                <div style="width: 20%;float: left; text-align:center;">
                    <%=order.getCustomername()%>
                </div>
                <div style="width: 20%;float: left;text-align:center;">
                    <%=order.getBookname()%>
                </div>
                <div style="width: 15%;float: left;text-align:center;">
                    <%=order.getOrdermount()%>
                </div>
                <div style="width: 15%;float: left;text-align:center;">
                    <%=order.getPrice()%>
                </div>
                <div id = "<%=++i%>" style="width: 20%;float: left;text-align:center;" onclick="alterOrder1(<%=order.getOrderid()%>,<%=i%>)" >
                    未完成
                </div>
            </div>

            <%
                }
            %>



        </div>

    </div>
</div>
<script>
    function alterOrder1(orderID,divID) {

        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                if(xmlHttp.status == 200) {
                    alert("修改成功！");
                    var data = xmlHttp.responseText;
                    document.getElementById(divID).innerHTML = data;
                }
            }
        }
        xmlHttp.open("GET", "alterOrder.min.jsp?id="+orderID, true);
        xmlHttp.send(null);

    }
</script>

</body>
</html>