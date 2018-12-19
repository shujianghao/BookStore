package beans;
public class Item {
    private Car car;
    private User user;
    public void setCar(Car car){
        this.car=car;
    }
    public Car getCar(){
        return car;
    }
    public  void setUser(User user){
        this.user=user;
    }
    public User getUser(){
        return user;
    }

    public void setUser(Administer administer) {
    }
}
