package dao;

import beans.User;
import dao.impl.UserDAOImpl;

import java.sql.*;
import java.util.ArrayList;

public class Register {
    UserDAO userDAO = new UserDAOImpl();






}
//    public ArrayList queryAllUsers() throws Exception{
//        Connection conn=null;
//        ArrayList users=new ArrayList();
//        try {
//            //获取连接
////			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
////			String url="jdbc:odbc:DsSchool";
////			conn = DriverManager.getConnection(url, "", "");
//
//            String url = "jdbc:mysql://localhost:3306/db_bookstore?"
//                    + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
//            Class.forName("com.mysql.jdbc.Driver");
//            conn = DriverManager.getConnection(url);
////      	Statement stat = (Statement) conn.createStatement();
//            // 运行SQL语句
//            String sql = "SELECT USERNAME,PASSWORD from db_bookstore.users";
//            Statement stat = conn.createStatement();
//            ResultSet rs = stat.executeQuery(sql);
//            while (rs.next()) {
//                //实例化VO
//                User user = new User();
//                user.setUsername(rs.getString("USERNAME"));
//                user.setPassword(rs.getString("PASSWORD"));
//                users.add(user);
//            }
//            rs.close();
//            stat.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {// 关闭连接
//                if (conn != null) {
//                    conn.close();
//                    conn = null;
//                }
//            } catch (Exception ex) {
//            }
//        }
//        return users;
//    }
