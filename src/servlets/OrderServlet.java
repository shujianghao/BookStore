package servlets;

import beans.*;
import dao.Manager.ManagerDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Car> books=(ArrayList<Car>) request.getSession().getAttribute("books");
        Item item=(Item)request.getSession().getAttribute("item");
        User user=item.getUser();
        String Customername=user.getUsername();
        Order order=new Order();
        ManagerDAOImpl insert=new ManagerDAOImpl();
        try {
            for(int i=0;i<books.size();i++){
                String bookname=books.get(i).getBookname();
                int bookcount=books.get(i).getBookcount();
                float bookprice=books.get(i).getBookprice();
                float allprice=bookcount*bookprice;
                int state=0;
                order.setBookname(bookname);
                order.setCustomername(Customername);
                order.setOrdermount(bookcount);
                order.setPrice(allprice);
                order.setState(state);
                System.out.println("查询0");
                insert.insertOrder(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        request.getSession().removeAttribute("books");
        response.sendRedirect("/cart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
