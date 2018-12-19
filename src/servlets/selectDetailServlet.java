package servlets;

import beans.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "selectDetailServlet")
public class selectDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn=null;
        String Bookname=request.getParameter("bookname");
        Book book=new Book();
        try {
            String url = "jdbc:mysql://localhost:3306/db_bookstore?"
                    + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url);
            String sql = "SELECT BookPrice,BookAuthor,BookDescription,BookPic from tb_bookinfo where BookName='"+Bookname+"'";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()){
                book.setBookauthor(rs.getString("BookAuthor"));
                book.setBookdescription(rs.getString("BookDescription"));
                book.setBookpic(rs.getString("BookPic"));
                book.setBookprice(rs.getString("BookPrice"));
                book.setBookname(Bookname);
                request.getSession().setAttribute("selectDetail",book);
            }
            rs.close();
            stat.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }catch (ClassNotFoundException e2){
            e2.printStackTrace();
        }
        finally {
            try {// 关闭连接
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ex) {
            }
        }
        response.sendRedirect("/selectDetail.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
