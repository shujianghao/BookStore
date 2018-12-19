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
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
</head>
<body>
<h1>我的购物车</h1>
<hr>
<div>
    <form >
        <table>
            <tr>
                <th>商品名称</th>
                <th>商品单价</th>
                <th>商品价格</th>
                <th>购买数量</th>
                <th>操作</th>
            </tr>
            <%
                ArrayList<Car> books = (ArrayList<Car>)request.getSession().getAttribute("books");
                int i=0;
                //首先判断session中是否有购物车对象
                if(request.getSession().getAttribute("item") != null) {
                    if(request.getSession().getAttribute("books")!=null){
                        float allPrice=0;
                        float price=0;
                        for(i=0;i<books.size();i++){
                            price=(int)books.get(i).getBookcount()*(float)books.get(i).getBookprice();
                            allPrice=allPrice+price;
                            int count=books.get(i).getBookcount();

            %>
            <tr name="products" >
                <td >
                    <%=books.get(i).getBookname()%>
                </td>

                <td>
                    <%=price%>
                </td>
                <td>
                    <%=allPrice%>
                </td>
                <td>
                    <form>
                        <a href="servlets/CarServlet?action=summore&name=<%=books.get(i).getBookname()%>" class="btn btn-primary" role="button"> - </a>
                        <input type="text" id="buy" value="<%=count%>">
                        <a href="servlets/CarServlet?action=addmore&name=<%=books.get(i).getBookname()%>" class="btn btn-primary" role="button"> + </a>
                    </form>

                </td>
                <td>
                    <a href="servlets/CarServlet?action=delete&name=<%=books.get(i).getBookname()%>">删除</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <div >
               <span >
                   总计：<%=allPrice%>¥
               </span>
        </div>
        <%
        }

            }
            else
            {%>
                您尚未登录，三秒后跳转回首页！
        <script type="text/javascript">
            window.setTimeout("toindex()","3000");
            function toindex() {
                window.location.href="index.jsp";
            }
        </script>
        <%
            }
        %>


        <div class="button"><input type="submit" value="立即付款"/></div>
    </form>
    <a href="showHeader.jsp">返回首页</a>
</div>

</body>
</html>
