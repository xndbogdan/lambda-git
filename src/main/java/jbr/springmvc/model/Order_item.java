package jbr.springmvc.model;

import java.sql.Timestamp;

public class Order_item {
  private int id;
  private int video_id;
  private int order_id;
  private double price;

  public int getOrder_id() {
    return order_id;
  }
  public void setOrder_id(int order_id){
    this.order_id=order_id;
  }
  public double getPrice(){
    return price;
  }
  public void setPrice(double price){
    this.price=price;
  }
  public void setId(int id){
    this.id=id;
  }
  public int getId(){
    return id;
  }
  public void setVideo_id(int video_id){
    this.video_id=video_id;
  }
  public int getVideo_id(){
    return video_id;
  }
}
