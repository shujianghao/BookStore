package dao;


import beans.User;
// 定义数据库操作方法
public interface UserDAO{
    // 增加操作
    public void insert(User user) throws Exception ;

    // 修改操作
    User select(String username) throws Exception ;

    // 删除操作
    // void delete(int userid) throws Exception ;
    // 按ID查询操作
   //  User queryById(int userid) throws Exception ;
    // 查询全部
    //public List queryAll() throws Exception ;
}