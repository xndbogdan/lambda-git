package jbr.springmvc.dao;

import jbr.springmvc.model.Order;
import jbr.springmvc.model.Order_item;
import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;

import java.sql.Timestamp;
import java.util.List;

public interface OrderDao {
  void placeOrder(Order order);
  Order getOrderById(int id);
  User getUser(Order order);
  Double getPrice(Order order);
  List<Order_item> getItems(Order order);
  List<Order> getOrdersByUser(User user);
  Order getOrderByTimestamp(String uid, User u);
}
