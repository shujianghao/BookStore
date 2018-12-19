<%--
  Created by IntelliJ IDEA.
  User: 礼文
  Date: 2018/12/3
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html lang="ch">
<head>
  <meta charset="utf-8">
  <title>后台管理系统</title>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src = "js/commons.js"></script>
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
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/common.css" />
  <link rel="stylesheet" type="text/css" href="css/slide.css" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
  <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">

</head>

<body >
<div id="wrap">
  <!-- 左侧菜单栏目块 -->
  <div class="leftMeun" id="leftMeun">
    <div id="logoDiv">
      <p id="logoP"><img id="logo" alt="左右结构项目" src="images/logo.png"><span>网上书店
                    </span></p>
    </div>
    <div id="personInfor">
      <p id="userName">admin</p>
      <p>
        <a href="index.jsp" style="text-decoration: none;">退出登录</a>
      </p>
    </div>
    <div class="meun-title">账号管理</div>
    <div class="meun-item meun-item-active"><a href="bookdetail.jsp" target="iframe1">书籍查看</a></div>
    <div class="meun-item "><a href="addBook.jsp" target="iframe1">书籍添加</a></div>
    <div class="meun-item" ><a href="selectUnfinishOrder.jsp" target="iframe1">订单管理(未完成)</a></div>
    <div class="meun-item" ><a href="selectFinishOrder.jsp" target="iframe1">订单管理(已完成)</a></div>
    <div class="meun-item" ><a href="showUser.jsp" target="iframe1">用户管理</a></div>
    <div class="meun-item" ><a href="alterOrder.jsp" target="iframe1">修改订单</a></div>
  </div>

  <div id = "rightContent">
    <iframe name="iframe1" width = "100%" height="100%">

    </iframe>

  </div>

</div>
</div>
</div>
</div>


</body>

</html>