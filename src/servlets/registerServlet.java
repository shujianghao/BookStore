package servlets;

import beans.User;
import dao.DataBaseConnection;
import dao.UserDAO;
import dao.impl.UserDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "/registerServlet")
public class registerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        System.out.println(username);
//        System.out.println(password);
        DataBaseConnection connection = new DataBaseConnection();//创建一个数据库连接对象
        connection.getConnection();//调用数据库连接方法
        UserDAO userDAO = new UserDAOImpl();//创建一个接口实现类对象
            try {
            User user = userDAO.select(username);//接口实现类对象调用select方法
            if (user.getUsername() == null) {//如果数据库中无该username的用户则说明可以注册
                userDAO.insert(new User(username, password));//调用insert方法进行用户对象的插入
                response.sendRedirect("/login.jsp");
            } else {
                response.sendRedirect("/registerFail.jsp");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }
    }
}
//        response.sendRedirect("/login.jsp");
//        response.sendRedirect("/registerFail.jsp");
//      request.getRequestDispatcher("/index.jsp").forward(request,response);