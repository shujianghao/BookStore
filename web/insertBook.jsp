<%--
  Created by IntelliJ IDEA.
  User: 礼文
  Date: 2018/12/4
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.*"%>
<%@ page import="dao.Manager.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
</head>
<body>
    <%
        ManagerDAO managerDAO = new ManagerDAOImpl();
        Book book = new Book();

        book.setBookname(request.getParameter("bookname"));
        book.setBooktypeid(Integer.parseInt(request.getParameter("booktype")));

        book.setBookstoremount(Integer.parseInt(request.getParameter("bookmount")));
        book.setBookpic(request.getParameter("bookpic"));
        book.setBookprice(request.getParameter("bookprice"));
        book.setBookauthor(request.getParameter("bookauthor"));
        book.setBookdescription(request.getParameter("bookdisc"));



//        out.println(request.getParameter("bookname"));
//        out.println(Integer.parseInt(request.getParameter("booktype")));
//        out.println(Integer.parseInt(request.getParameter("bookmount")));
//        out.println(request.getParameter("bookpic"));
//        out.println(request.getParameter("bookprice"));
//        out.println(request.getParameter("bookauthor"));
//        out.println(request.getParameter("bookdisc"));

        managerDAO.insert(book);
//        out.println("插入成功");
        response.sendRedirect("/bookdetail.jsp");

    %>
</body>
</html>
