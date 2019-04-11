package jbr.springmvc.model;

public class Video {

  private String Title;
  private String Description;
  private double Price;
  private String File_Link;
  private int User_id;
  private int Approval;
  private int id;

  public static int approval_pending=0;
  public static int approval_sucessful=1;
  public static int approval_declined=2;

  public String getTitle() {
    return this.Title;
  }

  public void setTitle(String Title) {
    this.Title = Title;
  }

  public String getDescription() {
    return Description;
  }

  public void setDescription(String Description) {
    this.Description = Description;
  }

  public double getPrice() {
    return Price;
  }

  public void setPrice(double Price) {
    this.Price = Price;
  }

  public String getFile_Link() {
    return File_Link;
  }

  public void setFile_Link(String File_Link) {
    this.File_Link = File_Link;
  }

  public int getUser_id() {
    return User_id;
  }

  public void setUser_id(int User_id) {
    this.User_id=User_id;
  }

  public int getApproval(){
    return Approval;
  }

  public void setApproval(int Approval){
    this.Approval=Approval;
  }

  public int getId() {return this.id;}

  public void setId(int id) {this.id = id;}
}
