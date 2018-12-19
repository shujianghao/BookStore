package servlets;

import beans.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CarServlet")
public class CarServlet extends HttpServlet {
    protected String action;
    protected String name;
    private  String pic;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action=request.getParameter("action");
        name=request.getParameter("name");
        pic=request.getParameter("pic");
        String price1=request.getParameter("price");
        float price=Float.parseFloat(price1);
        System.out.println(action+name);
        ArrayList<Car> books=new ArrayList<>();
        if(request.getSession().getAttribute("books")!=null){
            books=(ArrayList<Car>) request.getSession().getAttribute("books");
        }

        if("delete".equals(action)){
            for(int i=0;i<books.size();i++)
            {
                if(books.get(i).getBookname().equals(name))
                {
                    books.remove(i);
                }
            }
            request.getSession().setAttribute("books",books);
            response.sendRedirect("/cart.jsp");
        }
        if("deleteAll".equals(action)){
            request.getSession().removeAttribute("books");
            response.sendRedirect("/cart.jsp");
        }

        if("add".equals(action)){
            if(request.getSession().getAttribute("user")!=null){
                int number=0;
                System.out.println(name);
                for(int i=0;i<books.size();i++){
                    if(name.equals(books.get(i).getBookname())){
                        int count=(int)books.get(i).getBookcount();
                        count++;
                        books.get(i).setBookcount(count);
                        number=1;
                        request.removeAttribute("books");
                        request.getSession().setAttribute("books",books);
                        break;
                    }
                }
                if(number==0){
                    Car book=new Car();
                    book.setBookcount(1);
                    book.setBookname(name);
                    book.setBookPic(pic);
                    book.setBookprice(price);
                    books.add(book);
                    request.getSession().setAttribute("books",books);
                }
                response.sendRedirect("/cart.jsp");
            }
            else{
                response.sendRedirect("/login.jsp");
            }
        }
        if("addmore".equals(action)){
            if(request.getSession().getAttribute("user")!=null){
                int number=0;
                System.out.println(name);
                for(int i=0;i<books.size();i++){
                    System.out.println(books.get(i).getBookname());
                    if(name.equals(books.get(i).getBookname())){
                        int count=(int)books.get(i).getBookcount();
                        count++;
                        books.get(i).setBookcount(count);
                        number=1;
                        System.out.println("这是用加号添加");
                        request.removeAttribute("books");
                        request.getSession().setAttribute("books",books);
                        break;
                    }
                }
                if(number==0){
                    Car book=new Car();
                    book.setBookcount(1);
                    book.setBookname(name);
                    books.add(book);
                    request.getSession().setAttribute("books",books);

                }
                response.sendRedirect("/cart.jsp");

            }
            else{
                response.sendRedirect("/cart.jsp");
            }

        }
        if("summore".equals(action)){
            if(request.getSession().getAttribute("user")!=null){
                System.out.println(name);
                for(int i=0;i<books.size();i++){
                    System.out.println(books.get(i).getBookname());
                    if(name.equals(books.get(i).getBookname())){
                        int count=(int)books.get(i).getBookcount();
                        if(count>1)
                            count--;
                        books.get(i).setBookcount(count);
                        System.out.println("这是用减号添加");
                        request.removeAttribute("books");
                        request.getSession().setAttribute("books",books);
                        break;
                    }
                }
                response.sendRedirect("/cart.jsp");
            }
            else{
                response.sendRedirect("/cart.jsp");
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
