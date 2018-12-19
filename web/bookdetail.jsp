<%--
  Created by IntelliJ IDEA.
  User: 礼文
  Date: 2018/12/3
  Time: 19:27
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
    <title>书籍管理</title>
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
<body style=" background-color: #EFF3F6;">
<div role="tabpanel" class="tab-pane active" id="sour">
    <div class="check-div form-inline">

    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div style="width: 5%;float: left;text-align:center;">
                编码
            </div>
            <div style="width: 20%;float: left; text-align:center;">
                书籍名称
            </div>
            <div style="width: 20%;float: left;text-align:center;">
                书籍类型
            </div>
            <div style="width: 7.5%;float: left;text-align:center;">
                书籍数量
            </div>
            <div style="width: 20%;float: left;text-align:center;">
                书籍封面
            </div>
            <div style="width: 7.5%;float: left;text-align:center;">
                书籍价格
            </div>
            <div style="width: 20%;float: left;text-align:center;">
                书籍作者
            </div>
        </div>
        <!--循环输出书籍-->
        <div class="tablebody">
            <%
                ManagerDAO managerDAO = new ManagerDAOImpl();
                List<Book> all = managerDAO.selectBook();
                Iterator<Book> iter = all.iterator();
                while(iter.hasNext()) {
                    Book book = iter.next();

            %>

            <div class="row">
                <div style="width: 5%;float: left;text-align:center;">
                    <%=book.getBookid()%>
                </div>
                <div style="width: 20%;float: left; text-align:center;">
                    <%=book.getBookname()%>
                </div>
                <div style="width: 20%;float: left;text-align:center;">
                    <%=book.getBooktypename()%>
                </div>
                <div style="width: 7.5%;float: left;text-align:center;">
                    <%=book.getBookstoremount()%>
                </div>
                <div style="width: 20%;float: left;text-align:center;">
                    <table border="0" width="200px" height="70px" style="table-layout: fixed; word-break: break-all; word-wrap: break-word; text-align: center;">
                        <tr>
                            <td><img src="<%=book.getBookpic()%>" height="70px" width="94px"></td>
                        </tr>
                    </table>
                </div>
                <div style="width: 7.5%;float: left;text-align:center;">
                    <%=book.getBookprice()%>
                </div>
                <div style="width: 20%;float: left;text-align:center;">
                    <%=book.getBookauthor()%>
                </div>
            </div>

            <%
                }
            %>



        </div>

    </div>
</div>
</body>
</html>