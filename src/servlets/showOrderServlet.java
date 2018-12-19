package servlets;

import dao.DataBaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "showOrderServlet")
public class showOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        DataBaseConnection conn=new DataBaseConnection();
//        conn.getConnection();
//        String id = request.getParameter("");
//        String sql = "SELECT BookPic,BookPrice,BookTypeId,BookName,BookDescription FROM db_bookstore.tb_bookinfo where BookTypeId = '"+id+"'";
//        System.out.println(id);
//        Statement pstat=conn.createStatement();
//        ResultSet rs = pstat.executeQuery(sql);
//        while (rs.next()) {
//            System.out.println("成功");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
