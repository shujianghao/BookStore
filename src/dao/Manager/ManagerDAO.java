package dao.Manager;

import beans.Book;
import beans.Order;

import java.util.*;

public interface ManagerDAO {

    public void insert(Book book) throws Exception ;

    public List selectBook() throws Exception;

    public List selectBookType() throws Exception;

    public List selectUnfinishOrder() throws Exception;

    public List selectFinishOrder() throws Exception;

    public void  alterOrder(String orderID) throws Exception;

    public List selectUser() throws Exception;

    public int selectBookId(String BookName) throws Exception;

    public void insertOrder(Order order) throws Exception;
}
