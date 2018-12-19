<%--
  Created by IntelliJ IDEA.
  User: 礼文
  Date: 2018/12/4
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.*"%>
<%@ page import="dao.Manager.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
    <meta charset="utf-8">
    <title>书籍添加</title>
    <style type="text/css">
        /*第 1 图层样式*/
        .div1{background-color:#f2f9fd; color:#66ffff;  width:100%; height:60px;}
        /*第 2 图层样式*/
        .div2{background-color:#f2f9fd; color:#66ffff;  width:100%; height:675px; margin-top:3px;}
    </style>
</head>
<body>
<div class="div1">
    <table border="0" width="100%">
        <tr style="height: 60px; text-align: center;">
            <td colspan="5"><h style="color:black;font-size: 25px;font-weight: 600">添加书籍资源<br /></h></td>
        </tr>
    </table>
</div>
<div class="div2">
    <form action="insertBook.jsp" method="post">
        <table border="0" width="100%" style="text-align: center;">
            <tr>
                <td style="line-height:22px; font-size:18px; width:100px;height: 80px;" colspan="5">书籍名称：<input type="text" name="bookname" required></td>
            </tr>
            <tr>
                <td style="line-height:22px; font-size:18px; width:100px;height: 80px;" colspan="5">书籍类型：<select name="booktype" style="width: 160px;height: 22px;">
                    <%
                        ManagerDAO managerDAO = new ManagerDAOImpl();
                        List<BookType> all1 = managerDAO.selectBookType();
                        Iterator<BookType> iter1 = all1.iterator();
                        while(iter1.hasNext()) {
                            BookType bookType = iter1.next();
                    %>
                    <option value = "<%=bookType.getBooktypeid()%>"><%=bookType.getBooktypename()%></option>
                    <%
                        }
                    %>
                </select></td>
            </tr>
            <tr>
                <td style="line-height:22px; font-size:18px; width:100px;height: 80px;" colspan="5">书籍数量：<input type="text" name="bookmount" required></td>
            </tr>
            <tr>
                <td style="line-height:22px; font-size:18px; width:100px;height: 80px;" colspan="5">书籍封面：<input type="text" name="bookpic" required></td>
            </tr>
            <tr>
                <td style="line-height:22px; font-size:18px; width:100px;height: 80px;" colspan="5">书籍价格：<input type="text" name="bookprice" required></td>
            </tr>
            <tr>
                <td style="line-height:22px; font-size:18px; width:100px;height: 80px;" colspan="5">书籍作者：<input type="text" name="bookauthor" required></td>
            </tr>
            <tr>
                <td style="line-height:22px; font-size:18px; width:100px;height: 80px;" colspan="5">书籍描述：<input type="text" name="bookdisc" required></td>
            </tr>
            <tr>
                <td style="line-height:22px; font-size:18px; width:100px;" colspan="3" ></td>
                <td colspan="2" style="line-height:22px; font-size:18px; width:100px;text-align: left;"><input type="submit" name="" value = "保存"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>