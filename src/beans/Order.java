package beans;

public class Order {
    private int orderid;
    private String customername;
    private int ordermount;
    private int state;
    private float price;
    private String bookname;

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }


    public int getOrdermount() {
        return ordermount;
    }

    public void setOrdermount(int ordermount) {
        this.ordermount = ordermount;
    }

    public int isState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }


}
