package servlets;

import beans.Administer;
import beans.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "loginServlet")
public class adminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("admin");
        String password=request.getParameter("adminpassword");
        Connection conn=null;
        ArrayList<Administer> admins=new ArrayList<>();
        boolean isLogin=false;
        try {
            String url = "jdbc:mysql://localhost:3306/db_bookstore?"
                    + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url);
            String sql = "SELECT AdminName,AdminPwd from db_bookstore.tb_manager";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while(rs.next()){
                Administer admin=new Administer();
//                User user = new User();
                admin.setUsername(rs.getString("AdminName"));
                admin.setPassword(rs.getString("AdminPwd"));
                admins.add(admin);
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

        for(int i=0;i<admins.size();i++) {
            Administer admin1= (Administer) admins.get(i);
//            User user=(User)users.get(i);
            String Username=(String)admin1.getUsername();
            String Password=(String)admin1.getPassword();
            System.out.println("查询名字"+Username);
            if(Username.equals(username)&&Password.equals(password))//之前username放在前面时报了异常，估计时觉得username可能没有接受到数据，为空
            {
                isLogin=true;

            }
        }
        if (isLogin == true) {
            Administer administer = new Administer();
            administer.setUsername(username);
//            User user=new User();
//            user.setUsername(username);
            Item item=new Item();
            item.setUser(administer);
            request.getSession().setAttribute("item",item);
            response.sendRedirect(request.getContextPath() + "/indexback.jsp");
        } else {
            System.out.println("用户不存在");
            response.sendRedirect(request.getContextPath() + "/loginFail.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

