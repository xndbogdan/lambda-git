package jbr.springmvc.service;

import jbr.springmvc.model.Order;
import jbr.springmvc.model.Order_item;

import java.util.List;

public interface OrderItemService {
  Order_item getOrderItemById(int id);
  Order getOrder(Order_item order_item);
  List<Order_item> getOrderItemsByOrder(Order order);
}
