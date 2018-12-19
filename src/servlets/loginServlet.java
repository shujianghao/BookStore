package servlets;

import beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("user");//login.jsp中的表格中name属性为user中取出值
        String password=request.getParameter("password");
        Connection conn=null;
        ArrayList users=new ArrayList();//ArrayList 是一个数组队列，相当于 动态数组。
        boolean isLogin=false;
        try {
            String url = "jdbc:mysql://localhost:3306/db_bookstore?"
                    + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");//加载驱动类
            conn = DriverManager.getConnection(url);//进行数据库连接
            String sql = "SELECT CustomerName,CustomerPwd from db_bookstore.tb_customerinfo";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);//执行查询语句
            while(rs.next()){//一行一行的查
                User user = new User();//创建一个用户对象
                user.setUsername(rs.getString("CustomerName"));//将改行的取到的CustomerName值赋给对象
                user.setPassword(rs.getString("CustomerPwd"));
                users.add(user);//将一个用户对象存入users数组队列中
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

        for(int i=0;i<users.size();i++) {
            User user=(User)users.get(i);//List<E>的get(index)拿出来的是List里面元素的reference
            String Username=(String)user.getUsername();
            String Password=(String)user.getPassword();
//          System.out.println(Username);
            if(Username.equals(username)&&Password.equals(password))//之前username放在前面时报了异常，估计时觉得username可能没有接受到数据，为空
            {
                isLogin=true;

            }
        }
        if (isLogin == true) {
            User user=new User();
            user.setUsername(username);
//            Item item=new Item();
//            item.setUser(user);
            //设置session，变量名为item，item值为item的值，
            // user可以在多个页面共项,在jsp中可以用session.getAttribute("item")这个把user的值获取出来.
//                request.getSession().setAttribute("item",item);
            request.getSession().setAttribute("user",username);
            response.sendRedirect("/showHeader.jsp");
        } else {
            System.out.println("用户不存在");
            response.sendRedirect(request.getContextPath() + "/loginFail.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

