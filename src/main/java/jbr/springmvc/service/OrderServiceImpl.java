package jbr.springmvc.service;

import jbr.springmvc.dao.OrderDao;
import jbr.springmvc.model.Order;
import jbr.springmvc.model.Order_item;
import jbr.springmvc.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.List;

public class OrderServiceImpl implements OrderService {

  @Autowired
  public OrderDao orderDao;

  @Override
  public void placeOrder(Order order) {
    orderDao.placeOrder(order);
  }

  @Override
  public Order getOrderById(int id) {
    return orderDao.getOrderById(id);
  }

  @Override
  public User getUser(Order order) {
    return orderDao.getUser(order);
  }

  @Override
  public Double getPrice(Order order) {
    return orderDao.getPrice(order);
  }

  @Override
  public List<Order_item> getItems(Order order) {
    return orderDao.getItems(order);
  }

  @Override
  public List<Order> getOrdersByUser(User user) { return orderDao.getOrdersByUser(user);}

  @Override
  public Order getOrderByTimestamp(String uid, User u) { return orderDao.getOrderByTimestamp(uid,u); }
}
