package jbr.springmvc.model;

public class Video {

  private String Title;
  private String Description;
  private String Price;
  private String File_Link;
  private int User_id;

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

  public String getPrice() {
    return Price;
  }

  public void setPrice(String lastname) {
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
}
