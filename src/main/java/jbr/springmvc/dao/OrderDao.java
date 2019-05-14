package jbr.springmvc.dao;

import jbr.springmvc.model.Order;
import jbr.springmvc.model.Order_item;
import jbr.springmvc.model.User;

import java.util.List;

public interface OrderDao {
  void placeOrder(Order order);
  Order getOrderById(int id);
  User getUser(Order order);
  Double getPrice(Order order);
  List<Order_item> getItems(Order order);
}
