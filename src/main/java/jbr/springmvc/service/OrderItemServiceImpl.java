package jbr.springmvc.service;

import jbr.springmvc.dao.OrderDao;
import jbr.springmvc.dao.OrderItemDao;
import jbr.springmvc.model.Order;
import jbr.springmvc.model.Order_item;
import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class OrderItemServiceImpl implements OrderItemService {

  @Autowired
  public OrderItemDao orderItemDao;


  @Override
  public Order_item getOrderItemById(int id) {
    return orderItemDao.getOrderItemById(id);
  }

  @Override
  public Order getOrder(Order_item order_item) {
    return orderItemDao.getOrder(order_item);
  }

  @Override
  public List<Order_item> getOrderItemsByOrder(Order order) {
    return orderItemDao.getOrderItemsByOrder(order);
  }

  @Override
  public Video getVideoByOrderItem(Order_item order_item){
    return orderItemDao.getVideoByOrderItem(order_item);
  }
}
