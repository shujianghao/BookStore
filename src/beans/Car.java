package beans;

public class Car {
    private String bookname;
    private int bookcount;
    private float bookprice;
    private String bookPic;

    public String getBookPic() {
        return bookPic;
    }

    public void setBookPic(String bookPic) {
        this.bookPic = bookPic;
    }

    public String getBookname(){
        return bookname;
    }
    public void setBookname(String bookname){
        this.bookname=bookname;
    }
    public int getBookcount(){
        return bookcount;
    }
    public void setBookcount(int bookcount){
        this.bookcount=bookcount;
    }
    public float getBookprice(){
        return bookprice;
    }
    public void setBookprice(float bookprice){
        this.bookprice=bookprice;
    }
}
