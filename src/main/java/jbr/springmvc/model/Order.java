package jbr.springmvc.model;

import java.sql.Timestamp;

public class Order {
  private int id;
  private int user_id;
  private Timestamp date;
  private String uid;

  public int getUser_id() {
    return user_id;
  }

  public void setUser_id(int user_id) {
    this.user_id=user_id;
  }

  public Timestamp getDate() {
    return date;
  }

  public void setDate(Timestamp date){
    this.date=date;
  }

  public void setId(int id){
    this.id=id;
  }
  public int getId(){
    return id;
  }

  public void setUid(String uid){ this.uid=uid; }
  public String getUid() { return uid; }
}
