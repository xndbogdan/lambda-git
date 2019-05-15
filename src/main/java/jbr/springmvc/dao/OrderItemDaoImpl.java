package jbr.springmvc.dao;

import jbr.springmvc.model.Order;
import jbr.springmvc.model.Order_item;
import jbr.springmvc.model.Video;
import jbr.springmvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OrderItemDaoImpl implements OrderItemDao {

  @Autowired
  DataSource datasource;

  @Autowired
  JdbcTemplate jdbcTemplate;

  @Autowired
  UserService userService;

  @Override
  public Order_item getOrderItemById(int id) {
    String sql = "select * from order_items where id='"+id+"'";
    List<Order_item> items = jdbcTemplate.query(sql,new OrderItemMapper());
    return items.size() > 0 ? items.get(0):null;
  }

  @Override
  public Order getOrder(Order_item order_item) {
    String sql ="select * from orders where id='"+order_item.getOrder_id()+"'";
    List<Order> orders = jdbcTemplate.query(sql,new OrderMapper());
    return orders.size()>0 ? orders.get(0):null;
  }

  @Override
  public List<Order_item> getOrderItemsByOrder(Order order) {
    String sql = "select * from orders where order_id='"+order.getId()+"'";
    List<Order_item> order_items = jdbcTemplate.query(sql, new OrderItemMapper());
    return order_items;
  }
  @Override
  public Video getVideoByOrderItem(Order_item order_item){
    String sql = "select * from videos where id='"+order_item.getVideo_id()+"'";
    List<Video> videos = jdbcTemplate.query(sql, new VideoMapper());
    return videos.size()>0 ? videos.get(0):null;
  }
}

class OrderItemMapper implements RowMapper<Order_item> {
  @Autowired
  UserService userService;

  public Order_item mapRow(ResultSet rs, int arg1) throws SQLException {
    Order_item item = new Order_item();
    item.setPrice(rs.getDouble("price"));
    item.setVideo_id(rs.getInt("video_id"));
    item.setId(rs.getInt("id"));
    return item;
  }
}