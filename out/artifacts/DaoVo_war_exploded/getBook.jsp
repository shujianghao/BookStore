<%--
  Created by IntelliJ IDEA.
  User: 李宇
  Date: 2018/11/1
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String url = "jdbc:mysql://localhost:3306/db_bookstore?"
            + "user=root&password=123456&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url);
    conn = DriverManager.getConnection(url);
    String categoryID = request.getParameter("id");
    String sql = "SELECT BookTypeId,BookName,BookDescription FROM db_bookstore.tb_bookinfo" +
            " where BookTypeId = '"+categoryID+"'";
    /*

    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,categoryID);
    */
    Statement pstat=conn.createStatement();
    ResultSet rs = pstat.executeQuery(sql);
    while (rs.next()) {
        System.out.println("第二页"+rs.getString("BookName"));
%>
<div class="col-sm-9 col-md-3"><div class="thumbnail" ><img src="images/book.jpg"><div class="caption">  <h4>
    <%=rs.getString("BookName")%>
</h4><p><%=rs.getString("BookDescription")%>
</p><p><a href="servlets/CarServlet?action=add&name=<%=rs.getString("BookName")%>" class="btn btn-primary" role="button">加入购物车</a> <a href="#" class="btn btn-default" role="button">查看详情
</a></p></div></div> </div><%
    }
    pstat.close();
    conn.close();
%>

</body>
</html>
