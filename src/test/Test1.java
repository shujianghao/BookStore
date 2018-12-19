package test;
import beans.User;
import dao.UserDAO;
import dao.impl.UserDAOImpl;

public class Test1 {
    public static void main(String[] args) throws Exception{

    UserDAO userDAO = new UserDAOImpl();

    User user = userDAO.select("张三丰");

    System.out.println(user.getUsername());

}

}
