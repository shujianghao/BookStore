package dao;

import dao.impl.UserDAOImpl;

public class DAOFactory {
    public static UserDAO getUserDAOInstance(){
        return new UserDAOImpl();
    }

}
