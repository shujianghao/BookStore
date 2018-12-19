<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/23 0023
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<html>
<head>
  <link href="css/bootstrap.min.css" rel="stylesheet"/>
  <link href="css/style.css" rel="stylesheet"/>
  <title>网上书店</title>
</head>
<body onload="initAJAX()">
<div class="header">
  <div class="container">
    <div class="row">
      <div class="login span4">
        <h1><a href=""> 欢迎来到<strong>我的</strong>书店</a>
          <span class="red">.</span></h1>
      </div>
      <div class="links span8">
        <a href="login.jsp" rel="tooltip" data-placement="bottom" data-toggle="modal" data-target="#myModal"> <img src="images/login.png"/> </a>
        <a href="register.jsp"><img src="images/register.png"/> </a>
        <a href="cart.jsp"><img src="images/car.png"/></a>
      </div>
    </div>
  </div>
</div> <%--header--%>
<div class="row"> <%--下方左右div控制--%>
  <div class="col-md-3"> <%--左侧菜单div控制--%>
    <ul class="nav nav-list">
      <li class="nav-header">书籍类型</li>
      <%
        String url = "jdbc:mysql://localhost:3306/db_bookstore?"
                + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url);
        conn = DriverManager.getConnection(url);
        String sql = "SELECT BookTypeId,BookName,BookDescription FROM db_bookstore.tb_bookinfo; ";

        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery(sql);
        while(rs.next())
        {
      %>
      <li>
        <a href='javascript:showBook(<%=rs.getString("BookTypeId")%>)'><%=rs.getString("BookTypeId")%></a>
      </li>
      <%
          System.out.println("类型是"+rs.getString("BookTypeId"));
        }
        stat.close();
        conn.close();
      %>
    </ul>
  </div><%--左侧菜单div控制--%>
  <div class="col-md-9" id="book"></div>
</div><%--下方左右div控制--%>
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"></div>
      <div class="modal-body"></div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>
<script language="JavaScript">
    function showBook(categoryID) {
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                if(xmlHttp.status == 200) {
                    var data = xmlHttp.responseText;
                    document.getElementById("book").innerHTML = data;
                }
            }
        }
        xmlHttp.open("GET", "getBook.jsp?id="+categoryID, true);
        xmlHttp.send();
    }
</script>
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>
</body>
</html>

