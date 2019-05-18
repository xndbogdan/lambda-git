package jbr.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import jbr.springmvc.helper.MD5;
import jbr.springmvc.model.*;
import jbr.springmvc.service.OrderItemService;
import jbr.springmvc.service.OrderService;
import jbr.springmvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class UserDaoImpl implements UserDao {

  @Autowired
  DataSource datasource;

  @Autowired
  JdbcTemplate jdbcTemplate;

  @Autowired
  OrderService orderService;

  @Autowired
  OrderItemService orderItemService;

  public void register(User user) {

    String sql = "insert into users (username, password, firstname, lastname, email, address, phone,admin) values(?,?,?,?,?,?,?,0)";

    jdbcTemplate.update(sql, new Object[] { user.getUsername(), MD5.getMd5(user.getPassword()), user.getFirstname(),
        user.getLastname(), user.getEmail(), user.getAddress(), user.getPhone() });
  }

  public User checkExistance(User user) {

    String sql = "select * from users where username='" + user.getUsername() + "'";

    List<User> users = jdbcTemplate.query(sql, new UserMapper());

    return users.size() > 0 ? users.get(0) : null;
  }


  public User validateUser(Login login) {

    String sql = "select * from users where username='" + login.getUsername() + "' and password='" + MD5.getMd5(login.getPassword())
        + "'";

    List<User> users = jdbcTemplate.query(sql, new UserMapper());

    return users.size() > 0 ? users.get(0) : null;
  }

  public User getUserById(int id){
    String sql = "select * from users where id='"+id+"'";
    List<User> users = jdbcTemplate.query(sql,new UserMapper());
    return users.size() > 0 ? users.get(0):null;
  }

  public List<Video> getBoughtTracks(User user){
    if(user==null){
      return null;
    }
    List<Order> orders = orderService.getOrdersByUser(user);
    List<Order_item> order_items = new ArrayList<>();
    List<Video> videos = new ArrayList<>();
    if(orders==null) return null;
    for(Order order:orders){
      order_items.addAll(orderItemService.getOrderItemsByOrder(order));
    }
    for(Order_item order_item:order_items){
      videos.add(orderItemService.getVideoByOrderItem(order_item));
    }
    return videos;
  }

  public List<Video> getUploadedTracks(User user){
    if(user==null){
      return null;
    }
    String sql = "select * from videos where User_id='"+user.getId()+"'";
    List<Video> videos = jdbcTemplate.query(sql, new VideoMapper());
    return videos;
  }

  public boolean userHasTrack(User user, Video video){
    List<Video> videos = getBoughtTracks(user);
    List<Video> uploaded = getUploadedTracks(user);
    if(videos!=null){
      for(Video v:videos){
        if(v.getId()==video.getId()) return true;
      }
    }
    if(uploaded!=null){
      for(Video v:uploaded){
        if(v.getId()==video.getId()) return true;
      }
    }
    return false;
  }
}

class UserMapper implements RowMapper<User> {

  public User mapRow(ResultSet rs, int arg1) throws SQLException {
    User user = new User();

    user.setUsername(rs.getString("username"));
    user.setPassword(rs.getString("password"));
    user.setFirstname(rs.getString("firstname"));
    user.setLastname(rs.getString("lastname"));
    user.setEmail(rs.getString("email"));
    user.setAddress(rs.getString("address"));
    user.setPhone(rs.getInt("phone"));
    user.setId(rs.getInt("id"));
    user.setAdmin(rs.getBoolean("admin"));
    return user;
  }
}