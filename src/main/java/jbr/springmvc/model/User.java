package jbr.springmvc.model;

public class User {

  private String username;
  private String password;
  private String firstname;
  private String lastname;
  private String email;
  private String address;
  private Boolean admin;
  public int id;
  private int phone;

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getFirstname() {
    return firstname;
  }

  public void setFirstname(String firstname) {
    this.firstname = firstname;
  }

  public String getLastname() {
    return lastname;
  }

  public void setLastname(String lastname) {
    this.lastname = lastname;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public int getPhone() {
    return phone;
  }

  public void setPhone(int phone) {
    this.phone = phone;
  }

  public int getId() {return id;}

  public void setId(int id) {this.id=id;}

  public void setAdmin(boolean admin){ this.admin=admin; }

  public boolean getAdmin(){ return admin; }
}
