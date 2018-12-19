package dao.impl;

import beans.User;
import dao.DataBaseConnection;
import dao.UserDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAO {
    //添加操作
    @Override
    public void insert(User user) throws Exception {
        String sql = "INSERT INTO tb_customerinfo(CustomerName,CustomerPWD) VALUES(?,?)" ;//sql模板
        PreparedStatement pstmt;
        DataBaseConnection dbc=new DataBaseConnection();
        try{
            // 连接数据库
            //dbc = new DataBaseConnection() ;
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            //pstmt.setInt(3,user.getId());
            pstmt.executeUpdate() ;
            pstmt.close() ;
        }catch (SQLException e){
            e.printStackTrace();
        }catch (Exception e ){
            e.printStackTrace();
        }
        finally{
            // 关闭数据库连接
            dbc.close() ;
        }
    }

    @Override
    public User select(String username) {
        User user = new User();
        String sql = "select * from tb_customerinfo where CustomerName = \'" + username + "\'";
        //System.out.println(sql);
        PreparedStatement pstmt=null;
        DataBaseConnection dbc=new DataBaseConnection();
        ResultSet rs ;

        try{
            // 连接数据库
            //Connection connection = dbc.getConnection();
            //dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            rs = pstmt.executeQuery();//执行查询语句后的结果
            while (rs.next()){
                user.setId(rs.getInt("CustomerId"));
                user.setUsername(rs.getString("CustomerName"));
                user.setPassword(rs.getString("CustomerPwd"));
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e ){
            e.printStackTrace();
        }
        finally{
            dbc.close() ;
        }
        return user;
    }
/*
    //修改操作
    public void update(User user) throws Exception {
    String sql = "UPDATE tb_customerinfo SET CustomerName=?,CustomerPWD=? WHERE CustomerId=?" ;
    PreparedStatement pstmt = null ;
    DataBaseConnection dbc = null ;
    // 下面是针对数据库的具体操作
    try{
        // 连接数据库
        dbc = new DataBaseConnection() ;//创建一个数据库连接对象
        pstmt = dbc.getConnection().prepareStatement(sql) ;//dbc.getConnection();取得数据库连接（数据库连接对象调用连接方法进行数据库的连接）
        pstmt.setString(1, user.getUsername());
        pstmt.setString(2, user.getPassword());
        pstmt.setInt(3,user.getId());
        // 进行数据库更新操作
        pstmt.executeUpdate() ;
        pstmt.close() ;
    }catch (SQLException e){
        e.printStackTrace();
    }
    catch (Exception e){
        throw new Exception("操作出现异常") ;
    }
    finally{
        // 关闭数据库连接
        dbc.close() ;
    }
}

    //删除操作
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM tb_customerinfo WHERE CustomerId=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        // 下面是针对数据库的具体操作
        try{
            // 连接数据库
            dbc = new DataBaseConnection() ;
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setInt(1,id) ;
            // 进行数据库更新操作
            pstmt.executeUpdate() ;
            pstmt.close() ;
        }catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            throw new Exception("操作出现异常") ;
        }
        finally{
            // 关闭数据库连接
            dbc.close() ;
        }
    }

    //按ID查询
    public User queryById(int id) throws Exception {
        User user = null ;
        String sql = "SELECT * FROM tb_customerinfo WHERE CustomerId=?" ;
        PreparedStatement pstmt = null ;
        DataBaseConnection dbc = null ;
        // 下面是针对数据库的具体操作
        try{
            // 连接数据库
            dbc = new DataBaseConnection() ;
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setInt(1, userid);
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery() ;
            if(rs.next())
            {
                // 查询出内容，之后将查询出的内容赋值给user对象
                user = new User() ;
               // user.setUserid(rs.getInt(1));
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
            }
            rs.close() ;
            pstmt.close() ;
        }catch (Exception e){
            throw new Exception("操作出现异常") ;
        }
        finally{
            // 关闭数据库连接
            dbc.close() ;
        }
        return user ;
    }
    /*public List<User> queryAll() throws Exception {
        List<User> all = new ArrayList<User>() ;
        String sql = "SELECT * FROM tb_customerinfo " ;
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
                User user = new User() ;
                user.setUserid(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));

                // 将查询出来的数据加入到List对象之中
                all.add(user) ;
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
    }*/

}