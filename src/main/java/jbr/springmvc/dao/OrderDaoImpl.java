package jbr.springmvc.dao;

import jbr.springmvc.model.Order;
import jbr.springmvc.model.Order_item;
import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;
import jbr.springmvc.service.OrderItemService;
import jbr.springmvc.service.OrderService;
import jbr.springmvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

public class OrderDaoImpl implements OrderDao {

  @Autowired
  DataSource datasource;

  @Autowired
  JdbcTemplate jdbcTemplate;

  @Autowired
  UserService userService;

  @Autowired
  OrderItemService orderItemService;

  @Autowired
  OrderService orderService;

  @Override
  public void placeOrder(Order order) {
    String sql = "insert into orders (user_id, date) values(?,?)";
    jdbcTemplate.update(sql, new Object[]{order.getUser_id(), order.getDate()});
  }

  @Override
  public Order getOrderById(int id) {
    String sql = "select * from orders where id'"+id+"'";
    List<Order> orders = jdbcTemplate.query(sql, new OrderMapper());
    return orders.size() > 0 ? orders.get(0):null;
  }

  @Override
  public User getUser(Order order) {
    return userService.getUserById(order.getUser_id());
  }

  @Override
  public Double getPrice(Order order) {
    Double price = 0.0;
    List<Order_item> order_items = orderItemService.getOrderItemsByOrder(order);
    for(Order_item item :order_items){
      price+=item.getPrice();
    }
    return price;
  }

  @Override
  public List<Order_item> getItems(Order order) {
    return orderService.getItems(order);
  }
}

class OrderMapper implements RowMapper<Order> {
  @Autowired
  UserService userService;

  public Order mapRow(ResultSet rs, int arg1) throws SQLException {
    Order order = new Order();
    order.setDate(rs.getTimestamp("date"));
    order.setUser_id(rs.getInt("user_id"));
    order.setId(rs.getInt("id"));
    return order;
  }
}