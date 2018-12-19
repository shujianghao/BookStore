package dao.Manager;

import beans.Book;
import beans.BookType;
import beans.Order;
import beans.User;
import dao.DataBaseConnection;
import dao.impl.UserDAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManagerDAOImpl implements ManagerDAO {

    //向数据库中添加书籍信息
    public void insert(Book book) throws Exception {
        String sql = "INSERT INTO tb_bookinfo(BookId,BookTypeId,BookName,BookStoremount,BookPic,BookPrice,BookAuthor,BookDescription) " +
                "VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;
        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            //pstmt.setInt(1, user.getUserid());
            pstmt.setInt(1, book.getBookid());
            pstmt.setInt(2, book.getBooktypeid());
            pstmt.setString(3, book.getBookname());
            pstmt.setInt(4, book.getBookstoremount());
            pstmt.setString(5, book.getBookpic());
            pstmt.setString(6, book.getBookprice());
            pstmt.setString(7, book.getBookauthor());
            pstmt.setString(8, book.getBookdescription());
            //进行数据库更新操作
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
    }

    //查询书籍类型表，包括类型id和类型名，存在名为all的List数组中
    public List<BookType> selectBookType() throws Exception {
        List<BookType> all = new ArrayList<BookType>();
        String sql = "SELECT * FROM tb_booktypeinfo ";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                // 查询出内容，之后将查询出的内容赋值给user对象
                BookType bookType = new BookType();
                bookType.setBooktypeid(rs.getInt(1));
                bookType.setBooktypename(rs.getString(2));

                // 将查询出来的数据加入到List对象之中
                all.add(bookType);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            throw new Exception("操作出现异常");
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
        return all;
    }


    public List selectBook() throws Exception{
        List<Book> all = new ArrayList<Book>();
        String sql = "SELECT * " +
                "FROM tb_bookinfo,tb_booktypeinfo " +
                "WHERE tb_bookinfo.`BookTypeId`=tb_booktypeinfo.`BookTypeId`" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;

        // 下面是针对数据库的具体操作
        try{
            // 连接数据库
            dbc = new DataBaseConnection() ;
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery() ;
            while(rs.next()){
                // 查询出内容，之后将查询出的内容赋值给user对象
                Book book = new Book();
                book.setBookid(rs.getInt(1));
                book.setBookname(rs.getString(3));
                book.setBooktypename(rs.getString(10));
                book.setBookstoremount(rs.getInt(4));
                book.setBookpic(rs.getString(5));
                book.setBookprice(rs.getString(6));
                book.setBookauthor(rs.getString(7));

                // 将查询出来的数据加入到List对象之中
                all.add(book) ;
            }
            rs.close() ;
            pstmt.close() ;
        }
        catch (Exception e){
            throw new Exception("操作出现异常") ;
        }
        finally{
            // 关闭数据库连接
            dbc.close() ;
        }
        return all ;
    }



    public List<Order> selectUnfinishOrder() throws Exception {
        List<Order> all = new ArrayList<Order>();
        String sql = "SELECT tb_order.`OrderId`,tb_order.`Ordermount`,tb_order.`state`,tb_order.`price`,tb_bookinfo.`BookName`,tb_customerinfo.`CustomerName` " +
                "FROM tb_order,tb_bookinfo,tb_customerinfo " +
                "WHERE tb_order.`CustomerId`=tb_customerinfo.`CustomerId`" +
                "AND tb_order.`BookId`=tb_bookinfo.`BookId` " +
                "AND tb_order.`state`=0";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                // 查询出内容，之后将查询出的内容赋值给user对象
                Order order = new Order();
                order.setOrderid(rs.getInt(1));
                order.setOrdermount(rs.getInt(2));
                order.setState(rs.getInt(3));
                order.setPrice(rs.getFloat(4));
                order.setBookname(rs.getString(5));
                order.setCustomername(rs.getString(6));

                // 将查询出来的数据加入到List对象之中
                all.add(order);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            throw new Exception("操作出现异常");
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
        return all;

    }

    public List<Order> selectFinishOrder() throws Exception {
        List<Order> all = new ArrayList<Order>();
        String sql = "SELECT tb_order.`OrderId`,tb_order.`Ordermount`,tb_order.`state`,tb_order.`price`,tb_bookinfo.`BookName`,tb_customerinfo.`CustomerName` " +
                "FROM tb_order,tb_bookinfo,tb_customerinfo " +
                "WHERE tb_order.`CustomerId`=tb_customerinfo.`CustomerId` " +
                "AND tb_order.`BookId`=tb_bookinfo.`BookId` " +
                "AND tb_order.`state`=1";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                // 查询出内容，之后将查询出的内容赋值给user对象
                Order order = new Order();
                order.setOrderid(rs.getInt(1));
                order.setOrdermount(rs.getInt(2));
                order.setState(rs.getInt(3));
                order.setPrice(rs.getFloat(4));
                order.setBookname(rs.getString(5));
                order.setCustomername(rs.getString(6));

                // 将查询出来的数据加入到List对象之中
                all.add(order);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            throw new Exception("操作出现异常");
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
        return all;

    }

public void  alterOrder(String orderID) throws Exception{
        String sql = "UPDATE db_bookstore.tb_order  SET state='1' WHERE OrderId=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        // 下面是针对数据库的具体操作
        try{
            // 连接数据库
            dbc = new DataBaseConnection() ;
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            //pstmt.setString(1,orderID);
            System.out.println(orderID);
            pstmt.setInt(1,Integer.parseInt(orderID));
            // 进行数据库更新操作
            pstmt.executeUpdate() ;
            pstmt.close() ;
        }
        catch (Exception e){
            throw new Exception("操作出现异常") ;
        }
        finally{
            // 关闭数据库连接
            dbc.close() ;
        }
    }


    public List<User> selectUser() throws Exception {
        List<User> all = new ArrayList<User>();
        String sql = "SELECT tb_customerinfo.CustomerId,tb_customerinfo.`CustomerName`,tb_customerinfo.`CustomerPwd` " +
                "FROM tb_customerinfo; ";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                // 查询出内容，之后将查询出的内容赋值给user对象
                User user = new User();
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));

                // 将查询出来的数据加入到List对象之中
                all.add(user);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            throw new Exception("操作出现异常");
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
        return all;
    }

    public void insertOrder(Order order) throws Exception {
        UserDAOImpl dao=new UserDAOImpl();
        User user=((UserDAOImpl) dao).select(order.getCustomername());
        int  id=user.getId();
        int bookId=selectBookId(order.getBookname());
        System.out.println(id+bookId);
        Connection conn=null;
        try {
            String url = "jdbc:mysql://localhost:3306/db_bookstore?"
                    + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url);
            String sql = "insert db_bookstore.tb_order(CustomerId, BookId, ordermount, price, state) "
            +"values ('"+id+"','"+bookId+"','"+order.getOrdermount()+"','"+order.getPrice()+"','0')";
            Statement stat = conn.createStatement();
            stat.executeUpdate(sql);
            System.out.println("查询3");
//            rs.close();
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

    }

    public int selectBookId(String BookName){
        Connection conn=null;
        int bookId=0;
        try {
            String url = "jdbc:mysql://localhost:3306/db_bookstore?"
                    + "user=root&password=666666&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url);
            String sql = "SELECT BookId from tb_bookinfo where BookName='"+BookName+"'";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()){
                bookId=rs.getInt("BookId");
            }
            System.out.println("查询2");
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
        return bookId;
    }

}